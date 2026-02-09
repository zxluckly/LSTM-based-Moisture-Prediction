package com.ruoyi.soil.service;

import java.util.List;
import java.util.Map;
import com.ruoyi.soil.domain.SoilData;

/**
 * 土壤数据Service接口
 * 
 * @author ruoyi
 * @date 2024-01-19
 */
public interface ISoilDataService 
{
    /**
     * 查询土壤数据
     * 
     * @param id 土壤数据主键
     * @return 土壤数据
     */
    public SoilData selectSoilDataById(Long id);

    /**
     * 查询土壤数据列表
     * 
     * @param soilData 土壤数据
     * @return 土壤数据集合
     */
    public List<SoilData> selectSoilDataList(SoilData soilData);

    /**
     * 新增土壤数据
     * 
     * @param soilData 土壤数据
     * @return 结果
     */
    public int insertSoilData(SoilData soilData);

    /**
     * 修改土壤数据
     * 
     * @param soilData 土壤数据
     * @return 结果
     */
    public int updateSoilData(SoilData soilData);

    /**
     * 批量删除土壤数据
     * 
     * @param ids 需要删除的土壤数据主键集合
     * @return 结果
     */
    public int deleteSoilDataByIds(Long[] ids);

    /**
     * 删除土壤数据信息
     * 
     * @param id 土壤数据主键
     * @return 结果
     */
    public int deleteSoilDataById(Long id);

    /**
     * 数据预处理 - 清洗异常值和缺失值
     * 
     * @param soilDataList 原始数据列表
     * @return 清洗后的数据列表
     */
    public List<SoilData> preprocessData(List<SoilData> soilDataList);

    /**
     * 数据归一化处理
     * 
     * @param soilDataList 待归一化的数据列表
     * @return 归一化后的数据列表
     */
    public List<SoilData> normalizeData(List<SoilData> soilDataList);

    /**
     * 根据地块ID获取历史数据用于LSTM训练
     * 
     * @param fieldId 地块ID
     * @param days 历史天数
     * @return 时间序列数据
     */
    public List<SoilData> getHistoryDataForTraining(String fieldId, int days);

    /**
     * 模拟数据生成 - 用于测试
     * 
     * @param fieldId 地块ID
     * @param count 生成数据条数
     * @return 生成的数据列表
     */
    public List<SoilData> generateSimulatedData(String fieldId, int count);

    /**
     * 获取实时数据统计
     * 
     * @return 统计数据
     */
    public Map<String, Object> getRealTimeStats();

    /**
     * 获取数据质量报告
     * 
     * @param fieldId 地块ID
     * @return 数据质量报告
     */
    public Map<String, Object> getDataQualityReport(String fieldId);

    /**
     * 批量导入土壤数据
     * 
     * @param soilDataList 土壤数据列表
     * @return 导入结果
     */
    public Map<String, Object> importSoilData(List<SoilData> soilDataList);
}