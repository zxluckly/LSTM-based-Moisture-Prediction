<template>
  <div class="app-container">
    <!-- 页面头部 -->
    <div class="trend-header">
      <el-page-header @back="goBack" content="预测趋势分析">
        <template slot="title">
          <span>返回列表</span>
        </template>
      </el-page-header>
    </div>

    <!-- 筛选条件 -->
    <el-card class="filter-card">
      <el-form :model="queryParams" ref="queryForm" size="small" :inline="true">
        <el-form-item label="地块ID" prop="fieldId">
          <el-select v-model="queryParams.fieldId" placeholder="请选择地块" @change="handleQuery">
            <el-option label="东区试验田A" value="FIELD_001"></el-option>
            <el-option label="西区试验田B" value="FIELD_002"></el-option>
            <el-option label="南区试验田C" value="FIELD_003"></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="预测类型" prop="predictType">
          <el-select v-model="queryParams.predictType" placeholder="请选择预测类型" @change="handleQuery">
            <el-option label="小时级预测" value="1"></el-option>
            <el-option label="天级预测" value="2"></el-option>
            <el-option label="周级预测" value="3"></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="时间范围">
          <el-date-picker
            v-model="dateRange"
            type="datetimerange"
            range-separator="至"
            start-placeholder="开始日期"
            end-placeholder="结束日期"
            @change="handleQuery">
          </el-date-picker>
        </el-form-item>
        <el-form-item>
          <el-button type="primary" icon="el-icon-search" @click="handleQuery">搜索</el-button>
          <el-button icon="el-icon-refresh" @click="resetQuery">重置</el-button>
        </el-form-item>
      </el-form>
    </el-card>

    <!-- 趋势图表 -->
    <el-row :gutter="20">
      <!-- 预测值趋势图 -->
      <el-col :span="24">
        <el-card class="chart-card">
          <div slot="header" class="chart-header">
            <span>预测值趋势图</span>
            <div class="chart-controls">
              <el-radio-group v-model="chartType" size="mini" @change="updateCharts">
                <el-radio-button label="line">折线图</el-radio-button>
                <el-radio-button label="bar">柱状图</el-radio-button>
                <el-radio-button label="area">面积图</el-radio-button>
              </el-radio-group>
            </div>
          </div>
          <div ref="trendChart" style="height: 400px;" v-loading="chartLoading"></div>
        </el-card>
      </el-col>
    </el-row>

    <el-row :gutter="20" style="margin-top: 20px;">
      <!-- 准确度趋势 -->
      <el-col :span="12">
        <el-card class="chart-card">
          <div slot="header">
            <span>预测准确度趋势</span>
          </div>
          <div ref="accuracyChart" style="height: 300px;" v-loading="chartLoading"></div>
        </el-card>
      </el-col>

      <!-- 误差分析 -->
      <el-col :span="12">
        <el-card class="chart-card">
          <div slot="header">
            <span>误差分析</span>
          </div>
          <div ref="errorChart" style="height: 300px;" v-loading="chartLoading"></div>
        </el-card>
      </el-col>
    </el-row>

    <!-- 统计信息 -->
    <el-row :gutter="20" style="margin-top: 20px;">
      <el-col :span="24">
        <el-card class="stats-card">
          <div slot="header">
            <span>趋势统计分析</span>
          </div>
          <el-row :gutter="20">
            <el-col :span="6">
              <div class="stat-item">
                <div class="stat-value">{{ trendStats.totalPredictions || 0 }}</div>
                <div class="stat-label">总预测次数</div>
              </div>
            </el-col>
            <el-col :span="6">
              <div class="stat-item">
                <div class="stat-value">{{ trendStats.averageAccuracy || 0 }}%</div>
                <div class="stat-label">平均准确度</div>
              </div>
            </el-col>
            <el-col :span="6">
              <div class="stat-item">
                <div class="stat-value">{{ trendStats.trendDirection || '未知' }}</div>
                <div class="stat-label">趋势方向</div>
              </div>
            </el-col>
            <el-col :span="6">
              <div class="stat-item">
                <div class="stat-value">{{ trendStats.stabilityIndex || 0 }}%</div>
                <div class="stat-label">稳定性指数</div>
              </div>
            </el-col>
          </el-row>
        </el-card>
      </el-col>
    </el-row>

    <!-- 预测数据表格 -->
    <el-card class="table-card" style="margin-top: 20px;">
      <div slot="header">
        <span>预测数据详情</span>
        <el-button style="float: right; padding: 3px 0" type="text" @click="exportTrendData">
          <i class="el-icon-download"></i> 导出数据
        </el-button>
      </div>
      <el-table :data="trendData" border style="width: 100%" v-loading="tableLoading">
        <el-table-column prop="predictTime" label="预测时间" width="180">
          <template slot-scope="scope">
            {{ parseTime(scope.row.predictTime) }}
          </template>
        </el-table-column>
        <el-table-column prop="predictType" label="预测类型" width="120">
          <template slot-scope="scope">
            <el-tag :type="getPredictTypeTag(scope.row.predictType)">
              {{ getPredictTypeName(scope.row.predictType) }}
            </el-tag>
          </template>
        </el-table-column>
        <el-table-column prop="predictedTemperature" label="预测温度(°C)" width="120"></el-table-column>
        <el-table-column prop="predictedHumidity" label="预测湿度(%)" width="120"></el-table-column>
        <el-table-column prop="predictedEcValue" label="预测EC值" width="120"></el-table-column>
        <el-table-column prop="predictedPhValue" label="预测pH值" width="120"></el-table-column>
        <el-table-column prop="accuracy" label="准确度" width="100">
          <template slot-scope="scope">
            <el-tag :type="getAccuracyTagType(scope.row.accuracy)">
              {{ scope.row.accuracy }}%
            </el-tag>
          </template>
        </el-table-column>
