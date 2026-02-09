package com.ruoyi.soil.service.impl;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.*;
import java.util.stream.Collectors;

import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.soil.service.ISoilDataService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.soil.mapper.SoilPredictionMapper;
import com.ruoyi.soil.domain.SoilPrediction;
import com.ruoyi.soil.domain.SoilData;
import com.ruoyi.soil.service.ISoilPredictionService;
import com.ruoyi.soil.service.ILstmModelService;

/**
 * 土壤墒情预测Service业务层处理
 * 
 * @author ruoyi
 * @date 2024-01-19
 */
@Service
public class SoilPredictionServiceImpl implements ISoilPredictionService 
{
    @Autowired
    private SoilPredictionMapper soilPredictionMapper;
    
    @Autowired
    private ISoilDataService soilDataService;
    
    @Autowired
    private ILstmModelService lstmModelService;

    /**
     * 查询土壤墒情预测
     * 
     * @param id 土壤墒情预测主键
     * @return 土壤墒情预测
     */
    @Override
    public SoilPrediction selectSoilPredictionById(Long id)
    {
        return soilPredictionMapper.selectSoilPredictionById(id);
    }

    /**
     * 查询土壤墒情预测列表
     * 
     * @param soilPrediction 土壤墒情预测
     * @return 土壤墒情预测
     */
    @Override
    public List<SoilPrediction> selectSoilPredictionList(SoilPrediction soilPrediction)
    {
        return soilPredictionMapper.selectSoilPredictionList(soilPrediction);
    }

    /**
     * 新增土壤墒情预测
     * 
     * @param soilPrediction 土壤墒情预测
     * @return 结果
     */
    @Override
    public int insertSoilPrediction(SoilPrediction soilPrediction)
    {
        soilPrediction.setCreateTime(DateUtils.getNowDate());
        return soilPredictionMapper.insertSoilPrediction(soilPrediction);
    }

    /**
     * 修改土壤墒情预测
     * 
     * @param soilPrediction 土壤墒情预测
     * @return 结果
     */
    @Override
    public int updateSoilPrediction(SoilPrediction soilPrediction)
    {
        soilPrediction.setUpdateTime(DateUtils.getNowDate());
        return soilPredictionMapper.updateSoilPrediction(soilPrediction);
    }

    /**
     * 批量删除土壤墒情预测
     * 
     * @param ids 需要删除的土壤墒情预测主键
     * @return 结果
     */
    @Override
    public int deleteSoilPredictionByIds(Long[] ids)
    {
        return soilPredictionMapper.deleteSoilPredictionByIds(ids);
    }

    /**
     * 删除土壤墒情预测信息
     * 
     * @param id 土壤墒情预测主键
     * @return 结果
     */
    @Override
    public int deleteSoilPredictionById(Long id)
    {
        return soilPredictionMapper.deleteSoilPredictionById(id);
    }

    /**
     * 调用LSTM模型进行预测
     */
    @Override
    public SoilPrediction predictSoilMoisture(String fieldId, String predictType) {
        try {
            // 1. 获取历史数据
            int historyDays = getHistoryDaysByPredictType(predictType);
            List<SoilData> historyData = soilDataService.getHistoryDataForTraining(fieldId, historyDays);
            
            if (historyData.size() < 24) { // 至少需要24小时的数据
                throw new RuntimeException("历史数据不足，无法进行预测");
            }
            
            // 2. 准备输入数据
            Map<String, Object> inputData = prepareInputData(historyData);
            
            // 3. 调用LSTM模型服务
            Map<String, Object> predictionResult = lstmModelService.predict(inputData, predictType);
            
            // 4. 解析预测结果
            SoilPrediction prediction = parsePredictionResult(predictionResult, fieldId, predictType);
            
            // 5. 保存预测结果
            insertSoilPrediction(prediction);
            
            return prediction;
            
        } catch (Exception e) {
            throw new RuntimeException("预测失败: " + e.getMessage(), e);
        }
    }

    /**
     * 批量预测多个地块
     */
    @Override
    public List<SoilPrediction> batchPredictSoilMoisture(List<String> fieldIds, String predictType) {
        List<SoilPrediction> predictions = new ArrayList<>();
        
        for (String fieldId : fieldIds) {
            try {
                SoilPrediction prediction = predictSoilMoisture(fieldId, predictType);
                predictions.add(prediction);
            } catch (Exception e) {
                // 记录错误但继续处理其他地块
                System.err.println("地块 " + fieldId + " 预测失败: " + e.getMessage());
            }
        }
        
        return predictions;
    }

