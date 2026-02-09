<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="地块编号" prop="fieldId">
        <el-input
          v-model="queryParams.fieldId"
          placeholder="请输入地块编号"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="预测类型" prop="predictType">
        <el-select v-model="queryParams.predictType" placeholder="请选择预测类型" clearable>
          <el-option label="小时级预测" value="1" />
          <el-option label="天级预测" value="2" />
          <el-option label="周级预测" value="3" />
        </el-select>
      </el-form-item>
      <el-form-item label="模型版本" prop="modelVersion">
        <el-input
          v-model="queryParams.modelVersion"
          placeholder="请输入模型版本"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="预测时间">
        <el-date-picker
          v-model="dateRange"
          style="width: 240px"
          value-format="yyyy-MM-dd"
          type="daterange"
          range-separator="-"
          start-placeholder="开始日期"
          end-placeholder="结束日期"
        ></el-date-picker>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="el-icon-magic-stick"
          size="mini"
          @click="handlePredict"
          v-hasPermi="['soil:prediction:predict']"
        >执行预测</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="el-icon-data-analysis"
          size="mini"
          @click="handleBatchPredict"
          v-hasPermi="['soil:prediction:predict']"
        >批量预测</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="info"
          plain
          icon="el-icon-monitor"
          size="mini"
          @click="handleModelPerformance"
          v-hasPermi="['soil:prediction:query']"
        >模型性能</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['soil:prediction:export']"
        >导出</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['soil:prediction:remove']"
        >删除</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <!-- 预测性能指标卡片 -->
    <el-row :gutter="20" class="mb8">
      <el-col :span="6">
        <el-card class="box-card">
          <div slot="header" class="clearfix">
            <span>平均准确度</span>
          </div>
          <div class="text item">
            <span class="count" :class="getAccuracyClass(performance.averageAccuracy)">
              {{ performance.averageAccuracy || 0 }}%
            </span>
          </div>
        </el-card>
      </el-col>
      <el-col :span="6">
        <el-card class="box-card">
          <div slot="header" class="clearfix">
            <span>RMSE误差</span>
          </div>
          <div class="text item">
            <span class="count">{{ performance.averageRMSE || 0 }}</span>
          </div>
        </el-card>
      </el-col>
      <el-col :span="6">
        <el-card class="box-card">
          <div slot="header" class="clearfix">
            <span>MAE误差</span>
          </div>
          <div class="text item">
            <span class="count">{{ performance.averageMAE || 0 }}</span>
          </div>
        </el-card>
      </el-col>
      <el-col :span="6">
        <el-card class="box-card">
          <div slot="header" class="clearfix">
            <span>预测总数</span>
          </div>
          <div class="text item">
            <span class="count">{{ performance.totalPredictions || 0 }}</span>
          </div>
        </el-card>
      </el-col>
    </el-row>

    <el-table v-loading="loading" :data="predictionList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="ID" align="center" prop="id" />
      <el-table-column label="地块编号" align="center" prop="fieldId" />
      <el-table-column label="预测时间" align="center" prop="predictTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.predictTime, '{y}-{m}-{d} {h}:{i}:{s}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="预测湿度(%)" align="center" prop="predictedHumidity" />
      <el-table-column label="预测温度(°C)" align="center" prop="predictedTemperature" />
      <el-table-column label="预测EC值" align="center" prop="predictedEcValue" />
      <el-table-column label="预测pH值" align="center" prop="predictedPhValue" />
      <el-table-column label="准确度(%)" align="center" prop="accuracy">
        <template slot-scope="scope">
          <el-tag :type="getAccuracyTagType(scope.row.accuracy)">
            {{ scope.row.accuracy }}%
          </el-tag>
        </template>
      </el-table-column>
      <el-table-column label="预测类型" align="center" prop="predictType">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.soil_predict_type" :value="scope.row.predictType"/>
        </template>
      </el-table-column>
      <el-table-column label="模型版本" align="center" prop="modelVersion" />
      <el-table-column label="置信度(%)" align="center" prop="confidence" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-view"
            @click="handleDetail(scope.row)"
          >详情</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-data-line"
            @click="handleTrend(scope.row)"
          >趋势</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['soil:prediction:remove']"
          >删除</el-button>
        </template>
      </el-table-column>
    </el-table>
    
    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 执行预测对话框 -->
    <el-dialog title="执行LSTM预测" :visible.sync="predictOpen" width="500px" append-to-body>
      <el-form ref="predictForm" :model="predictForm" :rules="predictRules" label-width="100px">
        <el-form-item label="地块编号" prop="fieldId">
          <el-select v-model="predictForm.fieldId" placeholder="请选择地块编号" style="width: 100%">
            <el-option label="FIELD_001" value="FIELD_001" />
            <el-option label="FIELD_002" value="FIELD_002" />
            <el-option label="FIELD_003" value="FIELD_003" />
          </el-select>
        </el-form-item>
        <el-form-item label="预测类型" prop="predictType">
          <el-select v-model="predictForm.predictType" placeholder="请选择预测类型" style="width: 100%">
            <el-option label="小时级预测" value="1" />
            <el-option label="天级预测" value="2" />
            <el-option label="周级预测" value="3" />
          </el-select>
        </el-form-item>
        <el-alert
          title="预测说明"
          type="info"
          :closable="false"
          show-icon>
          <div slot="default">
            <p>• 小时级预测：基于最近7天数据预测未来1-24小时</p>
            <p>• 天级预测：基于最近30天数据预测未来1-7天</p>
            <p>• 周级预测：基于最近90天数据预测未来1-4周</p>
          </div>
        </el-alert>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitPredict" :loading="predictLoading">执行预测</el-button>
        <el-button @click="predictOpen = false">取 消</el-button>
      </div>
    </el-dialog>

    <!-- 批量预测对话框 -->
    <el-dialog title="批量预测" :visible.sync="batchPredictOpen" width="500px" append-to-body>
      <el-form ref="batchPredictForm" :model="batchPredictForm" label-width="100px">
        <el-form-item label="地块列表" prop="fieldIds">
          <el-checkbox-group v-model="batchPredictForm.fieldIds">
            <el-checkbox label="FIELD_001">东区试验田A</el-checkbox>
            <el-checkbox label="FIELD_002">西区试验田B</el-checkbox>
            <el-checkbox label="FIELD_003">南区试验田C</el-checkbox>
          </el-checkbox-group>
        </el-form-item>
        <el-form-item label="预测类型" prop="predictType">
          <el-select v-model="batchPredictForm.predictType" placeholder="请选择预测类型" style="width: 100%">
            <el-option label="小时级预测" value="1" />
            <el-option label="天级预测" value="2" />
            <el-option label="周级预测" value="3" />
          </el-select>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitBatchPredict" :loading="batchPredictLoading">批量预测</el-button>
        <el-button @click="batchPredictOpen = false">取 消</el-button>
      </div>
    </el-dialog>

    <!-- 模型性能对话框 -->
    <el-dialog title="模型性能监控" :visible.sync="performanceOpen" width="800px" append-to-body>
      <el-row :gutter="20">
        <el-col :span="12">
          <el-card>
            <div slot="header">整体性能指标</div>
            <el-descriptions :column="1" border>
              <el-descriptions-item label="整体准确度">{{ modelMetrics.overallAccuracy || 0 }}%</el-descriptions-item>
              <el-descriptions-item label="整体RMSE">{{ modelMetrics.overallRMSE || 0 }}</el-descriptions-item>
              <el-descriptions-item label="整体MAE">{{ modelMetrics.overallMAE || 0 }}</el-descriptions-item>
              <el-descriptions-item label="模型健康状态">
                <el-tag :type="getHealthTagType(modelMetrics.modelHealth)">
                  {{ modelMetrics.modelHealth || '未知' }}
                </el-tag>
              </el-descriptions-item>
            </el-descriptions>
          </el-card>
        </el-col>
        <el-col :span="12">
          <el-card>
            <div slot="header">分类性能统计</div>
            <el-table :data="modelMetrics.accuracyStats || []" size="small">
              <el-table-column prop="predict_type" label="预测类型">
                <template slot-scope="scope">
                  <dict-tag :options="dict.type.soil_predict_type" :value="scope.row.predict_type"/>
                </template>
              </el-table-column>
              <el-table-column prop="avg_accuracy" label="平均准确度" />
              <el-table-column prop="prediction_count" label="预测次数" />
            </el-table>
          </el-card>
        </el-col>
      </el-row>
    </el-dialog>
  </div>
