package com.ruoyi.soil.domain;

import java.math.BigDecimal;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 土壤墒情预测对象 soil_prediction
 * 
 * @author ruoyi
 * @date 2024-01-19
 */
public class SoilPrediction extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键ID */
    private Long id;

    /** 地块编号 */
    @Excel(name = "地块编号")
    private String fieldId;

    /** 预测时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "预测时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    private Date predictTime;

    /** 预测湿度值(%) */
    @Excel(name = "预测湿度值", readConverterExp = "%=")
    private BigDecimal predictedHumidity;

    /** 预测温度值(°C) */
    @Excel(name = "预测温度值", readConverterExp = "°=C")
    private BigDecimal predictedTemperature;

    /** 预测EC值(mS/cm) */
    @Excel(name = "预测EC值", readConverterExp = "m=S/cm")
    private BigDecimal predictedEcValue;

    /** 预测pH值 */
    @Excel(name = "预测pH值")
    private BigDecimal predictedPhValue;

    /** 预测准确度(%) */
    @Excel(name = "预测准确度", readConverterExp = "%=")
    private BigDecimal accuracy;

    /** 模型版本 */
    @Excel(name = "模型版本")
    private String modelVersion;

    /** 预测类型(1小时 2天 3周) */
    @Excel(name = "预测类型", readConverterExp = "1=小时,2=天,3=周")
    private String predictType;

    /** RMSE误差 */
    @Excel(name = "RMSE误差")
    private BigDecimal rmseError;

    /** MAE误差 */
    @Excel(name = "MAE误差")
    private BigDecimal maeError;

    /** 置信度(%) */
    @Excel(name = "置信度", readConverterExp = "%=")
    private BigDecimal confidence;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setFieldId(String fieldId) 
    {
        this.fieldId = fieldId;
    }

    public String getFieldId() 
    {
        return fieldId;
    }
    public void setPredictTime(Date predictTime) 
    {
        this.predictTime = predictTime;
    }

    public Date getPredictTime() 
    {
        return predictTime;
    }
    public void setPredictedHumidity(BigDecimal predictedHumidity) 
    {
        this.predictedHumidity = predictedHumidity;
    }

    public BigDecimal getPredictedHumidity() 
    {
        return predictedHumidity;
    }
    public void setPredictedTemperature(BigDecimal predictedTemperature) 
    {
        this.predictedTemperature = predictedTemperature;
    }

    public BigDecimal getPredictedTemperature() 
    {
        return predictedTemperature;
    }
    public void setPredictedEcValue(BigDecimal predictedEcValue) 
    {
        this.predictedEcValue = predictedEcValue;
    }

    public BigDecimal getPredictedEcValue() 
    {
        return predictedEcValue;
    }
    public void setPredictedPhValue(BigDecimal predictedPhValue) 
    {
        this.predictedPhValue = predictedPhValue;
    }

    public BigDecimal getPredictedPhValue() 
    {
        return predictedPhValue;
    }
    public void setAccuracy(BigDecimal accuracy) 
    {
        this.accuracy = accuracy;
    }

    public BigDecimal getAccuracy() 
    {
        return accuracy;
    }
    public void setModelVersion(String modelVersion) 
    {
        this.modelVersion = modelVersion;
    }

    public String getModelVersion() 
    {
        return modelVersion;
    }
    public void setPredictType(String predictType) 
    {
        this.predictType = predictType;
    }

    public String getPredictType() 
    {
        return predictType;
    }
    public void setRmseError(BigDecimal rmseError) 
    {
        this.rmseError = rmseError;
    }

    public BigDecimal getRmseError() 
    {
        return rmseError;
    }
    public void setMaeError(BigDecimal maeError) 
    {
        this.maeError = maeError;
    }

    public BigDecimal getMaeError() 
    {
        return maeError;
    }
    public void setConfidence(BigDecimal confidence) 
    {
        this.confidence = confidence;
    }

    public BigDecimal getConfidence() 
    {
        return confidence;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("fieldId", getFieldId())
            .append("predictTime", getPredictTime())
            .append("predictedHumidity", getPredictedHumidity())
            .append("predictedTemperature", getPredictedTemperature())
            .append("predictedEcValue", getPredictedEcValue())
            .append("predictedPhValue", getPredictedPhValue())
            .append("accuracy", getAccuracy())
            .append("modelVersion", getModelVersion())
            .append("predictType", getPredictType())
            .append("rmseError", getRmseError())
            .append("maeError", getMaeError())
            .append("confidence", getConfidence())
            .append("createTime", getCreateTime())
            .append("updateTime", getUpdateTime())
            .toString();
    }
}