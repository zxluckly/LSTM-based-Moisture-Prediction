package com.ruoyi.soil.mapper;

import java.util.List;
import java.util.Map;
import org.apache.ibatis.annotations.Param;
import com.ruoyi.soil.domain.SoilData;

/**
 * 土壤数据Mapper接口
 * 
 * @author ruoyi
 * @date 2024-01-19
 */
public interface SoilDataMapper 
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
     * 删除土壤数据
     * 
     * @param id 土壤数据主键
     * @return 结果
     */
    public int deleteSoilDataById(Long id);

    /**
     * 批量删除土壤数据
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteSoilDataByIds(Long[] ids);

    /**
     * 根据地块ID和时间范围查询历史数据
     * 
     * @param fieldId 地块ID
     * @param startTime 开始时间
     * @param endTime 结束时间
     * @return 土壤数据集合
     */
    public List<SoilData> selectHistoryDataByFieldId(@Param("fieldId") String fieldId, @Param("startTime") String startTime, @Param("endTime") String endTime);

    /**
     * 获取最新的土壤数据
     * 
     * @param fieldId 地块ID
     * @return 土壤数据
     */
    public SoilData selectLatestDataByFieldId(@Param("fieldId") String fieldId);

    /**
     * 统计各地块数据数量
     * 
     * @return 统计结果
     */
    public List<Map<String, Object>> selectDataCountByField();

    /**
     * 获取异常数据统计
     * 
     * @return 异常数据统计
     */
    public List<Map<String, Object>> selectAbnormalDataStats();

    /**
     * 批量插入土壤数据
     * 
     * @param soilDataList 土壤数据列表
     * @return 结果
     */
    public int batchInsertSoilData(List<SoilData> soilDataList);
}