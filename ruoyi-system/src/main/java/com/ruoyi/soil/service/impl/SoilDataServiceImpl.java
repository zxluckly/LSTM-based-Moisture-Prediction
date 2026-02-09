package com.ruoyi.soil.service.impl;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.*;
import java.util.stream.Collectors;

import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.soil.mapper.SoilDataMapper;
import com.ruoyi.soil.domain.SoilData;
import com.ruoyi.soil.service.ISoilDataService;

/**
 * 土壤数据Service业务层处理
 * 
 * @author ruoyi
 * @date 2024-01-19
 */
@Service
public class SoilDataServiceImpl implements ISoilDataService 
{
    @Autowired
    private SoilDataMapper soilDataMapper;

    /**
     * 查询土壤数据
     * 
     * @param id 土壤数据主键
     * @return 土壤数据
     */
    @Override
    public SoilData selectSoilDataById(Long id)
    {
        return soilDataMapper.selectSoilDataById(id);
    }

    /**
     * 查询土壤数据列表
     * 
     * @param soilData 土壤数据
     * @return 土壤数据
     */
    @Override
    public List<SoilData> selectSoilDataList(SoilData soilData)
    {
        return soilDataMapper.selectSoilDataList(soilData);
    }

    /**
     * 新增土壤数据
     * 
     * @param soilData 土壤数据
     * @return 结果
     */
    @Override
    public int insertSoilData(SoilData soilData)
    {
        soilData.setCreateTime(DateUtils.getNowDate());
        return soilDataMapper.insertSoilData(soilData);
    }

    /**
     * 修改土壤数据
     * 
     * @param soilData 土壤数据
     * @return 结果
     */
    @Override
    public int updateSoilData(SoilData soilData)
    {
        soilData.setUpdateTime(DateUtils.getNowDate());
        return soilDataMapper.updateSoilData(soilData);
    }

    /**
     * 批量删除土壤数据
     * 
     * @param ids 需要删除的土壤数据主键
     * @return 结果
     */
    @Override
    public int deleteSoilDataByIds(Long[] ids)
    {
        return soilDataMapper.deleteSoilDataByIds(ids);
    }

    /**
     * 删除土壤数据信息
     * 
     * @param id 土壤数据主键
     * @return 结果
     */
    @Override
    public int deleteSoilDataById(Long id)
    {
        return soilDataMapper.deleteSoilDataById(id);
    }

    /**
     * 数据预处理 - 清洗异常值和缺失值
     */
    @Override
    public List<SoilData> preprocessData(List<SoilData> soilDataList) {
        if (soilDataList == null || soilDataList.isEmpty()) {
            return new ArrayList<>();
        }

        List<SoilData> cleanedData = new ArrayList<>();
        
        for (SoilData data : soilDataList) {
            // 检查数据完整性
            if (isDataComplete(data) && isDataValid(data)) {
                cleanedData.add(data);
            } else {
                // 标记为异常数据
                data.setDataStatus("1");
                // 可以选择修复或丢弃
                if (canRepairData(data)) {
                    SoilData repairedData = repairData(data);
                    cleanedData.add(repairedData);
                }
            }
        }
        
        return cleanedData;
    }

    /**
     * 数据归一化处理
     */
    @Override
    public List<SoilData> normalizeData(List<SoilData> soilDataList) {
        if (soilDataList == null || soilDataList.isEmpty()) {
            return new ArrayList<>();
        }

        // 计算各指标的最大最小值
        Map<String, BigDecimal[]> ranges = calculateDataRanges(soilDataList);
        
        List<SoilData> normalizedData = new ArrayList<>();
        
        for (SoilData data : soilDataList) {
            SoilData normalized = new SoilData();
            // 复制基本信息
            normalized.setDeviceId(data.getDeviceId());
            normalized.setFieldId(data.getFieldId());
            normalized.setCollectTime(data.getCollectTime());
            normalized.setDataStatus(data.getDataStatus());
            normalized.setLongitude(data.getLongitude());
            normalized.setLatitude(data.getLatitude());
            normalized.setAltitude(data.getAltitude());
            
            // 归一化数值数据 (Min-Max归一化到0-1区间)
            normalized.setTemperature(normalizeValue(data.getTemperature(), ranges.get("temperature")));
            normalized.setHumidity(normalizeValue(data.getHumidity(), ranges.get("humidity")));
            normalized.setEcValue(normalizeValue(data.getEcValue(), ranges.get("ecValue")));
            normalized.setPhValue(normalizeValue(data.getPhValue(), ranges.get("phValue")));
            
            normalizedData.add(normalized);
        }
        
        return normalizedData;
    }

