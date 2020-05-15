package com.jeecg.supply.controller;
import com.jeecg.supply.entity.SubcontractSupplierEntity;
import com.jeecg.supply.service.SubcontractSupplierServiceI;
import java.util.ArrayList;
import java.util.List;
import java.text.SimpleDateFormat;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import org.jeecgframework.core.common.controller.BaseController;
import org.jeecgframework.core.common.exception.BusinessException;
import org.jeecgframework.core.common.hibernate.qbc.CriteriaQuery;
import org.jeecgframework.core.common.model.common.TreeChildCount;
import org.jeecgframework.core.common.model.json.AjaxJson;
import org.jeecgframework.core.common.model.json.DataGrid;
import org.jeecgframework.core.constant.Globals;
import org.jeecgframework.core.util.StringUtil;
import org.jeecgframework.tag.core.easyui.TagUtil;
import org.jeecgframework.web.system.pojo.base.TSCategoryEntity;
import org.jeecgframework.web.system.pojo.base.TSDepart;
import org.jeecgframework.web.system.service.SystemService;
import org.jeecgframework.core.util.MyBeanUtils;

import java.io.OutputStream;
import org.jeecgframework.core.util.BrowserUtils;
import org.jeecgframework.poi.excel.ExcelExportUtil;
import org.jeecgframework.poi.excel.ExcelImportUtil;
import org.jeecgframework.poi.excel.entity.ExportParams;
import org.jeecgframework.poi.excel.entity.ImportParams;
import org.jeecgframework.poi.excel.entity.TemplateExportParams;
import org.jeecgframework.poi.excel.entity.vo.NormalExcelConstants;
import org.jeecgframework.poi.excel.entity.vo.TemplateExcelConstants;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.hibernate.criterion.Restrictions;
import org.jeecgframework.core.util.ResourceUtil;
import java.io.IOException;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import java.util.Map;
import java.util.HashMap;
import org.jeecgframework.core.util.ExceptionUtil;


/**   
 * @Title: Controller  
 * @Description: 供应商管理
 * @author onlineGenerator
 * @date 2019-04-06 16:38:23
 * @version V1.0   
 *
 */
@Controller
@RequestMapping("/subcontractSupplierController")
public class SubcontractSupplierController extends BaseController {
	private static final Logger logger = LoggerFactory.getLogger(SubcontractSupplierController.class);

	@Autowired
	private SubcontractSupplierServiceI subcontractSupplierService;
	@Autowired
	private SystemService systemService;
	


	/**
	 * 供应商管理列表 页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "list")
	public ModelAndView list(HttpServletRequest request) {
		return new ModelAndView("com/jeecg/supply/subcontractSupplierList");
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
	public void datagrid(SubcontractSupplierEntity subcontractSupplier,HttpServletRequest request, HttpServletResponse response, DataGrid dataGrid) {
		CriteriaQuery cq = new CriteriaQuery(SubcontractSupplierEntity.class, dataGrid);
		//查询条件组装器
		org.jeecgframework.core.extend.hqlsearch.HqlGenerateUtil.installHql(cq, subcontractSupplier, request.getParameterMap());
		try{
		//自定义追加查询条件
		}catch (Exception e) {  
			throw new BusinessException(e.getMessage());
		}
		cq.add();
		this.subcontractSupplierService.getDataGridReturn(cq, true);
		TagUtil.datagrid(response, dataGrid);
	}
	
	/**
	 * 删除供应商管理
	 * 
	 * @return
	 */
	@RequestMapping(params = "doDel")
	@ResponseBody
	public AjaxJson doDel(SubcontractSupplierEntity subcontractSupplier, HttpServletRequest request) {
		String message = null;
		AjaxJson j = new AjaxJson();
		subcontractSupplier = systemService.getEntity(SubcontractSupplierEntity.class, subcontractSupplier.getId());
		message = "供应商管理删除成功";
		try{
			subcontractSupplierService.delete(subcontractSupplier);
			systemService.addLog(message, Globals.Log_Type_DEL, Globals.Log_Leavel_INFO);
		}catch(Exception e){
			e.printStackTrace();
			message = "供应商管理删除失败";
			throw new BusinessException(e.getMessage());
		}
		j.setMsg(message);
		return j;
	}
	
