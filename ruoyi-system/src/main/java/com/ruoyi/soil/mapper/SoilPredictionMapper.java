package com.ruoyi.soil.mapper;

import java.util.List;
import java.util.Map;
import org.apache.ibatis.annotations.Param;
import com.ruoyi.soil.domain.SoilPrediction;

/**
 * 土壤墒情预测Mapper接口
 * 
 * @author ruoyi
 * @date 2024-01-19
 */
public interface SoilPredictionMapper 
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
     * 删除土壤墒情预测
     * 
     * @param id 土壤墒情预测主键
     * @return 结果
     */
    public int deleteSoilPredictionById(Long id);

    /**
     * 批量删除土壤墒情预测
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteSoilPredictionByIds(Long[] ids);

    /**
     * 根据地块ID查询最新预测结果
     * 
     * @param fieldId 地块ID
     * @return 预测结果
     */
    public SoilPrediction selectLatestPredictionByFieldId(@Param("fieldId") String fieldId);

    /**
     * 根据地块ID和预测类型查询预测历史
     * 
     * @param fieldId 地块ID
     * @param predictType 预测类型
     * @return 预测历史列表
     */
    public List<SoilPrediction> selectPredictionHistoryByFieldId(@Param("fieldId") String fieldId, @Param("predictType") String predictType);

    /**
     * 获取预测准确度统计
     * 
     * @return 准确度统计
     */
    public List<Map<String, Object>> selectAccuracyStats();

    /**
     * 获取全局性能统计
     * 
     * @return 全局统计
     */
    public Map<String, Object> selectOverallStats();

    /**
     * 批量插入预测结果
     * 
     * @param predictionList 预测结果列表
     * @return 结果
     */
    public int batchInsertSoilPrediction(@Param("predictionList") List<SoilPrediction> predictionList);
}