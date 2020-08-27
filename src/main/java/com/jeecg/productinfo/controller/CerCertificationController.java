package com.jeecg.productinfo.controller;
import com.alibaba.fastjson.JSONArray;
import com.jeecg.filemanage.entity.TestFilestoreEntity;
import com.jeecg.productinfo.entity.CerCertificationEntity;
import com.jeecg.productinfo.service.CerCertificationServiceI;
import com.jeecg.waixieapply.entity.SubcontractApplyEntity;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.text.SimpleDateFormat;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
import org.jeecgframework.core.util.doc.MDoc;
import org.jeecgframework.jwt.util.DateUtil;
import org.jeecgframework.jwt.util.UtilValidate;
import org.jeecgframework.tag.core.easyui.TagUtil;
import org.jeecgframework.web.system.pojo.base.TSDepart;
import org.jeecgframework.web.system.pojo.base.TSRole;
import org.jeecgframework.web.system.pojo.base.TSRoleUser;
import org.jeecgframework.web.system.pojo.base.TSUser;
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
import org.jeecgframework.core.util.ResourceUtil;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import java.util.Map;
import java.util.UUID;
import java.util.HashMap;
import org.jeecgframework.core.util.ExceptionUtil;


/**   
 * @Title: Controller  
 * @Description: 合格证管理
 * @author onlineGenerator
 * @date 2019-12-21 19:52:50
 * @version V1.0   
 *
 */
@Controller
@RequestMapping("/cerCertificationController")
public class CerCertificationController extends BaseController {
	private static final Logger logger = LoggerFactory.getLogger(CerCertificationController.class);

	@Autowired
	private CerCertificationServiceI cerCertificationService;
	@Autowired
	private SystemService systemService;
	


	/**
	 * 合格证管理列表 页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "list")
	public ModelAndView list(HttpServletRequest request) {
		return new ModelAndView("com/jeecg/productinfo/cerCertificationList");
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
	public void datagrid(CerCertificationEntity cerCertification,HttpServletRequest request, HttpServletResponse response, DataGrid dataGrid) {
		CriteriaQuery cq = new CriteriaQuery(CerCertificationEntity.class, dataGrid);
		//查询条件组装器
		org.jeecgframework.core.extend.hqlsearch.HqlGenerateUtil.installHql(cq, cerCertification, request.getParameterMap());
		try{
		//自定义追加查询条件
		}catch (Exception e) {
			throw new BusinessException(e.getMessage());
		}
		cq.add();
		this.cerCertificationService.getDataGridReturn(cq, true);
		TagUtil.datagrid(response, dataGrid);
	}
	
	/**
	 * 删除合格证管理
	 * 
	 * @return
	 */
	@RequestMapping(params = "doDel")
	@ResponseBody
	public AjaxJson doDel(CerCertificationEntity cerCertification, HttpServletRequest request) {
		String message = null;
		AjaxJson j = new AjaxJson();
		cerCertification = systemService.getEntity(CerCertificationEntity.class, cerCertification.getId());
		message = "合格证管理删除成功";
		try{
			cerCertificationService.delete(cerCertification);
			systemService.addLog(message, Globals.Log_Type_DEL, Globals.Log_Leavel_INFO);
		}catch(Exception e){
			e.printStackTrace();
			message = "合格证管理删除失败";
			throw new BusinessException(e.getMessage());
		}
		j.setMsg(message);
		return j;
	}
	
	/**
	 * 批量删除合格证管理
	 * 
	 * @return
	 */
	 @RequestMapping(params = "doBatchDel")
	@ResponseBody
	public AjaxJson doBatchDel(String ids,HttpServletRequest request){
		String message = null;
		AjaxJson j = new AjaxJson();
		message = "合格证管理删除成功";
		try{
			for(String id:ids.split(",")){
				CerCertificationEntity cerCertification = systemService.getEntity(CerCertificationEntity.class, 
				id
				);
				cerCertificationService.delete(cerCertification);
				systemService.addLog(message, Globals.Log_Type_DEL, Globals.Log_Leavel_INFO);
			}
		}catch(Exception e){
			e.printStackTrace();
			message = "合格证管理删除失败";
			throw new BusinessException(e.getMessage());
		}
		j.setMsg(message);
		return j;
	}


