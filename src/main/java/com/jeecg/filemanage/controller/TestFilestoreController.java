package com.jeecg.filemanage.controller;
import com.jeecg.filemanage.entity.TestFilestoreEntity;
import com.jeecg.filemanage.service.TestFilestoreServiceI;
import com.jeecg.materialmanage.entity.FileRawMaterialEntity;

import java.util.ArrayList;
import java.util.Date;
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
import org.jeecgframework.core.util.ZipUtil;
import org.jeecgframework.jwt.util.UtilValidate;
import org.jeecgframework.tag.core.easyui.TagUtil;
import org.jeecgframework.web.system.pojo.base.TSDepart;
import org.jeecgframework.web.system.service.SystemService;
import org.jeecgframework.core.util.MyBeanUtils;

import java.io.OutputStream;
import org.jeecgframework.core.util.BrowserUtils;
import org.jeecgframework.core.util.DateUtils;
import org.jeecgframework.poi.excel.ExcelExportUtil;
import org.jeecgframework.poi.excel.ExcelImportUtil;
import org.jeecgframework.poi.excel.entity.ExportParams;
import org.jeecgframework.poi.excel.entity.ImportParams;
import org.jeecgframework.poi.excel.entity.TemplateExportParams;
import org.jeecgframework.poi.excel.entity.vo.NormalExcelConstants;
import org.jeecgframework.poi.excel.entity.vo.TemplateExcelConstants;
import org.apache.commons.lang3.ArrayUtils;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.jeecgframework.core.util.ResourceUtil;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;

import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import java.util.Map;
import java.util.HashMap;
import org.jeecgframework.core.util.ExceptionUtil;


import org.jeecgframework.web.cgform.entity.upload.CgUploadEntity;
import org.jeecgframework.web.cgform.service.config.CgFormFieldServiceI;
import java.util.HashMap;
/**   
 * @Title: Controller  
 * @Description: 文件管理
 * @author onlineGenerator
 * @date 2019-12-22 18:21:14
 * @version V1.0   
 *
 */
@Controller
@RequestMapping("/testFilestoreController")
public class TestFilestoreController extends BaseController {
	private static final Logger logger = LoggerFactory.getLogger(TestFilestoreController.class);

	@Autowired
	private TestFilestoreServiceI testFilestoreService;
	@Autowired
	private SystemService systemService;
	@Autowired
	private CgFormFieldServiceI cgFormFieldService;
	


	/**
	 * 文件管理列表 页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "list")
	public ModelAndView list(HttpServletRequest request) {
		return new ModelAndView("com/jeecg/filemanage/testFilestoreList");
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
	public void datagrid(TestFilestoreEntity testFilestore,HttpServletRequest request, HttpServletResponse response, DataGrid dataGrid) {
		CriteriaQuery cq = new CriteriaQuery(TestFilestoreEntity.class, dataGrid);
		//查询条件组装器
		org.jeecgframework.core.extend.hqlsearch.HqlGenerateUtil.installHql(cq, testFilestore, request.getParameterMap());
		try{
		//自定义追加查询条件
		}catch (Exception e) {
			throw new BusinessException(e.getMessage());
		}
		cq.add();
		this.testFilestoreService.getDataGridReturn(cq, true);
		TagUtil.datagrid(response, dataGrid);
	}
	
	/**
	 * 删除文件管理
	 * 
	 * @return
	 */
	@RequestMapping(params = "doDel")
	@ResponseBody
	public AjaxJson doDel(TestFilestoreEntity testFilestore, HttpServletRequest request) {
		String message = null;
		AjaxJson j = new AjaxJson();
		testFilestore = systemService.getEntity(TestFilestoreEntity.class, testFilestore.getId());
		message = "文件管理删除成功";
		try{
			testFilestoreService.delete(testFilestore);
			systemService.addLog(message, Globals.Log_Type_DEL, Globals.Log_Leavel_INFO);
		}catch(Exception e){
			e.printStackTrace();
			message = "文件管理删除失败";
			throw new BusinessException(e.getMessage());
		}
		j.setMsg(message);
		return j;
	}
	
	/**
	 * 批量删除文件管理
	 * 
	 * @return
	 */
	 @RequestMapping(params = "doBatchDel")
	@ResponseBody
	public AjaxJson doBatchDel(String ids,HttpServletRequest request){
		String message = null;
		AjaxJson j = new AjaxJson();
		message = "文件管理删除成功";
		try{
			for(String id:ids.split(",")){
				TestFilestoreEntity testFilestore = systemService.getEntity(TestFilestoreEntity.class, 
				id
				);
				testFilestoreService.delete(testFilestore);
				systemService.addLog(message, Globals.Log_Type_DEL, Globals.Log_Leavel_INFO);
			}
		}catch(Exception e){
			e.printStackTrace();
			message = "文件管理删除失败";
			throw new BusinessException(e.getMessage());
		}
		j.setMsg(message);
		return j;
	}


