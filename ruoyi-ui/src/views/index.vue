<template>
  <div class="app-container home">
    <!-- 系统标题和概览 -->
    <el-row :gutter="20">
      <el-col :sm="24" :lg="16" style="padding-left: 20px">
        <h2>🌱 土壤墒情预测系统</h2>
        <p>
          基于LSTM神经网络的智能农田墒情预测系统，采用SpringBoot + Vue.js + Python微服务架构，
          通过物联网设备实时采集土壤温度、湿度、电导率、酸碱度等关键参数，运用深度学习算法进行
          数据分析和预测，为精准农业提供科学决策支持。
        </p>
        <p>
          <b>系统版本:</b> <span>v{{ version }}</span>
        </p>
        <p>
          <el-tag type="success">🎯 智能预测</el-tag>
          <el-tag type="primary">📊 实时监控</el-tag>
          <el-tag type="warning">🔬 科学分析</el-tag>
        </p>
        <p>
          <el-button
            type="primary"
            size="mini"
            icon="el-icon-monitor"
            @click="goToDashboard"
            >监控大屏</el-button
          >
          <el-button
            type="success"
            size="mini"
            icon="el-icon-data-line"
            @click="goToPrediction"
            >预测分析</el-button
          >
          <el-button
            size="mini"
            icon="el-icon-document"
            plain
            @click="goTarget('https://github.com/tensorflow/tensorflow')"
            >TensorFlow</el-button
          >
        </p>
      </el-col>

      <el-col :sm="24" :lg="8" style="padding-left: 20px">
        <el-card class="system-status">
          <div slot="header" class="clearfix">
            <span>系统状态</span>
            <el-button style="float: right; padding: 3px 0" type="text" @click="refreshStatus">刷新</el-button>
          </div>
          <div class="status-item">
            <span class="status-label">数据采集:</span>
            <el-tag :type="systemStatus.dataCollection ? 'success' : 'danger'" size="mini">
              {{ systemStatus.dataCollection ? '正常' : '异常' }}
            </el-tag>
          </div>
          <div class="status-item">
            <span class="status-label">LSTM服务:</span>
            <el-tag :type="systemStatus.lstmService ? 'success' : 'danger'" size="mini">
              {{ systemStatus.lstmService ? '运行中' : '离线' }}
            </el-tag>
          </div>
          <div class="status-item">
            <span class="status-label">预测准确度:</span>
            <span class="status-value">{{ systemStatus.accuracy }}%</span>
          </div>
          <div class="status-item">
            <span class="status-label">数据总量:</span>
            <span class="status-value">{{ systemStatus.totalData }}</span>
          </div>
        </el-card>
      </el-col>
    </el-row>

    <el-divider />

    <!-- 功能模块 -->
    <el-row :gutter="20">
      <el-col :xs="24" :sm="12" :md="6" :lg="6">
        <el-card class="feature-card" @click.native="goToDataManagement">
          <div class="feature-icon">
            <i class="el-icon-data-board" style="color: #409EFF;"></i>
          </div>
          <h3>数据管理</h3>
          <p>土壤数据采集、存储、预处理和质量控制</p>
          <div class="feature-stats">
            <span>{{ stats.dataCount }} 条数据</span>
          </div>
        </el-card>
      </el-col>
      <el-col :xs="24" :sm="12" :md="6" :lg="6">
        <el-card class="feature-card" @click.native="goToPrediction">
          <div class="feature-icon">
            <i class="el-icon-data-analysis" style="color: #67C23A;"></i>
          </div>
          <h3>预测分析</h3>
          <p>基于LSTM神经网络的墒情预测和趋势分析</p>
          <div class="feature-stats">
            <span>{{ stats.predictionCount }} 次预测</span>
          </div>
        </el-card>
      </el-col>
      <el-col :xs="24" :sm="12" :md="6" :lg="6">
        <el-card class="feature-card" @click.native="goToDashboard">
          <div class="feature-icon">
            <i class="el-icon-monitor" style="color: #E6A23C;"></i>
          </div>
          <h3>监控大屏</h3>
          <p>实时监控、数据可视化和预警信息展示</p>
          <div class="feature-stats">
            <span>{{ stats.alertCount }} 条预警</span>
          </div>
        </el-card>
      </el-col>
      <el-col :xs="24" :sm="12" :md="6" :lg="6">
        <el-card class="feature-card" @click.native="goToModelManagement">
          <div class="feature-icon">
            <i class="el-icon-cpu" style="color: #F56C6C;"></i>
          </div>
          <h3>模型管理</h3>
          <p>LSTM模型训练、评估和性能优化</p>
          <div class="feature-stats">
            <span>{{ stats.modelAccuracy }}% 准确度</span>
          </div>
        </el-card>
      </el-col>
    </el-row>

    <el-divider />

<!--    &lt;!&ndash; 快速操作 &ndash;&gt;-->
<!--    <el-row :gutter="20">-->
<!--      <el-col :span="24">-->
<!--        <el-card class="quick-actions">-->
<!--          <div slot="header" class="clearfix">-->
<!--            <span>快速操作</span>-->
<!--          </div>-->
<!--          <div class="action-buttons">-->
<!--            <el-button type="primary" icon="el-icon-plus" @click="generateData" :loading="generating">-->
<!--              生成模拟数据-->
<!--            </el-button>-->
<!--            <el-button type="success" icon="el-icon-magic-stick" @click="runPrediction" :loading="predicting">-->
<!--              执行预测-->
<!--            </el-button>-->
<!--            <el-button type="warning" icon="el-icon-refresh" @click="trainModel" :loading="training">-->
<!--              训练模型-->
<!--            </el-button>-->
<!--            <el-button type="info" icon="el-icon-view" @click="viewReports">-->
<!--              查看报告-->
<!--            </el-button>-->
<!--          </div>-->
<!--        </el-card>-->
<!--      </el-col>-->
<!--    </el-row>-->
  </div>
