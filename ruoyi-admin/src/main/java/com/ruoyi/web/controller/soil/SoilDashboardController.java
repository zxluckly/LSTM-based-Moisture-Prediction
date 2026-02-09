package com.ruoyi.web.controller.soil;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.soil.domain.SoilData;
import com.ruoyi.soil.domain.SoilPrediction;
import com.ruoyi.soil.service.ISoilDataService;
import com.ruoyi.soil.service.ISoilPredictionService;
import com.ruoyi.soil.service.ILstmModelService;

/**
 * 土壤墒情监控大屏Controller
 * 
 * @author ruoyi
 * @date 2024-01-19
 */
@RestController
@RequestMapping("/soil/dashboard")
public class SoilDashboardController extends BaseController
{
    @Autowired
    private ISoilDataService soilDataService;
    
    @Autowired
    private ISoilPredictionService soilPredictionService;
    
    @Autowired
    private ILstmModelService lstmModelService;

    /**
     * 获取监控大屏总览数据
     */
    @PreAuthorize("@ss.hasPermi('soil:dashboard:view')")
    @GetMapping("/overview")
    public AjaxResult getOverview()
    {
        Map<String, Object> overview = new HashMap<>();
        
        // 获取实时数据统计
        Map<String, Object> realTimeStats = soilDataService.getRealTimeStats();
        overview.put("dataStats", realTimeStats);
        
        // 获取模型性能指标
        Map<String, Object> modelMetrics = soilPredictionService.getModelPerformanceMetrics();
        overview.put("modelMetrics", modelMetrics);
        
        // 获取LSTM服务健康状态
        Map<String, Object> serviceHealth = lstmModelService.checkHealth();
        overview.put("serviceHealth", serviceHealth);
        
        // 添加系统状态信息
        Map<String, Object> systemStatus = new HashMap<>();
        systemStatus.put("dataCollectionStatus", "正常");
        systemStatus.put("predictionServiceStatus", serviceHealth.get("status"));
        systemStatus.put("lastUpdateTime", System.currentTimeMillis());
        overview.put("systemStatus", systemStatus);
        
        return success(overview);
    }

    /**
     * 获取地块实时数据
     */
    @PreAuthorize("@ss.hasPermi('soil:dashboard:view')")
    @GetMapping("/realtime/{fieldId}")
    public AjaxResult getRealtimeData(@PathVariable String fieldId)
    {
        Map<String, Object> realtimeData = new HashMap<>();
        
        // 获取最新的土壤数据
        SoilData condition = new SoilData();
        condition.setFieldId(fieldId);
        List<SoilData> latestData = soilDataService.selectSoilDataList(condition);
        
        if (!latestData.isEmpty()) {
            // 取最新的一条数据
            SoilData latest = latestData.get(0);
            realtimeData.put("currentData", latest);
            
            // 获取数据质量报告
            Map<String, Object> qualityReport = soilDataService.getDataQualityReport(fieldId);
            realtimeData.put("qualityReport", qualityReport);
        }
        
        // 获取最新的预测结果
        SoilPrediction predictionCondition = new SoilPrediction();
        predictionCondition.setFieldId(fieldId);
        List<SoilPrediction> predictions = soilPredictionService.selectSoilPredictionList(predictionCondition);
        
        if (!predictions.isEmpty()) {
            realtimeData.put("latestPrediction", predictions.get(0));
        }
        
        return success(realtimeData);
    }

    /**
     * 获取历史趋势数据
     */
    @PreAuthorize("@ss.hasPermi('soil:dashboard:view')")
    @GetMapping("/trend/{fieldId}")
    public AjaxResult getTrendData(@PathVariable String fieldId, @RequestParam(defaultValue = "7") int days)
    {
        Map<String, Object> trendData = new HashMap<>();
        
        // 获取历史数据趋势
        List<SoilData> historyData = soilDataService.getHistoryDataForTraining(fieldId, days);
        trendData.put("historyData", historyData);
        
        // 获取预测趋势
        Map<String, Object> predictionTrend = soilPredictionService.getPredictionTrend(fieldId);
        trendData.put("predictionTrend", predictionTrend);
        
        return success(trendData);
    }

    /**
     * 获取多地块对比数据
     */
    @PreAuthorize("@ss.hasPermi('soil:dashboard:view')")
    @GetMapping("/compare")
    public AjaxResult getCompareData(@RequestParam List<String> fieldIds)
    {
        Map<String, Object> compareData = new HashMap<>();
        
        for (String fieldId : fieldIds) {
            Map<String, Object> fieldData = new HashMap<>();
            
            // 获取最新数据
            SoilData condition = new SoilData();
            condition.setFieldId(fieldId);
            List<SoilData> latestData = soilDataService.selectSoilDataList(condition);
            
            if (!latestData.isEmpty()) {
                fieldData.put("currentData", latestData.get(0));
            }
            
            // 获取数据质量
            Map<String, Object> quality = soilDataService.getDataQualityReport(fieldId);
            fieldData.put("dataQuality", quality);
            
            // 获取预测准确度
            Map<String, Object> accuracy = soilPredictionService.evaluatePredictionAccuracy(fieldId, 7);
            fieldData.put("predictionAccuracy", accuracy);
            
            compareData.put(fieldId, fieldData);
        }
        
        return success(compareData);
    }

