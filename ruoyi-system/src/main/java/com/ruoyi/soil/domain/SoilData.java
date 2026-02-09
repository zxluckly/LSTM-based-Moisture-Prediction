package com.ruoyi.soil.domain;

import java.math.BigDecimal;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 土壤数据对象 soil_data
 * 
 * @author ruoyi
 * @date 2024-01-19
 */
public class SoilData extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键ID */
    private Long id;

    /** 设备编号 */
    @Excel(name = "设备编号")
    private String deviceId;

    /** 地块编号 */
    @Excel(name = "地块编号")
    private String fieldId;

    /** 土壤温度(°C) */
    @Excel(name = "土壤温度", readConverterExp = "°=C")
    private BigDecimal temperature;

    /** 土壤湿度(%) */
    @Excel(name = "土壤湿度", readConverterExp = "%=")
    private BigDecimal humidity;

    /** 电导率EC值(mS/cm) */
    @Excel(name = "电导率EC值", readConverterExp = "m=S/cm")
    private BigDecimal ecValue;

    /** 酸碱度pH值 */
    @Excel(name = "酸碱度pH值")
    private BigDecimal phValue;

    /** 采集时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "采集时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    private Date collectTime;

    /** 数据状态(0正常 1异常) */
    @Excel(name = "数据状态", readConverterExp = "0=正常,1=异常")
    private String dataStatus;

    /** 经度 */
    @Excel(name = "经度")
    private BigDecimal longitude;

    /** 纬度 */
    @Excel(name = "纬度")
    private BigDecimal latitude;

    /** 海拔高度(m) */
    @Excel(name = "海拔高度", readConverterExp = "m=")
    private BigDecimal altitude;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setDeviceId(String deviceId) 
    {
        this.deviceId = deviceId;
    }

    public String getDeviceId() 
    {
        return deviceId;
    }
    public void setFieldId(String fieldId) 
    {
        this.fieldId = fieldId;
    }

    public String getFieldId() 
    {
        return fieldId;
    }
    public void setTemperature(BigDecimal temperature) 
    {
        this.temperature = temperature;
    }

    public BigDecimal getTemperature() 
    {
        return temperature;
    }
    public void setHumidity(BigDecimal humidity) 
    {
        this.humidity = humidity;
    }

    public BigDecimal getHumidity() 
    {
        return humidity;
    }
    public void setEcValue(BigDecimal ecValue) 
    {
        this.ecValue = ecValue;
    }

    public BigDecimal getEcValue() 
    {
        return ecValue;
    }
    public void setPhValue(BigDecimal phValue) 
    {
        this.phValue = phValue;
    }

    public BigDecimal getPhValue() 
    {
        return phValue;
    }
    public void setCollectTime(Date collectTime) 
    {
        this.collectTime = collectTime;
    }

    public Date getCollectTime() 
    {
        return collectTime;
    }
    public void setDataStatus(String dataStatus) 
    {
        this.dataStatus = dataStatus;
    }

    public String getDataStatus() 
    {
        return dataStatus;
    }
    public void setLongitude(BigDecimal longitude) 
    {
        this.longitude = longitude;
    }

    public BigDecimal getLongitude() 
    {
        return longitude;
    }
    public void setLatitude(BigDecimal latitude) 
    {
        this.latitude = latitude;
    }

    public BigDecimal getLatitude() 
    {
        return latitude;
    }
    public void setAltitude(BigDecimal altitude) 
    {
        this.altitude = altitude;
    }

    public BigDecimal getAltitude() 
    {
        return altitude;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("deviceId", getDeviceId())
            .append("fieldId", getFieldId())
            .append("temperature", getTemperature())
            .append("humidity", getHumidity())
            .append("ecValue", getEcValue())
            .append("phValue", getPhValue())
            .append("collectTime", getCollectTime())
            .append("dataStatus", getDataStatus())
            .append("longitude", getLongitude())
            .append("latitude", getLatitude())
            .append("altitude", getAltitude())
            .append("createTime", getCreateTime())
            .append("updateTime", getUpdateTime())
            .toString();
    }
}