    /**
     * 根据地块ID获取历史数据用于LSTM训练
     */
    @Override
    public List<SoilData> getHistoryDataForTraining(String fieldId, int days) {
        Calendar calendar = Calendar.getInstance();
        String endTime = DateUtils.parseDateToStr(DateUtils.YYYY_MM_DD_HH_MM_SS, calendar.getTime());
        
        calendar.add(Calendar.DAY_OF_MONTH, -days);
        String startTime = DateUtils.parseDateToStr(DateUtils.YYYY_MM_DD_HH_MM_SS, calendar.getTime());
        
        List<SoilData> historyData = soilDataMapper.selectHistoryDataByFieldId(fieldId, startTime, endTime);
        
        // 数据预处理和归一化
        List<SoilData> cleanedData = preprocessData(historyData);
        return normalizeData(cleanedData);
    }

    /**
     * 模拟数据生成 - 用于测试
     */
    @Override
    public List<SoilData> generateSimulatedData(String fieldId, int count) {
        List<SoilData> simulatedData = new ArrayList<>();
        Random random = new Random();
        
        Calendar calendar = Calendar.getInstance();
        
        for (int i = 0; i < count; i++) {
            SoilData data = new SoilData();
            data.setDeviceId("DEVICE_" + fieldId + "_001");
            data.setFieldId(fieldId);
            
            // 模拟真实的土壤数据变化规律
            double baseTemp = 20.0 + 10 * Math.sin(2 * Math.PI * i / 24); // 日温度变化
            double baseHumidity = 60.0 + 20 * Math.sin(2 * Math.PI * i / 168); // 周湿度变化
            
            data.setTemperature(BigDecimal.valueOf(baseTemp + random.nextGaussian() * 2).setScale(2, RoundingMode.HALF_UP));
            data.setHumidity(BigDecimal.valueOf(Math.max(0, Math.min(100, baseHumidity + random.nextGaussian() * 5))).setScale(2, RoundingMode.HALF_UP));
            data.setEcValue(BigDecimal.valueOf(1.2 + random.nextGaussian() * 0.3).setScale(3, RoundingMode.HALF_UP));
            data.setPhValue(BigDecimal.valueOf(6.5 + random.nextGaussian() * 0.5).setScale(2, RoundingMode.HALF_UP));
            
            calendar.add(Calendar.HOUR, -1); // 每小时一条数据
            data.setCollectTime(calendar.getTime());
            data.setDataStatus("0");
            
            // 模拟地理位置
            data.setLongitude(BigDecimal.valueOf(116.3974 + random.nextGaussian() * 0.01));
            data.setLatitude(BigDecimal.valueOf(39.9093 + random.nextGaussian() * 0.01));
            data.setAltitude(BigDecimal.valueOf(50 + random.nextGaussian() * 10));
            
            simulatedData.add(data);
        }
        
        return simulatedData;
    }

    /**
     * 获取实时数据统计
     */
    @Override
    public Map<String, Object> getRealTimeStats() {
        Map<String, Object> stats = new HashMap<>();
        
        // 获取各地块数据统计
        List<Map<String, Object>> fieldStats = soilDataMapper.selectDataCountByField();
        stats.put("fieldStats", fieldStats);
        
        // 获取异常数据统计
        List<Map<String, Object>> abnormalStats = soilDataMapper.selectAbnormalDataStats();
        stats.put("abnormalStats", abnormalStats);
        
        // 计算总体统计
        int totalCount = fieldStats.stream().mapToInt(map -> Integer.parseInt(map.get("count").toString())).sum();
        stats.put("totalDataCount", totalCount);
        
        return stats;
    }

    /**
     * 获取数据质量报告
     */
    @Override
    public Map<String, Object> getDataQualityReport(String fieldId) {
        Map<String, Object> report = new HashMap<>();
        
        SoilData condition = new SoilData();
        condition.setFieldId(fieldId);
        List<SoilData> allData = soilDataMapper.selectSoilDataList(condition);
        
        if (allData.isEmpty()) {
            report.put("message", "暂无数据");
            return report;
        }
        
        // 计算数据质量指标
        long totalCount = allData.size();
        long abnormalCount = allData.stream().filter(data -> "1".equals(data.getDataStatus())).count();
        long missingCount = allData.stream().filter(this::hasMissingValues).count();
        
        double qualityScore = ((double)(totalCount - abnormalCount - missingCount) / totalCount) * 100;
        
        report.put("totalCount", totalCount);
        report.put("abnormalCount", abnormalCount);
        report.put("missingCount", missingCount);
        report.put("qualityScore", BigDecimal.valueOf(qualityScore).setScale(2, RoundingMode.HALF_UP));
        report.put("dataCompleteness", BigDecimal.valueOf(((double)(totalCount - missingCount) / totalCount) * 100).setScale(2, RoundingMode.HALF_UP));
        
        return report;
    }

