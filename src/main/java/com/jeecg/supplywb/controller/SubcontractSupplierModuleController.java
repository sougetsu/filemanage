package com.jeecg.supplywb.controller;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.criterion.Restrictions;
import org.jeecgframework.core.common.controller.BaseController;
import org.jeecgframework.core.common.exception.BusinessException;
import org.jeecgframework.core.common.hibernate.qbc.CriteriaQuery;
import org.jeecgframework.core.common.model.json.AjaxJson;
import org.jeecgframework.core.common.model.json.DataGrid;
import org.jeecgframework.core.constant.Globals;
import org.jeecgframework.core.util.ExceptionUtil;
import org.jeecgframework.core.util.MyBeanUtils;
import org.jeecgframework.core.util.ResourceUtil;
import org.jeecgframework.core.util.StringUtil;
import org.jeecgframework.poi.excel.ExcelImportUtil;
import org.jeecgframework.poi.excel.entity.ExportParams;
import org.jeecgframework.poi.excel.entity.ImportParams;
import org.jeecgframework.poi.excel.entity.vo.NormalExcelConstants;
import org.jeecgframework.tag.core.easyui.TagUtil;
import org.jeecgframework.web.system.service.SystemService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.jeecg.supplywb.entity.SubcontractSupplierModuleEntity;
import com.jeecg.supplywb.service.SubcontractSupplierModuleServiceI;

/**   
 * @Title: Controller  
 * @Description: 模块外包供应商
 * @author onlineGenerator
 * @date 2019-04-15 03:27:39
 * @version V1.0   
 *
 */
@Controller
@RequestMapping("/subcontractSupplierModuleController")
public class SubcontractSupplierModuleController extends BaseController {
	private static final Logger logger = LoggerFactory.getLogger(SubcontractSupplierModuleController.class);

	@Autowired
	private SubcontractSupplierModuleServiceI subcontractSupplierModuleService;
	@Autowired
	private SystemService systemService;
	


	/**
	 * 模块外包供应商列表 页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "list")
	public ModelAndView list(HttpServletRequest request) {
		return new ModelAndView("com/jeecg/supplywb/subcontractSupplierModuleList");
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
	public void datagrid(SubcontractSupplierModuleEntity subcontractSupplierModule,HttpServletRequest request, HttpServletResponse response, DataGrid dataGrid) {
		CriteriaQuery cq = new CriteriaQuery(SubcontractSupplierModuleEntity.class, dataGrid);
		//查询条件组装器
		org.jeecgframework.core.extend.hqlsearch.HqlGenerateUtil.installHql(cq, subcontractSupplierModule, request.getParameterMap());
		try{
		//自定义追加查询条件
		
		}catch (Exception e) {
			throw new BusinessException(e.getMessage());
		}
		cq.add();
		this.subcontractSupplierModuleService.getDataGridReturn(cq, true);
		TagUtil.datagrid(response, dataGrid);
	}
	
	/**
	 * 删除模块外包供应商
	 * 
	 * @return
	 */
	@RequestMapping(params = "doDel")
	@ResponseBody
	public AjaxJson doDel(SubcontractSupplierModuleEntity subcontractSupplierModule, HttpServletRequest request) {
		String message = null;
		AjaxJson j = new AjaxJson();
		subcontractSupplierModule = systemService.getEntity(SubcontractSupplierModuleEntity.class, subcontractSupplierModule.getId());
		message = "模块外包供应商删除成功";
		try{
			subcontractSupplierModuleService.delete(subcontractSupplierModule);
			systemService.addLog(message, Globals.Log_Type_DEL, Globals.Log_Leavel_INFO);
		}catch(Exception e){
			e.printStackTrace();
			message = "模块外包供应商删除失败";
			throw new BusinessException(e.getMessage());
		}
		j.setMsg(message);
		return j;
	}
	