    /**
     * 获取预测准确度评估
     */
    @Override
    public Map<String, Object> evaluatePredictionAccuracy(String fieldId, int days) {
        Map<String, Object> evaluation = new HashMap<>();
        
        // 获取历史预测结果
        List<SoilPrediction> historicalPredictions = soilPredictionMapper.selectPredictionHistoryByFieldId(fieldId, null);
        
        if (historicalPredictions.isEmpty()) {
            evaluation.put("message", "暂无历史预测数据");
            return evaluation;
        }
        
        // 计算准确度指标
        List<Double> rmseErrors = new ArrayList<>();
        List<Double> maeErrors = new ArrayList<>();
        List<Double> accuracies = new ArrayList<>();
        
        for (SoilPrediction prediction : historicalPredictions) {
            if (prediction.getRmseError() != null) {
                rmseErrors.add(prediction.getRmseError().doubleValue());
            }
            if (prediction.getMaeError() != null) {
                maeErrors.add(prediction.getMaeError().doubleValue());
            }
            if (prediction.getAccuracy() != null) {
                accuracies.add(prediction.getAccuracy().doubleValue());
            }
        }
        
        // 计算平均指标
        double avgRmse = rmseErrors.stream().mapToDouble(Double::doubleValue).average().orElse(0.0);
        double avgMae = maeErrors.stream().mapToDouble(Double::doubleValue).average().orElse(0.0);
        double avgAccuracy = accuracies.stream().mapToDouble(Double::doubleValue).average().orElse(0.0);
        
        evaluation.put("averageRMSE", BigDecimal.valueOf(avgRmse).setScale(4, RoundingMode.HALF_UP));
        evaluation.put("averageMAE", BigDecimal.valueOf(avgMae).setScale(4, RoundingMode.HALF_UP));
        evaluation.put("averageAccuracy", BigDecimal.valueOf(avgAccuracy).setScale(2, RoundingMode.HALF_UP));
        evaluation.put("totalPredictions", historicalPredictions.size());
        
        return evaluation;
    }

    /**
     * 获取预测趋势分析
     */
    @Override
    public Map<String, Object> getPredictionTrend(String fieldId) {
        Map<String, Object> trend = new HashMap<>();
        
        // 获取最近的预测数据
        List<SoilPrediction> recentPredictions = soilPredictionMapper.selectPredictionHistoryByFieldId(fieldId, null);
        
        if (recentPredictions.isEmpty()) {
            trend.put("message", "暂无预测数据");
            return trend;
        }
        
        // 按时间排序
        recentPredictions.sort(Comparator.comparing(SoilPrediction::getPredictTime));
        
        // 分析趋势
        List<Map<String, Object>> trendData = new ArrayList<>();
        for (SoilPrediction prediction : recentPredictions) {
            Map<String, Object> point = new HashMap<>();
            point.put("time", prediction.getPredictTime());
            point.put("humidity", prediction.getPredictedHumidity());
            point.put("temperature", prediction.getPredictedTemperature());
            point.put("ecValue", prediction.getPredictedEcValue());
            point.put("phValue", prediction.getPredictedPhValue());
            trendData.add(point);
        }
        
        trend.put("trendData", trendData);
        trend.put("dataCount", recentPredictions.size());
        
        // 计算变化趋势
        if (recentPredictions.size() >= 2) {
            SoilPrediction first = recentPredictions.get(0);
            SoilPrediction last = recentPredictions.get(recentPredictions.size() - 1);
            
            Map<String, String> trendDirection = new HashMap<>();
            trendDirection.put("humidity", getTrendDirection(first.getPredictedHumidity(), last.getPredictedHumidity()));
            trendDirection.put("temperature", getTrendDirection(first.getPredictedTemperature(), last.getPredictedTemperature()));
            trendDirection.put("ecValue", getTrendDirection(first.getPredictedEcValue(), last.getPredictedEcValue()));
            trendDirection.put("phValue", getTrendDirection(first.getPredictedPhValue(), last.getPredictedPhValue()));
            
            trend.put("trendDirection", trendDirection);
        }
        
        return trend;
    }

