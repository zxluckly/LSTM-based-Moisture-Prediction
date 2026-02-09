<template>
  <div class="dashboard-container">
    <!-- 头部标题 -->
    <div class="dashboard-header">
      <h1>土壤墒情预测监控大屏</h1>
      <div class="header-info">
        <span>最后更新时间: {{ lastUpdateTime }}</span>
        <el-button type="primary" size="mini" @click="refreshData" :loading="refreshing">
          <i class="el-icon-refresh"></i> 刷新
        </el-button>
      </div>
    </div>

    <!-- 系统状态指标 -->
    <el-row :gutter="20" class="status-row">
      <el-col :span="6">
        <div class="status-card">
          <div class="status-icon success">
            <i class="el-icon-data-line"></i>
          </div>
          <div class="status-content">
            <h3>{{ (overview.dataStats && overview.dataStats.totalDataCount) || 0 }}</h3>
            <p>总数据量</p>
          </div>
        </div>
      </el-col>
      <el-col :span="6">
        <div class="status-card">
          <div class="status-icon" :class="getServiceStatusClass((overview.serviceHealth && overview.serviceHealth.status))">
            <i class="el-icon-cpu"></i>
          </div>
          <div class="status-content">
            <h3>{{ (overview.modelMetrics && overview.modelMetrics.overallAccuracy) || 0 }}%</h3>
            <p>模型准确度</p>
          </div>
        </div>
      </el-col>
      <el-col :span="6">
        <div class="status-card">
          <div class="status-icon" :class="getHealthStatusClass((overview.modelMetrics && overview.modelMetrics.modelHealth))">
            <i class="el-icon-monitor"></i>
          </div>
          <div class="status-content">
            <h3>{{ (overview.modelMetrics && overview.modelMetrics.modelHealth) || '未知' }}</h3>
            <p>模型健康状态</p>
          </div>
        </div>
      </el-col>
      <el-col :span="6">
        <div class="status-card">
          <div class="status-icon" :class="getServiceStatusClass((overview.serviceHealth && overview.serviceHealth.status))">
            <i class="el-icon-connection"></i>
          </div>
          <div class="status-content">
            <h3>{{ (overview.serviceHealth && overview.serviceHealth.status) || '未知' }}</h3>
            <p>LSTM服务状态</p>
          </div>
        </div>
      </el-col>
    </el-row>

    <!-- 主要内容区域 -->
    <el-row :gutter="20" class="main-content">
      <!-- 左侧：实时数据和趋势图 -->
      <el-col :span="16">
        <!-- 地块选择 -->
        <el-card class="field-selector">
          <div slot="header">
            <span>地块选择</span>
          </div>
          <el-radio-group v-model="selectedField" @change="onFieldChange">
            <el-radio-button label="FIELD_001">东区试验田A</el-radio-button>
            <el-radio-button label="FIELD_002">西区试验田B</el-radio-button>
            <el-radio-button label="FIELD_003">南区试验田C</el-radio-button>
          </el-radio-group>
        </el-card>

        <!-- 实时数据展示 -->
        <el-card class="realtime-data" v-loading="realtimeLoading">
          <div slot="header">
            <span>{{ selectedField }} 实时数据</span>
            <span class="update-time">{{ realtimeData.currentData && realtimeData.currentData.collectTime }}</span>
          </div>
          <el-row :gutter="20" v-if="realtimeData.currentData">
            <el-col :span="6">
              <div class="data-item">
                <div class="data-value">{{ realtimeData.currentData.temperature }}°C</div>
                <div class="data-label">土壤温度</div>
              </div>
            </el-col>
            <el-col :span="6">
              <div class="data-item">
                <div class="data-value">{{ realtimeData.currentData.humidity }}%</div>
                <div class="data-label">土壤湿度</div>
              </div>
            </el-col>
            <el-col :span="6">
              <div class="data-item">
                <div class="data-value">{{ realtimeData.currentData.ecValue }}</div>
                <div class="data-label">EC值(mS/cm)</div>
              </div>
            </el-col>
            <el-col :span="6">
              <div class="data-item">
                <div class="data-value">{{ realtimeData.currentData.phValue }}</div>
                <div class="data-label">pH值</div>
              </div>
            </el-col>
          </el-row>
          <div v-else class="no-data">
            <i class="el-icon-warning"></i>
            <p>暂无实时数据</p>
          </div>
        </el-card>

        <!-- 趋势图表 -->
        <el-card class="trend-chart">
          <div slot="header">
            <span>历史趋势 (最近7天)</span>
          </div>
          <div ref="trendChart" style="height: 400px;"></div>
        </el-card>

        <!-- 预测结果 -->
        <el-card class="prediction-result" v-if="realtimeData.latestPrediction">
          <div slot="header">
            <span>最新预测结果</span>
            <el-tag :type="getPredictionTypeTag(realtimeData.latestPrediction.predictType)">
              {{ getPredictionTypeName(realtimeData.latestPrediction.predictType) }}
            </el-tag>
          </div>
          <el-row :gutter="20">
            <el-col :span="6">
              <div class="prediction-item">
                <div class="prediction-value">{{ realtimeData.latestPrediction.predictedTemperature }}°C</div>
                <div class="prediction-label">预测温度</div>
              </div>
            </el-col>
            <el-col :span="6">
              <div class="prediction-item">
                <div class="prediction-value">{{ realtimeData.latestPrediction.predictedHumidity }}%</div>
                <div class="prediction-label">预测湿度</div>
              </div>
            </el-col>
            <el-col :span="6">
              <div class="prediction-item">
                <div class="prediction-value">{{ realtimeData.latestPrediction.predictedEcValue }}</div>
                <div class="prediction-label">预测EC值</div>
              </div>
            </el-col>
            <el-col :span="6">
              <div class="prediction-item">
                <div class="prediction-value">{{ realtimeData.latestPrediction.accuracy }}%</div>
                <div class="prediction-label">预测准确度</div>
              </div>
            </el-col>
          </el-row>
        </el-card>
      </el-col>

      <!-- 右侧：预警信息和地图 -->
      <el-col :span="8">
        <!-- 预警信息 -->
        <el-card class="alert-panel">
          <div slot="header">
            <span>预警信息</span>
            <el-badge :value="alerts.totalCount" class="alert-badge">
              <i class="el-icon-bell"></i>
            </el-badge>
          </div>
          <div class="alert-list" v-if="alerts.alerts && alerts.alerts.length > 0">
            <div 
              v-for="alert in alerts.alerts" 
              :key="alert.timestamp"
              class="alert-item"
              :class="'alert-' + alert.level"
            >
              <div class="alert-icon">
                <i class="el-icon-warning"></i>
              </div>
              <div class="alert-content">
                <div class="alert-type">{{ alert.type }}</div>
                <div class="alert-message">{{ alert.message }}</div>
                <div class="alert-time">{{ formatTime(alert.timestamp) }}</div>
              </div>
            </div>
          </div>
          <div v-else class="no-alerts">
            <i class="el-icon-success"></i>
            <p>暂无预警信息</p>
          </div>
        </el-card>

        <!-- 地图展示 -->
        <el-card class="map-panel">
          <div slot="header">
            <span>地块分布图</span>
          </div>
          <div ref="mapChart" style="height: 300px;"></div>
        </el-card>

        <!-- 数据质量 -->
        <el-card class="quality-panel" v-if="realtimeData.qualityReport">
          <div slot="header">
            <span>数据质量报告</span>
          </div>
          <el-descriptions :column="1" size="small">
            <el-descriptions-item label="总数据量">
              {{ realtimeData.qualityReport.totalCount }}
            </el-descriptions-item>
            <el-descriptions-item label="异常数据">
              {{ realtimeData.qualityReport.abnormalCount }}
            </el-descriptions-item>
            <el-descriptions-item label="质量评分">
              <el-tag :type="getQualityScoreType(realtimeData.qualityReport.qualityScore)">
                {{ realtimeData.qualityReport.qualityScore }}%
              </el-tag>
            </el-descriptions-item>
            <el-descriptions-item label="数据完整性">
              {{ realtimeData.qualityReport.dataCompleteness }}%
            </el-descriptions-item>
          </el-descriptions>
        </el-card>
      </el-col>
    </el-row>
  </div>
