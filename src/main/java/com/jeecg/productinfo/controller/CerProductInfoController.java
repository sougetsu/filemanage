package com.jeecg.productinfo.controller;
import com.jeecg.productinfo.entity.CerProductInfoEntity;
import com.jeecg.productinfo.service.CerProductInfoServiceI;
import com.jeecg.supply.entity.SubcontractSupplierEntity;

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
import org.jeecgframework.web.system.pojo.base.DictionaryInfo;
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
 * @Description: 产品基础信息
 * @author onlineGenerator
 * @date 2019-12-21 16:36:12
 * @version V1.0   
 *
 */
@Controller
@RequestMapping("/cerProductInfoController")
public class CerProductInfoController extends BaseController {
	private static final Logger logger = LoggerFactory.getLogger(CerProductInfoController.class);

	@Autowired
	private CerProductInfoServiceI cerProductInfoService;
	@Autowired
	private SystemService systemService;
	


	/**
	 * 产品基础信息列表 页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "list")
	public ModelAndView list(HttpServletRequest request) {
		return new ModelAndView("com/jeecg/productinfo/cerProductInfoList");
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
	public void datagrid(CerProductInfoEntity cerProductInfo,HttpServletRequest request, HttpServletResponse response, DataGrid dataGrid) {
		CriteriaQuery cq = new CriteriaQuery(CerProductInfoEntity.class, dataGrid);
		//查询条件组装器
		org.jeecgframework.core.extend.hqlsearch.HqlGenerateUtil.installHql(cq, cerProductInfo, request.getParameterMap());
		try{
		//自定义追加查询条件
		}catch (Exception e) {
			throw new BusinessException(e.getMessage());
		}
		cq.add();
		this.cerProductInfoService.getDataGridReturn(cq, true);
		TagUtil.datagrid(response, dataGrid);
	}
	
	/**
	 * 删除产品基础信息
	 * 
	 * @return
	 */
	@RequestMapping(params = "doDel")
	@ResponseBody
	public AjaxJson doDel(CerProductInfoEntity cerProductInfo, HttpServletRequest request) {
		String message = null;
		AjaxJson j = new AjaxJson();
		cerProductInfo = systemService.getEntity(CerProductInfoEntity.class, cerProductInfo.getId());
		message = "产品基础信息删除成功";
		try{
			cerProductInfoService.delete(cerProductInfo);
			systemService.addLog(message, Globals.Log_Type_DEL, Globals.Log_Leavel_INFO);
		}catch(Exception e){
			e.printStackTrace();
			message = "产品基础信息删除失败";
			throw new BusinessException(e.getMessage());
		}
		j.setMsg(message);
		return j;
	}
	
	/**
	 * 批量删除产品基础信息
	 * 
	 * @return
	 */
	 @RequestMapping(params = "doBatchDel")
	@ResponseBody
	public AjaxJson doBatchDel(String ids,HttpServletRequest request){
		String message = null;
		AjaxJson j = new AjaxJson();
		message = "产品基础信息删除成功";
		try{
			for(String id:ids.split(",")){
				CerProductInfoEntity cerProductInfo = systemService.getEntity(CerProductInfoEntity.class, 
				id
				);
				cerProductInfoService.delete(cerProductInfo);
				systemService.addLog(message, Globals.Log_Type_DEL, Globals.Log_Leavel_INFO);
			}
		}catch(Exception e){
			e.printStackTrace();
			message = "产品基础信息删除失败";
			throw new BusinessException(e.getMessage());
		}
		j.setMsg(message);
		return j;
	}


