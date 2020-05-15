package com.jeecg.charge.controller;
import com.jeecg.charge.entity.SubcontractChargeEntity;
import com.jeecg.charge.service.SubcontractChargeServiceI;

import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;

import org.jeecgframework.core.common.controller.BaseController;
import org.jeecgframework.core.common.exception.BusinessException;
import org.jeecgframework.core.common.hibernate.qbc.CriteriaQuery;
import org.jeecgframework.core.common.model.json.AjaxJson;
import org.jeecgframework.core.common.model.json.DataGrid;
import org.jeecgframework.core.constant.Globals;
import org.jeecgframework.core.util.StringUtil;
import org.jeecgframework.tag.core.easyui.TagUtil;
import org.jeecgframework.web.system.service.SystemService;
import org.jeecgframework.core.util.MyBeanUtils;

import java.io.OutputStream;
import org.jeecgframework.poi.excel.ExcelExportUtil;
import org.jeecgframework.poi.excel.ExcelImportUtil;
import org.jeecgframework.poi.excel.entity.ExportParams;
import org.jeecgframework.poi.excel.entity.ImportParams;
import org.jeecgframework.poi.excel.entity.vo.NormalExcelConstants;
import org.jeecgframework.core.util.ResourceUtil;
import java.io.IOException;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import java.util.Map;
import java.util.HashMap;
import org.jeecgframework.core.util.ExceptionUtil;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**   
 * @Title: Controller  
 * @Description: 挂账记录表
 * @author onlineGenerator
 * @date 2019-10-04 12:28:12
 * @version V1.0   
 *
 */
@Controller
@RequestMapping("/subcontractChargeController")
public class SubcontractChargeController extends BaseController {
	private static final Logger logger = LoggerFactory.getLogger(SubcontractChargeController.class);

	@Autowired
	private SubcontractChargeServiceI subcontractChargeService;
	@Autowired
	private SystemService systemService;
	

	/**
	 * 挂账记录表列表 页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "list")
	public ModelAndView list(HttpServletRequest request) {
		return new ModelAndView("com/jeecg/charge/subcontractChargeList");
	}

	/**
	 * easyui AJAX请求数据
	 * 
	 * @param request
	 * @param response
	 * @param dataGrid
	 * @param user
	 */

	@RequestMapping(params = "datagrid")
	public void datagrid(SubcontractChargeEntity subcontractCharge,HttpServletRequest request, HttpServletResponse response, DataGrid dataGrid) {
		CriteriaQuery cq = new CriteriaQuery(SubcontractChargeEntity.class, dataGrid);
		//查询条件组装器
		org.jeecgframework.core.extend.hqlsearch.HqlGenerateUtil.installHql(cq, subcontractCharge, request.getParameterMap());
		try{
		//自定义追加查询条件
		
		}catch (Exception e) {
			throw new BusinessException(e.getMessage());
		}
		cq.add();
		this.subcontractChargeService.getDataGridReturn(cq, true);
		TagUtil.datagrid(response, dataGrid);
	}
	
	/**
	 * 删除挂账记录表
	 * 
	 * @return
	 */
	@RequestMapping(params = "doDel")
	@ResponseBody
	public AjaxJson doDel(SubcontractChargeEntity subcontractCharge, HttpServletRequest request) {
		String message = null;
		AjaxJson j = new AjaxJson();
		subcontractCharge = systemService.getEntity(SubcontractChargeEntity.class, subcontractCharge.getId());
		message = "挂账记录表删除成功";
		try{
			subcontractChargeService.delete(subcontractCharge);
			systemService.addLog(message, Globals.Log_Type_DEL, Globals.Log_Leavel_INFO);
		}catch(Exception e){
			e.printStackTrace();
			message = "挂账记录表删除失败";
			throw new BusinessException(e.getMessage());
		}
		j.setMsg(message);
		return j;
	}
	
	/**
	 * 批量删除挂账记录表
	 * 
	 * @return
	 */
	 @RequestMapping(params = "doBatchDel")
	@ResponseBody
	public AjaxJson doBatchDel(String ids,HttpServletRequest request){
		String message = null;
		AjaxJson j = new AjaxJson();
		message = "挂账记录表删除成功";
		try{
			for(String id:ids.split(",")){
				SubcontractChargeEntity subcontractCharge = systemService.getEntity(SubcontractChargeEntity.class, 
				id
				);
				subcontractChargeService.delete(subcontractCharge);
				systemService.addLog(message, Globals.Log_Type_DEL, Globals.Log_Leavel_INFO);
			}
		}catch(Exception e){
			e.printStackTrace();
			message = "挂账记录表删除失败";
			throw new BusinessException(e.getMessage());
		}
		j.setMsg(message);
		return j;
	}