	/**
	 * 添加文件管理
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping(params = "doAdd")
	@ResponseBody
	public AjaxJson doAdd(TestFilestoreEntity testFilestore, HttpServletRequest request) {
		String message = null;
		AjaxJson j = new AjaxJson();
		message = "文件管理添加成功";
		try{
			testFilestoreService.save(testFilestore);
			systemService.addLog(message, Globals.Log_Type_INSERT, Globals.Log_Leavel_INFO);
		}catch(Exception e){
			e.printStackTrace();
			message = "文件管理添加失败";
			throw new BusinessException(e.getMessage());
		}
		j.setMsg(message);
		j.setObj(testFilestore);
		return j;
	}
	
	/**
	 * 更新文件管理
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping(params = "doUpdate")
	@ResponseBody
	public AjaxJson doUpdate(TestFilestoreEntity testFilestore, HttpServletRequest request) {
		String message = null;
		AjaxJson j = new AjaxJson();
		message = "文件管理更新成功";
		TestFilestoreEntity t = testFilestoreService.get(TestFilestoreEntity.class, testFilestore.getId());
		try {
			MyBeanUtils.copyBeanNotNull2Bean(testFilestore, t);
			testFilestoreService.saveOrUpdate(t);
			systemService.addLog(message, Globals.Log_Type_UPDATE, Globals.Log_Leavel_INFO);
		} catch (Exception e) {
			e.printStackTrace();
			message = "文件管理更新失败";
			throw new BusinessException(e.getMessage());
		}
		j.setMsg(message);
		return j;
	}
	

	/**
	 * 文件管理新增页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "goAdd")
	public ModelAndView goAdd(TestFilestoreEntity testFilestore, HttpServletRequest req) {
		if (StringUtil.isNotEmpty(testFilestore.getId())) {
			testFilestore = testFilestoreService.getEntity(TestFilestoreEntity.class, testFilestore.getId());
			req.setAttribute("testFilestorePage", testFilestore);
		}
		return new ModelAndView("com/jeecg/filemanage/testFilestore-add");
	}
	/**
	 * 文件管理编辑页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "goUpdate")
	public ModelAndView goUpdate(TestFilestoreEntity testFilestore, HttpServletRequest req) {
		if (StringUtil.isNotEmpty(testFilestore.getId())) {
			testFilestore = testFilestoreService.getEntity(TestFilestoreEntity.class, testFilestore.getId());
			req.setAttribute("testFilestorePage", testFilestore);
		}
		return new ModelAndView("com/jeecg/filemanage/testFilestore-update");
	}
	
	/**
	 * 导入功能跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "upload")
	public ModelAndView upload(HttpServletRequest req) {
		req.setAttribute("controller_name","testFilestoreController");
		return new ModelAndView("common/upload/pub_excel_upload");
	}
	
	/**
	 * 导出excel
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(params = "exportXls")
	public String exportXls(TestFilestoreEntity testFilestore,HttpServletRequest request,HttpServletResponse response
			, DataGrid dataGrid,ModelMap modelMap) {
		CriteriaQuery cq = new CriteriaQuery(TestFilestoreEntity.class, dataGrid);
		org.jeecgframework.core.extend.hqlsearch.HqlGenerateUtil.installHql(cq, testFilestore, request.getParameterMap());
		List<TestFilestoreEntity> testFilestores = this.testFilestoreService.getListByCriteriaQuery(cq,false);
		modelMap.put(NormalExcelConstants.FILE_NAME,"文件管理");
		modelMap.put(NormalExcelConstants.CLASS,TestFilestoreEntity.class);
		modelMap.put(NormalExcelConstants.PARAMS,new ExportParams("文件管理列表", "导出人:"+ResourceUtil.getSessionUser().getRealName(),
			"导出信息"));
		modelMap.put(NormalExcelConstants.DATA_LIST,testFilestores);
		return NormalExcelConstants.JEECG_EXCEL_VIEW;
	}
	/**
	 * 导出excel 使模板
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(params = "exportXlsByT")
	public String exportXlsByT(TestFilestoreEntity testFilestore,HttpServletRequest request,HttpServletResponse response
			, DataGrid dataGrid,ModelMap modelMap) {
    	modelMap.put(NormalExcelConstants.FILE_NAME,"文件管理");
    	modelMap.put(NormalExcelConstants.CLASS,TestFilestoreEntity.class);
    	modelMap.put(NormalExcelConstants.PARAMS,new ExportParams("文件管理列表", "导出人:"+ResourceUtil.getSessionUser().getRealName(),
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
				List<TestFilestoreEntity> listTestFilestoreEntitys = ExcelImportUtil.importExcel(file.getInputStream(),TestFilestoreEntity.class,params);
				for (TestFilestoreEntity testFilestore : listTestFilestoreEntitys) {
					testFilestoreService.save(testFilestore);
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
	 * 获取文件附件信息
	 * 
	 * @param id testFilestore主键id
	 */
	@RequestMapping(params = "getFiles")
	@ResponseBody
	public AjaxJson getFiles(String id){
		List<CgUploadEntity> uploadBeans = cgFormFieldService.findByProperty(CgUploadEntity.class, "cgformId", id);
		List<Map<String,Object>> files = new ArrayList<Map<String,Object>>(0);
		for(CgUploadEntity b:uploadBeans){
			String title = b.getAttachmenttitle();//附件名
			String fileKey = b.getId();//附件主键
			String path = b.getRealpath();//附件路径
			String field = b.getCgformField();//表单中作为附件控件的字段
			Map<String, Object> file = new HashMap<String, Object>();
			file.put("title", title);
			file.put("fileKey", fileKey);
			file.put("path", path);
			file.put("field", field==null?"":field);
			files.add(file);
		}
		AjaxJson j = new AjaxJson();
		j.setObj(files);
		return j;
	}
	/**
	 * 获取图片流/获取文件用于下载
	 * @param response
	 * @param request
	 * @throws Exception
	 */
	@RequestMapping(params="downzipFile",method = RequestMethod.GET)
	public void downzipFile(HttpServletResponse response,HttpServletRequest request) throws Exception{
		String id=request.getParameter("id");
		TestFilestoreEntity t = testFilestoreService.get(TestFilestoreEntity.class, id);
		String ctxPath = ResourceUtil.getConfigByName("webUploadpath");
		
		String[] jzbghList = t.getJzbgh().split(",");
		String[] fzbhgList = t.getFzbhgqk().split(",");
		String[] sxbghList = t.getSxbgh().split(",");
		String[] sxbbgbgList = t.getSxbhgqk().split(",");
		String[] threebgList = t.getThreebg().split(",");
		String[] dcplList = t.getDcplzlfxbg().split(",");
		String[] sjjdbgList = t.getSjjdbg().split(",");
		String[] jdbgbhList = t.getJdbgbh().split(",");
		String[] sjjdmlList = t.getSjjdml().split(",");
		String[] yhpsyjList = t.getYhpsyj().split(",");
		String[] zlpsList = t.getZlps().split(",");
		String[] esdList = t.getEsd().split(",");
		String[] kssList = t.getKss().split(",");
		String[] zjlList = t.getZjl().split(",");
		String[] dlzList = t.getDlz().split(",");
		String[] smhsqList = t.getSmhsq().split(",");
		String[] shsqList = t.getShsq().split(",");
		String[] dpaList = t.getDpabgh().split(",");
		
		String[] dbpathList =  UtilValidate.concatAll(jzbghList, fzbhgList,sxbghList,sxbbgbgList,
				threebgList,dcplList,sjjdbgList,jdbgbhList,sjjdmlList,yhpsyjList,zlpsList,esdList,
				kssList,zjlList,dlzList,smhsqList,shsqList,dpaList);
		InputStream ins = null;
		BufferedInputStream bins = null;
		OutputStream outs = null;
		BufferedOutputStream bouts = null;
		File file = null;
		try {
			if(dbpathList!=null && dbpathList.length>=0){
				List<String> pathList = new ArrayList<String>();
				for (String subpath : dbpathList) {
					pathList.add(ctxPath+File.separator+subpath);
				}
				String zipfileName=t.getXh()+"_"+t.getPc()+"_"+DateUtils.formatDate(new Date(),"yyyy-MM-dd")+".zip";
				String user = ResourceUtil.getSessionUser().getUserName();
				String path = request.getServletContext().getRealPath("/")+user+zipfileName;//zip临时目录
				ZipUtil.compress(pathList, path);
				file = new File(path);
				if(file.exists()){
					ins = new FileInputStream(path);
					bins = new BufferedInputStream(ins);
					//去掉路径结尾逗号
					response.setContentType("application/x-msdownload;charset=utf-8");
					response.setHeader("Content-disposition", "attachment; filename=" + zipfileName);
					outs = response.getOutputStream();
					bouts = new BufferedOutputStream(outs);
					int bytesRead = 0;
					byte[] buffer = new byte[8192];
					//开始向网络传输流
					while((bytesRead = bins.read(buffer,0,buffer.length)) != -1){
						bouts.write(buffer, 0, bytesRead);
					}
					bouts.flush();
				}
			}
		} catch (Exception e) {
			logger.info("全部下载出问题了");
		}finally{
			if(ins!=null){
				ins.close();
			}
			if(bins!=null){
				bins.close();
			}
			if(outs!=null){
				outs.close();
			}
			if(bouts!=null){
				bouts.close();
			}
			if(file!=null){
				file.delete();//删除临时zip文件
			}
		}
		
	}
}
