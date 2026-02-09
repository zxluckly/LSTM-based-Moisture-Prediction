package com.ruoyi.web.controller.soil;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletResponse;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.soil.domain.SoilPrediction;
import com.ruoyi.soil.service.ISoilPredictionService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 土壤墒情预测Controller
 * 
 * @author ruoyi
 * @date 2024-01-19
 */
@RestController
@RequestMapping("/soil/prediction")
public class SoilPredictionController extends BaseController
{
    @Autowired
    private ISoilPredictionService soilPredictionService;

    /**
     * 查询土壤墒情预测列表
     */
    @PreAuthorize("@ss.hasPermi('soil:prediction:list')")
    @GetMapping("/list")
    public TableDataInfo list(SoilPrediction soilPrediction)
    {
        startPage();
        List<SoilPrediction> list = soilPredictionService.selectSoilPredictionList(soilPrediction);
        return getDataTable(list);
    }

    /**
     * 导出土壤墒情预测列表
     */
    @PreAuthorize("@ss.hasPermi('soil:prediction:export')")
    @Log(title = "土壤墒情预测", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SoilPrediction soilPrediction)
    {
        List<SoilPrediction> list = soilPredictionService.selectSoilPredictionList(soilPrediction);
        ExcelUtil<SoilPrediction> util = new ExcelUtil<SoilPrediction>(SoilPrediction.class);
        util.exportExcel(response, list, "土壤墒情预测");
    }

    /**
     * 获取土壤墒情预测详细信息
     */
    @PreAuthorize("@ss.hasPermi('soil:prediction:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(soilPredictionService.selectSoilPredictionById(id));
    }

    /**
     * 新增土壤墒情预测
     */
    @PreAuthorize("@ss.hasPermi('soil:prediction:add')")
    @Log(title = "土壤墒情预测", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SoilPrediction soilPrediction)
    {
        return toAjax(soilPredictionService.insertSoilPrediction(soilPrediction));
    }

    /**
     * 修改土壤墒情预测
     */
    @PreAuthorize("@ss.hasPermi('soil:prediction:edit')")
    @Log(title = "土壤墒情预测", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SoilPrediction soilPrediction)
    {
        return toAjax(soilPredictionService.updateSoilPrediction(soilPrediction));
    }

    /**
     * 删除土壤墒情预测
     */
    @PreAuthorize("@ss.hasPermi('soil:prediction:remove')")
    @Log(title = "土壤墒情预测", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(soilPredictionService.deleteSoilPredictionByIds(ids));
    }

    /**
     * 执行LSTM预测
     */
    @PreAuthorize("@ss.hasPermi('soil:prediction:predict')")
    @Log(title = "LSTM预测", businessType = BusinessType.OTHER)
    @PostMapping("/predict/{fieldId}/{predictType}")
    public AjaxResult predict(@PathVariable String fieldId, @PathVariable String predictType)
    {
        try {
            SoilPrediction prediction = soilPredictionService.predictSoilMoisture(fieldId, predictType);
            return success(prediction);
        } catch (Exception e) {
            return error("预测失败: " + e.getMessage());
        }
    }

    /**
     * 批量预测多个地块
     */
    @PreAuthorize("@ss.hasPermi('soil:prediction:predict')")
    @Log(title = "批量LSTM预测", businessType = BusinessType.OTHER)
    @PostMapping("/batch-predict")
    public AjaxResult batchPredict(@RequestBody Map<String, Object> params)
    {
        try {
            @SuppressWarnings("unchecked")
            List<String> fieldIds = (List<String>) params.get("fieldIds");
            String predictType = (String) params.get("predictType");
            
            List<SoilPrediction> predictions = soilPredictionService.batchPredictSoilMoisture(fieldIds, predictType);
            return success(predictions);
        } catch (Exception e) {
            return error("批量预测失败: " + e.getMessage());
        }
    }

    /**
     * 获取预测准确度评估
     */
    @PreAuthorize("@ss.hasPermi('soil:prediction:query')")
    @GetMapping("/accuracy/{fieldId}")
    public AjaxResult getAccuracyEvaluation(@PathVariable String fieldId, @RequestParam(defaultValue = "30") int days)
    {
        Map<String, Object> evaluation = soilPredictionService.evaluatePredictionAccuracy(fieldId, days);
        return success(evaluation);
    }

    /**
     * 获取预测趋势分析
     */
    @PreAuthorize("@ss.hasPermi('soil:prediction:query')")
    @GetMapping("/trend/{fieldId}")
    public AjaxResult getPredictionTrend(@PathVariable String fieldId)
    {
        Map<String, Object> trend = soilPredictionService.getPredictionTrend(fieldId);
        return success(trend);
    }

    /**
     * 获取模型性能监控
     */
    @PreAuthorize("@ss.hasPermi('soil:prediction:query')")
    @GetMapping("/model/performance")
    public AjaxResult getModelPerformance()
    {
        Map<String, Object> metrics = soilPredictionService.getModelPerformanceMetrics();
        return success(metrics);
    }

    /**
     * 执行自动预测任务
     */
    @PreAuthorize("@ss.hasPermi('soil:prediction:predict')")
    @Log(title = "自动预测任务", businessType = BusinessType.OTHER)
    @PostMapping("/auto-predict")
    public AjaxResult executeAutoPrediction()
    {
        Map<String, Object> result = soilPredictionService.executeAutoPrediction();
        return success(result);
    }

    /**
     * 获取预测类型说明
     */
    @GetMapping("/predict-types")
    public AjaxResult getPredictTypes()
    {
        Map<String, String> types = new HashMap<>();
        types.put("1", "小时级预测 - 基于最近7天数据预测未来1-24小时");
        types.put("2", "天级预测 - 基于最近30天数据预测未来1-7天");
        types.put("3", "周级预测 - 基于最近90天数据预测未来1-4周");
        return success(types);
    }
}