    /**
     * 批量导入土壤数据
     */
    @Override
    public Map<String, Object> importSoilData(List<SoilData> soilDataList) {
        Map<String, Object> result = new HashMap<>();
        
        if (soilDataList == null || soilDataList.isEmpty()) {
            result.put("success", false);
            result.put("message", "导入数据为空");
            return result;
        }
        
        // 数据预处理
        List<SoilData> cleanedData = preprocessData(soilDataList);
        
        try {
            int successCount = soilDataMapper.batchInsertSoilData(cleanedData);
            result.put("success", true);
            result.put("successCount", successCount);
            result.put("totalCount", soilDataList.size());
            result.put("message", String.format("成功导入 %d 条数据，共 %d 条", successCount, soilDataList.size()));
        } catch (Exception e) {
            result.put("success", false);
            result.put("message", "导入失败：" + e.getMessage());
        }
        
        return result;
    }

    // 私有辅助方法
    
    private boolean isDataComplete(SoilData data) {
        return data.getTemperature() != null && 
               data.getHumidity() != null && 
               data.getEcValue() != null && 
               data.getPhValue() != null &&
               data.getCollectTime() != null;
    }
    
    private boolean isDataValid(SoilData data) {
        // 检查数据范围是否合理
        if (data.getTemperature() != null && 
            (data.getTemperature().compareTo(BigDecimal.valueOf(-50)) < 0 || 
             data.getTemperature().compareTo(BigDecimal.valueOf(80)) > 0)) {
            return false;
        }
        
        if (data.getHumidity() != null && 
            (data.getHumidity().compareTo(BigDecimal.ZERO) < 0 || 
             data.getHumidity().compareTo(BigDecimal.valueOf(100)) > 0)) {
            return false;
        }
        
        if (data.getEcValue() != null && 
            (data.getEcValue().compareTo(BigDecimal.ZERO) < 0 || 
             data.getEcValue().compareTo(BigDecimal.valueOf(10)) > 0)) {
            return false;
        }
        
        if (data.getPhValue() != null && 
            (data.getPhValue().compareTo(BigDecimal.ZERO) < 0 || 
             data.getPhValue().compareTo(BigDecimal.valueOf(14)) > 0)) {
            return false;
        }
        
        return true;
    }
    
    private boolean canRepairData(SoilData data) {
        // 简单的修复策略：如果只有少量字段异常，可以尝试修复
        int invalidFields = 0;
        if (data.getTemperature() == null || !isTemperatureValid(data.getTemperature())) invalidFields++;
        if (data.getHumidity() == null || !isHumidityValid(data.getHumidity())) invalidFields++;
        if (data.getEcValue() == null || !isEcValueValid(data.getEcValue())) invalidFields++;
        if (data.getPhValue() == null || !isPhValueValid(data.getPhValue())) invalidFields++;
        
        return invalidFields <= 1; // 只有一个字段异常时才尝试修复
    }
    
    private SoilData repairData(SoilData data) {
        SoilData repaired = new SoilData();
        // 复制所有字段
        repaired.setDeviceId(data.getDeviceId());
        repaired.setFieldId(data.getFieldId());
        repaired.setCollectTime(data.getCollectTime());
        repaired.setLongitude(data.getLongitude());
        repaired.setLatitude(data.getLatitude());
        repaired.setAltitude(data.getAltitude());
        
        // 修复异常值，使用合理的默认值
        repaired.setTemperature(data.getTemperature() != null && isTemperatureValid(data.getTemperature()) ? 
                               data.getTemperature() : BigDecimal.valueOf(20.0));
        repaired.setHumidity(data.getHumidity() != null && isHumidityValid(data.getHumidity()) ? 
                            data.getHumidity() : BigDecimal.valueOf(60.0));
        repaired.setEcValue(data.getEcValue() != null && isEcValueValid(data.getEcValue()) ? 
                           data.getEcValue() : BigDecimal.valueOf(1.5));
        repaired.setPhValue(data.getPhValue() != null && isPhValueValid(data.getPhValue()) ? 
                           data.getPhValue() : BigDecimal.valueOf(7.0));
        
        repaired.setDataStatus("0"); // 标记为正常数据
        
        return repaired;
    }
    