	/**
	 * 添加产品基础信息
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping(params = "doAdd")
	@ResponseBody
	public AjaxJson doAdd(CerProductInfoEntity cerProductInfo, HttpServletRequest request) {
		String message = null;
		AjaxJson j = new AjaxJson();
		message = "产品基础信息添加成功";
		try{
			cerProductInfoService.save(cerProductInfo);
			systemService.addLog(message, Globals.Log_Type_INSERT, Globals.Log_Leavel_INFO);
		}catch(Exception e){
			e.printStackTrace();
			message = "产品基础信息添加失败";
			throw new BusinessException(e.getMessage());
		}
		j.setMsg(message);
		return j;
	}
	
	/**
	 * 更新产品基础信息
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping(params = "doUpdate")
	@ResponseBody
	public AjaxJson doUpdate(CerProductInfoEntity cerProductInfo, HttpServletRequest request) {
		String message = null;
		AjaxJson j = new AjaxJson();
		message = "产品基础信息更新成功";
		CerProductInfoEntity t = cerProductInfoService.get(CerProductInfoEntity.class, cerProductInfo.getId());
		try {
			MyBeanUtils.copyBeanNotNull2Bean(cerProductInfo, t);
			cerProductInfoService.saveOrUpdate(t);
			systemService.addLog(message, Globals.Log_Type_UPDATE, Globals.Log_Leavel_INFO);
		} catch (Exception e) {
			e.printStackTrace();
			message = "产品基础信息更新失败";
			throw new BusinessException(e.getMessage());
		}
		j.setMsg(message);
		return j;
	}
	

	/**
	 * 产品基础信息新增页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "goAdd")
	public ModelAndView goAdd(CerProductInfoEntity cerProductInfo, HttpServletRequest req) {
		if (StringUtil.isNotEmpty(cerProductInfo.getId())) {
			cerProductInfo = cerProductInfoService.getEntity(CerProductInfoEntity.class, cerProductInfo.getId());
			req.setAttribute("cerProductInfoPage", cerProductInfo);
		}
		return new ModelAndView("com/jeecg/productinfo/cerProductInfo-add");
	}
	/**
	 * 产品基础信息编辑页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "goUpdate")
	public ModelAndView goUpdate(CerProductInfoEntity cerProductInfo, HttpServletRequest req) {
		if (StringUtil.isNotEmpty(cerProductInfo.getId())) {
			cerProductInfo = cerProductInfoService.getEntity(CerProductInfoEntity.class, cerProductInfo.getId());
			req.setAttribute("cerProductInfoPage", cerProductInfo);
		}
		return new ModelAndView("com/jeecg/productinfo/cerProductInfo-update");
	}
	
	/**
	 * 导入功能跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "upload")
	public ModelAndView upload(HttpServletRequest req) {
		req.setAttribute("controller_name","cerProductInfoController");
		return new ModelAndView("common/upload/pub_excel_upload");
	}
	
	/**
	 * 导出excel
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(params = "exportXls")
	public String exportXls(CerProductInfoEntity cerProductInfo,HttpServletRequest request,HttpServletResponse response
			, DataGrid dataGrid,ModelMap modelMap) {
		CriteriaQuery cq = new CriteriaQuery(CerProductInfoEntity.class, dataGrid);
		org.jeecgframework.core.extend.hqlsearch.HqlGenerateUtil.installHql(cq, cerProductInfo, request.getParameterMap());
		List<CerProductInfoEntity> cerProductInfos = this.cerProductInfoService.getListByCriteriaQuery(cq,false);
		modelMap.put(NormalExcelConstants.FILE_NAME,"产品基础信息");
		modelMap.put(NormalExcelConstants.CLASS,CerProductInfoEntity.class);
		modelMap.put(NormalExcelConstants.PARAMS,new ExportParams("产品基础信息列表", "导出人:"+ResourceUtil.getSessionUser().getRealName(),
			"导出信息"));
		modelMap.put(NormalExcelConstants.DATA_LIST,cerProductInfos);
		return NormalExcelConstants.JEECG_EXCEL_VIEW;
	}
	/**
	 * 导出excel 使模板
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(params = "exportXlsByT")
	public String exportXlsByT(CerProductInfoEntity cerProductInfo,HttpServletRequest request,HttpServletResponse response
			, DataGrid dataGrid,ModelMap modelMap) {
    	modelMap.put(NormalExcelConstants.FILE_NAME,"产品基础信息");
    	modelMap.put(NormalExcelConstants.CLASS,CerProductInfoEntity.class);
    	modelMap.put(NormalExcelConstants.PARAMS,new ExportParams("产品基础信息列表", "导出人:"+ResourceUtil.getSessionUser().getRealName(),
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
				List<CerProductInfoEntity> listCerProductInfoEntitys = ExcelImportUtil.importExcel(file.getInputStream(),CerProductInfoEntity.class,params);
				for (CerProductInfoEntity cerProductInfo : listCerProductInfoEntitys) {
					cerProductInfoService.save(cerProductInfo);
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
	 * 获得项目名称
	 * @param request
	 * @return List<DictionaryInfo> 对象列表
	 */
	@RequestMapping(params = "getCpxhList")
	@ResponseBody
	public List<DictionaryInfo> getProjectList(HttpServletRequest request) {
		List<DictionaryInfo> result = new ArrayList<DictionaryInfo>();
		String sql  = "select distinct cpxh from cer_product_info";
		List<String> cpxhList = systemService.findListbySql(sql);
		if(cpxhList != null && !cpxhList.isEmpty() && cpxhList.get(0) != null){
			for (String cpxh : cpxhList) {
				DictionaryInfo di = new DictionaryInfo();
				di.setId(cpxh);
				di.setText(cpxh);
				result.add(di);
			}
		}
		return result;
	}
	
	/**
	 * @param 
	 * @param 
	 * @param request
	 * @return
	 */
	@RequestMapping(params = "getCppcListByCpxh")
	@ResponseBody
	public AjaxJson getCppcListByCpxh( HttpServletRequest request,String proCpxh) {
		String message = null;
		AjaxJson j = new AjaxJson();
		String sql  = "select distinct cppc from cer_product_info where cpxh= '" + proCpxh+"'";
		List<String> cppcList = systemService.findListbySql(sql);
		List<DictionaryInfo> result = new ArrayList<DictionaryInfo>();
		if(cppcList != null && !cppcList.isEmpty() && cppcList.get(0) != null){
			for (String cppc : cppcList) {
				DictionaryInfo di = new DictionaryInfo();
				di.setId(cppc);
				di.setText(cppc);
				result.add(di);
			}
		}
		j.setObj(result);
		j.setMsg(message);
		return j;
	}
	/**
	 * @param 
	 * @param 
	 * @param request
	 * @return
	 */
	@RequestMapping(params = "getProductInfo")
	@ResponseBody
	public AjaxJson getProductInfo( HttpServletRequest request,String proCpxh,String proCppc) {
		String message = null;
		AjaxJson j = new AjaxJson();
		CriteriaQuery cq = new CriteriaQuery(CerProductInfoEntity.class,new DataGrid());
		CerProductInfoEntity ssle = new CerProductInfoEntity();
		//查询条件组装器
		org.jeecgframework.core.extend.hqlsearch.HqlGenerateUtil.installHql(cq, ssle, request.getParameterMap());
		try{
		//自定义追加查询条件
			cq.add(Restrictions.eq("cpxh", proCpxh));
			cq.add(Restrictions.eq("cppc", proCppc));
		}catch (Exception e) {  
			throw new BusinessException(e.getMessage());
		}
		List<CerProductInfoEntity> list = this.cerProductInfoService
				.getListByCriteriaQuery(cq, false);
		j.setObj(list);
		j.setMsg(message);
		return j;
	}
}