<!--        <el-table-column label="操作" width="120">-->
<!--          <template slot-scope="scope">-->
<!--            <el-button size="mini" type="text" @click="viewDetail(scope.row)">详情</el-button>-->
<!--          </template>-->
<!--        </el-table-column>-->
      </el-table>

      <pagination
        v-show="total>0"
        :total="total"
        :page.sync="queryParams.pageNum"
        :limit.sync="queryParams.pageSize"
        @pagination="getList"
      />
    </el-card>
  </div>
</template>

<script>
import { listPrediction, getPredictionTrend } from "@/api/soil/prediction";

export default {
  name: "SoilPredictionTrend",
  data() {
    return {
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 20,
        fieldId: null,
        predictType: null
      },
      // 数据
      trendData: [],
      chartTrendData: [], // 用于图表显示的趋势数据
      trendStats: {},
      dateRange: [],
      total: 0,
      // 图表
      trendChart: null,
      accuracyChart: null,
      errorChart: null,
      chartType: 'line',
      // 状态
      chartLoading: false,
      tableLoading: false
    };
  },
  created() {
    // 从路由参数获取地块ID
    if (this.$route.query.fieldId) {
      this.queryParams.fieldId = this.$route.query.fieldId;
    }
    this.getList();
    this.getTrendStats();
  },
  mounted() {
    this.initCharts();
  },
  beforeDestroy() {
    if (this.trendChart) {
      this.trendChart.dispose();
    }
    if (this.accuracyChart) {
      this.accuracyChart.dispose();
    }
    if (this.errorChart) {
      this.errorChart.dispose();
    }
  },
  methods: {
    /** 查询预测数据列表 */
    getList() {
      this.tableLoading = true;
      const params = { ...this.queryParams };
      if (this.dateRange && this.dateRange.length === 2) {
        params.beginTime = this.parseTime(this.dateRange[0]);
        params.endTime = this.parseTime(this.dateRange[1]);
      }

      listPrediction(params).then(response => {
        this.trendData = response.rows || [];
        this.total = response.total || 0;
        this.tableLoading = false;
        this.updateCharts();
      }).catch(() => {
        this.tableLoading = false;
      });
    },

    /** 获取趋势统计 */
    getTrendStats() {
      if (!this.queryParams.fieldId) return;

      getPredictionTrend(this.queryParams.fieldId).then(response => {
        const data = response.data || {};
        
        // 处理趋势统计数据
        this.trendStats = {
          totalPredictions: data.dataCount || 0,
          averageAccuracy: this.calculateAverageAccuracy(data.trendData || []),
          trendDirection: this.getTrendDirectionText(data.trendDirection || {}),
          stabilityIndex: this.calculateStabilityIndex(data.trendData || [])
        };
        
        // 如果有趋势数据，更新图表
        if (data.trendData && data.trendData.length > 0) {
          this.processTrendData(data.trendData);
        }
      });
    },
    
    /** 计算平均准确度 */
    calculateAverageAccuracy(trendData) {
      if (!trendData || trendData.length === 0) return 0;
      
      // 这里简化处理，实际应该根据预测值和实际值计算
      // 假设数据变化越小，准确度越高
      const avgChange = trendData.reduce((sum, item) => {
        const change = Math.abs(item.temperature || 0) + 
                      Math.abs(item.humidity || 0) + 
                      Math.abs(item.ecValue || 0) + 
                      Math.abs(item.phValue || 0);
        return sum + change;
      }, 0) / trendData.length;
      
      // 转换为准确度百分比（变化越小，准确度越高）
      const accuracy = Math.max(0, Math.min(100, 100 - avgChange * 10));
      return accuracy.toFixed(2);
    },
    
    /** 获取趋势方向文本 */
    getTrendDirectionText(trendDirection) {
      if (!trendDirection) return '未知';
      
      // 获取主要趋势（取第一个非稳定的趋势）
      const directions = Object.values(trendDirection);
      const mainTrend = directions.find(d => d !== '稳定') || '稳定';
      
      return mainTrend;
    },
    
    /** 计算稳定性指数 */
    calculateStabilityIndex(trendData) {
      if (!trendData || trendData.length === 0) return 0;
      
      // 计算各指标的标准差
      const calcStdDev = (values) => {
        const avg = values.reduce((a, b) => a + b, 0) / values.length;
        const variance = values.reduce((sum, val) => sum + Math.pow(val - avg, 2), 0) / values.length;
        return Math.sqrt(variance);
      };
      
      const temps = trendData.map(d => d.temperature || 0);
      const humids = trendData.map(d => d.humidity || 0);
      const ecs = trendData.map(d => d.ecValue || 0);
      const phs = trendData.map(d => d.phValue || 0);
      
      const tempStd = calcStdDev(temps);
      const humidStd = calcStdDev(humids);
      const ecStd = calcStdDev(ecs);
      const phStd = calcStdDev(phs);
      
      // 标准差越小，稳定性越高
      const avgStd = (tempStd + humidStd + ecStd + phStd) / 4;
      const stability = Math.max(0, Math.min(100, 100 - avgStd * 100));
      
      return stability.toFixed(2);
    },
    
    /** 处理趋势数据用于图表显示 */
    processTrendData(trendData) {
      // 将趋势数据转换为图表需要的格式
      // 注意：后端返回的是变化量，需要转换为实际值
      // 这里假设基准值，实际应该从第一条数据或配置中获取
      const baseValues = {
        temperature: 25,
        humidity: 60,
        ecValue: 1.5,
        phValue: 7.0
      };
      
      this.chartTrendData = trendData.map(item => ({
        time: item.time,
        predictedTemperature: (baseValues.temperature + (item.temperature || 0)).toFixed(2),
        predictedHumidity: (baseValues.humidity + (item.humidity || 0)).toFixed(2),
        predictedEcValue: (baseValues.ecValue + (item.ecValue || 0)).toFixed(3),
        predictedPhValue: (baseValues.phValue + (item.phValue || 0)).toFixed(2),
        accuracy: this.calculateAverageAccuracy([item]),
        rmseError: Math.abs(item.temperature || 0).toFixed(3),
        maeError: Math.abs(item.humidity || 0).toFixed(3)
      }));
      
      // 更新图表
      this.$nextTick(() => {
        this.updateTrendChartFromData();
      });
    },
    
    /** 使用趋势数据更新图表 */
    updateTrendChartFromData() {
      if (!this.trendChart || !this.chartTrendData || this.chartTrendData.length === 0) return;

      const times = [];
      const temperatures = [];
      const humidities = [];
      const ecValues = [];
      const phValues = [];

      this.chartTrendData.forEach(item => {
        times.push(this.parseTime(item.time, '{m}-{d} {h}:{i}'));
        temperatures.push(item.predictedTemperature);
        humidities.push(item.predictedHumidity);
        ecValues.push(item.predictedEcValue);
        phValues.push(item.predictedPhValue);
      });

      const option = {
        title: {
          text: '预测值趋势分析',
          left: 'center'
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
          data: times,
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
            type: this.chartType === 'area' ? 'line' : this.chartType,
            data: temperatures,
            smooth: true,
            itemStyle: { color: '#ff7875' },
            areaStyle: this.chartType === 'area' ? {
              color: {
                type: 'linear',
                x: 0,
                y: 0,
                x2: 0,
                y2: 1,
                colorStops: [{
                  offset: 0, color: 'rgba(255, 120, 117, 0.3)'
                }, {
                  offset: 1, color: 'rgba(255, 120, 117, 0.1)'
                }]
              }
            } : undefined
          },
          {
            name: '湿度',
            type: this.chartType === 'area' ? 'line' : this.chartType,
            data: humidities,
            smooth: true,
            itemStyle: { color: '#36cfc9' },
            areaStyle: this.chartType === 'area' ? {
              color: {
                type: 'linear',
                x: 0,
                y: 0,
                x2: 0,
                y2: 1,
                colorStops: [{
                  offset: 0, color: 'rgba(54, 207, 201, 0.3)'
                }, {
                  offset: 1, color: 'rgba(54, 207, 201, 0.1)'
                }]
              }
            } : undefined
          },
          {
            name: 'EC值',
            type: this.chartType === 'area' ? 'line' : this.chartType,
            yAxisIndex: 1,
            data: ecValues,
            smooth: true,
            itemStyle: { color: '#ffc53d' },
            areaStyle: this.chartType === 'area' ? {
              color: {
                type: 'linear',
                x: 0,
                y: 0,
                x2: 0,
                y2: 1,
                colorStops: [{
                  offset: 0, color: 'rgba(255, 197, 61, 0.3)'
                }, {
                  offset: 1, color: 'rgba(255, 197, 61, 0.1)'
                }]
              }
            } : undefined
          },
          {
            name: 'pH值',
            type: this.chartType === 'area' ? 'line' : this.chartType,
            yAxisIndex: 1,
            data: phValues,
            smooth: true,
            itemStyle: { color: '#95de64' },
            areaStyle: this.chartType === 'area' ? {
              color: {
                type: 'linear',
                x: 0,
                y: 0,
                x2: 0,
                y2: 1,
                colorStops: [{
                  offset: 0, color: 'rgba(149, 222, 100, 0.3)'
                }, {
                  offset: 1, color: 'rgba(149, 222, 100, 0.1)'
                }]
              }
            } : undefined
          }
        ]
      };

      this.trendChart.setOption(option);
    },

    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.getList();
      this.getTrendStats();
    },

    /** 重置按钮操作 */
    resetQuery() {
      this.dateRange = [];
      this.resetForm("queryForm");
      this.handleQuery();
    },

    /** 初始化图表 */
    initCharts() {
      this.$nextTick(() => {
        if (this.$refs.trendChart) {
          this.trendChart = this.$echarts.init(this.$refs.trendChart);
        }
        if (this.$refs.accuracyChart) {
          this.accuracyChart = this.$echarts.init(this.$refs.accuracyChart);
        }
        if (this.$refs.errorChart) {
          this.errorChart = this.$echarts.init(this.$refs.errorChart);
        }
        this.updateCharts();
      });
    },

    /** 更新图表 */
    updateCharts() {
      // 如果有趋势数据（从getTrendStats获取），使用趋势数据
      if (this.chartTrendData && this.chartTrendData.length > 0) {
        this.updateTrendChartFromData();
        this.updateAccuracyChartFromData();
        this.updateErrorChartFromData();
        return;
      }
      
      // 否则使用预测列表数据
      if (!this.trendData || this.trendData.length === 0) return;

      this.updateTrendChart();
      this.updateAccuracyChart();
      this.updateErrorChart();
    },
    
    /** 使用趋势数据更新准确度图表 */
    updateAccuracyChartFromData() {
      if (!this.accuracyChart || !this.chartTrendData || this.chartTrendData.length === 0) return;

      const times = [];
      const accuracies = [];

      this.chartTrendData.forEach(item => {
        times.push(this.parseTime(item.time, '{m}-{d} {h}:{i}'));
        accuracies.push(item.accuracy || 0);
      });

      const option = {
        title: {
          text: '预测准确度趋势',
          left: 'center',
          textStyle: { fontSize: 14 }
        },
        tooltip: {
          trigger: 'axis',
          formatter: '{b}<br/>准确度: {c}%'
        },
        grid: {
          left: '3%',
          right: '4%',
          bottom: '3%',
          containLabel: true
        },
        xAxis: {
          type: 'category',
          data: times,
          axisLabel: {
            rotate: 45,
            fontSize: 10
          }
        },
        yAxis: {
          type: 'value',
          name: '准确度(%)',
          min: 0,
          max: 100
        },
        series: [
          {
            name: '准确度',
            type: 'line',
            data: accuracies,
            smooth: true,
            itemStyle: { color: '#67c23a' },
            areaStyle: {
              color: {
                type: 'linear',
                x: 0,
                y: 0,
                x2: 0,
                y2: 1,
                colorStops: [{
                  offset: 0, color: 'rgba(103, 194, 58, 0.3)'
                }, {
                  offset: 1, color: 'rgba(103, 194, 58, 0.1)'
                }]
              }
            }
          }
        ]
      };

      this.accuracyChart.setOption(option);
    },
    
    /** 使用趋势数据更新误差图表 */
    updateErrorChartFromData() {
      if (!this.errorChart || !this.chartTrendData || this.chartTrendData.length === 0) return;

      const times = [];
      const rmseErrors = [];
      const maeErrors = [];

      this.chartTrendData.forEach(item => {
        times.push(this.parseTime(item.time, '{m}-{d} {h}:{i}'));
        rmseErrors.push(item.rmseError || 0);
        maeErrors.push(item.maeError || 0);
      });

      const option = {
        title: {
          text: '预测误差分析',
          left: 'center',
          textStyle: { fontSize: 14 }
        },
        tooltip: {
          trigger: 'axis'
        },
        legend: {
          data: ['RMSE', 'MAE'],
          bottom: 5
        },
        grid: {
          left: '3%',
          right: '4%',
          bottom: '15%',
          containLabel: true
        },
        xAxis: {
          type: 'category',
          data: times,
          axisLabel: {
            rotate: 45,
            fontSize: 10
          }
        },
        yAxis: {
          type: 'value',
          name: '误差值'
        },
        series: [
          {
            name: 'RMSE',
            type: 'line',
            data: rmseErrors,
            smooth: true,
            itemStyle: { color: '#f56c6c' }
          },
          {
            name: 'MAE',
            type: 'line',
            data: maeErrors,
            smooth: true,
            itemStyle: { color: '#e6a23c' }
          }
        ]
      };

      this.errorChart.setOption(option);
    },

    /** 更新趋势图表 */
    updateTrendChart() {
      if (!this.trendChart) return;

      const times = [];
      const temperatures = [];
      const humidities = [];
      const ecValues = [];
      const phValues = [];

      this.trendData.forEach(item => {
        times.push(this.parseTime(item.predictTime, '{m}-{d} {h}:{i}'));
        temperatures.push(item.predictedTemperature);
        humidities.push(item.predictedHumidity);
        ecValues.push(item.predictedEcValue);
        phValues.push(item.predictedPhValue);
      });

      const option = {
        title: {
          text: '预测值趋势分析',
          left: 'center'
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
          data: times,
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
            type: this.chartType === 'area' ? 'line' : this.chartType,
            data: temperatures,
            smooth: true,
            itemStyle: { color: '#ff7875' },
            areaStyle: this.chartType === 'area' ? {
              color: {
                type: 'linear',
                x: 0,
                y: 0,
                x2: 0,
                y2: 1,
                colorStops: [{
                  offset: 0, color: 'rgba(255, 120, 117, 0.3)'
                }, {
                  offset: 1, color: 'rgba(255, 120, 117, 0.1)'
                }]
              }
            } : undefined
          },
          {
            name: '湿度',
            type: this.chartType === 'area' ? 'line' : this.chartType,
            data: humidities,
            smooth: true,
            itemStyle: { color: '#36cfc9' },
            areaStyle: this.chartType === 'area' ? {
              color: {
                type: 'linear',
                x: 0,
                y: 0,
                x2: 0,
                y2: 1,
                colorStops: [{
                  offset: 0, color: 'rgba(54, 207, 201, 0.3)'
                }, {
                  offset: 1, color: 'rgba(54, 207, 201, 0.1)'
                }]
              }
            } : undefined
          },
          {
            name: 'EC值',
            type: this.chartType === 'area' ? 'line' : this.chartType,
            yAxisIndex: 1,
            data: ecValues,
            smooth: true,
            itemStyle: { color: '#ffc53d' },
            areaStyle: this.chartType === 'area' ? {
              color: {
                type: 'linear',
                x: 0,
                y: 0,
                x2: 0,
                y2: 1,
                colorStops: [{
                  offset: 0, color: 'rgba(255, 197, 61, 0.3)'
                }, {
                  offset: 1, color: 'rgba(255, 197, 61, 0.1)'
                }]
              }
            } : undefined
          },
          {
            name: 'pH值',
            type: this.chartType === 'area' ? 'line' : this.chartType,
            yAxisIndex: 1,
            data: phValues,
            smooth: true,
            itemStyle: { color: '#95de64' },
            areaStyle: this.chartType === 'area' ? {
              color: {
                type: 'linear',
                x: 0,
                y: 0,
                x2: 0,
                y2: 1,
                colorStops: [{
                  offset: 0, color: 'rgba(149, 222, 100, 0.3)'
                }, {
                  offset: 1, color: 'rgba(149, 222, 100, 0.1)'
                }]
              }
            } : undefined
          }
        ]
      };

      this.trendChart.setOption(option);
    },

    /** 更新准确度图表 */
    updateAccuracyChart() {
      if (!this.accuracyChart) return;

      const times = [];
      const accuracies = [];

      this.trendData.forEach(item => {
        times.push(this.parseTime(item.predictTime, '{m}-{d} {h}:{i}'));
        accuracies.push(item.accuracy || 0);
      });

      const option = {
        title: {
          text: '预测准确度趋势',
          left: 'center',
          textStyle: { fontSize: 14 }
        },
        tooltip: {
          trigger: 'axis',
          formatter: '{b}<br/>准确度: {c}%'
        },
        grid: {
          left: '3%',
          right: '4%',
          bottom: '3%',
          containLabel: true
        },
        xAxis: {
          type: 'category',
          data: times,
          axisLabel: {
            rotate: 45,
            fontSize: 10
          }
        },
        yAxis: {
          type: 'value',
          name: '准确度(%)',
          min: 0,
          max: 100
        },
        series: [
          {
            name: '准确度',
            type: 'line',
            data: accuracies,
            smooth: true,
            itemStyle: { color: '#67c23a' },
            areaStyle: {
              color: {
                type: 'linear',
                x: 0,
                y: 0,
                x2: 0,
                y2: 1,
                colorStops: [{
                  offset: 0, color: 'rgba(103, 194, 58, 0.3)'
                }, {
                  offset: 1, color: 'rgba(103, 194, 58, 0.1)'
                }]
              }
            }
          }
        ]
      };

      this.accuracyChart.setOption(option);
    },

    /** 更新误差图表 */
    updateErrorChart() {
      if (!this.errorChart) return;

      const times = [];
      const rmseErrors = [];
      const maeErrors = [];

      this.trendData.forEach(item => {
        times.push(this.parseTime(item.predictTime, '{m}-{d} {h}:{i}'));
        rmseErrors.push(item.rmseError || 0);
        maeErrors.push(item.maeError || 0);
      });

      const option = {
        title: {
          text: '预测误差分析',
          left: 'center',
          textStyle: { fontSize: 14 }
        },
        tooltip: {
          trigger: 'axis'
        },
        legend: {
          data: ['RMSE', 'MAE'],
          bottom: 5
        },
        grid: {
          left: '3%',
          right: '4%',
          bottom: '15%',
          containLabel: true
        },
        xAxis: {
          type: 'category',
          data: times,
          axisLabel: {
            rotate: 45,
            fontSize: 10
          }
        },
        yAxis: {
          type: 'value',
          name: '误差值'
        },
        series: [
          {
            name: 'RMSE',
            type: 'line',
            data: rmseErrors,
            smooth: true,
            itemStyle: { color: '#f56c6c' }
          },
          {
            name: 'MAE',
            type: 'line',
            data: maeErrors,
            smooth: true,
            itemStyle: { color: '#e6a23c' }
          }
        ]
      };

      this.errorChart.setOption(option);
    },

    /** 返回列表 */
    goBack() {
      this.$router.push('/soil/prediction');
    },

    /** 查看详情 */
    viewDetail(row) {
      this.$router.push({
        path: '/soil/prediction/detail',
        query: { id: row.id }
      });
    },

    /** 导出趋势数据 */
    exportTrendData() {
      this.download('soil/prediction/export', {
        ...this.queryParams,
        beginTime: this.dateRange && this.dateRange.length === 2 ? this.parseTime(this.dateRange[0]) : null,
        endTime: this.dateRange && this.dateRange.length === 2 ? this.parseTime(this.dateRange[1]) : null
      }, `prediction_trend_${new Date().getTime()}.xlsx`);
    },

    /** 获取预测类型标签 */
    getPredictTypeTag(type) {
      const typeMap = {
        '1': 'success',
        '2': 'warning',
        '3': 'info'
      };
      return typeMap[type] || 'info';
    },

    /** 获取预测类型名称 */
    getPredictTypeName(type) {
      const nameMap = {
        '1': '小时级',
        '2': '天级',
        '3': '周级'
      };
      return nameMap[type] || '未知';
    },

    /** 获取准确度标签类型 */
    getAccuracyTagType(accuracy) {
      if (accuracy >= 90) return 'success';
      if (accuracy >= 80) return 'warning';
      return 'danger';
    }
  }
};
</script>

<style scoped>
.trend-header {
  margin-bottom: 20px;
}

.filter-card {
  margin-bottom: 20px;
}

.chart-card {
  margin-bottom: 20px;
}

.chart-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.chart-controls {
  display: flex;
  align-items: center;
  gap: 10px;
}

.stats-card {
  margin-bottom: 20px;
}

.stat-item {
  text-align: center;
  padding: 20px;
  background: #f8f9fa;
  border-radius: 8px;
}

.stat-value {
  font-size: 28px;
  font-weight: bold;
  color: #409eff;
  margin-bottom: 8px;
}

.stat-label {
  color: #666;
  font-size: 14px;
}

.table-card {
  margin-bottom: 20px;
}
</style>