    private boolean isTemperatureValid(BigDecimal temperature) {
        return temperature != null && 
               temperature.compareTo(BigDecimal.valueOf(-50)) >= 0 && 
               temperature.compareTo(BigDecimal.valueOf(80)) <= 0;
    }
    
    private boolean isHumidityValid(BigDecimal humidity) {
        return humidity != null && 
               humidity.compareTo(BigDecimal.ZERO) >= 0 && 
               humidity.compareTo(BigDecimal.valueOf(100)) <= 0;
    }
    
    private boolean isEcValueValid(BigDecimal ecValue) {
        return ecValue != null && 
               ecValue.compareTo(BigDecimal.ZERO) >= 0 && 
               ecValue.compareTo(BigDecimal.valueOf(10)) <= 0;
    }
    
    private boolean isPhValueValid(BigDecimal phValue) {
        return phValue != null && 
               phValue.compareTo(BigDecimal.ZERO) >= 0 && 
               phValue.compareTo(BigDecimal.valueOf(14)) <= 0;
    }
    
    private Map<String, BigDecimal[]> calculateDataRanges(List<SoilData> dataList) {
        Map<String, BigDecimal[]> ranges = new HashMap<>();
        
        if (dataList.isEmpty()) {
            return ranges;
        }
        
        // 计算温度范围
        List<BigDecimal> temperatures = dataList.stream()
                .map(SoilData::getTemperature)
                .filter(Objects::nonNull)
                .collect(Collectors.toList());
        if (!temperatures.isEmpty()) {
            BigDecimal minTemp = temperatures.stream().min(BigDecimal::compareTo).orElse(BigDecimal.ZERO);
            BigDecimal maxTemp = temperatures.stream().max(BigDecimal::compareTo).orElse(BigDecimal.valueOf(100));
            ranges.put("temperature", new BigDecimal[]{minTemp, maxTemp});
        }
        
        // 计算湿度范围
        List<BigDecimal> humidities = dataList.stream()
                .map(SoilData::getHumidity)
                .filter(Objects::nonNull)
                .collect(Collectors.toList());
        if (!humidities.isEmpty()) {
            BigDecimal minHumidity = humidities.stream().min(BigDecimal::compareTo).orElse(BigDecimal.ZERO);
            BigDecimal maxHumidity = humidities.stream().max(BigDecimal::compareTo).orElse(BigDecimal.valueOf(100));
            ranges.put("humidity", new BigDecimal[]{minHumidity, maxHumidity});
        }
        
        // 计算EC值范围
        List<BigDecimal> ecValues = dataList.stream()
                .map(SoilData::getEcValue)
                .filter(Objects::nonNull)
                .collect(Collectors.toList());
        if (!ecValues.isEmpty()) {
            BigDecimal minEc = ecValues.stream().min(BigDecimal::compareTo).orElse(BigDecimal.ZERO);
            BigDecimal maxEc = ecValues.stream().max(BigDecimal::compareTo).orElse(BigDecimal.valueOf(10));
            ranges.put("ecValue", new BigDecimal[]{minEc, maxEc});
        }
        
        // 计算pH值范围
        List<BigDecimal> phValues = dataList.stream()
                .map(SoilData::getPhValue)
                .filter(Objects::nonNull)
                .collect(Collectors.toList());
        if (!phValues.isEmpty()) {
            BigDecimal minPh = phValues.stream().min(BigDecimal::compareTo).orElse(BigDecimal.ZERO);
            BigDecimal maxPh = phValues.stream().max(BigDecimal::compareTo).orElse(BigDecimal.valueOf(14));
            ranges.put("phValue", new BigDecimal[]{minPh, maxPh});
        }
        
        return ranges;
    }
    
    private BigDecimal normalizeValue(BigDecimal value, BigDecimal[] range) {
        if (value == null || range == null || range.length != 2) {
            return BigDecimal.ZERO;
        }
        
        BigDecimal min = range[0];
        BigDecimal max = range[1];
        
        if (max.equals(min)) {
            return BigDecimal.valueOf(0.5); // 避免除零
        }
        
        return value.subtract(min).divide(max.subtract(min), 6, RoundingMode.HALF_UP);
    }
    
    private boolean hasMissingValues(SoilData data) {
        return data.getTemperature() == null || 
               data.getHumidity() == null || 
               data.getEcValue() == null || 
               data.getPhValue() == null;
    }
}