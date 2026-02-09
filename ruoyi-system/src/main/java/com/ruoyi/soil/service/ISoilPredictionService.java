package com.ruoyi.soil.service;

import java.util.List;
import java.util.Map;
import com.ruoyi.soil.domain.SoilPrediction;

/**
 * 土壤墒情预测Service接口
 * 
 * @author ruoyi
 * @date 2024-01-19
 */
public interface ISoilPredictionService 
{
    /**
     * 查询土壤墒情预测
     * 
     * @param id 土壤墒情预测主键
     * @return 土壤墒情预测
     */
    public SoilPrediction selectSoilPredictionById(Long id);

    /**
     * 查询土壤墒情预测列表
     * 
     * @param soilPrediction 土壤墒情预测
     * @return 土壤墒情预测集合
     */
    public List<SoilPrediction> selectSoilPredictionList(SoilPrediction soilPrediction);

    /**
     * 新增土壤墒情预测
     * 
     * @param soilPrediction 土壤墒情预测
     * @return 结果
     */
    public int insertSoilPrediction(SoilPrediction soilPrediction);

    /**
     * 修改土壤墒情预测
     * 
     * @param soilPrediction 土壤墒情预测
     * @return 结果
     */
    public int updateSoilPrediction(SoilPrediction soilPrediction);

    /**
     * 批量删除土壤墒情预测
     * 
     * @param ids 需要删除的土壤墒情预测主键集合
     * @return 结果
     */
    public int deleteSoilPredictionByIds(Long[] ids);

    /**
     * 删除土壤墒情预测信息
     * 
     * @param id 土壤墒情预测主键
     * @return 结果
     */
    public int deleteSoilPredictionById(Long id);

    /**
     * 调用LSTM模型进行预测
     * 
     * @param fieldId 地块ID
     * @param predictType 预测类型(1小时 2天 3周)
     * @return 预测结果
     */
    public SoilPrediction predictSoilMoisture(String fieldId, String predictType);

    /**
     * 批量预测多个地块
     * 
     * @param fieldIds 地块ID列表
     * @param predictType 预测类型
     * @return 预测结果列表
     */
    public List<SoilPrediction> batchPredictSoilMoisture(List<String> fieldIds, String predictType);

    /**
     * 获取预测准确度评估
     * 
     * @param fieldId 地块ID
     * @param days 评估天数
     * @return 准确度评估结果
     */
    public Map<String, Object> evaluatePredictionAccuracy(String fieldId, int days);

    /**
     * 获取预测趋势分析
     * 
     * @param fieldId 地块ID
     * @return 趋势分析结果
     */
    public Map<String, Object> getPredictionTrend(String fieldId);

    /**
     * 模型性能监控
     * 
     * @return 模型性能指标
     */
    public Map<String, Object> getModelPerformanceMetrics();

    /**
     * 自动预测任务 - 定时任务调用
     * 
     * @return 执行结果
     */
    public Map<String, Object> executeAutoPrediction();
}