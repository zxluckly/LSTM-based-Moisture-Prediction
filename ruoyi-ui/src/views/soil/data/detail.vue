<template>
  <div class="app-container">
    <!-- 页面头部 -->
    <div class="detail-header">
      <el-page-header @back="goBack" content="土壤数据详情">
        <template slot="title">
          <span>返回列表</span>
        </template>
      </el-page-header>
    </div>

    <!-- 数据详情卡片 -->
    <el-card v-loading="loading" class="detail-card">
      <div slot="header" class="card-header">
        <span>数据详细信息</span>
        <div class="header-buttons">
          <el-tag :type="getStatusTagType(detail.dataStatus)">
            {{ getStatusText(detail.dataStatus) }}
          </el-tag>
          <el-button type="primary" size="mini" @click="handleEdit">
            <i class="el-icon-edit"></i> 编辑
          </el-button>
        </div>
      </div>

      <div v-if="detail.id" class="detail-content">
        <!-- 基本信息 -->
        <div class="info-section">
          <h3>基本信息</h3>
          <el-row :gutter="20">
            <el-col :span="8">
              <div class="info-item">
                <label>数据ID：</label>
                <span>{{ detail.id }}</span>
              </div>
            </el-col>
            <el-col :span="8">
              <div class="info-item">
                <label>设备ID：</label>
                <span>{{ detail.deviceId }}</span>
              </div>
            </el-col>
            <el-col :span="8">
              <div class="info-item">
                <label>地块ID：</label>
                <span>{{ detail.fieldId }}</span>
              </div>
            </el-col>
          </el-row>
          <el-row :gutter="20">
            <el-col :span="8">
              <div class="info-item">
                <label>采集时间：</label>
                <span>{{ detail.collectTime }}</span>
              </div>
            </el-col>
            <el-col :span="8">
              <div class="info-item">
                <label>创建时间：</label>
                <span>{{ detail.createTime }}</span>
              </div>
            </el-col>
            <el-col :span="8">
              <div class="info-item">
                <label>更新时间：</label>
                <span>{{ detail.updateTime || '未更新' }}</span>
              </div>
            </el-col>
          </el-row>
        </div>

        <!-- 传感器数据 -->
        <div class="info-section">
          <h3>传感器数据</h3>
          <el-row :gutter="20">
            <el-col :span="6">
              <div class="sensor-card temperature">
                <div class="sensor-icon">
                  <i class="el-icon-thermometer"></i>
                </div>
                <div class="sensor-content">
                  <div class="sensor-value">{{ detail.temperature }}°C</div>
                  <div class="sensor-label">土壤温度</div>
                </div>
              </div>
            </el-col>
            <el-col :span="6">
              <div class="sensor-card humidity">
                <div class="sensor-icon">
                  <i class="el-icon-partly-cloudy"></i>
                </div>
                <div class="sensor-content">
                  <div class="sensor-value">{{ detail.humidity }}%</div>
                  <div class="sensor-label">土壤湿度</div>
                </div>
              </div>
            </el-col>
            <el-col :span="6">
              <div class="sensor-card ec">
                <div class="sensor-icon">
                  <i class="el-icon-lightning"></i>
                </div>
                <div class="sensor-content">
                  <div class="sensor-value">{{ detail.ecValue }}</div>
                  <div class="sensor-label">EC值 (mS/cm)</div>
                </div>
              </div>
            </el-col>
            <el-col :span="6">
              <div class="sensor-card ph">
                <div class="sensor-icon">
                  <i class="el-icon-help"></i>
                </div>
                <div class="sensor-content">
                  <div class="sensor-value">{{ detail.phValue }}</div>
                  <div class="sensor-label">pH值</div>
                </div>
              </div>
            </el-col>
          </el-row>
        </div>

        <!-- 地理位置信息 -->
        <div class="info-section">
          <h3>地理位置信息</h3>
          <el-row :gutter="20">
            <el-col :span="8">
              <div class="info-item">
                <label>经度：</label>
                <span>{{ detail.longitude }}°</span>
              </div>
            </el-col>
            <el-col :span="8">
              <div class="info-item">
                <label>纬度：</label>
                <span>{{ detail.latitude }}°</span>
              </div>
            </el-col>
            <el-col :span="8">
              <div class="info-item">
                <label>海拔：</label>
                <span>{{ detail.altitude }}m</span>
              </div>
            </el-col>
          </el-row>
        </div>

        <!-- 数据质量分析 -->
        <div class="info-section">
          <h3>数据质量分析</h3>
          <el-row :gutter="20">
            <el-col :span="12">
              <div class="quality-item">
                <label>数据状态：</label>
                <el-tag :type="getStatusTagType(detail.dataStatus)">
                  {{ getStatusText(detail.dataStatus) }}
                </el-tag>
              </div>
              <div class="quality-item">
                <label>数据完整性：</label>
                <el-progress 
                  :percentage="calculateCompleteness()" 
                  :color="getCompletenessColor(calculateCompleteness())"
                ></el-progress>
              </div>
            </el-col>
            <el-col :span="12">
              <div class="quality-item">
                <label>数据范围检查：</label>
                <div class="range-checks">
                  <el-tag size="mini" :type="checkTemperatureRange() ? 'success' : 'danger'">
                    温度范围 {{ checkTemperatureRange() ? '正常' : '异常' }}
                  </el-tag>
                  <el-tag size="mini" :type="checkHumidityRange() ? 'success' : 'danger'">
                    湿度范围 {{ checkHumidityRange() ? '正常' : '异常' }}
                  </el-tag>
                  <el-tag size="mini" :type="checkEcRange() ? 'success' : 'danger'">
                    EC值范围 {{ checkEcRange() ? '正常' : '异常' }}
                  </el-tag>
                  <el-tag size="mini" :type="checkPhRange() ? 'success' : 'danger'">
                    pH值范围 {{ checkPhRange() ? '正常' : '异常' }}
                  </el-tag>
                </div>
              </div>
            </el-col>
          </el-row>
        </div>

        <!-- 相关数据 -->
        <div class="info-section">
          <h3>相关数据</h3>
          <el-row :gutter="20">
            <el-col :span="12">
              <el-button type="text" @click="viewNearbyData">
                <i class="el-icon-location"></i> 查看附近数据
              </el-button>
              <el-button type="text" @click="viewHistoryData">
                <i class="el-icon-time"></i> 查看历史数据
              </el-button>
            </el-col>
            <el-col :span="12">
              <el-button type="text" @click="viewPredictionData">
                <i class="el-icon-data-line"></i> 查看预测数据
              </el-button>
              <el-button type="text" @click="exportData">
                <i class="el-icon-download"></i> 导出数据
              </el-button>
            </el-col>
          </el-row>
        </div>
      </div>

      <div v-else class="no-data">
        <i class="el-icon-warning"></i>
        <p>数据不存在或已被删除</p>
      </div>
    </el-card>

    <!-- 编辑对话框 -->
    <el-dialog title="编辑土壤数据" :visible.sync="editOpen" width="600px" append-to-body>
      <el-form ref="editForm" :model="editForm" :rules="editRules" label-width="100px">
        <el-row :gutter="20">
          <el-col :span="12">
            <el-form-item label="设备ID" prop="deviceId">
              <el-input v-model="editForm.deviceId" placeholder="请输入设备ID" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="地块ID" prop="fieldId">
              <el-input v-model="editForm.fieldId" placeholder="请输入地块ID" />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row :gutter="20">
          <el-col :span="12">
            <el-form-item label="土壤温度" prop="temperature">
              <el-input-number v-model="editForm.temperature" :precision="2" :step="0.1" placeholder="请输入温度" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="土壤湿度" prop="humidity">
              <el-input-number v-model="editForm.humidity" :precision="2" :step="0.1" :min="0" :max="100" placeholder="请输入湿度" />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row :gutter="20">
          <el-col :span="12">
            <el-form-item label="EC值" prop="ecValue">
              <el-input-number v-model="editForm.ecValue" :precision="3" :step="0.01" :min="0" placeholder="请输入EC值" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="pH值" prop="phValue">
              <el-input-number v-model="editForm.phValue" :precision="2" :step="0.1" :min="0" :max="14" placeholder="请输入pH值" />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row :gutter="20">
          <el-col :span="8">
            <el-form-item label="经度" prop="longitude">
              <el-input-number v-model="editForm.longitude" :precision="6" :step="0.000001" placeholder="请输入经度" />
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="纬度" prop="latitude">
              <el-input-number v-model="editForm.latitude" :precision="6" :step="0.000001" placeholder="请输入纬度" />
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="海拔" prop="altitude">
              <el-input-number v-model="editForm.altitude" :precision="2" :step="0.1" placeholder="请输入海拔" />
            </el-form-item>
          </el-col>
        </el-row>
        <el-form-item label="数据状态" prop="dataStatus">
          <el-radio-group v-model="editForm.dataStatus">
            <el-radio label="0">正常</el-radio>
            <el-radio label="1">异常</el-radio>
          </el-radio-group>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="editOpen = false">取 消</el-button>
        <el-button type="primary" @click="submitEdit">确 定</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { getData, updateData } from "@/api/soil/data";