    /**
     * 模型性能监控
     */
    @Override
    public Map<String, Object> getModelPerformanceMetrics() {
        Map<String, Object> metrics = new HashMap<>();
        
        // 获取全局统计
        Map<String, Object> overallStats = soilPredictionMapper.selectOverallStats();
        if (overallStats != null && !overallStats.isEmpty()) {
            // 直接使用数据库返回的字段名，确保数据正确传递
            Object totalPredictions = overallStats.get("total_predictions");
            Object averageAccuracy = overallStats.get("average_accuracy");
            Object averageRmse = overallStats.get("average_rmse");
            Object averageMae = overallStats.get("average_mae");
            
            metrics.put("totalPredictions", totalPredictions != null ? totalPredictions : 0);
            metrics.put("averageAccuracy", averageAccuracy != null ? 
                BigDecimal.valueOf(Double.parseDouble(averageAccuracy.toString())).setScale(2, RoundingMode.HALF_UP) : BigDecimal.ZERO);
            metrics.put("averageRMSE", averageRmse != null ? 
                BigDecimal.valueOf(Double.parseDouble(averageRmse.toString())).setScale(4, RoundingMode.HALF_UP) : BigDecimal.ZERO);
            metrics.put("averageMAE", averageMae != null ? 
                BigDecimal.valueOf(Double.parseDouble(averageMae.toString())).setScale(4, RoundingMode.HALF_UP) : BigDecimal.ZERO);
        } else {
            // 如果没有数据，返回默认值
            metrics.put("totalPredictions", 0);
            metrics.put("averageAccuracy", BigDecimal.ZERO);
            metrics.put("averageRMSE", BigDecimal.ZERO);
            metrics.put("averageMAE", BigDecimal.ZERO);
        }
        
        // 获取准确度统计
        List<Map<String, Object>> accuracyStats = soilPredictionMapper.selectAccuracyStats();
        metrics.put("accuracyStats", accuracyStats);
        
        // 计算整体性能指标（用于健康状态评估）
        if (!accuracyStats.isEmpty()) {
            double totalAccuracy = 0.0;
            double totalRmse = 0.0;
            double totalMae = 0.0;
            int count = 0;
            
            for (Map<String, Object> stat : accuracyStats) {
                if (stat.get("avg_accuracy") != null) {
                    totalAccuracy += Double.parseDouble(stat.get("avg_accuracy").toString());
                    count++;
                }
                if (stat.get("avg_rmse") != null) {
                    totalRmse += Double.parseDouble(stat.get("avg_rmse").toString());
                }
                if (stat.get("avg_mae") != null) {
                    totalMae += Double.parseDouble(stat.get("avg_mae").toString());
                }
            }
            
            if (count > 0) {
                metrics.put("overallAccuracy", BigDecimal.valueOf(totalAccuracy / count).setScale(2, RoundingMode.HALF_UP));
                metrics.put("overallRMSE", BigDecimal.valueOf(totalRmse / count).setScale(4, RoundingMode.HALF_UP));
                metrics.put("overallMAE", BigDecimal.valueOf(totalMae / count).setScale(4, RoundingMode.HALF_UP));
            }
        }
        
        // 模型健康状态评估
        String modelHealth = evaluateModelHealth(metrics);
        metrics.put("modelHealth", modelHealth);
        
        return metrics;
    }

    /**
     * 自动预测任务 - 定时任务调用
     */
    @Override
    public Map<String, Object> executeAutoPrediction() {
        Map<String, Object> result = new HashMap<>();
        
        try {
            // 获取所有需要预测的地块ID（这里简化处理，实际应该从配置或数据库获取）
            List<String> fieldIds = Arrays.asList("FIELD_001", "FIELD_002", "FIELD_003");
            
            int successCount = 0;
            int failCount = 0;
            List<String> errors = new ArrayList<>();
            
            for (String fieldId : fieldIds) {
                try {
                    // 执行小时级预测
                    predictSoilMoisture(fieldId, "1");
                    successCount++;
                } catch (Exception e) {
                    failCount++;
                    errors.add(fieldId + ": " + e.getMessage());
                }
            }
            
            result.put("success", true);
            result.put("successCount", successCount);
            result.put("failCount", failCount);
            result.put("errors", errors);
            result.put("executeTime", new Date());
            
        } catch (Exception e) {
            result.put("success", false);
            result.put("message", "自动预测任务执行失败: " + e.getMessage());
        }
        
        return result;
    }

