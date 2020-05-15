package com.jeecg.supplyjy.controller;
import com.jeecg.supply.entity.SubcontractSupplierEntity;
import com.jeecg.supplyjy.entity.SubcontractSupplierInspectionEntity;
import com.jeecg.supplyjy.service.SubcontractSupplierInspectionServiceI;

import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.hibernate.criterion.Restrictions;
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
 * @Description: 检验供应商管理
 * @author onlineGenerator
 * @date 2019-09-15 13:17:10
 * @version V1.0   
 *
 */
@Controller
@RequestMapping("/subcontractSupplierInspectionController")
public class SubcontractSupplierInspectionController extends BaseController {
	private static final Logger logger = LoggerFactory.getLogger(SubcontractSupplierInspectionController.class);

	@Autowired
	private SubcontractSupplierInspectionServiceI subcontractSupplierInspectionService;
	@Autowired
	private SystemService systemService;
	


	/**
	 * 检验供应商管理列表 页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "list")
	public ModelAndView list(HttpServletRequest request) {
		return new ModelAndView("com/jeecg/supplyjy/subcontractSupplierInspectionList");
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
	public void datagrid(SubcontractSupplierInspectionEntity subcontractSupplierInspection,HttpServletRequest request, HttpServletResponse response, DataGrid dataGrid) {
		CriteriaQuery cq = new CriteriaQuery(SubcontractSupplierInspectionEntity.class, dataGrid);
		//查询条件组装器
		org.jeecgframework.core.extend.hqlsearch.HqlGenerateUtil.installHql(cq, subcontractSupplierInspection, request.getParameterMap());
		try{
		//自定义追加查询条件
		
		}catch (Exception e) {
			throw new BusinessException(e.getMessage());
		}
		cq.add();
		this.subcontractSupplierInspectionService.getDataGridReturn(cq, true);
		TagUtil.datagrid(response, dataGrid);
	}
	
	/**
	 * 删除检验供应商管理
	 * 
	 * @return
	 */
	@RequestMapping(params = "doDel")
	@ResponseBody
	public AjaxJson doDel(SubcontractSupplierInspectionEntity subcontractSupplierInspection, HttpServletRequest request) {
		String message = null;
		AjaxJson j = new AjaxJson();
		subcontractSupplierInspection = systemService.getEntity(SubcontractSupplierInspectionEntity.class, subcontractSupplierInspection.getId());
		message = "检验供应商管理删除成功";
		try{
			subcontractSupplierInspectionService.delete(subcontractSupplierInspection);
			systemService.addLog(message, Globals.Log_Type_DEL, Globals.Log_Leavel_INFO);
		}catch(Exception e){
			e.printStackTrace();
			message = "检验供应商管理删除失败";
			throw new BusinessException(e.getMessage());
		}
		j.setMsg(message);
		return j;
	}
	
	/**
	 * 批量删除检验供应商管理
	 * 
	 * @return
	 */
	 @RequestMapping(params = "doBatchDel")
	@ResponseBody
	public AjaxJson doBatchDel(String ids,HttpServletRequest request){
		String message = null;
		AjaxJson j = new AjaxJson();
		message = "检验供应商管理删除成功";
		try{
			for(String id:ids.split(",")){
				SubcontractSupplierInspectionEntity subcontractSupplierInspection = systemService.getEntity(SubcontractSupplierInspectionEntity.class, 
				Integer.parseInt(id)
				);
				subcontractSupplierInspectionService.delete(subcontractSupplierInspection);
				systemService.addLog(message, Globals.Log_Type_DEL, Globals.Log_Leavel_INFO);
			}
		}catch(Exception e){
			e.printStackTrace();
			message = "检验供应商管理删除失败";
			throw new BusinessException(e.getMessage());
		}
		j.setMsg(message);
		return j;
	}


