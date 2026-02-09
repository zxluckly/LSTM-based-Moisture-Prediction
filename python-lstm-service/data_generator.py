#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
土壤数据模拟生成器
用于生成测试数据和训练数据
"""

import numpy as np
import pandas as pd
import json
import requests
from datetime import datetime, timedelta
import time
import logging

logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

class SoilDataGenerator:
    """土壤数据生成器"""
    
    def __init__(self):
        self.base_params = {
            'temperature': {'mean': 20.0, 'std': 5.0, 'min': -10.0, 'max': 40.0},
            'humidity': {'mean': 60.0, 'std': 15.0, 'min': 10.0, 'max': 95.0},
            'ec_value': {'mean': 1.5, 'std': 0.5, 'min': 0.1, 'max': 5.0},
            'ph_value': {'mean': 7.0, 'std': 0.8, 'min': 4.0, 'max': 9.0}
        }
        
    def generate_realistic_data(self, field_id, start_time, hours=168, interval_minutes=60):
        """
        生成真实的土壤数据
        
        Args:
            field_id: 地块ID
            start_time: 开始时间
            hours: 生成小时数
            interval_minutes: 采样间隔(分钟)
        
        Returns:
            DataFrame: 生成的数据
        """
        
        # 计算数据点数量
        points = int(hours * 60 / interval_minutes)
        
        # 时间序列
        timestamps = []
        current_time = start_time
        for i in range(points):
            timestamps.append(current_time)
            current_time += timedelta(minutes=interval_minutes)
        
        # 生成基础数据
        data = []
        
        for i, timestamp in enumerate(timestamps):
            # 模拟日周期变化
            hour_of_day = timestamp.hour
            day_cycle = np.sin(2 * np.pi * hour_of_day / 24)
            
            # 模拟季节变化
            day_of_year = timestamp.timetuple().tm_yday
            season_cycle = np.sin(2 * np.pi * day_of_year / 365)
            
            # 生成温度（受日周期和季节影响）
            temp_base = self.base_params['temperature']['mean']
            temp_daily_var = 8 * day_cycle  # 日温差
            temp_seasonal_var = 10 * season_cycle  # 季节变化
            temp_noise = np.random.normal(0, 2)  # 随机噪声
            temperature = temp_base + temp_daily_var + temp_seasonal_var + temp_noise
            temperature = np.clip(temperature, 
                                self.base_params['temperature']['min'],
                                self.base_params['temperature']['max'])
            
            # 生成湿度（与温度负相关）
            humidity_base = self.base_params['humidity']['mean']
            humidity_temp_effect = -0.5 * (temperature - temp_base)  # 温度影响
            humidity_seasonal = 15 * np.sin(2 * np.pi * (day_of_year + 90) / 365)  # 季节湿度
            humidity_noise = np.random.normal(0, 5)
            humidity = humidity_base + humidity_temp_effect + humidity_seasonal + humidity_noise
            humidity = np.clip(humidity,
                             self.base_params['humidity']['min'],
                             self.base_params['humidity']['max'])
            
            # 生成EC值（相对稳定，受湿度轻微影响）
            ec_base = self.base_params['ec_value']['mean']
            ec_humidity_effect = 0.01 * (humidity - 60)  # 湿度影响
            ec_noise = np.random.normal(0, 0.1)
            ec_value = ec_base + ec_humidity_effect + ec_noise
            ec_value = np.clip(ec_value,
                             self.base_params['ec_value']['min'],
                             self.base_params['ec_value']['max'])
            
            # 生成pH值（相对稳定）
            ph_base = self.base_params['ph_value']['mean']
            ph_drift = 0.1 * np.sin(2 * np.pi * i / (24 * 7))  # 周期性漂移
            ph_noise = np.random.normal(0, 0.2)
            ph_value = ph_base + ph_drift + ph_noise
            ph_value = np.clip(ph_value,
                             self.base_params['ph_value']['min'],
                             self.base_params['ph_value']['max'])
            
            # 随机生成异常数据（5%概率）
            data_status = '1' if np.random.random() < 0.05 else '0'
            if data_status == '1':
                # 异常数据：随机偏移
                temperature += np.random.normal(0, 10)
                humidity += np.random.normal(0, 20)
                ec_value += np.random.normal(0, 1)
                ph_value += np.random.normal(0, 1)
            
            # 生成设备和位置信息
            device_id = f"DEVICE_{field_id}_001"
            longitude = 116.397400 + np.random.normal(0, 0.001)
            latitude = 39.909300 + np.random.normal(0, 0.001)
            altitude = 50.0 + np.random.normal(0, 5)
            
            data.append({
                'device_id': device_id,
                'field_id': field_id,
                'temperature': round(temperature, 2),
                'humidity': round(humidity, 2),
                'ec_value': round(ec_value, 3),
                'ph_value': round(ph_value, 2),
                'collect_time': timestamp.strftime('%Y-%m-%d %H:%M:%S'),
                'data_status': data_status,
                'longitude': round(longitude, 6),
                'latitude': round(latitude, 6),
                'altitude': round(altitude, 2)
            })
        
        return pd.DataFrame(data)
    
    def generate_batch_data(self, field_ids, days=7):
        """
        批量生成多个地块的数据
        
        Args:
            field_ids: 地块ID列表
            days: 生成天数
        
        Returns:
            DataFrame: 合并的数据
        """
        all_data = []
        
        start_time = datetime.now() - timedelta(days=days)
        
        for field_id in field_ids:
            logger.info(f"生成地块 {field_id} 的数据...")
            field_data = self.generate_realistic_data(
                field_id=field_id,
                start_time=start_time,
                hours=days * 24,
                interval_minutes=60
            )
            all_data.append(field_data)
        
        return pd.concat(all_data, ignore_index=True)
    
    def send_to_ruoyi_api(self, data, api_url='http://localhost:8080/soil/data/import'):
        """
        将生成的数据发送到若依系统API
        
        Args:
            data: DataFrame格式的数据
            api_url: API地址
        
        Returns:
            bool: 是否成功
        """
        try:
            # 转换为API需要的格式
            data_list = data.to_dict('records')
            
            # 分批发送（每批1000条）
            batch_size = 1000
            total_batches = len(data_list) // batch_size + (1 if len(data_list) % batch_size > 0 else 0)
            
            success_count = 0
            
            for i in range(0, len(data_list), batch_size):
                batch_data = data_list[i:i + batch_size]
                
                response = requests.post(
                    api_url,
                    json=batch_data,
                    headers={'Content-Type': 'application/json'},
                    timeout=30
                )
                
                if response.status_code == 200:
                    success_count += len(batch_data)
                    logger.info(f"批次 {i//batch_size + 1}/{total_batches} 发送成功，{len(batch_data)} 条数据")
                else:
                    logger.error(f"批次 {i//batch_size + 1} 发送失败: {response.status_code}")
                
                # 避免请求过于频繁
                time.sleep(0.1)
            
            logger.info(f"数据发送完成，成功: {success_count}/{len(data_list)}")
            return success_count == len(data_list)
            
        except Exception as e:
            logger.error(f"发送数据到API失败: {str(e)}")
            return False
    
    def export_to_csv(self, data, filename):
        """导出数据到CSV文件"""
        try:
            data.to_csv(filename, index=False, encoding='utf-8')
            logger.info(f"数据已导出到: {filename}")
            return True
        except Exception as e:
            logger.error(f"导出CSV失败: {str(e)}")
            return False
    
    def export_to_json(self, data, filename):
        """导出数据到JSON文件"""
        try:
            data_list = data.to_dict('records')
            with open(filename, 'w', encoding='utf-8') as f:
                json.dump(data_list, f, ensure_ascii=False, indent=2, default=str)
            logger.info(f"数据已导出到: {filename}")
            return True
        except Exception as e:
            logger.error(f"导出JSON失败: {str(e)}")
            return False

def main():
    """主函数 - 演示数据生成"""
    generator = SoilDataGenerator()
    
    # 生成测试数据
    field_ids = ['FIELD_001', 'FIELD_002', 'FIELD_003']
    
    logger.info("开始生成土壤数据...")
    
    # 生成7天的历史数据
    data = generator.generate_batch_data(field_ids, days=7)
    
    logger.info(f"生成完成，共 {len(data)} 条数据")
    
    # 导出到文件
    generator.export_to_csv(data, 'soil_data.csv')
    generator.export_to_json(data, 'soil_data.json')
    
    # 发送到若依系统（需要系统运行）
    # generator.send_to_ruoyi_api(data)
    
    # 显示数据统计
    print("\n数据统计:")
    print(f"总记录数: {len(data)}")
    print(f"地块数量: {data['field_id'].nunique()}")
    print(f"时间范围: {data['collect_time'].min()} 到 {data['collect_time'].max()}")
    print(f"异常数据: {len(data[data['data_status'] == '1'])} 条")
    
    print("\n各参数统计:")
    for param in ['temperature', 'humidity', 'ec_value', 'ph_value']:
        print(f"{param}: 均值={data[param].mean():.2f}, 标准差={data[param].std():.2f}")

if __name__ == '__main__':
    main()