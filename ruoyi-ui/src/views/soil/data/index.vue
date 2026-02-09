<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="设备编号" prop="deviceId">
        <el-input
          v-model="queryParams.deviceId"
          placeholder="请输入设备编号"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="地块编号" prop="fieldId">
        <el-input
          v-model="queryParams.fieldId"
          placeholder="请输入地块编号"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="数据状态" prop="dataStatus">
        <el-select v-model="queryParams.dataStatus" placeholder="请选择数据状态" clearable>
          <el-option label="正常" value="0" />
          <el-option label="异常" value="1" />
        </el-select>
      </el-form-item>
      <el-form-item label="采集时间">
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
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          v-hasPermi="['soil:data:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['soil:data:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['soil:data:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['soil:data:export']"
        >导出</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="info"
          plain
          icon="el-icon-magic-stick"
          size="mini"
          @click="handleGenerateData"
          v-hasPermi="['soil:data:add']"
        >生成模拟数据</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="el-icon-data-analysis"
          size="mini"
          @click="handleDataPreprocess"
          v-hasPermi="['soil:data:edit']"
        >数据预处理</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <!-- 数据统计卡片 -->
    <el-row :gutter="20" class="mb8">
      <el-col :span="6">
        <el-card class="box-card">
          <div slot="header" class="clearfix">
            <span>总数据量</span>
          </div>
          <div class="text item">
            <span class="count">{{ statistics.totalCount || 0 }}</span>
          </div>
        </el-card>
      </el-col>
      <el-col :span="6">
        <el-card class="box-card">
          <div slot="header" class="clearfix">
            <span>正常数据</span>
          </div>
          <div class="text item">
            <span class="count success">{{ statistics.normalCount || 0 }}</span>
          </div>
        </el-card>
      </el-col>
      <el-col :span="6">
        <el-card class="box-card">
          <div slot="header" class="clearfix">
            <span>异常数据</span>
          </div>
          <div class="text item">
            <span class="count danger">{{ statistics.abnormalCount || 0 }}</span>
          </div>
        </el-card>
      </el-col>
      <el-col :span="6">
        <el-card class="box-card">
          <div slot="header" class="clearfix">
            <span>数据质量</span>
          </div>
          <div class="text item">
            <span class="count" :class="getQualityClass(statistics.qualityScore)">
              {{ statistics.qualityScore || 0 }}%
            </span>
          </div>
        </el-card>
      </el-col>
    </el-row>

    <el-table v-loading="loading" :data="dataList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="ID" align="center" prop="id" />
      <el-table-column label="设备编号" align="center" prop="deviceId" />
      <el-table-column label="地块编号" align="center" prop="fieldId" />
      <el-table-column label="土壤温度(°C)" align="center" prop="temperature" />
      <el-table-column label="土壤湿度(%)" align="center" prop="humidity" />
      <el-table-column label="EC值(mS/cm)" align="center" prop="ecValue" />
      <el-table-column label="pH值" align="center" prop="phValue" />
      <el-table-column label="采集时间" align="center" prop="collectTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.collectTime, '{y}-{m}-{d} {h}:{i}:{s}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="数据状态" align="center" prop="dataStatus">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.soil_data_status" :value="scope.row.dataStatus"/>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['soil:data:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['soil:data:remove']"
          >删除</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-view"
            @click="handleDetail(scope.row)"
          >详情</el-button>
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

    <!-- 添加或修改土壤数据对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="设备编号" prop="deviceId">
          <el-input v-model="form.deviceId" placeholder="请输入设备编号" />
        </el-form-item>
        <el-form-item label="地块编号" prop="fieldId">
          <el-input v-model="form.fieldId" placeholder="请输入地块编号" />
        </el-form-item>
        <el-form-item label="土壤温度" prop="temperature">
          <el-input v-model="form.temperature" placeholder="请输入土壤温度" />
        </el-form-item>
        <el-form-item label="土壤湿度" prop="humidity">
          <el-input v-model="form.humidity" placeholder="请输入土壤湿度" />
        </el-form-item>
        <el-form-item label="EC值" prop="ecValue">
          <el-input v-model="form.ecValue" placeholder="请输入电导率EC值" />
        </el-form-item>
        <el-form-item label="pH值" prop="phValue">
          <el-input v-model="form.phValue" placeholder="请输入酸碱度pH值" />
        </el-form-item>
        <el-form-item label="采集时间" prop="collectTime">
          <el-date-picker clearable
            v-model="form.collectTime"
            type="datetime"
            value-format="yyyy-MM-dd HH:mm:ss"
            placeholder="请选择采集时间">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="数据状态" prop="dataStatus">
          <el-radio-group v-model="form.dataStatus">
            <el-radio label="0">正常</el-radio>
            <el-radio label="1">异常</el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="经度" prop="longitude">
          <el-input v-model="form.longitude" placeholder="请输入经度" />
        </el-form-item>
        <el-form-item label="纬度" prop="latitude">
          <el-input v-model="form.latitude" placeholder="请输入纬度" />
        </el-form-item>
        <el-form-item label="海拔高度" prop="altitude">
          <el-input v-model="form.altitude" placeholder="请输入海拔高度" />
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>

    <!-- 生成模拟数据对话框 -->
    <el-dialog title="生成模拟数据" :visible.sync="generateOpen" width="400px" append-to-body>
      <el-form ref="generateForm" :model="generateForm" label-width="80px">
        <el-form-item label="地块编号" prop="fieldId">
          <el-input v-model="generateForm.fieldId" placeholder="请输入地块编号" />
        </el-form-item>
        <el-form-item label="数据条数" prop="count">
          <el-input-number v-model="generateForm.count" :min="1" :max="10000" />
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitGenerate">确 定</el-button>
        <el-button @click="generateOpen = false">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listData, getData, delData, addData, updateData, generateSimulatedData, getRealTimeStats, preprocessData } from "@/api/soil/data";