	/**
	 * 批量删除供应商管理
	 * 
	 * @return
	 */
	 @RequestMapping(params = "doBatchDel")
	@ResponseBody
	public AjaxJson doBatchDel(String ids,HttpServletRequest request){
		String message = null;
		AjaxJson j = new AjaxJson();
		message = "供应商管理删除成功";
		try{
			for(String id:ids.split(",")){
				SubcontractSupplierEntity subcontractSupplier = systemService.getEntity(SubcontractSupplierEntity.class, 
				Integer.parseInt(id)
				);
				subcontractSupplierService.delete(subcontractSupplier);
				systemService.addLog(message, Globals.Log_Type_DEL, Globals.Log_Leavel_INFO);
			}
		}catch(Exception e){
			e.printStackTrace();
			message = "供应商管理删除失败";
			throw new BusinessException(e.getMessage());
		}
		j.setMsg(message);
		return j;
	}


	/**
	 * 添加供应商管理
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping(params = "doAdd")
	@ResponseBody
	public AjaxJson doAdd(SubcontractSupplierEntity subcontractSupplier, HttpServletRequest request) {
		String message = null;
		AjaxJson j = new AjaxJson();
		message = "供应商管理添加成功";
		try{
			subcontractSupplierService.save(subcontractSupplier);
			systemService.addLog(message, Globals.Log_Type_INSERT, Globals.Log_Leavel_INFO);
		}catch(Exception e){
			e.printStackTrace();
			message = "供应商管理添加失败";
			throw new BusinessException(e.getMessage());
		}
		j.setMsg(message);
		return j;
	}
	
	/**
	 * 更新供应商管理
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping(params = "doUpdate")
	@ResponseBody
	public AjaxJson doUpdate(SubcontractSupplierEntity subcontractSupplier, HttpServletRequest request) {
		String message = null;
		AjaxJson j = new AjaxJson();
		message = "供应商管理更新成功";
		SubcontractSupplierEntity t = subcontractSupplierService.get(SubcontractSupplierEntity.class, subcontractSupplier.getId());
		try {
			MyBeanUtils.copyBeanNotNull2Bean(subcontractSupplier, t);
			subcontractSupplierService.saveOrUpdate(t);
			systemService.addLog(message, Globals.Log_Type_UPDATE, Globals.Log_Leavel_INFO);
		} catch (Exception e) {
			e.printStackTrace();
			message = "供应商管理更新失败";
			throw new BusinessException(e.getMessage());
		}
		j.setMsg(message);
		return j;
	}
	

	/**
	 * 供应商管理新增页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "goAdd")
	public ModelAndView goAdd(SubcontractSupplierEntity subcontractSupplier, HttpServletRequest req) {
		if (StringUtil.isNotEmpty(subcontractSupplier.getId())) {
			subcontractSupplier = subcontractSupplierService.getEntity(SubcontractSupplierEntity.class, subcontractSupplier.getId());
			req.setAttribute("subcontractSupplierPage", subcontractSupplier);
		}
		return new ModelAndView("com/jeecg/supply/subcontractSupplier-add");
	}
	/**
	 * 供应商管理编辑页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "goUpdate")
	public ModelAndView goUpdate(SubcontractSupplierEntity subcontractSupplier, HttpServletRequest req) {
		if (StringUtil.isNotEmpty(subcontractSupplier.getId())) {
			subcontractSupplier = subcontractSupplierService.getEntity(SubcontractSupplierEntity.class, subcontractSupplier.getId());
			req.setAttribute("subcontractSupplierPage", subcontractSupplier);
		}
		return new ModelAndView("com/jeecg/supply/subcontractSupplier-update");
	}
	
	/**
	 * 导入功能跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "upload")
	public ModelAndView upload(HttpServletRequest req) {
		req.setAttribute("controller_name","subcontractSupplierController");
		return new ModelAndView("common/upload/pub_excel_upload");
	}
	
	/**
	 * 导出excel
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(params = "exportXls")
	public String exportXls(SubcontractSupplierEntity subcontractSupplier,HttpServletRequest request,HttpServletResponse response
			, DataGrid dataGrid,ModelMap modelMap) {
		CriteriaQuery cq = new CriteriaQuery(SubcontractSupplierEntity.class, dataGrid);
		org.jeecgframework.core.extend.hqlsearch.HqlGenerateUtil.installHql(cq, subcontractSupplier, request.getParameterMap());
		List<SubcontractSupplierEntity> subcontractSuppliers = this.subcontractSupplierService.getListByCriteriaQuery(cq,false);
		modelMap.put(NormalExcelConstants.FILE_NAME,"供应商管理");
		modelMap.put(NormalExcelConstants.CLASS,SubcontractSupplierEntity.class);
		modelMap.put(NormalExcelConstants.PARAMS,new ExportParams("供应商管理列表", "导出人:"+ResourceUtil.getSessionUser().getRealName(),
			"导出信息"));
		modelMap.put(NormalExcelConstants.DATA_LIST,subcontractSuppliers);
		return NormalExcelConstants.JEECG_EXCEL_VIEW;
	}
	/**
	 * 导出excel 使模板
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(params = "exportXlsByT")
	public String exportXlsByT(SubcontractSupplierEntity subcontractSupplier,HttpServletRequest request,HttpServletResponse response
			, DataGrid dataGrid,ModelMap modelMap) {
    	modelMap.put(NormalExcelConstants.FILE_NAME,"供应商管理");
    	modelMap.put(NormalExcelConstants.CLASS,SubcontractSupplierEntity.class);
    	modelMap.put(NormalExcelConstants.PARAMS,new ExportParams("供应商管理列表", "导出人:"+ResourceUtil.getSessionUser().getRealName(),
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
				List<SubcontractSupplierEntity> listSubcontractSupplierEntitys = ExcelImportUtil.importExcel(file.getInputStream(),SubcontractSupplierEntity.class,params);
				for (SubcontractSupplierEntity subcontractSupplier : listSubcontractSupplierEntitys) {
					subcontractSupplierService.save(subcontractSupplier);
				}
				j.setMsg("文件导入成功！");
			} catch (Exception e) {
				j.setMsg("文件导入失败！");
				logger.error(e.getMessage());
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
		CriteriaQuery cq = new CriteriaQuery(SubcontractSupplierEntity.class,new DataGrid());
		SubcontractSupplierEntity ssle = new SubcontractSupplierEntity();
		//查询条件组装器
		org.jeecgframework.core.extend.hqlsearch.HqlGenerateUtil.installHql(cq, ssle, request.getParameterMap());
		try{
		//自定义追加查询条件
			cq.add(Restrictions.eq("cpmc", supplyType));
		}catch (Exception e) {  
			throw new BusinessException(e.getMessage());
		}
		List<SubcontractSupplierEntity> list = this.subcontractSupplierService
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
		CriteriaQuery cq = new CriteriaQuery(SubcontractSupplierEntity.class,new DataGrid());
		SubcontractSupplierEntity ssle = new SubcontractSupplierEntity();
		//查询条件组装器
		org.jeecgframework.core.extend.hqlsearch.HqlGenerateUtil.installHql(cq, ssle, request.getParameterMap());
		try{
		//自定义追加查询条件
			cq.add(Restrictions.eq("dwmc", supplyName));
		}catch (Exception e) {  
			throw new BusinessException(e.getMessage());
		}
		List<SubcontractSupplierEntity> list = this.subcontractSupplierService
				.getListByCriteriaQuery(cq, false);
		j.setObj(list);
		j.setMsg(message);
		return j;
	}
}