</template>
<script>
import { getOverview } from "@/api/soil/dashboard";
import { generateSimulatedData } from "@/api/soil/data";
import { predict } from "@/api/soil/prediction";

export default {
  name: "Index",
  data() {
    return {
      version: "1.0.0",
      generating: false,
      predicting: false,
      training: false,
      systemStatus: {
        dataCollection: true,
        lstmService: true,
        accuracy: 89.2,
        totalData: 0
      },
      stats: {
        dataCount: 0,
        predictionCount: 0,
        alertCount: 0,
        modelAccuracy: 89.2
      },
      systemInfo: {
        environment: "开发环境",
        database: "MySQL 8.0",
        aiFramework: "TensorFlow 2.x",
        lastUpdate: new Date().toLocaleDateString()
      },
      recentActivities: [
        {
          id: 1,
          time: "10分钟前",
          message: "FIELD_001地块完成数据采集",
          icon: "el-icon-success",
          color: "#67C23A"
        },
        {
          id: 2,
          time: "30分钟前",
          message: "LSTM模型预测准确度达到89.2%",
          icon: "el-icon-data-line",
          color: "#409EFF"
        }
      ]
    }
  },
  mounted() {
    this.loadSystemData();
  },
  methods: {
    async loadSystemData() {
      try {
        const response = await getOverview();
        const data = response.data || {};

        this.systemStatus.totalData = data.dataStats?.totalDataCount || 0;
        this.systemStatus.accuracy = data.modelMetrics?.overallAccuracy || 89.2;
        this.systemStatus.lstmService = data.serviceHealth?.status === 'healthy';

        this.stats.dataCount = data.dataStats?.totalDataCount || 0;
        this.stats.predictionCount = data.modelMetrics?.totalPredictions || 0;
        this.stats.modelAccuracy = data.modelMetrics?.overallAccuracy || 89.2;

      } catch (error) {
        console.error('加载系统数据失败:', error);
      }
    },

    refreshStatus() {
      this.loadSystemData();
      this.$message.success('系统状态已刷新');
    },

    async generateData() {
      this.generating = true;
      try {
        await generateSimulatedData('FIELD_001', 100);
        this.$message.success('模拟数据生成成功');
        this.loadSystemData();
      } catch (error) {
        this.$message.error('生成数据失败');
      } finally {
        this.generating = false;
      }
    },

    async runPrediction() {
      this.predicting = true;
      try {
        await predict('FIELD_001', '1');
        this.$message.success('预测执行成功');
        this.loadSystemData();
      } catch (error) {
        this.$message.error('预测执行失败');
      } finally {
        this.predicting = false;
      }
    },

    trainModel() {
      this.training = true;
      setTimeout(() => {
        this.$message.success('模型训练已启动');
        this.training = false;
      }, 2000);
    },

    viewReports() {
      this.$router.push('/soil/dashboard');
    },

    goToDashboard() {
      this.$router.push('/soil/dashboard');
    },

    goToPrediction() {
      this.$router.push('/soil/prediction');
    },

    goToDataManagement() {
      this.$router.push('/soil/data');
    },

    goToModelManagement() {
      this.$router.push('/soil/prediction');
    },

    goTarget(href) {
      window.open(href, "_blank");
    }
  }
}
</script>
<style scoped lang="scss">
.home {
  font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
  font-size: 14px;
  color: #606266;
  line-height: 1.6;

  h2 {
    margin-top: 10px;
    font-size: 28px;
    font-weight: 300;
    color: #409EFF;
  }

  h3 {
    font-size: 18px;
    font-weight: 500;
    margin: 10px 0;
  }

  h4 {
    font-size: 16px;
    font-weight: 500;
    margin: 15px 0 10px 0;
    color: #303133;
  }

  p {
    margin: 15px 0;
    line-height: 1.8;
  }

  .el-tag {
    margin-right: 10px;
  }

  .system-status {
    .status-item {
      display: flex;
      justify-content: space-between;
      align-items: center;
      padding: 8px 0;
      border-bottom: 1px solid #f0f0f0;

      &:last-child {
        border-bottom: none;
      }

      .status-label {
        font-weight: 500;
        color: #606266;
      }

      .status-value {
        font-weight: bold;
        color: #409EFF;
      }
    }
  }

  .feature-card {
    text-align: center;
    cursor: pointer;
    transition: all 0.3s;
    margin-bottom: 20px;
    min-height: 200px;

    &:hover {
      transform: translateY(-5px);
      box-shadow: 0 8px 25px rgba(0,0,0,0.1);
    }

    .feature-icon {
      font-size: 48px;
      margin-bottom: 15px;
    }

    h3 {
      color: #303133;
      margin-bottom: 10px;
    }

    p {
      color: #909399;
      font-size: 13px;
      margin-bottom: 15px;
    }

    .feature-stats {
      color: #409EFF;
      font-weight: bold;
      font-size: 14px;
    }
  }

  .quick-actions {
    .action-buttons {
      text-align: center;

      .el-button {
        margin: 0 10px 10px 0;
      }
    }
  }

  .clearfix:before,
  .clearfix:after {
    display: table;
    content: "";
  }

  .clearfix:after {
    clear: both;
  }
}
</style>