    /**
     * 获取预警信息
     */
    @PreAuthorize("@ss.hasPermi('soil:dashboard:view')")
    @GetMapping("/alerts")
    public AjaxResult getAlerts()
    {
        Map<String, Object> alerts = new HashMap<>();
        
        // 检查数据异常
        Map<String, Object> realTimeStats = soilDataService.getRealTimeStats();
        @SuppressWarnings("unchecked")
        List<Map<String, Object>> abnormalStats = (List<Map<String, Object>>) realTimeStats.get("abnormalStats");
        
        // 检查模型性能
        Map<String, Object> modelMetrics = soilPredictionService.getModelPerformanceMetrics();
        
        // 检查服务状态
        Map<String, Object> serviceHealth = lstmModelService.checkHealth();
        
        // 生成预警信息
        java.util.List<Map<String, Object>> alertList = new java.util.ArrayList<>();
        
        // 数据异常预警
        if (abnormalStats != null && !abnormalStats.isEmpty()) {
            for (Map<String, Object> stat : abnormalStats) {
                if (stat.get("abnormal_count") != null) {
                    int abnormalCount = Integer.parseInt(stat.get("abnormal_count").toString());
                    if (abnormalCount > 10) {
                        Map<String, Object> alert = new HashMap<>();
                        alert.put("type", "数据异常");
                        alert.put("level", "警告");
                        alert.put("message", "地块 " + stat.get("field_id") + " 存在 " + abnormalCount + " 条异常数据");
                        alert.put("timestamp", System.currentTimeMillis());
                        alertList.add(alert);
                    }
                }
            }
        }
        
        // 模型性能预警
        if (modelMetrics.get("overallAccuracy") != null) {
            double accuracy = Double.parseDouble(modelMetrics.get("overallAccuracy").toString());
            if (accuracy < 70) {
                Map<String, Object> alert = new HashMap<>();
                alert.put("type", "模型性能");
                alert.put("level", "严重");
                alert.put("message", "LSTM模型预测准确度过低: " + accuracy + "%");
                alert.put("timestamp", System.currentTimeMillis());
                alertList.add(alert);
            }
        }
        
        // 服务状态预警
        if (!"healthy".equals(serviceHealth.get("status"))) {
            Map<String, Object> alert = new HashMap<>();
            alert.put("type", "服务状态");
            alert.put("level", "严重");
            alert.put("message", "LSTM预测服务不可用: " + serviceHealth.get("message"));
            alert.put("timestamp", System.currentTimeMillis());
            alertList.add(alert);
        }
        
        alerts.put("alerts", alertList);
        alerts.put("totalCount", alertList.size());
        
        return success(alerts);
    }

    /**
     * 获取地图数据
     */
    @PreAuthorize("@ss.hasPermi('soil:dashboard:view')")
    @GetMapping("/map")
    public AjaxResult getMapData()
    {
        Map<String, Object> mapData = new HashMap<>();
        
        // 获取所有地块的最新数据
        List<SoilData> allData = soilDataService.selectSoilDataList(new SoilData());
        
        // 按地块分组
        Map<String, SoilData> fieldDataMap = new HashMap<>();
        for (SoilData data : allData) {
            String fieldId = data.getFieldId();
            if (!fieldDataMap.containsKey(fieldId) || 
                data.getCollectTime().after(fieldDataMap.get(fieldId).getCollectTime())) {
                fieldDataMap.put(fieldId, data);
            }
        }
        
        // 转换为地图标点数据
        java.util.List<Map<String, Object>> mapPoints = new java.util.ArrayList<>();
        for (Map.Entry<String, SoilData> entry : fieldDataMap.entrySet()) {
            SoilData data = entry.getValue();
            if (data.getLongitude() != null && data.getLatitude() != null) {
                Map<String, Object> point = new HashMap<>();
                point.put("fieldId", data.getFieldId());
                point.put("longitude", data.getLongitude());
                point.put("latitude", data.getLatitude());
                point.put("temperature", data.getTemperature());
                point.put("humidity", data.getHumidity());
                point.put("ecValue", data.getEcValue());
                point.put("phValue", data.getPhValue());
                point.put("dataStatus", data.getDataStatus());
                point.put("collectTime", data.getCollectTime());
                mapPoints.add(point);
            }
        }
        
        mapData.put("mapPoints", mapPoints);
        mapData.put("totalFields", fieldDataMap.size());
        
        return success(mapData);
    }

    /**
     * 获取统计报表数据
     */
    @PreAuthorize("@ss.hasPermi('soil:dashboard:view')")
    @GetMapping("/statistics")
    public AjaxResult getStatistics(@RequestParam(defaultValue = "30") int days)
    {
        Map<String, Object> statistics = new HashMap<>();
        
        // 获取数据统计
        Map<String, Object> dataStats = soilDataService.getRealTimeStats();
        statistics.put("dataStatistics", dataStats);
        
        // 获取预测统计
        Map<String, Object> predictionStats = soilPredictionService.getModelPerformanceMetrics();
        statistics.put("predictionStatistics", predictionStats);
        
        // 计算数据增长趋势（简化实现）
        Map<String, Object> growthTrend = new HashMap<>();
        growthTrend.put("dailyDataGrowth", "5.2%");
        growthTrend.put("predictionAccuracyTrend", "稳定");
        growthTrend.put("systemUsageTrend", "上升");
        statistics.put("growthTrend", growthTrend);
        
        return success(statistics);
    }
}