	/**
	 * 批量删除模块外包供应商
	 * 
	 * @return
	 */
	 @RequestMapping(params = "doBatchDel")
	@ResponseBody
	public AjaxJson doBatchDel(String ids,HttpServletRequest request){
		String message = null;
		AjaxJson j = new AjaxJson();
		message = "模块外包供应商删除成功";
		try{
			for(String id:ids.split(",")){
				SubcontractSupplierModuleEntity subcontractSupplierModule = systemService.getEntity(SubcontractSupplierModuleEntity.class, 
				id
				);
				subcontractSupplierModuleService.delete(subcontractSupplierModule);
				systemService.addLog(message, Globals.Log_Type_DEL, Globals.Log_Leavel_INFO);
			}
		}catch(Exception e){
			e.printStackTrace();
			message = "模块外包供应商删除失败";
			throw new BusinessException(e.getMessage());
		}
		j.setMsg(message);
		return j;
	}


	/**
	 * 添加模块外包供应商
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping(params = "doAdd")
	@ResponseBody
	public AjaxJson doAdd(SubcontractSupplierModuleEntity subcontractSupplierModule, HttpServletRequest request) {
		String message = null;
		AjaxJson j = new AjaxJson();
		message = "模块外包供应商添加成功";
		try{
			subcontractSupplierModuleService.save(subcontractSupplierModule);
			systemService.addLog(message, Globals.Log_Type_INSERT, Globals.Log_Leavel_INFO);
		}catch(Exception e){
			e.printStackTrace();
			message = "模块外包供应商添加失败";
			throw new BusinessException(e.getMessage());
		}
		j.setMsg(message);
		return j;
	}
	
	/**
	 * 更新模块外包供应商
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping(params = "doUpdate")
	@ResponseBody
	public AjaxJson doUpdate(SubcontractSupplierModuleEntity subcontractSupplierModule, HttpServletRequest request) {
		String message = null;
		AjaxJson j = new AjaxJson();
		message = "模块外包供应商更新成功";
		SubcontractSupplierModuleEntity t = subcontractSupplierModuleService.get(SubcontractSupplierModuleEntity.class, subcontractSupplierModule.getId());
		try {
			MyBeanUtils.copyBeanNotNull2Bean(subcontractSupplierModule, t);
			subcontractSupplierModuleService.saveOrUpdate(t);
			systemService.addLog(message, Globals.Log_Type_UPDATE, Globals.Log_Leavel_INFO);
		} catch (Exception e) {
			e.printStackTrace();
			message = "模块外包供应商更新失败";
			throw new BusinessException(e.getMessage());
		}
		j.setMsg(message);
		return j;
	}
	

	/**
	 * 模块外包供应商新增页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "goAdd")
	public ModelAndView goAdd(SubcontractSupplierModuleEntity subcontractSupplierModule, HttpServletRequest req) {
		if (StringUtil.isNotEmpty(subcontractSupplierModule.getId())) {
			subcontractSupplierModule = subcontractSupplierModuleService.getEntity(SubcontractSupplierModuleEntity.class, subcontractSupplierModule.getId());
			req.setAttribute("subcontractSupplierModule", subcontractSupplierModule);
		}
		return new ModelAndView("com/jeecg/supplywb/subcontractSupplierModule-add");
	}
	/**
	 * 模块外包供应商编辑页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "goUpdate")
	public ModelAndView goUpdate(SubcontractSupplierModuleEntity subcontractSupplierModule, HttpServletRequest req) {
		if (StringUtil.isNotEmpty(subcontractSupplierModule.getId())) {
			subcontractSupplierModule = subcontractSupplierModuleService.getEntity(SubcontractSupplierModuleEntity.class, subcontractSupplierModule.getId());
			req.setAttribute("subcontractSupplierModule", subcontractSupplierModule);
		}
		return new ModelAndView("com/jeecg/supplywb/subcontractSupplierModule-update");
	}
	
	/**
	 * 导入功能跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "upload")
	public ModelAndView upload(HttpServletRequest req) {
		req.setAttribute("controller_name","subcontractSupplierModuleController");
		return new ModelAndView("common/upload/pub_excel_upload");
	}
	
	/**
	 * 导出excel
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(params = "exportXls")
	public String exportXls(SubcontractSupplierModuleEntity subcontractSupplierModule,HttpServletRequest request,HttpServletResponse response
			, DataGrid dataGrid,ModelMap modelMap) {
		CriteriaQuery cq = new CriteriaQuery(SubcontractSupplierModuleEntity.class, dataGrid);
		org.jeecgframework.core.extend.hqlsearch.HqlGenerateUtil.installHql(cq, subcontractSupplierModule, request.getParameterMap());
		List<SubcontractSupplierModuleEntity> subcontractSupplierModules = this.subcontractSupplierModuleService.getListByCriteriaQuery(cq,false);
		modelMap.put(NormalExcelConstants.FILE_NAME,"模块外包供应商");
		modelMap.put(NormalExcelConstants.CLASS,SubcontractSupplierModuleEntity.class);
		modelMap.put(NormalExcelConstants.PARAMS,new ExportParams("模块外包供应商列表", "导出人:"+ResourceUtil.getSessionUser().getRealName(),
			"导出信息"));
		modelMap.put(NormalExcelConstants.DATA_LIST,subcontractSupplierModules);
		return NormalExcelConstants.JEECG_EXCEL_VIEW;
	}
	/**
	 * 导出excel 使模板
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(params = "exportXlsByT")
	public String exportXlsByT(SubcontractSupplierModuleEntity subcontractSupplierModule,HttpServletRequest request,HttpServletResponse response
			, DataGrid dataGrid,ModelMap modelMap) {
    	modelMap.put(NormalExcelConstants.FILE_NAME,"模块外包供应商");
    	modelMap.put(NormalExcelConstants.CLASS,SubcontractSupplierModuleEntity.class);
    	modelMap.put(NormalExcelConstants.PARAMS,new ExportParams("模块外包供应商列表", "导出人:"+ResourceUtil.getSessionUser().getRealName(),
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
				List<SubcontractSupplierModuleEntity> listSubcontractSupplierModuleEntitys = ExcelImportUtil.importExcel(file.getInputStream(),SubcontractSupplierModuleEntity.class,params);
				for (SubcontractSupplierModuleEntity subcontractSupplierModule : listSubcontractSupplierModuleEntitys) {
					subcontractSupplierModuleService.save(subcontractSupplierModule);
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
		CriteriaQuery cq = new CriteriaQuery(SubcontractSupplierModuleEntity.class,new DataGrid());
		SubcontractSupplierModuleEntity ssle = new SubcontractSupplierModuleEntity();
		//查询条件组装器
		org.jeecgframework.core.extend.hqlsearch.HqlGenerateUtil.installHql(cq, ssle, request.getParameterMap());
		try{
		//自定义追加查询条件
			cq.add(Restrictions.eq("cpmc", supplyType));
		}catch (Exception e) {  
			throw new BusinessException(e.getMessage());
		}
		List<SubcontractSupplierModuleEntity> list = this.subcontractSupplierModuleService
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
		CriteriaQuery cq = new CriteriaQuery(SubcontractSupplierModuleEntity.class,new DataGrid());
		SubcontractSupplierModuleEntity ssle = new SubcontractSupplierModuleEntity();
		//查询条件组装器
		org.jeecgframework.core.extend.hqlsearch.HqlGenerateUtil.installHql(cq, ssle, request.getParameterMap());
		try{
		//自定义追加查询条件
			cq.add(Restrictions.eq("dwmc", supplyName));
		}catch (Exception e) {  
			throw new BusinessException(e.getMessage());
		}
		List<SubcontractSupplierModuleEntity> list = this.subcontractSupplierModuleService
				.getListByCriteriaQuery(cq, false);
		j.setObj(list);
		j.setMsg(message);
		return j;
	}
}