</template>

<script>
import { 
  listPrediction, 
  getPrediction, 
  delPrediction, 
  predict, 
  batchPredict, 
  getModelPerformance,
  getPredictionTrend 
} from "@/api/soil/prediction";

export default {
  name: "SoilPrediction",
  dicts: ['soil_predict_type'],
  data() {
    return {
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 土壤墒情预测表格数据
      predictionList: [],
      // 日期范围
      dateRange: [],
      // 性能指标
      performance: {},
      // 模型指标
      modelMetrics: {},
      // 对话框
      predictOpen: false,
      batchPredictOpen: false,
      performanceOpen: false,
      // 加载状态
      predictLoading: false,
      batchPredictLoading: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        fieldId: null,
        predictType: null,
        modelVersion: null,
      },
      // 预测表单
      predictForm: {
        fieldId: null,
        predictType: null
      },
      // 批量预测表单
      batchPredictForm: {
        fieldIds: [],
        predictType: null
      },
      // 表单校验
      predictRules: {
        fieldId: [
          { required: true, message: "地块编号不能为空", trigger: "change" }
        ],
        predictType: [
          { required: true, message: "预测类型不能为空", trigger: "change" }
        ]
      }
    };
  },
  created() {
    this.getList();
    this.getPerformanceStats();
  },
  methods: {
    /** 查询土壤墒情预测列表 */
    getList() {
      this.loading = true;
      listPrediction(this.addDateRange(this.queryParams, this.dateRange)).then(response => {
        this.predictionList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    /** 获取性能统计 */
    getPerformanceStats() {
      getModelPerformance().then(response => {
        this.performance = response.data || {};
      });
    },
    /** 获取准确度样式 */
    getAccuracyClass(accuracy) {
      if (accuracy >= 90) return 'success';
      if (accuracy >= 80) return 'warning';
      return 'danger';
    },
    /** 获取准确度标签类型 */
    getAccuracyTagType(accuracy) {
      if (accuracy >= 90) return 'success';
      if (accuracy >= 80) return 'warning';
      return 'danger';
    },
    /** 获取健康状态标签类型 */
    getHealthTagType(health) {
      const healthMap = {
        '优秀': 'success',
        '良好': 'success',
        '一般': 'warning',
        '需要优化': 'danger'
      };
      return healthMap[health] || 'info';
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.getList();
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.dateRange = [];
      this.resetForm("queryForm");
      this.handleQuery();
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.id)
      this.multiple = !selection.length
    },
    /** 执行预测 */
    handlePredict() {
      this.predictForm = {
        fieldId: null,
        predictType: null
      };
      this.predictOpen = true;
    },
    /** 提交预测 */
    submitPredict() {
      this.$refs["predictForm"].validate(valid => {
        if (valid) {
          this.predictLoading = true;
          predict(this.predictForm.fieldId, this.predictForm.predictType).then(response => {
            this.$modal.msgSuccess("预测执行成功");
            this.predictOpen = false;
            this.predictLoading = false;
            this.getList();
            this.getPerformanceStats();
          }).catch(() => {
            this.predictLoading = false;
          });
        }
      });
    },
    /** 批量预测 */
    handleBatchPredict() {
      this.batchPredictForm = {
        fieldIds: [],
        predictType: null
      };
      this.batchPredictOpen = true;
    },
    /** 提交批量预测 */
    submitBatchPredict() {
      if (this.batchPredictForm.fieldIds.length === 0) {
        this.$modal.msgError("请选择至少一个地块");
        return;
      }
      if (!this.batchPredictForm.predictType) {
        this.$modal.msgError("请选择预测类型");
        return;
      }
      
      this.batchPredictLoading = true;
      batchPredict(this.batchPredictForm).then(response => {
        this.$modal.msgSuccess(`批量预测完成，成功预测 ${response.data.length} 个地块`);
        this.batchPredictOpen = false;
        this.batchPredictLoading = false;
        this.getList();
        this.getPerformanceStats();
      }).catch(() => {
        this.batchPredictLoading = false;
      });
    },
    /** 模型性能 */
    handleModelPerformance() {
      getModelPerformance().then(response => {
        this.modelMetrics = response.data || {};
        this.performanceOpen = true;
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const ids = row.id || this.ids;
      this.$modal.confirm('是否确认删除土壤墒情预测编号为"' + ids + '"的数据项？').then(function() {
        return delPrediction(ids);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('soil/prediction/export', {
        ...this.queryParams
      }, `prediction_${new Date().getTime()}.xlsx`)
    },
    /** 查看详情 */
    handleDetail(row) {
      this.$router.push({
        path: '/soil/prediction-detail/detail',
        query: { id: row.id }
      });
    },
    /** 查看趋势 */
    handleTrend(row) {
      this.$router.push({
        path: '/soil/prediction-trend/trend',
        query: { fieldId: row.fieldId }
      });
    },
    /** 查看趋势数据 */
    handleTrendData(row) {
      getPredictionTrend(row.fieldId).then(response => {
        this.$router.push({
          path: '/soil/prediction/trend',
          query: { 
            fieldId: row.fieldId,
            data: JSON.stringify(response.data)
          }
        });
      });
    }
  }
};
</script>

<style scoped>
.box-card {
  margin-bottom: 20px;
}

.text {
  font-size: 14px;
}

.item {
  margin-bottom: 18px;
}

.count {
  font-size: 24px;
  font-weight: bold;
}

.count.success {
  color: #67C23A;
}

.count.warning {
  color: #E6A23C;
}

.count.danger {
  color: #F56C6C;
}

.clearfix:before,
.clearfix:after {
  display: table;
  content: "";
}

.clearfix:after {
  clear: both
}
</style>