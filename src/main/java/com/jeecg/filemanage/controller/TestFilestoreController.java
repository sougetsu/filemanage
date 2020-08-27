package com.jeecg.filemanage.controller;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
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
import org.jeecgframework.jwt.util.UtilValidate;
import org.jeecgframework.poi.excel.ExcelImportUtil;
import org.jeecgframework.poi.excel.entity.ExportParams;
import org.jeecgframework.poi.excel.entity.ImportParams;
import org.jeecgframework.poi.excel.entity.vo.NormalExcelConstants;
import org.jeecgframework.tag.core.easyui.TagUtil;
import org.jeecgframework.web.cgform.entity.upload.CgUploadEntity;
import org.jeecgframework.web.cgform.service.config.CgFormFieldServiceI;
import org.jeecgframework.web.system.pojo.base.DictionaryInfo;
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

import com.jeecg.bcsxxx.entity.SubcontractBcsxxxEntity;
import com.jeecg.cqfyxx.entity.SubcontractCqfxxxEntity;
import com.jeecg.csbhgqk.entity.SubcontractCsbhgqkEntity;
import com.jeecg.ddsqbg.entity.SubcontractDdsqbgEntity;
import com.jeecg.dpa.entity.SubcontractDpaEntity;
import com.jeecg.filemanage.entity.TestFilestoreEntity;
import com.jeecg.filemanage.page.TestFilestorePage;
import com.jeecg.filemanage.service.TestFilestoreServiceI;
import com.jeecg.fzbhgqk.entity.SubcontractFzbhgqkEntity;
import com.jeecg.jianzhi.entity.SubcontractJianzhiEntity;
import com.jeecg.materialmanage.entity.FileRawMaterialEntity;
import com.jeecg.materialmanage.service.FileRawMaterialServiceI;
import com.jeecg.productinfo.entity.CerProductInfoEntity;
import com.jeecg.sxbhgqk.entity.SubcontractSxbhgqkEntity;
import com.jeecg.ysxx.entity.SubcontractYsxxEntity;
/**   
 * @Title: Controller
 * @Description: 文件管理
 * @author onlineGenerator
 * @date 2020-08-23 13:28:42
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
	
	@Autowired
	private FileRawMaterialServiceI fileRawMaterialService;
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
		AjaxJson j = new AjaxJson();
		testFilestore = systemService.getEntity(TestFilestoreEntity.class, testFilestore.getId());
		String message = "文件管理删除成功";
		try{
			testFilestoreService.delMain(testFilestore);
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
		AjaxJson j = new AjaxJson();
		String message = "文件管理删除成功";
		try{
			for(String id:ids.split(",")){
				TestFilestoreEntity testFilestore = systemService.getEntity(TestFilestoreEntity.class,
				id
				);
				testFilestoreService.delMain(testFilestore);
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
	public AjaxJson doAdd(TestFilestoreEntity testFilestore,TestFilestorePage testFilestorePage, HttpServletRequest request) {
		List<SubcontractYsxxEntity> subcontractYsxxList =  testFilestorePage.getSubcontractYsxxList();
		List<SubcontractCqfxxxEntity> subcontractCqfxxxList =  testFilestorePage.getSubcontractCqfxxxList();
		List<SubcontractBcsxxxEntity> subcontractBcsxxxList =  testFilestorePage.getSubcontractBcsxxxList();
		List<SubcontractDdsqbgEntity> subcontractDdsqbgList =  testFilestorePage.getSubcontractDdsqbgList();
		List<SubcontractDpaEntity> subcontractDpaList =  testFilestorePage.getSubcontractDpaList();
		List<SubcontractJianzhiEntity> subcontractJianzhiList =  testFilestorePage.getSubcontractJianzhiList();
		List<SubcontractCsbhgqkEntity> subcontractCsbhgqkList =  testFilestorePage.getSubcontractCsbhgqkList();
		List<SubcontractFzbhgqkEntity> subcontractFzbhgqkList =  testFilestorePage.getSubcontractFzbhgqkList();
		List<SubcontractSxbhgqkEntity> subcontractSxbhgqkList =  testFilestorePage.getSubcontractSxbhgqkList();
		AjaxJson j = new AjaxJson();
		String message = "添加成功";
		try{
			testFilestoreService.addMain(testFilestore, subcontractYsxxList,subcontractCqfxxxList,subcontractBcsxxxList,subcontractDdsqbgList,subcontractDpaList,subcontractJianzhiList,subcontractCsbhgqkList,subcontractFzbhgqkList,subcontractSxbhgqkList);
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
	public AjaxJson doUpdate(TestFilestoreEntity testFilestore,TestFilestorePage testFilestorePage, HttpServletRequest request) {
		List<SubcontractYsxxEntity> subcontractYsxxList =  testFilestorePage.getSubcontractYsxxList();
		List<SubcontractCqfxxxEntity> subcontractCqfxxxList =  testFilestorePage.getSubcontractCqfxxxList();
		List<SubcontractBcsxxxEntity> subcontractBcsxxxList =  testFilestorePage.getSubcontractBcsxxxList();
		List<SubcontractDdsqbgEntity> subcontractDdsqbgList =  testFilestorePage.getSubcontractDdsqbgList();
		List<SubcontractDpaEntity> subcontractDpaList =  testFilestorePage.getSubcontractDpaList();
		List<SubcontractJianzhiEntity> subcontractJianzhiList =  testFilestorePage.getSubcontractJianzhiList();
		List<SubcontractCsbhgqkEntity> subcontractCsbhgqkList =  testFilestorePage.getSubcontractCsbhgqkList();
		List<SubcontractFzbhgqkEntity> subcontractFzbhgqkList =  testFilestorePage.getSubcontractFzbhgqkList();
		List<SubcontractSxbhgqkEntity> subcontractSxbhgqkList =  testFilestorePage.getSubcontractSxbhgqkList();
		AjaxJson j = new AjaxJson();
		String message = "更新成功";
		try{
			testFilestoreService.updateMain(testFilestore, subcontractYsxxList,subcontractCqfxxxList,subcontractBcsxxxList,subcontractDdsqbgList,subcontractDpaList,subcontractJianzhiList,subcontractCsbhgqkList,subcontractFzbhgqkList,subcontractSxbhgqkList);
			systemService.addLog(message, Globals.Log_Type_UPDATE, Globals.Log_Leavel_INFO);
		}catch(Exception e){
			e.printStackTrace();
			message = "更新文件管理失败";
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
	 * 文件管理编辑页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "goDownload")
	public ModelAndView goDownload(TestFilestoreEntity testFilestore, HttpServletRequest req) {
		if (StringUtil.isNotEmpty(testFilestore.getId())) {
			testFilestore = testFilestoreService.getEntity(TestFilestoreEntity.class, testFilestore.getId());
			req.setAttribute("testFilestorePage", testFilestore);
			
			//圆片附件
			String ypFileList = "";
			String yphql = "from FileRawMaterialEntity where 1 = 1 AND model = ? AND inspectionLot= ? ";
			List<FileRawMaterialEntity> ypEntityList  = systemService.findHql(yphql,testFilestore.getYph(),testFilestore.getYppc());
			if(UtilValidate.isNotEmpty(ypEntityList))
			{
				ypFileList = ypEntityList.get(0).getFileattach();
			}
			req.setAttribute("yphFile", ypFileList);
			//外壳附件
			String wkFileList = "";
			String wkhql = "from FileRawMaterialEntity where 1 = 1 AND model = ? AND inspectionLot= ? ";
			List<FileRawMaterialEntity> wkEntityList = systemService.findHql(wkhql,testFilestore.getWjxh(),testFilestore.getWkjypc());
			if(UtilValidate.isNotEmpty(wkEntityList))
			{
				wkFileList = wkEntityList.get(0).getFileattach();
			}
			req.setAttribute("wkFile", wkFileList);
			
			//盖板附件
			String gbFileList = "";
			String gbhql = "from FileRawMaterialEntity where 1 = 1 AND model = ? AND inspectionLot= ? ";
			List<FileRawMaterialEntity> gbEntityList = systemService.findHql(gbhql,testFilestore.getGbxh(),testFilestore.getGbjypc()); 
			if(UtilValidate.isNotEmpty(gbEntityList))
			{
				gbFileList = gbEntityList.get(0).getFileattach();
			}
			req.setAttribute("gbFile", gbFileList);
			
			//键合丝附件
			String jhsFileList = "";
			String jhshql = "from FileRawMaterialEntity where 1 = 1 AND model = ? AND inspectionLot= ? ";
			List<FileRawMaterialEntity> jhsEntityList = systemService.findHql(jhshql,testFilestore.getJhsxh(),testFilestore.getJhsjypc());
			if(UtilValidate.isNotEmpty(jhsEntityList))
			{
				jhsFileList = jhsEntityList.get(0).getFileattach();
			}
			req.setAttribute("jhsFile", jhsFileList);
			
			//粘片胶附件
			String zpjFileList = "";
			String zpjhql = "from FileRawMaterialEntity where 1 = 1 AND model = ? AND inspectionLot= ? ";
			List<FileRawMaterialEntity> zpjEntityList = systemService.findHql(zpjhql,testFilestore.getZpjxh(),testFilestore.getZpjyjpc());
			if(UtilValidate.isNotEmpty(zpjEntityList))
			{
				zpjFileList = zpjEntityList.get(0).getFileattach();
			}
			req.setAttribute("gzpjFile",zpjFileList);
			
			//打标墨附件
			String dbmFileList = "";
			String dbmhql = "from FileRawMaterialEntity where 1 = 1 AND model = ? AND inspectionLot= ? ";
			List<FileRawMaterialEntity> dbmEntityList = systemService.findHql(dbmhql,testFilestore.getDbmxh(),testFilestore.getDbmjypc());
			if(UtilValidate.isNotEmpty(dbmEntityList))
			{
				dbmFileList = dbmEntityList.get(0).getFileattach();
			}
			req.setAttribute("dbmFile", dbmFileList);	
		}
		return new ModelAndView("com/jeecg/filemanage/testFilestore-download");
	}
	
	/**
	 * 加载明细列表[验收信息]
	 * 
	 * @return
	 */
	@RequestMapping(params = "subcontractYsxxList")
	public ModelAndView subcontractYsxxList(TestFilestoreEntity testFilestore, HttpServletRequest req) {
	
		//===================================================================================
		//获取参数
		Object id0 = testFilestore.getId();
		//===================================================================================
		//查询-验收信息
	    String hql0 = "from SubcontractYsxxEntity where 1 = 1 AND fileid = ? ";
	    try{
	    	List<SubcontractYsxxEntity> subcontractYsxxEntityList = systemService.findHql(hql0,id0);
			req.setAttribute("subcontractYsxxList", subcontractYsxxEntityList);
		}catch(Exception e){
			logger.info(e.getMessage());
		}
		return new ModelAndView("com/jeecg/ysxx/subcontractYsxxList");
	}
	/**
	 * 加载明细列表[超期复验信息]
	 * 
	 * @return
	 */
	@RequestMapping(params = "subcontractCqfxxxList")
	public ModelAndView subcontractCqfxxxList(TestFilestoreEntity testFilestore, HttpServletRequest req) {
	
		//===================================================================================
		//获取参数
		Object id1 = testFilestore.getId();
		//===================================================================================
		//查询-超期复验信息
	    String hql1 = "from SubcontractCqfxxxEntity where 1 = 1 AND fileid = ? ";
	    try{
	    	List<SubcontractCqfxxxEntity> subcontractCqfxxxEntityList = systemService.findHql(hql1,id1);
			req.setAttribute("subcontractCqfxxxList", subcontractCqfxxxEntityList);
		}catch(Exception e){
			logger.info(e.getMessage());
		}
		return new ModelAndView("com/jeecg/cqfyxx/subcontractCqfxxxList");
	}
	/**
	 * 加载明细列表[补充筛选信息]
	 * 
	 * @return
	 */
	@RequestMapping(params = "subcontractBcsxxxList")
	public ModelAndView subcontractBcsxxxList(TestFilestoreEntity testFilestore, HttpServletRequest req) {
	
		//===================================================================================
		//获取参数
		Object id2 = testFilestore.getId();
		//===================================================================================
		//查询-补充筛选信息
	    String hql2 = "from SubcontractBcsxxxEntity where 1 = 1 AND fileid = ? ";
	    try{
	    	List<SubcontractBcsxxxEntity> subcontractBcsxxxEntityList = systemService.findHql(hql2,id2);
			req.setAttribute("subcontractBcsxxxList", subcontractBcsxxxEntityList);
		}catch(Exception e){
			logger.info(e.getMessage());
		}
		return new ModelAndView("com/jeecg/bcsxxx/subcontractBcsxxxList");
	}
	/**
	 * 加载明细列表[单独水汽报告]
	 * 
	 * @return
	 */
	@RequestMapping(params = "subcontractDdsqbgList")
	public ModelAndView subcontractDdsqbgList(TestFilestoreEntity testFilestore, HttpServletRequest req) {
	
		//===================================================================================
		//获取参数
		Object id3 = testFilestore.getId();
		//===================================================================================
		//查询-单独水汽报告
	    String hql3 = "from SubcontractDdsqbgEntity where 1 = 1 AND fileid = ? ";
	    try{
	    	List<SubcontractDdsqbgEntity> subcontractDdsqbgEntityList = systemService.findHql(hql3,id3);
			req.setAttribute("subcontractDdsqbgList", subcontractDdsqbgEntityList);
		}catch(Exception e){
			logger.info(e.getMessage());
		}
		return new ModelAndView("com/jeecg/ddsqbg/subcontractDdsqbgList");
	}
	/**
	 * 加载明细列表[dpa]
	 * 
	 * @return
	 */
	@RequestMapping(params = "subcontractDpaList")
	public ModelAndView subcontractDpaList(TestFilestoreEntity testFilestore, HttpServletRequest req) {
	
		//===================================================================================
		//获取参数
		Object id4 = testFilestore.getId();
		//===================================================================================
		//查询-dpa
	    String hql4 = "from SubcontractDpaEntity where 1 = 1 AND fileid = ? ";
	    try{
	    	List<SubcontractDpaEntity> subcontractDpaEntityList = systemService.findHql(hql4,id4);
			req.setAttribute("subcontractDpaList", subcontractDpaEntityList);
		}catch(Exception e){
			logger.info(e.getMessage());
		}
		return new ModelAndView("com/jeecg/dpa/subcontractDpaList");
	}
	/**
	 * 加载明细列表[监制]
	 * 
	 * @return
	 */
	@RequestMapping(params = "subcontractJianzhiList")
	public ModelAndView subcontractJianzhiList(TestFilestoreEntity testFilestore, HttpServletRequest req) {
	
		//===================================================================================
		//获取参数
		Object id5 = testFilestore.getId();
		//===================================================================================
		//查询-监制
	    String hql5 = "from SubcontractJianzhiEntity where 1 = 1 AND fileid = ? ";
	    try{
	    	List<SubcontractJianzhiEntity> subcontractJianzhiEntityList = systemService.findHql(hql5,id5);
			req.setAttribute("subcontractJianzhiList", subcontractJianzhiEntityList);
		}catch(Exception e){
			logger.info(e.getMessage());
		}
		return new ModelAndView("com/jeecg/jianzhi/subcontractJianzhiList");
	}
	/**
	 * 加载明细列表[测试不合格情况]
	 * 
	 * @return
	 */
	@RequestMapping(params = "subcontractCsbhgqkList")
	public ModelAndView subcontractCsbhgqkList(TestFilestoreEntity testFilestore, HttpServletRequest req) {
	
		//===================================================================================
		//获取参数
		Object id6 = testFilestore.getId();
		//===================================================================================
		//查询-测试不合格情况
	    String hql6 = "from SubcontractCsbhgqkEntity where 1 = 1 AND fileid = ? ";
	    try{
	    	List<SubcontractCsbhgqkEntity> subcontractCsbhgqkEntityList = systemService.findHql(hql6,id6);
			req.setAttribute("subcontractCsbhgqkList", subcontractCsbhgqkEntityList);
		}catch(Exception e){
			logger.info(e.getMessage());
		}
		return new ModelAndView("com/jeecg/csbhgqk/subcontractCsbhgqkList");
	}
	/**
	 * 加载明细列表[封装不合格情况]
	 * 
	 * @return
	 */
	@RequestMapping(params = "subcontractFzbhgqkList")
	public ModelAndView subcontractFzbhgqkList(TestFilestoreEntity testFilestore, HttpServletRequest req) {
	
		//===================================================================================
		//获取参数
		Object id7 = testFilestore.getId();
		//===================================================================================
		//查询-封装不合格情况
	    String hql7 = "from SubcontractFzbhgqkEntity where 1 = 1 AND fileid = ? ";
	    try{
	    	List<SubcontractFzbhgqkEntity> subcontractFzbhgqkEntityList = systemService.findHql(hql7,id7);
			req.setAttribute("subcontractFzbhgqkList", subcontractFzbhgqkEntityList);
		}catch(Exception e){
			logger.info(e.getMessage());
		}
		return new ModelAndView("com/jeecg/fzbhgqk/subcontractFzbhgqkList");
	}
	/**
	 * 加载明细列表[筛选不合格情况]
	 * 
	 * @return
	 */
	@RequestMapping(params = "subcontractSxbhgqkList")
	public ModelAndView subcontractSxbhgqkList(TestFilestoreEntity testFilestore, HttpServletRequest req) {
	
		//===================================================================================
		//获取参数
		Object id8 = testFilestore.getId();
		//===================================================================================
		//查询-筛选不合格情况
	    String hql8 = "from SubcontractSxbhgqkEntity where 1 = 1 AND fileid = ? ";
	    try{
	    	List<SubcontractSxbhgqkEntity> subcontractSxbhgqkEntityList = systemService.findHql(hql8,id8);
			req.setAttribute("subcontractSxbhgqkList", subcontractSxbhgqkEntityList);
		}catch(Exception e){
			logger.info(e.getMessage());
		}
		return new ModelAndView("com/jeecg/sxbhgqk/subcontractSxbhgqkList");
	}

    /**
    * 导出excel
    *
    * @param request
    * @param response
    */
    @RequestMapping(params = "exportXls")
    public String exportXls(TestFilestoreEntity testFilestore,HttpServletRequest request, HttpServletResponse response, DataGrid dataGrid,ModelMap map) {
    	CriteriaQuery cq = new CriteriaQuery(TestFilestoreEntity.class, dataGrid);
    	//查询条件组装器
    	org.jeecgframework.core.extend.hqlsearch.HqlGenerateUtil.installHql(cq, testFilestore);
    	try{
    	//自定义追加查询条件
    	}catch (Exception e) {
    		throw new BusinessException(e.getMessage());
    	}
    	cq.add();
    	List<TestFilestoreEntity> list=this.testFilestoreService.getListByCriteriaQuery(cq, false);
    	List<TestFilestorePage> pageList=new ArrayList<TestFilestorePage>();
        if(list!=null&&list.size()>0){
        	for(TestFilestoreEntity entity:list){
        		try{
        		TestFilestorePage page=new TestFilestorePage();
        		   MyBeanUtils.copyBeanNotNull2Bean(entity,page);
            	    Object id0 = entity.getId();
				    String hql0 = "from SubcontractYsxxEntity where 1 = 1 AND fileid = ? ";
        	        List<SubcontractYsxxEntity> subcontractYsxxEntityList = systemService.findHql(hql0,id0);
            		page.setSubcontractYsxxList(subcontractYsxxEntityList);
            	    Object id1 = entity.getId();
				    String hql1 = "from SubcontractCqfxxxEntity where 1 = 1 AND fileid = ? ";
        	        List<SubcontractCqfxxxEntity> subcontractCqfxxxEntityList = systemService.findHql(hql1,id1);
            		page.setSubcontractCqfxxxList(subcontractCqfxxxEntityList);
            	    Object id2 = entity.getId();
				    String hql2 = "from SubcontractBcsxxxEntity where 1 = 1 AND fileid = ? ";
        	        List<SubcontractBcsxxxEntity> subcontractBcsxxxEntityList = systemService.findHql(hql2,id2);
            		page.setSubcontractBcsxxxList(subcontractBcsxxxEntityList);
            	    Object id3 = entity.getId();
				    String hql3 = "from SubcontractDdsqbgEntity where 1 = 1 AND fileid = ? ";
        	        List<SubcontractDdsqbgEntity> subcontractDdsqbgEntityList = systemService.findHql(hql3,id3);
            		page.setSubcontractDdsqbgList(subcontractDdsqbgEntityList);
            	    Object id4 = entity.getId();
				    String hql4 = "from SubcontractDpaEntity where 1 = 1 AND fileid = ? ";
        	        List<SubcontractDpaEntity> subcontractDpaEntityList = systemService.findHql(hql4,id4);
            		page.setSubcontractDpaList(subcontractDpaEntityList);
            	    Object id5 = entity.getId();
				    String hql5 = "from SubcontractJianzhiEntity where 1 = 1 AND fileid = ? ";
        	        List<SubcontractJianzhiEntity> subcontractJianzhiEntityList = systemService.findHql(hql5,id5);
            		page.setSubcontractJianzhiList(subcontractJianzhiEntityList);
            	    Object id6 = entity.getId();
				    String hql6 = "from SubcontractCsbhgqkEntity where 1 = 1 AND fileid = ? ";
        	        List<SubcontractCsbhgqkEntity> subcontractCsbhgqkEntityList = systemService.findHql(hql6,id6);
            		page.setSubcontractCsbhgqkList(subcontractCsbhgqkEntityList);
            	    Object id7 = entity.getId();
				    String hql7 = "from SubcontractFzbhgqkEntity where 1 = 1 AND fileid = ? ";
        	        List<SubcontractFzbhgqkEntity> subcontractFzbhgqkEntityList = systemService.findHql(hql7,id7);
            		page.setSubcontractFzbhgqkList(subcontractFzbhgqkEntityList);
            	    Object id8 = entity.getId();
				    String hql8 = "from SubcontractSxbhgqkEntity where 1 = 1 AND fileid = ? ";
        	        List<SubcontractSxbhgqkEntity> subcontractSxbhgqkEntityList = systemService.findHql(hql8,id8);
            		page.setSubcontractSxbhgqkList(subcontractSxbhgqkEntityList);
            		pageList.add(page);
            	}catch(Exception e){
            		logger.info(e.getMessage());
            	}
            }
        }
        map.put(NormalExcelConstants.FILE_NAME,"文件管理");
        map.put(NormalExcelConstants.CLASS,TestFilestorePage.class);
        map.put(NormalExcelConstants.PARAMS,new ExportParams("文件管理列表", "导出人:Jeecg",
            "导出信息"));
        map.put(NormalExcelConstants.DATA_LIST,pageList);
        return NormalExcelConstants.JEECG_EXCEL_VIEW;
	}

    /**
	 * 通过excel导入数据
	 * @param request
	 * @param
	 * @return
	 */
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
			params.setHeadRows(2);
			params.setNeedSave(true);
			try {
				List<TestFilestorePage> list =  ExcelImportUtil.importExcel(file.getInputStream(), TestFilestorePage.class, params);
				TestFilestoreEntity entity1=null;
				for (TestFilestorePage page : list) {
					entity1=new TestFilestoreEntity();
					MyBeanUtils.copyBeanNotNull2Bean(page,entity1);
		            testFilestoreService.addMain(entity1, page.getSubcontractYsxxList(),page.getSubcontractCqfxxxList(),page.getSubcontractBcsxxxList(),page.getSubcontractDdsqbgList(),page.getSubcontractDpaList(),page.getSubcontractJianzhiList(),page.getSubcontractCsbhgqkList(),page.getSubcontractFzbhgqkList(),page.getSubcontractSxbhgqkList());
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
	* 导出excel 使模板
	*/
	@RequestMapping(params = "exportXlsByT")
	public String exportXlsByT(ModelMap map) {
		map.put(NormalExcelConstants.FILE_NAME,"文件管理");
		map.put(NormalExcelConstants.CLASS,TestFilestorePage.class);
		map.put(NormalExcelConstants.PARAMS,new ExportParams("文件管理列表", "导出人:"+ ResourceUtil.getSessionUser().getRealName(),
		"导出信息"));
		map.put(NormalExcelConstants.DATA_LIST,new ArrayList());
		return NormalExcelConstants.JEECG_EXCEL_VIEW;
	}
	/**
	* 导入功能跳转
	*
	* @return
	*/
	@RequestMapping(params = "upload")
	public ModelAndView upload(HttpServletRequest req) {
		req.setAttribute("controller_name", "testFilestoreController");
		return new ModelAndView("common/upload/pub_excel_upload");
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
	 * 获得产品型号
	 * @param request
	 * @return List<DictionaryInfo> 对象列表
	 */
	@RequestMapping(params = "getCpxhList")
	@ResponseBody
	public List<DictionaryInfo> getProjectList(HttpServletRequest request) {
		List<DictionaryInfo> result = new ArrayList<DictionaryInfo>();
		String sql  = "select distinct xh from test_filestore";
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
	 *  根据产品型号获得产品批次
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
		String sql  = "select distinct pc from test_filestore where xh= '" + proCpxh+"'";
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
	 * 根据产品批次获得产品基本信息
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
		CriteriaQuery cq = new CriteriaQuery(TestFilestoreEntity.class,new DataGrid());
		TestFilestoreEntity ssle = new TestFilestoreEntity();
		//查询条件组装器
		org.jeecgframework.core.extend.hqlsearch.HqlGenerateUtil.installHql(cq, ssle, request.getParameterMap());
		try{
		//自定义追加查询条件
			cq.add(Restrictions.eq("xh", proCpxh));
			cq.add(Restrictions.eq("pc", proCppc));
		}catch (Exception e) {  
			throw new BusinessException(e.getMessage());
		}
		List<TestFilestoreEntity> list = this.testFilestoreService
				.getListByCriteriaQuery(cq, false);
		j.setObj(list);
		j.setMsg(message);
		return j;
	}
}