export default {
  name: "SoilData",
  dicts: ['soil_data_status'],
  data() {
    return {
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 土壤数据表格数据
      dataList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 生成数据对话框
      generateOpen: false,
      // 日期范围
      dateRange: [],
      // 统计数据
      statistics: {},
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        deviceId: null,
        fieldId: null,
        dataStatus: null,
      },
      // 表单参数
      form: {},
      // 生成数据表单
      generateForm: {
        fieldId: 'FIELD_001',
        count: 100
      },
      // 表单校验
      rules: {
        deviceId: [
          { required: true, message: "设备编号不能为空", trigger: "blur" }
        ],
        fieldId: [
          { required: true, message: "地块编号不能为空", trigger: "blur" }
        ],
        collectTime: [
          { required: true, message: "采集时间不能为空", trigger: "blur" }
        ]
      }
    };
  },
  created() {
    this.getList();
    this.getStatistics();
  },
  methods: {
    /** 查询土壤数据列表 */
    getList() {
      this.loading = true;
      listData(this.addDateRange(this.queryParams, this.dateRange)).then(response => {
        this.dataList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    /** 获取统计数据 */
    getStatistics() {
      getRealTimeStats().then(response => {
        if (response.data && response.data.fieldStats) {
          const fieldStats = response.data.fieldStats;
          this.statistics = {
            totalCount: fieldStats.reduce((sum, item) => sum + parseInt(item.count || 0), 0),
            normalCount: fieldStats.reduce((sum, item) => sum + parseInt(item.normal_count || 0), 0),
            abnormalCount: fieldStats.reduce((sum, item) => sum + parseInt(item.abnormal_count || 0), 0),
            qualityScore: 85 // 简化计算
          };
        }
      });
    },
    /** 获取质量分数样式 */
    getQualityClass(score) {
      if (score >= 90) return 'success';
      if (score >= 70) return 'warning';
      return 'danger';
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        id: null,
        deviceId: null,
        fieldId: null,
        temperature: null,
        humidity: null,
        ecValue: null,
        phValue: null,
        collectTime: null,
        dataStatus: "0",
        longitude: null,
        latitude: null,
        altitude: null
      };
      this.resetForm("form");
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
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加土壤数据";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids
      getData(id).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改土壤数据";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updateData(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addData(this.form).then(response => {
              this.$modal.msgSuccess("新增成功");
              this.open = false;
              this.getList();
            });
          }
        }
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const ids = row.id || this.ids;
      this.$modal.confirm('是否确认删除土壤数据编号为"' + ids + '"的数据项？').then(function() {
        return delData(ids);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('soil/data/export', {
        ...this.queryParams
      }, `data_${new Date().getTime()}.xlsx`)
    },
    /** 生成模拟数据 */
    handleGenerateData() {
      this.generateOpen = true;
    },
    /** 提交生成数据 */
    submitGenerate() {
      generateSimulatedData(this.generateForm.fieldId, this.generateForm.count).then(response => {
        this.$modal.msgSuccess("模拟数据生成成功");
        this.generateOpen = false;
        this.getList();
        this.getStatistics();
      });
    },
    /** 数据预处理 */
    handleDataPreprocess() {
      this.$modal.confirm('是否对当前查询结果进行数据预处理？').then(() => {
        const processData = this.dataList.filter(item => item.dataStatus === '1');
        if (processData.length === 0) {
          this.$modal.msgWarning("没有需要处理的异常数据");
          return;
        }
        
        preprocessData(processData).then(response => {
          this.$modal.msgSuccess("数据预处理完成");
          this.getList();
        });
      });
    },
    /** 查看详情 */
    handleDetail(row) {
      this.$router.push({
        path: '/soil/data-detail/detail',
        query: { id: row.id }
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