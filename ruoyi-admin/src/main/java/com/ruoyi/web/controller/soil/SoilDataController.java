package com.ruoyi.web.controller.soil;

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
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.soil.domain.SoilData;
import com.ruoyi.soil.service.ISoilDataService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 土壤数据Controller
 * 
 * @author ruoyi
 * @date 2024-01-19
 */
@RestController
@RequestMapping("/soil/data")
public class SoilDataController extends BaseController
{
    @Autowired
    private ISoilDataService soilDataService;

    /**
     * 查询土壤数据列表
     */
    @PreAuthorize("@ss.hasPermi('soil:data:list')")
    @GetMapping("/list")
    public TableDataInfo list(SoilData soilData)
    {
        startPage();
        List<SoilData> list = soilDataService.selectSoilDataList(soilData);
        return getDataTable(list);
    }

    /**
     * 导出土壤数据列表
     */
    @PreAuthorize("@ss.hasPermi('soil:data:export')")
    @Log(title = "土壤数据", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SoilData soilData)
    {
        List<SoilData> list = soilDataService.selectSoilDataList(soilData);
        ExcelUtil<SoilData> util = new ExcelUtil<SoilData>(SoilData.class);
        util.exportExcel(response, list, "土壤数据");
    }

    /**
     * 获取土壤数据详细信息
     */
    @PreAuthorize("@ss.hasPermi('soil:data:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(soilDataService.selectSoilDataById(id));
    }

    /**
     * 新增土壤数据
     */
    @PreAuthorize("@ss.hasPermi('soil:data:add')")
    @Log(title = "土壤数据", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SoilData soilData)
    {
        return toAjax(soilDataService.insertSoilData(soilData));
    }

    /**
     * 修改土壤数据
     */
    @PreAuthorize("@ss.hasPermi('soil:data:edit')")
    @Log(title = "土壤数据", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SoilData soilData)
    {
        return toAjax(soilDataService.updateSoilData(soilData));
    }

    /**
     * 删除土壤数据
     */
    @PreAuthorize("@ss.hasPermi('soil:data:remove')")
    @Log(title = "土壤数据", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(soilDataService.deleteSoilDataByIds(ids));
    }

    /**
     * 获取历史数据用于LSTM训练
     */
    @PreAuthorize("@ss.hasPermi('soil:data:query')")
    @GetMapping("/history/{fieldId}/{days}")
    public AjaxResult getHistoryData(@PathVariable String fieldId, @PathVariable int days)
    {
        List<SoilData> historyData = soilDataService.getHistoryDataForTraining(fieldId, days);
        return success(historyData);
    }

    /**
     * 生成模拟数据
     */
    @PreAuthorize("@ss.hasPermi('soil:data:add')")
    @Log(title = "生成模拟数据", businessType = BusinessType.INSERT)
    @PostMapping("/simulate/{fieldId}/{count}")
    public AjaxResult generateSimulatedData(@PathVariable String fieldId, @PathVariable int count)
    {
        List<SoilData> simulatedData = soilDataService.generateSimulatedData(fieldId, count);
        Map<String, Object> result = soilDataService.importSoilData(simulatedData);
        return success(result);
    }

    /**
     * 获取实时数据统计
     */
    @PreAuthorize("@ss.hasPermi('soil:data:query')")
    @GetMapping("/stats/realtime")
    public AjaxResult getRealTimeStats()
    {
        Map<String, Object> stats = soilDataService.getRealTimeStats();
        return success(stats);
    }

    /**
     * 获取数据质量报告
     */
    @PreAuthorize("@ss.hasPermi('soil:data:query')")
    @GetMapping("/quality/{fieldId}")
    public AjaxResult getDataQualityReport(@PathVariable String fieldId)
    {
        Map<String, Object> report = soilDataService.getDataQualityReport(fieldId);
        return success(report);
    }

    /**
     * 数据预处理
     */
    @PreAuthorize("@ss.hasPermi('soil:data:edit')")
    @Log(title = "数据预处理", businessType = BusinessType.UPDATE)
    @PostMapping("/preprocess")
    public AjaxResult preprocessData(@RequestBody List<SoilData> soilDataList)
    {
        List<SoilData> processedData = soilDataService.preprocessData(soilDataList);
        return success(processedData);
    }

    /**
     * 数据归一化
     */
    @PreAuthorize("@ss.hasPermi('soil:data:edit')")
    @Log(title = "数据归一化", businessType = BusinessType.UPDATE)
    @PostMapping("/normalize")
    public AjaxResult normalizeData(@RequestBody List<SoilData> soilDataList)
    {
        List<SoilData> normalizedData = soilDataService.normalizeData(soilDataList);
        return success(normalizedData);
    }

    /**
     * 批量导入土壤数据
     */
    @PreAuthorize("@ss.hasPermi('soil:data:import')")
    @Log(title = "批量导入土壤数据", businessType = BusinessType.IMPORT)
    @PostMapping("/import")
    public AjaxResult importData(@RequestBody List<SoilData> soilDataList)
    {
        Map<String, Object> result = soilDataService.importSoilData(soilDataList);
        return success(result);
    }
}