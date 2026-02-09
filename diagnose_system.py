#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
土壤墒情系统诊断脚本
帮助理解数据生成流程和排查问题
"""

import requests
import json
import mysql.connector
import sys
import traceback
from datetime import datetime

class SystemDiagnostic:
    def __init__(self):
        self.base_url = 'http://localhost:8080'
        self.lstm_url = 'http://localhost:8081'
        self.db_config = {
            'host': 'localhost',
            'port': 3306,
            'user': 'root',
            'password': 'password',  # 请修改为你的数据库密码
            'database': 'ry-vue',
            'charset': 'utf8mb4'
        }
    
    def print_section(self, title):
        """打印分节标题"""
        print("\n" + "=" * 60)
        print(f" {title}")
        print("=" * 60)
    
    def test_database_connection(self):
        """测试数据库连接"""
        self.print_section("1. 数据库连接测试")
        
        try:
            conn = mysql.connector.connect(**self.db_config)
            cursor = conn.cursor()
            
            # 检查数据库是否存在
            cursor.execute("SELECT DATABASE()")
            db_name = cursor.fetchone()[0]
            print(f"✓ 数据库连接成功: {db_name}")
            
            # 检查soil_data表是否存在
            cursor.execute("SHOW TABLES LIKE 'soil_data'")
            if cursor.fetchone():
                print("✓ soil_data表存在")
                
                # 检查表结构
                cursor.execute("DESCRIBE soil_data")
                columns = cursor.fetchall()
                print("  表结构:")
                for col in columns:
                    print(f"    {col[0]} - {col[1]}")
                
                # 检查现有数据
                cursor.execute("SELECT COUNT(*) FROM soil_data")
                count = cursor.fetchone()[0]
                print(f"  现有数据条数: {count}")
                
                if count > 0:
                    cursor.execute("SELECT field_id, COUNT(*) FROM soil_data GROUP BY field_id")
                    field_counts = cursor.fetchall()
                    print("  各地块数据分布:")
                    for field_id, field_count in field_counts:
                        print(f"    {field_id}: {field_count} 条")
            else:
                print("✗ soil_data表不存在")
                print("  请执行: mysql -u root -p ry-vue < sql/soil_moisture_system.sql")
            
            cursor.close()
            conn.close()
            return True
            
        except Exception as e:
            print(f"✗ 数据库连接失败: {str(e)}")
            print("  请检查:")
            print("  1. MySQL服务是否启动")
            print("  2. 数据库配置是否正确")
            print("  3. ry-vue数据库是否存在")
            return False
    
    def test_backend_service(self):
        """测试后端服务"""
        self.print_section("2. 后端服务测试")
        
        try:
            # 测试健康检查
            response = requests.get(f'{self.base_url}/actuator/health', timeout=5)
            if response.status_code == 200:
                print("✓ 后端服务运行正常")
            else:
                print(f"⚠️  后端服务状态异常: {response.status_code}")
        except Exception as e:
            print(f"✗ 后端服务连接失败: {str(e)}")
            print("  请确保若依后端服务已启动在端口8080")
            return False
        
        # 测试土壤数据API
        try:
            response = requests.get(f'{self.base_url}/soil/data/list', timeout=5)
            if response.status_code in [200, 401, 403]:
                print("✓ 土壤数据API接口存在")
                if response.status_code == 401:
                    print("  (需要登录认证)")
                elif response.status_code == 403:
                    print("  (需要权限)")
            else:
                print(f"✗ 土壤数据API异常: {response.status_code}")
        except Exception as e:
            print(f"✗ 土壤数据API测试失败: {str(e)}")
        
        return True
    
    def test_lstm_service(self):
        """测试LSTM服务"""
        self.print_section("3. LSTM服务测试")
        
        try:
            response = requests.get(f'{self.lstm_url}/api/lstm/health', timeout=5)
            if response.status_code == 200:
                health_data = response.json()
                print("✓ LSTM服务运行正常")
                print(f"  服务状态: {health_data.get('status')}")
                print(f"  模型版本: {health_data.get('model_version')}")
                return True
            else:
                print(f"✗ LSTM服务异常: {response.status_code}")
        except Exception as e:
            print(f"✗ LSTM服务连接失败: {str(e)}")
            print("  请启动LSTM服务:")
            print("  cd python-lstm-service && python app.py")
        
        return False
    
    def explain_data_flow(self):
        """解释数据流程"""
        self.print_section("4. 数据流程说明")
        
        print("土壤墒情系统的数据流程如下:")
        print()
        print("📊 数据生成流程:")
        print("  1. 前端点击'生成模拟数据'按钮")
        print("  2. 调用API: POST /soil/data/simulate/{fieldId}/{count}")
        print("  3. 后端SoilDataController.generateSimulatedData()方法")
        print("  4. 调用SoilDataService.generateSimulatedData()生成数据")
        print("  5. 调用SoilDataService.importSoilData()批量插入")
        print("  6. 通过MyBatis执行batchInsertSoilData插入数据库")
        print()
        print("🔄 预测流程:")
        print("  1. 前端请求预测")
        print("  2. 后端从数据库获取历史数据")
        print("  3. 调用LSTM微服务进行预测")
        print("  4. 返回预测结果并保存到数据库")
        print()
        print("📈 数据查看:")
        print("  1. 土壤数据管理页面查看原始数据")
        print("  2. 预测管理页面查看预测结果")
        print("  3. 监控大屏查看实时统计")
    
    def test_generate_data_manually(self):
        """手动测试数据生成"""
        self.print_section("5. 手动数据生成测试")
        
        print("尝试直接调用数据生成接口...")
        
        field_id = 'TEST_FIELD_001'
        count = 10
        
        try:
            url = f'{self.base_url}/soil/data/simulate/{field_id}/{count}'
            print(f"调用URL: {url}")
            
            response = requests.post(url, timeout=30)
            print(f"响应状态: {response.status_code}")
            print(f"响应内容: {response.text}")
            
            if response.status_code == 200:
                result = response.json()
                if result.get('code') == 200:
                    print("✓ 数据生成成功")
                    data = result.get('data', {})
                    print(f"  成功条数: {data.get('successCount', 0)}")
                    print(f"  总条数: {data.get('totalCount', 0)}")
                else:
                    print(f"✗ 数据生成失败: {result.get('msg', '未知错误')}")
            elif response.status_code == 401:
                print("⚠️  需要登录认证")
                self.try_login_and_generate(field_id, count)
            else:
                print(f"✗ 接口调用失败: {response.status_code}")
                
        except Exception as e:
            print(f"✗ 请求异常: {str(e)}")
    
    def try_login_and_generate(self, field_id, count):
        """尝试登录后生成数据"""
        print("\n尝试登录后生成数据...")
        
        try:
            # 获取验证码
            captcha_response = requests.get(f'{self.base_url}/captchaImage')
            if captcha_response.status_code != 200:
                print("✗ 获取验证码失败")
                return
            
            captcha_data = captcha_response.json()
            uuid = captcha_data.get('uuid', '')
            
            # 登录
            login_data = {
                "username": "admin",
                "password": "admin123",
                "code": "",  # 验证码留空，有些系统可能不验证
                "uuid": uuid
            }
            
            login_response = requests.post(f'{self.base_url}/login', json=login_data)
            
            if login_response.status_code == 200:
                login_result = login_response.json()
                if login_result.get('code') == 200:
                    token = login_result.get('token')
                    print(f"✓ 登录成功")
                    
                    # 使用token生成数据
                    headers = {'Authorization': f'Bearer {token}'}
                    url = f'{self.base_url}/soil/data/simulate/{field_id}/{count}'
                    
                    generate_response = requests.post(url, headers=headers, timeout=30)
                    print(f"生成数据响应: {generate_response.status_code}")
                    print(f"响应内容: {generate_response.text}")
                    
                    if generate_response.status_code == 200:
                        result = generate_response.json()
                        if result.get('code') == 200:
                            print("✓ 登录后数据生成成功")
                            data = result.get('data', {})
                            print(f"  成功条数: {data.get('successCount', 0)}")
                        else:
                            print(f"✗ 数据生成失败: {result.get('msg')}")
                    else:
                        print(f"✗ 生成数据失败: {generate_response.status_code}")
                else:
                    print(f"✗ 登录失败: {login_result.get('msg')}")
            else:
                print(f"✗ 登录请求失败: {login_response.status_code}")
                
        except Exception as e:
            print(f"✗ 登录测试异常: {str(e)}")
    
    def check_data_after_generation(self):
        """检查生成后的数据"""
        self.print_section("6. 数据验证")
        
        try:
            conn = mysql.connector.connect(**self.db_config)
            cursor = conn.cursor()
            
            # 检查最新数据
            cursor.execute("""
                SELECT field_id, COUNT(*) as count, 
                       MAX(collect_time) as latest_time,
                       MIN(collect_time) as earliest_time
                FROM soil_data 
                GROUP BY field_id 
                ORDER BY latest_time DESC
            """)
            
            results = cursor.fetchall()
            
            if results:
                print("数据库中的数据:")
                for field_id, count, latest, earliest in results:
                    print(f"  地块 {field_id}: {count} 条数据")
                    print(f"    最新时间: {latest}")
                    print(f"    最早时间: {earliest}")
                    print()
                
                # 显示最新的几条数据
                cursor.execute("""
                    SELECT field_id, temperature, humidity, ec_value, ph_value, collect_time
                    FROM soil_data 
                    ORDER BY collect_time DESC 
                    LIMIT 5
                """)
                
                recent_data = cursor.fetchall()
                print("最新的5条数据:")
                for data in recent_data:
                    print(f"  {data[0]} | 温度:{data[1]}°C | 湿度:{data[2]}% | EC:{data[3]} | pH:{data[4]} | 时间:{data[5]}")
            else:
                print("❌ 数据库中没有数据")
                print("   可能的原因:")
                print("   1. 数据生成失败")
                print("   2. 数据库连接问题")
                print("   3. 权限问题")
            
            cursor.close()
            conn.close()
            
        except Exception as e:
            print(f"✗ 数据验证失败: {str(e)}")
    
    def provide_solutions(self):
        """提供解决方案"""
        self.print_section("7. 问题解决方案")
        
        print("如果生成模拟数据没有效果，请按以下步骤排查:")
        print()
        print("🔍 步骤1: 检查后端日志")
        print("  查看 logs/sys-error.log 和控制台输出")
        print("  关注MyBatis、数据库连接相关错误")
        print()
        print("🔍 步骤2: 检查权限配置")
        print("  确保用户有 soil:data:add 权限")
        print("  检查菜单权限是否正确配置")
        print()
        print("🔍 步骤3: 检查数据库")
        print("  确保soil_data表存在且结构正确")
        print("  检查数据库连接配置")
        print()
        print("🔍 步骤4: 手动测试")
        print("  使用Postman或curl直接调用API")
        print("  检查请求参数和响应")
        print()
        print("🛠️  快速修复命令:")
        print("  # 重新导入数据库表")
        print("  mysql -u root -p ry-vue < sql/soil_moisture_system.sql")
        print()
        print("  # 重新导入菜单权限")
        print("  mysql -u root -p ry-vue < sql/soil_menu_init.sql")
        print()
        print("  # 重启后端服务")
        print("  java -jar ruoyi-admin.jar")
    
    def run_full_diagnostic(self):
        """运行完整诊断"""
        print("🔧 土壤墒情预测系统 - 完整诊断")
        print(f"诊断时间: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}")
        
        # 执行所有测试
        db_ok = self.test_database_connection()
        backend_ok = self.test_backend_service()
        lstm_ok = self.test_lstm_service()
        
        self.explain_data_flow()
        
        if db_ok and backend_ok:
            self.test_generate_data_manually()
            self.check_data_after_generation()
        
        self.provide_solutions()
        
        # 总结
        self.print_section("诊断总结")
        print(f"数据库连接: {'✓' if db_ok else '✗'}")
        print(f"后端服务: {'✓' if backend_ok else '✗'}")
        print(f"LSTM服务: {'✓' if lstm_ok else '✗'}")
        
        if db_ok and backend_ok:
            print("\n✅ 基础服务正常，如果数据生成仍有问题，请检查权限和日志")
        else:
            print("\n❌ 基础服务有问题，请先解决服务启动问题")

def main():
    # 提示用户修改数据库配置
    print("请先修改脚本中的数据库配置:")
    print("  host: localhost")
    print("  port: 3306") 
    print("  user: root")
    print("  password: 你的数据库密码")
    print("  database: ry-vue")
    print()
    
    input("按回车键继续...")
    
    diagnostic = SystemDiagnostic()
    diagnostic.run_full_diagnostic()

if __name__ == '__main__':
    main()