</template>

<script>
import { getOverview, getRealtimeData, getTrendData, getAlerts, getMapData } from "@/api/soil/dashboard";

export default {
  name: "SoilDashboard",
  data() {
    return {
      // 数据
      overview: {},
      realtimeData: {},
      trendData: {},
      alerts: {},
      mapData: {},
      // 状态
      refreshing: false,
      realtimeLoading: false,
      selectedField: 'FIELD_001',
      lastUpdateTime: '',
      // 图表实例
      trendChart: null,
      mapChart: null,
      // 定时器
      refreshTimer: null
    };
  },
  mounted() {
    this.initData();
    this.initCharts();
    this.startAutoRefresh();
    
    // 监听窗口大小变化
    window.addEventListener('resize', this.handleResize);
  },
  beforeDestroy() {
    this.stopAutoRefresh();
    window.removeEventListener('resize', this.handleResize);
    
    if (this.trendChart) {
      this.trendChart.dispose();
    }
    if (this.mapChart) {
      this.mapChart.dispose();
    }
  },
  methods: {
    /** 初始化数据 */
    async initData() {
      try {
        await Promise.all([
          this.loadOverview(),
          this.loadRealtimeData(),
          this.loadTrendData(),
          this.loadAlerts(),
          this.loadMapData()
        ]);
        this.updateLastUpdateTime();
      } catch (error) {
        console.error('初始化数据失败:', error);
      }
    },
    
    /** 加载总览数据 */
    async loadOverview() {
      const response = await getOverview();
      this.overview = response.data || {};
    },
    
    /** 加载实时数据 */
    async loadRealtimeData() {
      this.realtimeLoading = true;
      try {
        const response = await getRealtimeData(this.selectedField);
        this.realtimeData = response.data || {};
      } finally {
        this.realtimeLoading = false;
      }
    },
    
    /** 加载趋势数据 */
    async loadTrendData() {
      const response = await getTrendData(this.selectedField, 7);
      this.trendData = response.data || {};
      this.updateTrendChart();
    },
    
    /** 加载预警数据 */
    async loadAlerts() {
      const response = await getAlerts();
      this.alerts = response.data || {};
    },
    
    /** 加载地图数据 */
    async loadMapData() {
      const response = await getMapData();
      this.mapData = response.data || {};
      this.updateMapChart();
    },
    
    /** 刷新数据 */
    async refreshData() {
      this.refreshing = true;
      try {
        await this.initData();
        this.$message.success('数据刷新成功');
      } catch (error) {
        this.$message.error('数据刷新失败');
      } finally {
        this.refreshing = false;
      }
    },
    
    /** 地块切换 */
    async onFieldChange() {
      await Promise.all([
        this.loadRealtimeData(),
        this.loadTrendData()
      ]);
    },
    
    /** 初始化图表 */
    initCharts() {
      this.$nextTick(() => {
        // 初始化趋势图表
        if (this.$refs.trendChart) {
          this.trendChart = this.$echarts.init(this.$refs.trendChart);
          this.initTrendChart();
        }
        
        // 初始化地图图表
        if (this.$refs.mapChart) {
          this.mapChart = this.$echarts.init(this.$refs.mapChart);
          this.initMapChart();
        }
      });
    },
    
    /** 初始化趋势图表 */
    initTrendChart() {
      const option = {
        title: {
          text: '土壤参数趋势',
          left: 'center',
          textStyle: {
            fontSize: 14
          }
        },
        tooltip: {
          trigger: 'axis',
          axisPointer: {
            type: 'cross'
          }
        },
        legend: {
          data: ['温度', '湿度', 'EC值', 'pH值'],
          bottom: 10
        },
        grid: {
          left: '3%',
          right: '4%',
          bottom: '15%',
          containLabel: true
        },
        xAxis: {
          type: 'category',
          data: [],
          axisLabel: {
            rotate: 45
          }
        },
        yAxis: [
          {
            type: 'value',
            name: '温度(°C) / 湿度(%)',
            position: 'left'
          },
          {
            type: 'value',
            name: 'EC值 / pH值',
            position: 'right'
          }
        ],
        series: [
          {
            name: '温度',
            type: 'line',
            data: [],
            smooth: true,
            itemStyle: { color: '#ff7875' }
          },
          {
            name: '湿度',
            type: 'line',
            data: [],
            smooth: true,
            itemStyle: { color: '#36cfc9' }
          },
          {
            name: 'EC值',
            type: 'line',
            yAxisIndex: 1,
            data: [],
            smooth: true,
            itemStyle: { color: '#ffc53d' }
          },
          {
            name: 'pH值',
            type: 'line',
            yAxisIndex: 1,
            data: [],
            smooth: true,
            itemStyle: { color: '#95de64' }
          }
        ]
      };
      
      this.trendChart.setOption(option);
    },
    
    /** 初始化地图图表 */
    initMapChart() {
      const option = {
        title: {
          text: '地块分布',
          left: 'center',
          textStyle: {
            fontSize: 14
          }
        },
        tooltip: {
          trigger: 'item',
          formatter: function(params) {
            const data = params.data;
            return `
              地块: ${data.fieldId}<br/>
              温度: ${data.temperature}°C<br/>
              湿度: ${data.humidity}%<br/>
              EC值: ${data.ecValue}<br/>
              pH值: ${data.phValue}
            `;
          }
        },
        grid: {
          left: '3%',
          right: '4%',
          bottom: '3%',
          containLabel: true
        },
        xAxis: {
          type: 'value',
          name: '经度',
          scale: true
        },
        yAxis: {
          type: 'value',
          name: '纬度',
          scale: true
        },
        series: [
          {
            name: '地块位置',
            type: 'scatter',
            data: [],
            symbolSize: function(data) {
              return Math.max(data[2] * 2, 10); // 根据湿度调整点的大小
            },
            itemStyle: {
              color: function(params) {
                const humidity = params.data[2];
                if (humidity >= 70) return '#52c41a'; // 绿色 - 湿度高
                if (humidity >= 50) return '#faad14'; // 黄色 - 湿度中等
                return '#ff4d4f'; // 红色 - 湿度低
              }
            }
          }
        ]
      };
      
      this.mapChart.setOption(option);
    },
    
    /** 更新趋势图表 */
    updateTrendChart() {
      if (!this.trendChart || !this.trendData.historyData) {
        return;
      }
      
      const historyData = this.trendData.historyData || [];
      
      // 准备数据
      const times = [];
      const temperatures = [];
      const humidities = [];
      const ecValues = [];
      const phValues = [];
      
      historyData.forEach(item => {
        const date = new Date(item.collectTime);
        const timeStr = `${(date.getMonth() + 1).toString().padStart(2, '0')}-${date.getDate().toString().padStart(2, '0')} ${date.getHours().toString().padStart(2, '0')}:${date.getMinutes().toString().padStart(2, '0')}`;
        times.push(timeStr);
        temperatures.push(item.temperature);
        humidities.push(item.humidity);
        ecValues.push(item.ecValue);
        phValues.push(item.phValue);
      });
      
      // 更新图表数据
      this.trendChart.setOption({
        xAxis: {
          data: times
        },
        series: [
          { data: temperatures },
          { data: humidities },
          { data: ecValues },
          { data: phValues }
        ]
      });
    },
    
    /** 更新地图图表 */
    updateMapChart() {
      if (!this.mapChart || !this.mapData.mapPoints) {
        return;
      }
      
      const mapPoints = this.mapData.mapPoints || [];
      
      // 转换数据格式 [经度, 纬度, 湿度, 其他信息]
      const scatterData = mapPoints.map(point => ({
        value: [point.longitude, point.latitude, point.humidity],
        fieldId: point.fieldId,
        temperature: point.temperature,
        humidity: point.humidity,
        ecValue: point.ecValue,
        phValue: point.phValue,
        dataStatus: point.dataStatus,
        collectTime: point.collectTime
      }));
      
      // 更新图表数据
      this.mapChart.setOption({
        series: [
          {
            data: scatterData
          }
        ]
      });
    },
    
    /** 开始自动刷新 */
    startAutoRefresh() {
      this.refreshTimer = setInterval(() => {
        this.loadRealtimeData();
        this.loadAlerts();
      }, 30000); // 30秒刷新一次
    },
    
    /** 停止自动刷新 */
    stopAutoRefresh() {
      if (this.refreshTimer) {
        clearInterval(this.refreshTimer);
        this.refreshTimer = null;
      }
    },
    
    /** 更新最后更新时间 */
    updateLastUpdateTime() {
      this.lastUpdateTime = new Date().toLocaleString();
    },
    
    /** 获取服务状态样式 */
    getServiceStatusClass(status) {
      const statusMap = {
        'healthy': 'success',
        'unhealthy': 'danger'
      };
      return statusMap[status] || 'warning';
    },
    
    /** 获取健康状态样式 */
    getHealthStatusClass(health) {
      const healthMap = {
        '优秀': 'success',
        '良好': 'success',
        '一般': 'warning',
        '需要优化': 'danger'
      };
      return healthMap[health] || 'warning';
    },
    
    /** 获取预测类型标签 */
    getPredictionTypeTag(type) {
      const typeMap = {
        '1': 'success',
        '2': 'warning',
        '3': 'info'
      };
      return typeMap[type] || 'info';
    },
    
    /** 获取预测类型名称 */
    getPredictionTypeName(type) {
      const nameMap = {
        '1': '小时级预测',
        '2': '天级预测',
        '3': '周级预测'
      };
      return nameMap[type] || '未知';
    },
    
    /** 获取质量评分类型 */
    getQualityScoreType(score) {
      if (score >= 90) return 'success';
      if (score >= 70) return 'warning';
      return 'danger';
    },
    
    /** 格式化时间 */
    formatTime(timestamp) {
      return new Date(timestamp).toLocaleString();
    },
    
    /** 处理窗口大小变化 */
    handleResize() {
      if (this.trendChart) {
        this.trendChart.resize();
      }
      if (this.mapChart) {
        this.mapChart.resize();
      }
    }
  }
};
</script>