export default {
  name: "SoilDataDetail",
  data() {
    return {
      // 数据
      detail: {},
      editForm: {},
      // 状态
      loading: false,
      editOpen: false,
      // 验证规则
      editRules: {
        deviceId: [
          { required: true, message: "设备ID不能为空", trigger: "blur" }
        ],
        fieldId: [
          { required: true, message: "地块ID不能为空", trigger: "blur" }
        ],
        temperature: [
          { required: true, message: "温度不能为空", trigger: "blur" }
        ],
        humidity: [
          { required: true, message: "湿度不能为空", trigger: "blur" }
        ],
        ecValue: [
          { required: true, message: "EC值不能为空", trigger: "blur" }
        ],
        phValue: [
          { required: true, message: "pH值不能为空", trigger: "blur" }
        ]
      }
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
        this.$message.error("缺少数据ID参数");
        this.goBack();
        return;
      }

      this.loading = true;
      getData(id).then(response => {
        this.detail = response.data || {};
        this.loading = false;
      }).catch(() => {
        this.loading = false;
      });
    },

    /** 返回列表 */
    goBack() {
      this.$router.push('/soil/data');
    },

    /** 编辑数据 */
    handleEdit() {
      this.editForm = { ...this.detail };
      this.editOpen = true;
    },

    /** 提交编辑 */
    submitEdit() {
      this.$refs["editForm"].validate(valid => {
        if (valid) {
          updateData(this.editForm).then(response => {
            this.$modal.msgSuccess("修改成功");
            this.editOpen = false;
            this.getDetail();
          });
        }
      });
    },

    /** 获取状态标签类型 */
    getStatusTagType(status) {
      return status === '0' ? 'success' : 'danger';
    },

    /** 获取状态文本 */
    getStatusText(status) {
      return status === '0' ? '正常' : '异常';
    },

    /** 计算数据完整性 */
    calculateCompleteness() {
      const fields = ['temperature', 'humidity', 'ecValue', 'phValue', 'longitude', 'latitude'];
      const completedFields = fields.filter(field => this.detail[field] != null).length;
      return Math.round((completedFields / fields.length) * 100);
    },

    /** 获取完整性颜色 */
    getCompletenessColor(percentage) {
      if (percentage >= 90) return '#67c23a';
      if (percentage >= 70) return '#e6a23c';
      return '#f56c6c';
    },

    /** 检查温度范围 */
    checkTemperatureRange() {
      const temp = this.detail.temperature;
      return temp >= -50 && temp <= 80;
    },

    /** 检查湿度范围 */
    checkHumidityRange() {
      const humidity = this.detail.humidity;
      return humidity >= 0 && humidity <= 100;
    },

    /** 检查EC值范围 */
    checkEcRange() {
      const ec = this.detail.ecValue;
      return ec >= 0 && ec <= 10;
    },

    /** 检查pH值范围 */
    checkPhRange() {
      const ph = this.detail.phValue;
      return ph >= 0 && ph <= 14;
    },

    /** 查看附近数据 */
    viewNearbyData() {
      this.$router.push({
        path: '/soil/data',
        query: { 
          fieldId: this.detail.fieldId,
          nearby: true 
        }
      });
    },

    /** 查看历史数据 */
    viewHistoryData() {
      this.$router.push({
        path: '/soil/data',
        query: { 
          fieldId: this.detail.fieldId,
          history: true 
        }
      });
    },

    /** 查看预测数据 */
    viewPredictionData() {
      this.$router.push({
        path: '/soil/prediction',
        query: { 
          fieldId: this.detail.fieldId 
        }
      });
    },

    /** 导出数据 */
    exportData() {
      this.download('soil/data/export', {
        id: this.detail.id
      }, `soil_data_${this.detail.id}_${new Date().getTime()}.xlsx`);
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

.sensor-card {
  display: flex;
  align-items: center;
  padding: 20px;
  border-radius: 8px;
  box-shadow: 0 2px 8px rgba(0,0,0,0.1);
  margin-bottom: 15px;
}

.sensor-card.temperature {
  background: linear-gradient(135deg, #ff7875, #ff9c6e);
  color: white;
}

.sensor-card.humidity {
  background: linear-gradient(135deg, #36cfc9, #52c41a);
  color: white;
}

.sensor-card.ec {
  background: linear-gradient(135deg, #ffc53d, #faad14);
  color: white;
}

.sensor-card.ph {
  background: linear-gradient(135deg, #95de64, #73d13d);
  color: white;
}

.sensor-icon {
  font-size: 32px;
  margin-right: 15px;
}

.sensor-content {
  flex: 1;
}

.sensor-value {
  font-size: 24px;
  font-weight: bold;
  margin-bottom: 5px;
}

.sensor-label {
  font-size: 14px;
  opacity: 0.9;
}

.quality-item {
  margin-bottom: 15px;
}

.quality-item label {
  font-weight: bold;
  color: #606266;
  display: block;
  margin-bottom: 8px;
}

.range-checks {
  display: flex;
  flex-wrap: wrap;
  gap: 8px;
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