package com.ruoyi.soil.service.impl;

import com.alibaba.fastjson2.JSON;
import com.alibaba.fastjson2.JSONObject;
import com.ruoyi.soil.service.ILstmModelService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.*;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import java.util.HashMap;
import java.util.Map;

/**
 * LSTM模型服务实现类
 * 通过HTTP REST API与Python LSTM微服务通信
 * 
 * @author ruoyi
 * @date 2024-01-19
 */
@Service
public class LstmModelServiceImpl implements ILstmModelService {
    
    private static final Logger logger = LoggerFactory.getLogger(LstmModelServiceImpl.class);
    
    @Value("${lstm.service.url:http://localhost:8081}")
    private String lstmServiceUrl;
    
    @Value("${lstm.service.timeout:30000}")
    private int timeout;
    
    private final RestTemplate restTemplate;
    
    public LstmModelServiceImpl() {
        this.restTemplate = new RestTemplate();
        // 设置超时时间
        // this.restTemplate.setRequestFactory(new HttpComponentsClientHttpRequestFactory());
    }
    
    /**
     * 调用LSTM模型进行预测
     */
    @Override
    public Map<String, Object> predict(Map<String, Object> inputData, String predictType) {
        String url = lstmServiceUrl + "/api/lstm/predict";
        
        try {
            // 准备请求数据
            Map<String, Object> requestData = new HashMap<>();
            requestData.put("input_data", inputData);
            requestData.put("predict_type", predictType);
            requestData.put("timestamp", System.currentTimeMillis());
            
            // 设置请求头
            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.APPLICATION_JSON);
            
            HttpEntity<Map<String, Object>> request = new HttpEntity<>(requestData, headers);
            
            logger.info("调用LSTM预测服务: {}", url);
            logger.debug("请求数据: {}", JSON.toJSONString(requestData));
            
            // 发送请求
            ResponseEntity<String> response = restTemplate.postForEntity(url, request, String.class);
            
            if (response.getStatusCode() == HttpStatus.OK) {
                JSONObject result = JSON.parseObject(response.getBody());
                logger.info("LSTM预测成功，响应: {}", result);
                return result;
            } else {
                throw new RuntimeException("LSTM服务响应异常: " + response.getStatusCode());
            }
            
        } catch (Exception e) {
            logger.error("调用LSTM预测服务失败", e);
            // 返回模拟预测结果作为降级处理
            return generateFallbackPrediction(inputData, predictType);
        }
    }
    
    /**
     * 训练LSTM模型
     */
    @Override
    public Map<String, Object> trainModel(Map<String, Object> trainingData, Map<String, Object> modelConfig) {
        String url = lstmServiceUrl + "/api/lstm/train";
        
        try {
            Map<String, Object> requestData = new HashMap<>();
            requestData.put("training_data", trainingData);
            requestData.put("model_config", modelConfig);
            requestData.put("timestamp", System.currentTimeMillis());
            
            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.APPLICATION_JSON);
            
            HttpEntity<Map<String, Object>> request = new HttpEntity<>(requestData, headers);
            
            logger.info("调用LSTM训练服务: {}", url);
            
            ResponseEntity<String> response = restTemplate.postForEntity(url, request, String.class);
            
            if (response.getStatusCode() == HttpStatus.OK) {
                JSONObject result = JSON.parseObject(response.getBody());
                logger.info("LSTM训练完成，响应: {}", result);
                return result;
            } else {
                throw new RuntimeException("LSTM训练服务响应异常: " + response.getStatusCode());
            }
            
        } catch (Exception e) {
            logger.error("调用LSTM训练服务失败", e);
            Map<String, Object> errorResult = new HashMap<>();
            errorResult.put("success", false);
            errorResult.put("message", "训练服务不可用: " + e.getMessage());
            return errorResult;
        }
    }
    
    /**
     * 评估模型性能
     */
    @Override
    public Map<String, Object> evaluateModel(Map<String, Object> testData, String modelVersion) {
        String url = lstmServiceUrl + "/api/lstm/evaluate";
        
        try {
            Map<String, Object> requestData = new HashMap<>();
            requestData.put("test_data", testData);
            requestData.put("model_version", modelVersion);
            
            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.APPLICATION_JSON);
            
            HttpEntity<Map<String, Object>> request = new HttpEntity<>(requestData, headers);
            
            ResponseEntity<String> response = restTemplate.postForEntity(url, request, String.class);
            
            if (response.getStatusCode() == HttpStatus.OK) {
                return JSON.parseObject(response.getBody());
            } else {
                throw new RuntimeException("模型评估服务响应异常: " + response.getStatusCode());
            }
            
        } catch (Exception e) {
            logger.error("调用模型评估服务失败", e);
            Map<String, Object> errorResult = new HashMap<>();
            errorResult.put("success", false);
            errorResult.put("message", "评估服务不可用: " + e.getMessage());
            return errorResult;
        }
    }
    
    /**
     * 获取模型信息
     */
    @Override
    public Map<String, Object> getModelInfo(String modelVersion) {
        String url = lstmServiceUrl + "/api/lstm/model/info?version=" + modelVersion;
        
        try {
            ResponseEntity<String> response = restTemplate.getForEntity(url, String.class);
            
            if (response.getStatusCode() == HttpStatus.OK) {
                return JSON.parseObject(response.getBody());
            } else {
                throw new RuntimeException("获取模型信息失败: " + response.getStatusCode());
            }
            
        } catch (Exception e) {
            logger.error("获取模型信息失败", e);
            Map<String, Object> errorResult = new HashMap<>();
            errorResult.put("success", false);
            errorResult.put("message", "模型信息服务不可用: " + e.getMessage());
            return errorResult;
        }
    }
    
    /**
     * 检查模型服务健康状态
     */
    @Override
    public Map<String, Object> checkHealth() {
        String url = lstmServiceUrl + "/api/lstm/health";
        
        try {
            ResponseEntity<String> response = restTemplate.getForEntity(url, String.class);
            
            Map<String, Object> healthStatus = new HashMap<>();
            if (response.getStatusCode() == HttpStatus.OK) {
                JSONObject result = JSON.parseObject(response.getBody());
                healthStatus.put("status", "healthy");
                healthStatus.put("service_info", result);
            } else {
                healthStatus.put("status", "unhealthy");
                healthStatus.put("message", "服务响应异常: " + response.getStatusCode());
            }
            
            return healthStatus;
            
        } catch (Exception e) {
            logger.error("检查LSTM服务健康状态失败", e);
            Map<String, Object> healthStatus = new HashMap<>();
            healthStatus.put("status", "unhealthy");
            healthStatus.put("message", "服务不可达: " + e.getMessage());
            return healthStatus;
        }
    }
    
    /**
     * 更新模型版本
     */
    @Override
    public Map<String, Object> updateModel(String newModelPath) {
        String url = lstmServiceUrl + "/api/lstm/model/update";
        
        try {
            Map<String, Object> requestData = new HashMap<>();
            requestData.put("model_path", newModelPath);
            requestData.put("timestamp", System.currentTimeMillis());
            
            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.APPLICATION_JSON);
            
            HttpEntity<Map<String, Object>> request = new HttpEntity<>(requestData, headers);
            
            ResponseEntity<String> response = restTemplate.postForEntity(url, request, String.class);
            
            if (response.getStatusCode() == HttpStatus.OK) {
                return JSON.parseObject(response.getBody());
            } else {
                throw new RuntimeException("模型更新失败: " + response.getStatusCode());
            }
            
        } catch (Exception e) {
            logger.error("更新模型失败", e);
            Map<String, Object> errorResult = new HashMap<>();
            errorResult.put("success", false);
            errorResult.put("message", "模型更新服务不可用: " + e.getMessage());
            return errorResult;
        }
    }
    
    /**
     * 生成降级预测结果
     * 当LSTM服务不可用时使用简单的统计方法进行预测
     */
    private Map<String, Object> generateFallbackPrediction(Map<String, Object> inputData, String predictType) {
        logger.warn("LSTM服务不可用，使用降级预测策略");
        
        Map<String, Object> fallbackResult = new HashMap<>();
        
        try {
            // 从输入数据中提取历史值
            Object humidityObj = inputData.get("humidity");
            Object temperatureObj = inputData.get("temperature");
            Object ecValueObj = inputData.get("ecValue");
            Object phValueObj = inputData.get("phValue");
            
            if (humidityObj instanceof java.util.List) {
                java.util.List<?> humidityList = (java.util.List<?>) humidityObj;
                java.util.List<?> temperatureList = (java.util.List<?>) temperatureObj;
                java.util.List<?> ecValueList = (java.util.List<?>) ecValueObj;
                java.util.List<?> phValueList = (java.util.List<?>) phValueObj;
                
                // 使用简单的移动平均作为预测值
                double avgHumidity = calculateAverage(humidityList);
                double avgTemperature = calculateAverage(temperatureList);
                double avgEcValue = calculateAverage(ecValueList);
                double avgPhValue = calculateAverage(phValueList);
                
                // 添加一些随机波动
                double variation = 0.05; // 5%的变化
                fallbackResult.put("predicted_humidity", avgHumidity * (1 + (Math.random() - 0.5) * variation));
                fallbackResult.put("predicted_temperature", avgTemperature * (1 + (Math.random() - 0.5) * variation));
                fallbackResult.put("predicted_ec", avgEcValue * (1 + (Math.random() - 0.5) * variation));
                fallbackResult.put("predicted_ph", avgPhValue * (1 + (Math.random() - 0.5) * variation));
                
                // 设置较低的准确度和置信度
                fallbackResult.put("accuracy", 60.0);
                fallbackResult.put("confidence", 50.0);
                fallbackResult.put("rmse", 0.1);
                fallbackResult.put("mae", 0.08);
                fallbackResult.put("model_version", "fallback_v1.0");
                fallbackResult.put("is_fallback", true);
                
            } else {
                // 如果数据格式不正确，使用默认值
                fallbackResult.put("predicted_humidity", 60.0);
                fallbackResult.put("predicted_temperature", 20.0);
                fallbackResult.put("predicted_ec", 1.5);
                fallbackResult.put("predicted_ph", 7.0);
                fallbackResult.put("accuracy", 50.0);
                fallbackResult.put("confidence", 30.0);
                fallbackResult.put("model_version", "fallback_default");
                fallbackResult.put("is_fallback", true);
            }
            
        } catch (Exception e) {
            logger.error("生成降级预测结果失败", e);
            // 最后的兜底策略
            fallbackResult.put("predicted_humidity", 60.0);
            fallbackResult.put("predicted_temperature", 20.0);
            fallbackResult.put("predicted_ec", 1.5);
            fallbackResult.put("predicted_ph", 7.0);
            fallbackResult.put("accuracy", 30.0);
            fallbackResult.put("confidence", 20.0);
            fallbackResult.put("model_version", "fallback_emergency");
            fallbackResult.put("is_fallback", true);
        }
        
        return fallbackResult;
    }
    
    /**
     * 计算列表的平均值
     */
    private double calculateAverage(java.util.List<?> list) {
        if (list == null || list.isEmpty()) {
            return 0.0;
        }
        
        double sum = 0.0;
        int count = 0;
        
        for (Object obj : list) {
            if (obj instanceof Number) {
                sum += ((Number) obj).doubleValue();
                count++;
            }
        }
        
        return count > 0 ? sum / count : 0.0;
    }
}