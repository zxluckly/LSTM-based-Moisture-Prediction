<template>
  <div class="app-container">
    <!-- 页面头部 -->
    <div class="detail-header">
      <el-page-header @back="goBack" content="预测结果详情">
        <template slot="title">
          <span>返回列表</span>
        </template>
      </el-page-header>
    </div>

    <!-- 预测详情卡片 -->
    <el-card v-loading="loading" class="detail-card">
      <div slot="header" class="card-header">
        <span>预测详细信息</span>
        <div class="header-buttons">
          <el-tag :type="getPredictTypeTag(detail.predictType)">
            {{ getPredictTypeName(detail.predictType) }}
          </el-tag>
          <el-tag :type="getAccuracyTagType(detail.accuracy)">
            准确度: {{ detail.accuracy }}%
          </el-tag>
        </div>
      </div>

      <div v-if="detail.id" class="detail-content">
        <!-- 基本信息 -->
        <div class="info-section">
          <h3>基本信息</h3>
          <el-row :gutter="20">
            <el-col :span="8">
              <div class="info-item">
                <label>预测ID：</label>
                <span>{{ detail.id }}</span>
              </div>
            </el-col>
            <el-col :span="8">
              <div class="info-item">
                <label>地块ID：</label>
                <span>{{ detail.fieldId }}</span>
              </div>
            </el-col>
            <el-col :span="8">
              <div class="info-item">
                <label>预测类型：</label>
                <el-tag :type="getPredictTypeTag(detail.predictType)">
                  {{ getPredictTypeName(detail.predictType) }}
                </el-tag>
              </div>
            </el-col>
          </el-row>
          <el-row :gutter="20">
            <el-col :span="8">
              <div class="info-item">
                <label>预测时间：</label>
                <span>{{ detail.predictTime }}</span>
              </div>
            </el-col>
            <el-col :span="8">
              <div class="info-item">
                <label>模型版本：</label>
                <span>{{ detail.modelVersion || '未知' }}</span>
              </div>
            </el-col>
            <el-col :span="8">
              <div class="info-item">
                <label>创建时间：</label>
                <span>{{ detail.createTime }}</span>
              </div>
            </el-col>
          </el-row>
        </div>

        <!-- 预测结果 -->
        <div class="info-section">
          <h3>预测结果</h3>
          <el-row :gutter="20">
            <el-col :span="6">
              <div class="prediction-card temperature">
                <div class="prediction-icon">
                  <i class="el-icon-thermometer"></i>
                </div>
                <div class="prediction-content">
                  <div class="prediction-value">{{ detail.predictedTemperature }}°C</div>
                  <div class="prediction-label">预测温度</div>
                </div>
              </div>
            </el-col>
            <el-col :span="6">
              <div class="prediction-card humidity">
                <div class="prediction-icon">
                  <i class="el-icon-partly-cloudy"></i>
                </div>
                <div class="prediction-content">
                  <div class="prediction-value">{{ detail.predictedHumidity }}%</div>
                  <div class="prediction-label">预测湿度</div>
                </div>
              </div>
            </el-col>
            <el-col :span="6">
              <div class="prediction-card ec">
                <div class="prediction-icon">
                  <i class="el-icon-lightning"></i>
                </div>
                <div class="prediction-content">
                  <div class="prediction-value">{{ detail.predictedEcValue }}</div>
                  <div class="prediction-label">预测EC值</div>
                </div>
              </div>
            </el-col>
            <el-col :span="6">
              <div class="prediction-card ph">
                <div class="prediction-icon">
                  <i class="el-icon-help"></i>
                </div>
                <div class="prediction-content">
                  <div class="prediction-value">{{ detail.predictedPhValue }}</div>
                  <div class="prediction-label">预测pH值</div>
                </div>
              </div>
            </el-col>
          </el-row>
        </div>

        <!-- 模型性能指标 -->
        <div class="info-section">
          <h3>模型性能指标</h3>
          <el-row :gutter="20">
            <el-col :span="12">
              <div class="metric-card">
                <div class="metric-header">
                  <h4>准确度评估</h4>
                </div>
                <div class="metric-content">
                  <div class="metric-item">
                    <label>预测准确度：</label>
                    <div class="metric-value">
                      <el-progress 
                        :percentage="detail.accuracy || 0" 
                        :color="getAccuracyColor(detail.accuracy)"
                        :show-text="false"
                      ></el-progress>
                      <span class="percentage-text">{{ detail.accuracy || 0 }}%</span>
                    </div>
                  </div>
                  <div class="metric-item">
                    <label>置信度：</label>
                    <div class="metric-value">
                      <el-progress 
                        :percentage="detail.confidence || 0" 
                        color="#67c23a"
                        :show-text="false"
                      ></el-progress>
                      <span class="percentage-text">{{ detail.confidence || 0 }}%</span>
                    </div>
                  </div>
                </div>
              </div>
            </el-col>
            <el-col :span="12">
              <div class="metric-card">
                <div class="metric-header">
                  <h4>误差分析</h4>
                </div>
                <div class="metric-content">
                  <div class="metric-item">
                    <label>RMSE误差：</label>
                    <span class="error-value">{{ detail.rmseError || 'N/A' }}</span>
                  </div>
                  <div class="metric-item">
                    <label>MAE误差：</label>
                    <span class="error-value">{{ detail.maeError || 'N/A' }}</span>
                  </div>
                  <div class="metric-item">
                    <label>误差等级：</label>
                    <el-tag :type="getErrorLevelTag()">
                      {{ getErrorLevel() }}
                    </el-tag>
                  </div>
                </div>
              </div>
            </el-col>
          </el-row>
        </div>

        <!-- 预测对比 -->
        <div class="info-section" v-if="actualData">
          <h3>预测对比分析</h3>
          <el-table :data="comparisonData" border style="width: 100%">
            <el-table-column prop="parameter" label="参数" width="120"></el-table-column>
            <el-table-column prop="predicted" label="预测值" width="120"></el-table-column>
            <el-table-column prop="actual" label="实际值" width="120"></el-table-column>
            <el-table-column prop="difference" label="差值" width="120"></el-table-column>
            <el-table-column prop="accuracy" label="准确度">
              <template slot-scope="scope">
                <el-tag :type="getComparisonAccuracyTag(scope.row.accuracy)">
                  {{ scope.row.accuracy }}%
                </el-tag>
              </template>
            </el-table-column>
          </el-table>
        </div>

        <!-- 操作按钮 -->
        <div class="info-section">
          <h3>相关操作</h3>
          <el-row :gutter="20">
            <el-col :span="12">
              <el-button type="primary" @click="viewTrend">
                <i class="el-icon-data-line"></i> 查看趋势分析
              </el-button>
              <el-button type="success" @click="viewFieldData">
                <i class="el-icon-location"></i> 查看地块数据
              </el-button>
            </el-col>
            <el-col :span="12">
              <el-button type="warning" @click="rePredict">
                <i class="el-icon-refresh"></i> 重新预测
              </el-button>
              <el-button type="info" @click="exportPrediction">
                <i class="el-icon-download"></i> 导出预测结果
              </el-button>
            </el-col>
          </el-row>
        </div>
      </div>

      <div v-else class="no-data">
        <i class="el-icon-warning"></i>
        <p>预测数据不存在或已被删除</p>
      </div>
    </el-card>
  </div>