    // 私有辅助方法
    
    private int getHistoryDaysByPredictType(String predictType) {
        switch (predictType) {
            case "1": // 小时级预测
                return 7; // 使用7天历史数据
            case "2": // 天级预测
                return 30; // 使用30天历史数据
            case "3": // 周级预测
                return 90; // 使用90天历史数据
            default:
                return 7;
        }
    }
    
    private Map<String, Object> prepareInputData(List<SoilData> historyData) {
        Map<String, Object> inputData = new HashMap<>();
        
        // 提取时间序列特征
        List<Double> temperatures = new ArrayList<>();
        List<Double> humidities = new ArrayList<>();
        List<Double> ecValues = new ArrayList<>();
        List<Double> phValues = new ArrayList<>();
        List<String> timestamps = new ArrayList<>();
        
        for (SoilData data : historyData) {
            temperatures.add(data.getTemperature().doubleValue());
            humidities.add(data.getHumidity().doubleValue());
            ecValues.add(data.getEcValue().doubleValue());
            phValues.add(data.getPhValue().doubleValue());
            timestamps.add(DateUtils.parseDateToStr(DateUtils.YYYY_MM_DD_HH_MM_SS, data.getCollectTime()));
        }
        
        inputData.put("temperature", temperatures);
        inputData.put("humidity", humidities);
        inputData.put("ecValue", ecValues);
        inputData.put("phValue", phValues);
        inputData.put("timestamps", timestamps);
        inputData.put("sequenceLength", historyData.size());
        
        return inputData;
    }
    
    private SoilPrediction parsePredictionResult(Map<String, Object> result, String fieldId, String predictType) {
        SoilPrediction prediction = new SoilPrediction();
        
        prediction.setFieldId(fieldId);
        prediction.setPredictType(predictType);
        prediction.setPredictTime(new Date());
        
        // 解析预测结果
        if (result.get("predicted_humidity") != null) {
            prediction.setPredictedHumidity(BigDecimal.valueOf(Double.parseDouble(result.get("predicted_humidity").toString())));
        }
        if (result.get("predicted_temperature") != null) {
            prediction.setPredictedTemperature(BigDecimal.valueOf(Double.parseDouble(result.get("predicted_temperature").toString())));
        }
        if (result.get("predicted_ec") != null) {
            prediction.setPredictedEcValue(BigDecimal.valueOf(Double.parseDouble(result.get("predicted_ec").toString())));
        }
        if (result.get("predicted_ph") != null) {
            prediction.setPredictedPhValue(BigDecimal.valueOf(Double.parseDouble(result.get("predicted_ph").toString())));
        }
        
        // 解析性能指标
        if (result.get("accuracy") != null) {
            prediction.setAccuracy(BigDecimal.valueOf(Double.parseDouble(result.get("accuracy").toString())));
        }
        if (result.get("rmse") != null) {
            prediction.setRmseError(BigDecimal.valueOf(Double.parseDouble(result.get("rmse").toString())));
        }
        if (result.get("mae") != null) {
            prediction.setMaeError(BigDecimal.valueOf(Double.parseDouble(result.get("mae").toString())));
        }
        if (result.get("confidence") != null) {
            prediction.setConfidence(BigDecimal.valueOf(Double.parseDouble(result.get("confidence").toString())));
        }
        if (result.get("model_version") != null) {
            prediction.setModelVersion(result.get("model_version").toString());
        }
        
        return prediction;
    }
    
    private String getTrendDirection(BigDecimal first, BigDecimal last) {
        if (first == null || last == null) {
            return "未知";
        }
        
        int comparison = last.compareTo(first);
        if (comparison > 0) {
            return "上升";
        } else if (comparison < 0) {
            return "下降";
        } else {
            return "稳定";
        }
    }
    
    private String evaluateModelHealth(Map<String, Object> metrics) {
        // 简单的模型健康评估逻辑
        if (metrics.get("overallAccuracy") != null) {
            double accuracy = Double.parseDouble(metrics.get("overallAccuracy").toString());
            if (accuracy >= 90) {
                return "优秀";
            } else if (accuracy >= 80) {
                return "良好";
            } else if (accuracy >= 70) {
                return "一般";
            } else {
                return "需要优化";
            }
        }
        return "未知";
    }
}