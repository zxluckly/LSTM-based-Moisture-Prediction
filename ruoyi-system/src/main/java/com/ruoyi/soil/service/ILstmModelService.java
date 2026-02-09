package com.ruoyi.soil.service;

import java.util.Map;

/**
 * LSTM模型服务接口
 * 用于与Python LSTM微服务进行通信
 * 
 * @author ruoyi
 * @date 2024-01-19
 */
public interface ILstmModelService {
    
    /**
     * 调用LSTM模型进行预测
     * 
     * @param inputData 输入数据，包含时间序列特征
     * @param predictType 预测类型(1小时 2天 3周)
     * @return 预测结果
     */
    Map<String, Object> predict(Map<String, Object> inputData, String predictType);
    
    /**
     * 训练LSTM模型
     * 
     * @param trainingData 训练数据
     * @param modelConfig 模型配置参数
     * @return 训练结果
     */
    Map<String, Object> trainModel(Map<String, Object> trainingData, Map<String, Object> modelConfig);
    
    /**
     * 评估模型性能
     * 
     * @param testData 测试数据
     * @param modelVersion 模型版本
     * @return 评估结果
     */
    Map<String, Object> evaluateModel(Map<String, Object> testData, String modelVersion);
    
    /**
     * 获取模型信息
     * 
     * @param modelVersion 模型版本
     * @return 模型信息
     */
    Map<String, Object> getModelInfo(String modelVersion);
    
    /**
     * 检查模型服务健康状态
     * 
     * @return 健康状态
     */
    Map<String, Object> checkHealth();
    
    /**
     * 更新模型版本
     * 
     * @param newModelPath 新模型路径
     * @return 更新结果
     */
    Map<String, Object> updateModel(String newModelPath);
}