	/**
	 * 添加挂账记录表
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping(params = "doAdd")
	@ResponseBody
	public AjaxJson doAdd(SubcontractChargeEntity subcontractCharge, HttpServletRequest request) {
		String message = null;
		AjaxJson j = new AjaxJson();
		message = "挂账记录表添加成功";
		try{
			subcontractChargeService.save(subcontractCharge);
			systemService.addLog(message, Globals.Log_Type_INSERT, Globals.Log_Leavel_INFO);
		}catch(Exception e){
			e.printStackTrace();
			message = "挂账记录表添加失败";
			throw new BusinessException(e.getMessage());
		}
		j.setMsg(message);
		return j;
	}
	
	/**
	 * 更新挂账记录表
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping(params = "doUpdate")
	@ResponseBody
	public AjaxJson doUpdate(SubcontractChargeEntity subcontractCharge, HttpServletRequest request) {
		String message = null;
		AjaxJson j = new AjaxJson();
		message = "挂账记录表更新成功";
		SubcontractChargeEntity t = subcontractChargeService.get(SubcontractChargeEntity.class, subcontractCharge.getId());
		try {
			MyBeanUtils.copyBeanNotNull2Bean(subcontractCharge, t);
			subcontractChargeService.saveOrUpdate(t);
			systemService.addLog(message, Globals.Log_Type_UPDATE, Globals.Log_Leavel_INFO);
		} catch (Exception e) {
			e.printStackTrace();
			message = "挂账记录表更新失败";
			throw new BusinessException(e.getMessage());
		}
		j.setMsg(message);
		return j;
	}
	

	/**
	 * 挂账记录表新增页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "goAdd")
	public ModelAndView goAdd(SubcontractChargeEntity subcontractCharge, HttpServletRequest req) {
		if (StringUtil.isNotEmpty(subcontractCharge.getId())) {
			subcontractCharge = subcontractChargeService.getEntity(SubcontractChargeEntity.class, subcontractCharge.getId());
			req.setAttribute("subcontractCharge", subcontractCharge);
		}
		return new ModelAndView("com/jeecg/charge/subcontractCharge-add");
	}
	/**
	 * 挂账记录表编辑页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "goUpdate")
	public ModelAndView goUpdate(SubcontractChargeEntity subcontractCharge, HttpServletRequest req) {
		if (StringUtil.isNotEmpty(subcontractCharge.getId())) {
			subcontractCharge = subcontractChargeService.getEntity(SubcontractChargeEntity.class, subcontractCharge.getId());
			req.setAttribute("subcontractCharge", subcontractCharge);
		}
		return new ModelAndView("com/jeecg/charge/subcontractCharge-update");
	}
	
	/**
	 * 导入功能跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "upload")
	public ModelAndView upload(HttpServletRequest req) {
		req.setAttribute("controller_name","subcontractChargeController");
		return new ModelAndView("common/upload/pub_excel_upload");
	}
	
	/**
	 * 导出excel
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(params = "exportXls")
	public String exportXls(SubcontractChargeEntity subcontractCharge,HttpServletRequest request,HttpServletResponse response
			, DataGrid dataGrid,ModelMap modelMap) {
		CriteriaQuery cq = new CriteriaQuery(SubcontractChargeEntity.class, dataGrid);
		org.jeecgframework.core.extend.hqlsearch.HqlGenerateUtil.installHql(cq, subcontractCharge, request.getParameterMap());
		List<SubcontractChargeEntity> subcontractCharges = this.subcontractChargeService.getListByCriteriaQuery(cq,false);
		modelMap.put(NormalExcelConstants.FILE_NAME,"挂账记录表");
		modelMap.put(NormalExcelConstants.CLASS,SubcontractChargeEntity.class);
		modelMap.put(NormalExcelConstants.PARAMS,new ExportParams("挂账记录表列表", "导出人:"+ResourceUtil.getSessionUser().getRealName(),
			"导出信息"));
		modelMap.put(NormalExcelConstants.DATA_LIST,subcontractCharges);
		return NormalExcelConstants.JEECG_EXCEL_VIEW;
	}
	/**
	 * 导出excel 使模板
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(params = "exportXlsByT")
	public String exportXlsByT(SubcontractChargeEntity subcontractCharge,HttpServletRequest request,HttpServletResponse response
			, DataGrid dataGrid,ModelMap modelMap) {
    	modelMap.put(NormalExcelConstants.FILE_NAME,"挂账记录表");
    	modelMap.put(NormalExcelConstants.CLASS,SubcontractChargeEntity.class);
    	modelMap.put(NormalExcelConstants.PARAMS,new ExportParams("挂账记录表列表", "导出人:"+ResourceUtil.getSessionUser().getRealName(),
    	"导出信息"));
    	modelMap.put(NormalExcelConstants.DATA_LIST,new ArrayList());
    	return NormalExcelConstants.JEECG_EXCEL_VIEW;
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(params = "importExcel", method = RequestMethod.POST)
	@ResponseBody
	public AjaxJson importExcel(HttpServletRequest request, HttpServletResponse response) {
		AjaxJson j = new AjaxJson();
		
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		Map<String, MultipartFile> fileMap = multipartRequest.getFileMap();
		for (Map.Entry<String, MultipartFile> entity : fileMap.entrySet()) {
			MultipartFile file = entity.getValue();// 获取上传文件对象
			ImportParams params = new ImportParams();
			params.setTitleRows(2);
			params.setHeadRows(1);
			params.setNeedSave(true);
			try {
				List<SubcontractChargeEntity> listSubcontractChargeEntitys = ExcelImportUtil.importExcel(file.getInputStream(),SubcontractChargeEntity.class,params);
				for (SubcontractChargeEntity subcontractCharge : listSubcontractChargeEntitys) {
					subcontractChargeService.save(subcontractCharge);
				}
				j.setMsg("文件导入成功！");
			} catch (Exception e) {
				j.setMsg("文件导入失败！");
				logger.error(ExceptionUtil.getExceptionMessage(e));
			}finally{
				try {
					file.getInputStream().close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		return j;
	}
	
	
}