	/**
	 * 添加合格证管理
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping(params = "doAdd")
	@ResponseBody
	public AjaxJson doAdd(CerCertificationEntity cerCertification, HttpServletRequest request) {
		String message = null;
		AjaxJson j = new AjaxJson();
		message = "合格证管理添加成功";
		try{
			TSUser user = ResourceUtil.getSessionUser();
			String roles = "";
			List<TSRoleUser> rUsers = systemService.findByProperty(TSRoleUser.class, "TSUser.id", user.getId());
			for (TSRoleUser ru : rUsers) {
				TSRole role = ru.getTSRole();
				roles += role.getRoleName() + ",";
			}
			
			if(roles.indexOf("市场人员")!=-1){
				cerCertification.setBpmStatus("2");
			}else if(roles.indexOf("检验处人员")!=-1 ){
				cerCertification.setBpmStatus("3");
			}else{
				cerCertification.setBpmStatus("2");
			}
			cerCertificationService.save(cerCertification);
			systemService.addLog(message, Globals.Log_Type_INSERT, Globals.Log_Leavel_INFO);
		}catch(Exception e){
			e.printStackTrace();
			message = "合格证管理添加失败";
			throw new BusinessException(e.getMessage());
		}
		j.setMsg(message);
		return j;
	}
	
	/**
	 * 更新合格证管理
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping(params = "doUpdate")
	@ResponseBody
	public AjaxJson doUpdate(CerCertificationEntity cerCertification, HttpServletRequest request) {
		String message = null;
		AjaxJson j = new AjaxJson();
		message = "合格证管理更新成功";
		CerCertificationEntity t = cerCertificationService.get(CerCertificationEntity.class, cerCertification.getId());
		try {
			TSUser user = ResourceUtil.getSessionUser();
			String roles = "";
			List<TSRoleUser> rUsers = systemService.findByProperty(TSRoleUser.class, "TSUser.id", user.getId());
			for (TSRoleUser ru : rUsers) {
				TSRole role = ru.getTSRole();
				roles += role.getRoleName() + ",";
			}
			
			if(roles.indexOf("市场人员")!=-1){
				cerCertification.setBpmStatus("2");
			}else if(roles.indexOf("检验处人员")!=-1 ){
				cerCertification.setBpmStatus("3");
			}else{
				cerCertification.setBpmStatus("2");
			}
			MyBeanUtils.copyBeanNotNull2Bean(cerCertification, t);
			cerCertificationService.saveOrUpdate(t);
			systemService.addLog(message, Globals.Log_Type_UPDATE, Globals.Log_Leavel_INFO);
		} catch (Exception e) {
			e.printStackTrace();
			message = "合格证管理更新失败";
			throw new BusinessException(e.getMessage());
		}
		j.setMsg(message);
		return j;
	}
	
	/**
	 * 更新外协加工申请
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping(params = "doConfirm")
	@ResponseBody
	public AjaxJson doConfirm(CerCertificationEntity cerCertification,String confrimStatus, HttpServletRequest request) {
		String message = null;
		AjaxJson j = new AjaxJson();
		message = "合格证管理审核完成";
		CerCertificationEntity t = cerCertificationService.get(CerCertificationEntity.class, cerCertification.getId());
		if("1".equals(confrimStatus)){
			cerCertification.setBpmStatus("3");
		}
		else {
			cerCertification.setBpmStatus("11");
		}
		cerCertification.setQfrq(new Date());
		try {
			MyBeanUtils.copyBeanNotNull2Bean(cerCertification, t);
			cerCertificationService.saveOrUpdate(t);
			systemService.addLog(message, Globals.Log_Type_UPDATE, Globals.Log_Leavel_INFO);
		} catch (Exception e) {
			e.printStackTrace();
			message = "合格证管理更新失败";
			throw new BusinessException(e.getMessage());
		}
		j.setMsg(message);
		return j;
	}

	/**
	 * 合格证管理新增页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "goAdd")
	public ModelAndView goAdd(CerCertificationEntity cerCertification, HttpServletRequest req) {
		if (StringUtil.isNotEmpty(cerCertification.getId())) {
			cerCertification = cerCertificationService.getEntity(CerCertificationEntity.class, cerCertification.getId());
			req.setAttribute("cerCertificationPage", cerCertification);
		}
		return new ModelAndView("com/jeecg/productinfo/cerCertification-add");
	}
	/**
	 * 合格证管理编辑页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "goUpdate")
	public ModelAndView goUpdate(CerCertificationEntity cerCertification, HttpServletRequest req) {
		if (StringUtil.isNotEmpty(cerCertification.getId())) {
			cerCertification = cerCertificationService.getEntity(CerCertificationEntity.class, cerCertification.getId());
			req.setAttribute("cerCertificationPage", cerCertification);
		}
		return new ModelAndView("com/jeecg/productinfo/cerCertification-update");
	}
	
	/**
	 * 导入功能跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "upload")
	public ModelAndView upload(HttpServletRequest req) {
		req.setAttribute("controller_name","cerCertificationController");
		return new ModelAndView("common/upload/pub_excel_upload");
	}
	
	/**
	 * 导出excel
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(params = "exportXls")
	public String exportXls(CerCertificationEntity cerCertification,HttpServletRequest request,HttpServletResponse response
			, DataGrid dataGrid,ModelMap modelMap) {
		CriteriaQuery cq = new CriteriaQuery(CerCertificationEntity.class, dataGrid);
		org.jeecgframework.core.extend.hqlsearch.HqlGenerateUtil.installHql(cq, cerCertification, request.getParameterMap());
		List<CerCertificationEntity> cerCertifications = this.cerCertificationService.getListByCriteriaQuery(cq,false);
		modelMap.put(NormalExcelConstants.FILE_NAME,"合格证管理");
		modelMap.put(NormalExcelConstants.CLASS,CerCertificationEntity.class);
		modelMap.put(NormalExcelConstants.PARAMS,new ExportParams("合格证管理列表", "导出人:"+ResourceUtil.getSessionUser().getRealName(),
			"导出信息"));
		modelMap.put(NormalExcelConstants.DATA_LIST,cerCertifications);
		return NormalExcelConstants.JEECG_EXCEL_VIEW;
	}
	
	
	/**
	 * 导出excel 使模板
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(params = "exportXlsByT")
	public String exportXlsByT(CerCertificationEntity cerCertification,HttpServletRequest request,HttpServletResponse response
			, DataGrid dataGrid,ModelMap modelMap) {
    	modelMap.put(NormalExcelConstants.FILE_NAME,"合格证管理");
    	modelMap.put(NormalExcelConstants.CLASS,CerCertificationEntity.class);
    	modelMap.put(NormalExcelConstants.PARAMS,new ExportParams("合格证管理列表", "导出人:"+ResourceUtil.getSessionUser().getRealName(),
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
				List<CerCertificationEntity> listCerCertificationEntitys = ExcelImportUtil.importExcel(file.getInputStream(),CerCertificationEntity.class,params);
				for (CerCertificationEntity cerCertification : listCerCertificationEntitys) {
					cerCertificationService.save(cerCertification);
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
	 * 导出doc
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(params = "exportDoc")
	public void exportDoc(CerCertificationEntity cerCertification,HttpServletRequest request,HttpServletResponse response
			, DataGrid dataGrid,ModelMap modelMap) throws Exception {
		CriteriaQuery cq = new CriteriaQuery(CerCertificationEntity.class, dataGrid);
		org.jeecgframework.core.extend.hqlsearch.HqlGenerateUtil.installHql(cq, cerCertification, request.getParameterMap());
		List<CerCertificationEntity> cerCertifications = this.cerCertificationService.getListByCriteriaQuery(cq,false);
		Map<String, Object> resultMap = new HashMap<String, Object>();
		List<Map<String, Object>> datalist = new ArrayList<Map<String, Object>>();
		for (CerCertificationEntity certificationVO : cerCertifications) {
			Map<String, Object> dataMap = new HashMap<String, Object>();
			dataMap.put("certificationId", UtilValidate.isEmpty(certificationVO.getHgzbh())?"":certificationVO.getHgzbh());
			dataMap.put("productName", UtilValidate.isEmpty(certificationVO.getCpmc())?"":certificationVO.getCpmc());
			dataMap.put("productType", UtilValidate.isEmpty(certificationVO.getCpxh())?"":certificationVO.getCpxh());
			dataMap.put("productBatch", UtilValidate.isEmpty(certificationVO.getCppc())?"":certificationVO.getCppc());
			dataMap.put("productNum", UtilValidate.isEmpty(certificationVO.getCpsl())?"":certificationVO.getCpsl());
			dataMap.put("testStandard", UtilValidate.isEmpty(certificationVO.getCpjcbz())?"":certificationVO.getCpjcbz());
			dataMap.put("testReportId", UtilValidate.isEmpty(certificationVO.getJcbgh())?"":certificationVO.getJcbgh());
			dataMap.put("qualityStatus", UtilValidate.isEmpty(certificationVO.getZlbzdj())?"":certificationVO.getZlbzdj());
			dataMap.put("userUnits", UtilValidate.isEmpty(certificationVO.getYhdw())?"":certificationVO.getYhdw());
			dataMap.put("inspector", UtilValidate.isEmpty(certificationVO.getJyy())?"":certificationVO.getJyy());
			dataMap.put("certificationDate",  UtilValidate.isEmpty(certificationVO.getQfrq())?"": DateUtil.formatYMD(certificationVO.getQfrq()));
			dataMap.put("remark", UtilValidate.isEmpty(certificationVO.getBz())?"":certificationVO.getBz());
			datalist.add(dataMap);
		}
		resultMap.put("dataList", datalist);
		MDoc mdoc = new MDoc();
		String newFileName = UUID.randomUUID().toString()
				.replaceAll("-", "")+".doc";
		String fileName="C:/download/"+newFileName;
		mdoc.createDoc(resultMap, fileName,"hgzlist.ftl");
		
		File uploadedFile = new File(fileName);
		if (uploadedFile.exists()) {
			try {
				response.setContentType("application/msword");
				response.setHeader("Content-disposition",
						"attachment;filename="+"certificate"+".doc");
				OutputStream out = response.getOutputStream();
				FileInputStream in = new FileInputStream(uploadedFile);
				try {
					byte[] buf = new byte[512];
					int len = 0;
					while ((len = in.read(buf)) != -1) {
						out.write(buf, 0, len);
					}
				} finally {
					in.close();
					out.close();
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		
		}
	}
	
	/**
	 * 文件管理编辑页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "goConfirm")
	public ModelAndView goConfirm(CerCertificationEntity cerCertification, HttpServletRequest req) {
		if (StringUtil.isNotEmpty(cerCertification.getId())) {
			cerCertification = cerCertificationService.getEntity(CerCertificationEntity.class, cerCertification.getId());
			req.setAttribute("cerCertificationPage", cerCertification);
		}
		return new ModelAndView("com/jeecg/productinfo/cerCertification-confirm");
	}
	
	
}