</template>

<script>
import { getPrediction, predict } from "@/api/soil/prediction";
import { getData } from "@/api/soil/data";

export default {
  name: "SoilPredictionDetail",
  data() {
    return {
      // 数据
      detail: {},
      actualData: null,
      comparisonData: [],
      // 状态
      loading: false
    };
  },
  created() {
    this.getDetail();
  },
  methods: {
    /** 获取详情数据 */
    getDetail() {
      const id = this.$route.query.id;
      if (!id) {
        this.$message.error("缺少预测ID参数");
        this.goBack();
        return;
      }

      this.loading = true;
      getPrediction(id).then(response => {
        this.detail = response.data || {};
        this.loading = false;
        // 尝试获取实际数据进行对比
        this.getActualDataForComparison();
      }).catch(() => {
        this.loading = false;
      });
    },

    /** 获取实际数据用于对比 */
    getActualDataForComparison() {
      // 这里可以根据预测时间和地块ID获取对应的实际数据
      // 简化实现，实际项目中需要更复杂的逻辑
    },

    /** 返回列表 */
    goBack() {
      this.$router.push('/soil/prediction');
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
        '1': '小时级预测',
        '2': '天级预测',
        '3': '周级预测'
      };
      return nameMap[type] || '未知类型';
    },

    /** 获取准确度标签类型 */
    getAccuracyTagType(accuracy) {
      if (accuracy >= 90) return 'success';
      if (accuracy >= 80) return 'warning';
      return 'danger';
    },

    /** 获取准确度颜色 */
    getAccuracyColor(accuracy) {
      if (accuracy >= 90) return '#67c23a';
      if (accuracy >= 80) return '#e6a23c';
      return '#f56c6c';
    },

    /** 获取误差等级 */
    getErrorLevel() {
      const rmse = this.detail.rmseError;
      if (!rmse) return '未知';
      if (rmse < 0.1) return '优秀';
      if (rmse < 0.3) return '良好';
      if (rmse < 0.5) return '一般';
      return '较差';
    },

    /** 获取误差等级标签 */
    getErrorLevelTag() {
      const level = this.getErrorLevel();
      const tagMap = {
        '优秀': 'success',
        '良好': 'success',
        '一般': 'warning',
        '较差': 'danger',
        '未知': 'info'
      };
      return tagMap[level] || 'info';
    },

    /** 获取对比准确度标签 */
    getComparisonAccuracyTag(accuracy) {
      if (accuracy >= 95) return 'success';
      if (accuracy >= 85) return 'warning';
      return 'danger';
    },

    /** 查看趋势分析 */
    viewTrend() {
      this.$router.push({
        path: '/soil/prediction/trend',
        query: { 
          fieldId: this.detail.fieldId 
        }
      });
    },

    /** 查看地块数据 */
    viewFieldData() {
      this.$router.push({
        path: '/soil/data',
        query: { 
          fieldId: this.detail.fieldId 
        }
      });
    },

    /** 重新预测 */
    rePredict() {
      this.$modal.confirm('是否重新执行预测？').then(() => {
        predict(this.detail.fieldId, this.detail.predictType).then(response => {
          this.$modal.msgSuccess("重新预测成功");
          this.getDetail();
        });
      });
    },

    /** 导出预测结果 */
    exportPrediction() {
      this.download('soil/prediction/export', {
        id: this.detail.id
      }, `prediction_${this.detail.id}_${new Date().getTime()}.xlsx`);
    }
  }
};
</script>

