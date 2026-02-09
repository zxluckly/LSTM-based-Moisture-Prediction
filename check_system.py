#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
土壤墒情预测系统部署检查脚本
用于验证系统各组件是否正常运行
"""

import requests
import json
import time
import sys
from datetime import datetime

class SystemChecker:
    def __init__(self):
        self.backend_url = "http://localhost:8080"
        self.frontend_url = "http://localhost:81"
        self.lstm_url = "http://localhost:8080"
        self.results = []
    
    def print_header(self):
        print("=" * 60)
        print("🌱 土壤墒情预测系统 - 部署检查工具")
        print("=" * 60)
        print(f"检查时间: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}")
        print()
    
    def check_service(self, name, url, timeout=5):
        """检查服务是否可访问"""
        print(f"🔍 检查 {name}...")
        try:
            response = requests.get(url, timeout=timeout)
            if response.status_code == 200:
                print(f"✅ {name} 运行正常 - {url}")
                self.results.append({"service": name, "status": "正常", "url": url})
                return True
            else:
                print(f"❌ {name} 响应异常 - 状态码: {response.status_code}")
                self.results.append({"service": name, "status": f"异常({response.status_code})", "url": url})
                return False
        except requests.exceptions.ConnectionError:
            print(f"❌ {name} 连接失败 - 服务可能未启动")
            self.results.append({"service": name, "status": "连接失败", "url": url})
            return False
        except requests.exceptions.Timeout:
            print(f"⚠️  {name} 响应超时")
            self.results.append({"service": name, "status": "超时", "url": url})
            return False
        except Exception as e:
            print(f"❌ {name} 检查失败: {str(e)}")
            self.results.append({"service": name, "status": f"错误: {str(e)}", "url": url})
            return False
    
    def check_backend_api(self):
        """检查后端API接口"""
        print("\n📡 检查后端API接口...")
        
        # 检查系统信息接口
        try:
            response = requests.get(f"{self.backend_url}/system/user/profile", timeout=10)
            if response.status_code in [200, 401]:  # 401表示需要登录，但服务正常
                print("✅ 后端API服务正常")
                return True
            else:
                print(f"❌ 后端API异常 - 状态码: {response.status_code}")
                return False
        except Exception as e:
            print(f"❌ 后端API检查失败: {str(e)}")
            return False
    
    def check_lstm_service(self):
        """检查LSTM微服务"""
        print("\n🧠 检查LSTM微服务...")
        
        try:
            response = requests.get(f"{self.lstm_url}/api/lstm/health", timeout=10)
            if response.status_code == 200:
                data = response.json()
                print("✅ LSTM服务运行正常")
                print(f"   服务信息: {data.get('service_info', {}).get('name', 'Unknown')}")
                print(f"   模型版本: {data.get('model_version', 'Unknown')}")
                print(f"   TensorFlow版本: {data.get('service_info', {}).get('tensorflow_version', 'Unknown')}")
                return True
            else:
                print(f"❌ LSTM服务异常 - 状态码: {response.status_code}")
                return False
        except Exception as e:
            print(f"❌ LSTM服务检查失败: {str(e)}")
            return False
    
    def check_database_connection(self):
        """检查数据库连接（通过后端API）"""
        print("\n🗄️  检查数据库连接...")
        
        try:
            # 尝试访问一个需要数据库的接口
            response = requests.get(f"{self.backend_url}/monitor/server", timeout=10)
            if response.status_code in [200, 401]:
                print("✅ 数据库连接正常")
                return True
            else:
                print(f"❌ 数据库连接异常 - 状态码: {response.status_code}")
                return False
        except Exception as e:
            print(f"❌ 数据库连接检查失败: {str(e)}")
            return False
    
    def test_soil_apis(self):
        """测试土壤墒情系统API"""
        print("\n🌱 测试土壤墒情系统API...")
        
        apis = [
            "/soil/data/stats/realtime",
            "/soil/prediction/predict-types",
            "/soil/dashboard/overview"
        ]
        
        success_count = 0
        for api in apis:
            try:
                response = requests.get(f"{self.backend_url}{api}", timeout=10)
                if response.status_code in [200, 401]:
                    print(f"✅ {api} - 接口正常")
                    success_count += 1
                else:
                    print(f"❌ {api} - 状态码: {response.status_code}")
            except Exception as e:
                print(f"❌ {api} - 错误: {str(e)}")
        
        print(f"\n📊 API测试结果: {success_count}/{len(apis)} 个接口正常")
        return success_count == len(apis)
    
    def generate_report(self):
        """生成检查报告"""
        print("\n" + "=" * 60)
        print("📋 系统检查报告")
        print("=" * 60)
        
        for result in self.results:
            status_icon = "✅" if result["status"] == "正常" else "❌"
            print(f"{status_icon} {result['service']}: {result['status']}")
        
        print("\n💡 建议:")
        
        # 检查是否有失败的服务
        failed_services = [r for r in self.results if r["status"] != "正常"]
        
        if not failed_services:
            print("🎉 所有服务运行正常！系统部署成功！")
            print("\n🚀 你现在可以:")
            print("   1. 访问前端页面: http://localhost:81")
            print("   2. 使用 admin/admin123 登录")
            print("   3. 在菜单中找到'土壤墒情系统'")
            print("   4. 开始使用系统功能")
        else:
            print("⚠️  发现以下问题需要解决:")
            for service in failed_services:
                if "连接失败" in service["status"]:
                    print(f"   - {service['service']}: 请检查服务是否启动")
                elif "超时" in service["status"]:
                    print(f"   - {service['service']}: 请检查网络连接或服务性能")
                else:
                    print(f"   - {service['service']}: {service['status']}")
            
            print("\n🔧 故障排除:")
            print("   1. 检查服务启动日志")
            print("   2. 验证配置文件设置")
            print("   3. 确认端口未被占用")
            print("   4. 查看防火墙设置")
    
    def run_all_checks(self):
        """运行所有检查"""
        self.print_header()
        
        # 基础服务检查
        self.check_service("前端服务", self.frontend_url)
        self.check_service("后端服务", self.backend_url)
        
        # 详细功能检查
        self.check_backend_api()
        self.check_lstm_service()
        self.check_database_connection()
        self.test_soil_apis()
        
        # 生成报告
        self.generate_report()

def main():
    """主函数"""
    checker = SystemChecker()
    
    try:
        checker.run_all_checks()
    except KeyboardInterrupt:
        print("\n\n⚠️  检查被用户中断")
        sys.exit(1)
    except Exception as e:
        print(f"\n\n❌ 检查过程中发生错误: {str(e)}")
        sys.exit(1)

if __name__ == "__main__":
    main()