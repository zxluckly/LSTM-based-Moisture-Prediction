#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
LSTM服务启动脚本
确保服务在正确的端口启动
"""

import os
import sys

# 添加当前目录到Python路径
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))

# 导入并启动应用
from app import app, predictor, logger, CONFIG

if __name__ == '__main__':
    try:
        # 创建必要的目录
        os.makedirs(CONFIG['MODEL_PATH'], exist_ok=True)
        os.makedirs(CONFIG['SCALER_PATH'], exist_ok=True)
        
        # 加载模型
        logger.info("启动LSTM预测服务...")
        predictor.load_model()
        
        # 启动Flask应用
        logger.info(f"LSTM服务将在端口 8081 启动")
        app.run(
            host='0.0.0.0',
            port=8081,
            debug=False,
            threaded=True
        )
    except Exception as e:
        logger.error(f"启动LSTM服务失败: {str(e)}")
        sys.exit(1)