<style scoped>
.detail-header {
  margin-bottom: 20px;
}

.detail-card {
  margin-bottom: 20px;
}

.card-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.header-buttons {
  display: flex;
  align-items: center;
  gap: 10px;
}

.detail-content {
  padding: 20px 0;
}

.info-section {
  margin-bottom: 30px;
}

.info-section h3 {
  margin-bottom: 15px;
  color: #303133;
  border-bottom: 2px solid #409eff;
  padding-bottom: 8px;
}

.info-item {
  margin-bottom: 15px;
  display: flex;
  align-items: center;
}

.info-item label {
  font-weight: bold;
  color: #606266;
  min-width: 100px;
}

.info-item span {
  color: #303133;
}

.prediction-card {
  display: flex;
  align-items: center;
  padding: 20px;
  border-radius: 8px;
  box-shadow: 0 2px 8px rgba(0,0,0,0.1);
  margin-bottom: 15px;
}

.prediction-card.temperature {
  background: linear-gradient(135deg, #ff7875, #ff9c6e);
  color: white;
}

.prediction-card.humidity {
  background: linear-gradient(135deg, #36cfc9, #52c41a);
  color: white;
}

.prediction-card.ec {
  background: linear-gradient(135deg, #ffc53d, #faad14);
  color: white;
}

.prediction-card.ph {
  background: linear-gradient(135deg, #95de64, #73d13d);
  color: white;
}

.prediction-icon {
  font-size: 32px;
  margin-right: 15px;
}

.prediction-content {
  flex: 1;
}

.prediction-value {
  font-size: 24px;
  font-weight: bold;
  margin-bottom: 5px;
}

.prediction-label {
  font-size: 14px;
  opacity: 0.9;
}

.metric-card {
  border: 1px solid #ebeef5;
  border-radius: 8px;
  padding: 20px;
  height: 100%;
}

.metric-header h4 {
  margin: 0 0 15px 0;
  color: #303133;
}

.metric-item {
  margin-bottom: 15px;
  display: flex;
  align-items: center;
  justify-content: space-between;
}

.metric-item label {
  font-weight: bold;
  color: #606266;
}

.metric-value {
  display: flex;
  align-items: center;
  flex: 1;
  margin-left: 15px;
}

.metric-value .el-progress {
  flex: 1;
  margin-right: 10px;
}

.percentage-text {
  font-weight: bold;
  color: #303133;
}

.error-value {
  font-weight: bold;
  color: #f56c6c;
}

.no-data {
  text-align: center;
  padding: 60px 0;
  color: #999;
}

.no-data i {
  font-size: 48px;
  margin-bottom: 15px;
  display: block;
}
</style>