<style scoped>
.dashboard-container {
  padding: 20px;
  background: #f0f2f5;
  min-height: 100vh;
}

.dashboard-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 20px;
  padding: 20px;
  background: white;
  border-radius: 8px;
  box-shadow: 0 2px 8px rgba(0,0,0,0.1);
}

.dashboard-header h1 {
  margin: 0;
  color: #1890ff;
  font-size: 28px;
}

.header-info {
  display: flex;
  align-items: center;
  gap: 15px;
}

.status-row {
  margin-bottom: 20px;
}

.status-card {
  display: flex;
  align-items: center;
  padding: 20px;
  background: white;
  border-radius: 8px;
  box-shadow: 0 2px 8px rgba(0,0,0,0.1);
}

.status-icon {
  width: 60px;
  height: 60px;
  border-radius: 50%;
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 24px;
  color: white;
  margin-right: 15px;
}

.status-icon.success {
  background: #52c41a;
}

.status-icon.warning {
  background: #faad14;
}

.status-icon.danger {
  background: #ff4d4f;
}

.status-content h3 {
  margin: 0 0 5px 0;
  font-size: 24px;
  font-weight: bold;
}

.status-content p {
  margin: 0;
  color: #666;
}

.main-content {
  margin-top: 20px;
}

.field-selector {
  margin-bottom: 20px;
}