	/**
	 * 添加检验供应商管理
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping(params = "doAdd")
	@ResponseBody
	public AjaxJson doAdd(SubcontractSupplierInspectionEntity subcontractSupplierInspection, HttpServletRequest request) {
		String message = null;
		AjaxJson j = new AjaxJson();
		message = "检验供应商管理添加成功";
		try{
			subcontractSupplierInspectionService.save(subcontractSupplierInspection);
			systemService.addLog(message, Globals.Log_Type_INSERT, Globals.Log_Leavel_INFO);
		}catch(Exception e){
			e.printStackTrace();
			message = "检验供应商管理添加失败";
			throw new BusinessException(e.getMessage());
		}
		j.setMsg(message);
		return j;
	}
	
	/**
	 * 更新检验供应商管理
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping(params = "doUpdate")
	@ResponseBody
	public AjaxJson doUpdate(SubcontractSupplierInspectionEntity subcontractSupplierInspection, HttpServletRequest request) {
		String message = null;
		AjaxJson j = new AjaxJson();
		message = "检验供应商管理更新成功";
		SubcontractSupplierInspectionEntity t = subcontractSupplierInspectionService.get(SubcontractSupplierInspectionEntity.class, subcontractSupplierInspection.getId());
		try {
			MyBeanUtils.copyBeanNotNull2Bean(subcontractSupplierInspection, t);
			subcontractSupplierInspectionService.saveOrUpdate(t);
			systemService.addLog(message, Globals.Log_Type_UPDATE, Globals.Log_Leavel_INFO);
		} catch (Exception e) {
			e.printStackTrace();
			message = "检验供应商管理更新失败";
			throw new BusinessException(e.getMessage());
		}
		j.setMsg(message);
		return j;
	}
	

	/**
	 * 检验供应商管理新增页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "goAdd")
	public ModelAndView goAdd(SubcontractSupplierInspectionEntity subcontractSupplierInspection, HttpServletRequest req) {
		if (StringUtil.isNotEmpty(subcontractSupplierInspection.getId())) {
			subcontractSupplierInspection = subcontractSupplierInspectionService.getEntity(SubcontractSupplierInspectionEntity.class, subcontractSupplierInspection.getId());
			req.setAttribute("subcontractSupplierInspection", subcontractSupplierInspection);
		}
		return new ModelAndView("com/jeecg/supplyjy/subcontractSupplierInspection-add");
	}
	/**
	 * 检验供应商管理编辑页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "goUpdate")
	public ModelAndView goUpdate(SubcontractSupplierInspectionEntity subcontractSupplierInspection, HttpServletRequest req) {
		if (StringUtil.isNotEmpty(subcontractSupplierInspection.getId())) {
			subcontractSupplierInspection = subcontractSupplierInspectionService.getEntity(SubcontractSupplierInspectionEntity.class, subcontractSupplierInspection.getId());
			req.setAttribute("subcontractSupplierInspection", subcontractSupplierInspection);
		}
		return new ModelAndView("com/jeecg/supplyjy/subcontractSupplierInspection-update");
	}
	
	/**
	 * 导入功能跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "upload")
	public ModelAndView upload(HttpServletRequest req) {
		req.setAttribute("controller_name","subcontractSupplierInspectionController");
		return new ModelAndView("common/upload/pub_excel_upload");
	}
	
	/**
	 * 导出excel
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(params = "exportXls")
	public String exportXls(SubcontractSupplierInspectionEntity subcontractSupplierInspection,HttpServletRequest request,HttpServletResponse response
			, DataGrid dataGrid,ModelMap modelMap) {
		CriteriaQuery cq = new CriteriaQuery(SubcontractSupplierInspectionEntity.class, dataGrid);
		org.jeecgframework.core.extend.hqlsearch.HqlGenerateUtil.installHql(cq, subcontractSupplierInspection, request.getParameterMap());
		List<SubcontractSupplierInspectionEntity> subcontractSupplierInspections = this.subcontractSupplierInspectionService.getListByCriteriaQuery(cq,false);
		modelMap.put(NormalExcelConstants.FILE_NAME,"检验供应商管理");
		modelMap.put(NormalExcelConstants.CLASS,SubcontractSupplierInspectionEntity.class);
		modelMap.put(NormalExcelConstants.PARAMS,new ExportParams("检验供应商管理列表", "导出人:"+ResourceUtil.getSessionUser().getRealName(),
			"导出信息"));
		modelMap.put(NormalExcelConstants.DATA_LIST,subcontractSupplierInspections);
		return NormalExcelConstants.JEECG_EXCEL_VIEW;
	}
	/**
	 * 导出excel 使模板
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(params = "exportXlsByT")
	public String exportXlsByT(SubcontractSupplierInspectionEntity subcontractSupplierInspection,HttpServletRequest request,HttpServletResponse response
			, DataGrid dataGrid,ModelMap modelMap) {
    	modelMap.put(NormalExcelConstants.FILE_NAME,"检验供应商管理");
    	modelMap.put(NormalExcelConstants.CLASS,SubcontractSupplierInspectionEntity.class);
    	modelMap.put(NormalExcelConstants.PARAMS,new ExportParams("检验供应商管理列表", "导出人:"+ResourceUtil.getSessionUser().getRealName(),
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
				List<SubcontractSupplierInspectionEntity> listSubcontractSupplierInspectionEntitys = ExcelImportUtil.importExcel(file.getInputStream(),SubcontractSupplierInspectionEntity.class,params);
				for (SubcontractSupplierInspectionEntity subcontractSupplierInspection : listSubcontractSupplierInspectionEntitys) {
					subcontractSupplierInspectionService.save(subcontractSupplierInspection);
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
	
	/**
	 * @param 
	 * @param 
	 * @param request
	 * @return
	 */
	@RequestMapping(params = "getSupplyInfo")
	@ResponseBody
	public AjaxJson getSupplyInfo( HttpServletRequest request,String supplyType) {
		String message = null;
		AjaxJson j = new AjaxJson();
		CriteriaQuery cq = new CriteriaQuery(SubcontractSupplierInspectionEntity.class,new DataGrid());
		SubcontractSupplierInspectionEntity ssle = new SubcontractSupplierInspectionEntity();
		//查询条件组装器
		org.jeecgframework.core.extend.hqlsearch.HqlGenerateUtil.installHql(cq, ssle, request.getParameterMap());
		try{
		//自定义追加查询条件
			cq.add(Restrictions.eq("cpmc", supplyType));
		}catch (Exception e) {  
			throw new BusinessException(e.getMessage());
		}
		List<SubcontractSupplierEntity> list = this.subcontractSupplierInspectionService
				.getListByCriteriaQuery(cq, false);
		j.setObj(list);
		j.setMsg(message);
		return j;
	}
	
	/**
	 * @param 
	 * @param 
	 * @param request
	 * @return
	 */
	@RequestMapping(params = "getSupplyInfoByName")
	@ResponseBody
	public AjaxJson getSupplyInfoByName( HttpServletRequest request,String supplyName) {
		String message = null;
		AjaxJson j = new AjaxJson();
		CriteriaQuery cq = new CriteriaQuery(SubcontractSupplierInspectionEntity.class,new DataGrid());
		SubcontractSupplierInspectionEntity ssle = new SubcontractSupplierInspectionEntity();
		//查询条件组装器
		org.jeecgframework.core.extend.hqlsearch.HqlGenerateUtil.installHql(cq, ssle, request.getParameterMap());
		try{
		//自定义追加查询条件
			cq.add(Restrictions.eq("dwmc", supplyName));
		}catch (Exception e) {  
			throw new BusinessException(e.getMessage());
		}
		List<SubcontractSupplierEntity> list = this.subcontractSupplierInspectionService
				.getListByCriteriaQuery(cq, false);
		j.setObj(list);
		j.setMsg(message);
		return j;
	}
}