.realtime-data {
  margin-bottom: 20px;
}

.realtime-data .el-card__header {
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.update-time {
  color: #666;
  font-size: 12px;
}

.data-item, .prediction-item {
  text-align: center;
  padding: 15px;
  background: #f8f9fa;
  border-radius: 6px;
}

.data-value, .prediction-value {
  font-size: 24px;
  font-weight: bold;
  color: #1890ff;
  margin-bottom: 5px;
}

.data-label, .prediction-label {
  color: #666;
  font-size: 14px;
}

.trend-chart {
  margin-bottom: 20px;
}

.prediction-result .el-card__header {
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.alert-panel {
  margin-bottom: 20px;
}

.alert-panel .el-card__header {
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.alert-badge {
  font-size: 18px;
}

.alert-list {
  max-height: 300px;
  overflow-y: auto;
}

.alert-item {
  display: flex;
  align-items: flex-start;
  padding: 12px;
  margin-bottom: 10px;
  border-radius: 6px;
  border-left: 4px solid;
}

.alert-item.alert-提醒 {
  background: #e6f7ff;
  border-left-color: #1890ff;
}

.alert-item.alert-警告 {
  background: #fff7e6;
  border-left-color: #faad14;
}

.alert-item.alert-严重 {
  background: #fff2f0;
  border-left-color: #ff4d4f;
}

.alert-icon {
  margin-right: 10px;
  font-size: 16px;
}

.alert-content {
  flex: 1;
}

.alert-type {
  font-weight: bold;
  margin-bottom: 4px;
}

.alert-message {
  color: #666;
  margin-bottom: 4px;
}

.alert-time {
  color: #999;
  font-size: 12px;
}

.map-panel {
  margin-bottom: 20px;
}

.no-data, .no-alerts {
  text-align: center;
  padding: 40px;
  color: #999;
}

.no-data i, .no-alerts i {
  font-size: 48px;
  margin-bottom: 10px;
  display: block;
}
</style>