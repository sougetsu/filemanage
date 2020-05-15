package com.jeecg.plan.controller;
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
import org.jeecgframework.web.system.pojo.base.TSRole;
import org.jeecgframework.web.system.pojo.base.TSRoleUser;
import org.jeecgframework.web.system.pojo.base.TSUser;
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

import com.jeecg.plan.entity.SubcontractPlanEntity;
import com.jeecg.plan.service.SubcontractPlanServiceI;
import com.jeecg.plan.vo.SubcontractPlanVO;

import net.sf.json.JSONObject;

/**   
 * @Title: Controller  
 * @Description: 外协计划表
 * @author onlineGenerator
 * @date 2019-04-14 14:54:01
 * @version V1.0   
 *
 */
@Controller
@RequestMapping("/subcontractPlanController")
public class SubcontractPlanController extends BaseController {
	private static final Logger logger = LoggerFactory.getLogger(SubcontractPlanController.class);

	@Autowired
	private SubcontractPlanServiceI subcontractPlanService;
	@Autowired
	private SystemService systemService;
	


	/**
	 * 外协计划表列表 页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "list")
	public ModelAndView list(HttpServletRequest request) {
		return new ModelAndView("com/jeecg/plan/subcontractPlanList");
	}
	
	@RequestMapping(value = "loadPlanData")
	@ResponseBody
	public Object loadPlanData(String keyword,HttpServletRequest request) {
		TSUser user = ResourceUtil.getSessionUser();
		String roles = "";
		List<TSRoleUser> rUsers = systemService.findByProperty(TSRoleUser.class, "TSUser.id", user.getId());
		for (TSRoleUser ru : rUsers) {
			TSRole role = ru.getTSRole();
			roles += role.getRoleName() + ",";
		}
		String sql = "";
		if(roles.indexOf("科研生产人员")!=-1 || roles.indexOf("检验处人员")!=-1){
			sql = "select plan_no,dlxh,DATE_FORMAT(plan_date,'%Y-%m-%d') as plan_date,plan_num,plies_num,size,supplier from subcontract_plan "
					+ " where status=0 ";
		}else{
			sql = "select plan_no,dlxh,DATE_FORMAT(plan_date,'%Y-%m-%d') as plan_date,plan_num,plies_num,size,supplier from subcontract_plan "
					+ " where status=0 and sys_org_code = '" + user.getDepartid() +"'";
		}
		JSONObject object = new JSONObject();
		object.put("message", "");
		try {
			List<Map<String,Object>> data = this.systemService.findForJdbc(sql);
			for (Map<String, Object> map : data) {
				for (String key : map.keySet()) {
					if(null == map.get(key)){
						map.put(key,"");
					}
				}
			}
			net.sf.json.JSONArray array = net.sf.json.JSONArray.fromObject(data);
			object.put("value", array);
			object.put("code", 200);
		} catch (Exception e) {
			e.printStackTrace();
		}
		object.put("redirect", "");
		return object;
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
	public void datagrid(SubcontractPlanEntity subcontractPlan,HttpServletRequest request, HttpServletResponse response, DataGrid dataGrid) {
		CriteriaQuery cq = new CriteriaQuery(SubcontractPlanEntity.class, dataGrid);
		//查询条件组装器
		org.jeecgframework.core.extend.hqlsearch.HqlGenerateUtil.installHql(cq, subcontractPlan, request.getParameterMap());
		String roles = "";
		try{
		//自定义追加查询条件
			//自定义追加查询条件
			TSUser user = ResourceUtil.getSessionUser();
			
			List<TSRoleUser> rUsers = systemService.findByProperty(TSRoleUser.class, "TSUser.id", user.getId());
			for (TSRoleUser ru : rUsers) {
				TSRole role = ru.getTSRole();
				roles += role.getRoleName() + ",";
			}
			if(roles.indexOf("部门主任")!=-1){
				cq.add(Restrictions.eq("status", "0"));
				cq.add(Restrictions.eq("sysOrgCode", user.getDepartid()));
			}else if(roles.indexOf("部门设计人员")!=-1){
				cq.add(Restrictions.eq("status", "0"));
				cq.add(Restrictions.eq("createBy", user.getUserName()));
			}
		}catch (Exception e) {
			throw new BusinessException(e.getMessage());
		}
		cq.add();
		this.subcontractPlanService.getDataGridReturn(cq, true);
		List<SubcontractPlanEntity> sae = dataGrid.getResults();
		String filed = dataGrid.getField();
		filed = filed+"confirmState,controlState,";
		int countnum = dataGrid.getRows();
		List<SubcontractPlanVO> savoList = new ArrayList<SubcontractPlanVO>();
		try{
			for (SubcontractPlanEntity subcontractPlanEntity : sae) {
				SubcontractPlanVO savo = new SubcontractPlanVO();
				MyBeanUtils.copyBeanNotNull2Bean(subcontractPlanEntity, savo);
				if(roles.indexOf("部门主任")!=-1){
					if("2".equals(savo.getBpmStatus()) || "21".equals(savo.getBpmStatus()))
					{
						savo.setConfirmState(1);
					}
				}else if(roles.indexOf("科研生产人员")!=-1){
					savo.setControlState(1);
					if("3".equals(savo.getBpmStatus()))
					{
						savo.setConfirmState(1);
						
					}
				}
				savoList.add(savo);
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new BusinessException(e.getMessage());
		}
		dataGrid.clear();
		dataGrid.setResults(savoList);
		dataGrid.setRows(countnum);
		dataGrid.setField(filed);
		TagUtil.datagrid(response, dataGrid);
	}
	
	/**
	 * 删除外协计划表
	 * 
	 * @return
	 */
	@RequestMapping(params = "doDel")
	@ResponseBody
	public AjaxJson doDel(SubcontractPlanEntity subcontractPlan, HttpServletRequest request) {
		String message = null;
		AjaxJson j = new AjaxJson();
		subcontractPlan = systemService.getEntity(SubcontractPlanEntity.class, subcontractPlan.getId());
		message = "外协计划表删除成功";
		try{
			//subcontractPlanService.delete(subcontractPlan);
			subcontractPlan.setStatus("1");
			subcontractPlanService.saveOrUpdate(subcontractPlan);
			systemService.addLog(message, Globals.Log_Type_DEL, Globals.Log_Leavel_INFO);
		}catch(Exception e){
			e.printStackTrace();
			message = "外协计划表删除失败";
			throw new BusinessException(e.getMessage());
		}
		j.setMsg(message);
		return j;
	}
	
	/**
	 * 启用外协计划表
	 * 
	 * @return
	 */
	@RequestMapping(params = "doActive")
	@ResponseBody
	public AjaxJson doActive(SubcontractPlanEntity subcontractPlan, HttpServletRequest request) {
		String message = null;
		AjaxJson j = new AjaxJson();
		subcontractPlan = systemService.getEntity(SubcontractPlanEntity.class, subcontractPlan.getId());
		message = "外协计划表启用成功";
		try{
			//subcontractPlanService.delete(subcontractPlan);
			subcontractPlan.setStatus("0");
			subcontractPlanService.saveOrUpdate(subcontractPlan);
			systemService.addLog(message, Globals.Log_Type_DEL, Globals.Log_Leavel_INFO);
		}catch(Exception e){
			e.printStackTrace();
			message = "外协计划表启用失败";
			throw new BusinessException(e.getMessage());
		}
		j.setMsg(message);
		return j;
	}
	
	/**
	 * 批量删除外协计划表
	 * 
	 * @return
	 */
	 @RequestMapping(params = "doBatchDel")
	@ResponseBody
	public AjaxJson doBatchDel(String ids,HttpServletRequest request){
		String message = null;
		AjaxJson j = new AjaxJson();
		message = "外协计划表删除成功";
		try{
			for(String id:ids.split(",")){
				SubcontractPlanEntity subcontractPlan = systemService.getEntity(SubcontractPlanEntity.class, 
				id
				);
				subcontractPlan.setStatus("1");
				//subcontractPlanService.delete(subcontractPlan);
				subcontractPlanService.saveOrUpdate(subcontractPlan);
				systemService.addLog(message, Globals.Log_Type_DEL, Globals.Log_Leavel_INFO);
			}
		}catch(Exception e){
			e.printStackTrace();
			message = "外协计划表删除失败";
			throw new BusinessException(e.getMessage());
		}
		j.setMsg(message);
		return j;
	}


	/**
	 * 添加外协计划表
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping(params = "doAdd")
	@ResponseBody
	public AjaxJson doAdd(SubcontractPlanEntity subcontractPlan, HttpServletRequest request) {
		String message = null;
		AjaxJson j = new AjaxJson();
		message = "外协计划表添加成功";
		try{
			TSUser user = ResourceUtil.getSessionUser();
			String roles = "";
			List<TSRoleUser> rUsers = systemService.findByProperty(TSRoleUser.class, "TSUser.id", user.getId());
			for (TSRoleUser ru : rUsers) {
				TSRole role = ru.getTSRole();
				roles += role.getRoleName() + ",";
			}
			if(roles.indexOf("部门主任")!=-1){
				subcontractPlan.setBpmStatus("3");
			}else if(roles.indexOf("科研生产人员")!=-1 ){
				subcontractPlan.setBpmStatus("7");
			}else{
				subcontractPlan.setBpmStatus("2");
			}
			String planlsh = subcontractPlanService.getPlanLsh();
			subcontractPlan.setStatus("0");
			subcontractPlan.setPlanNo(planlsh);
			subcontractPlanService.save(subcontractPlan);
			systemService.addLog(message, Globals.Log_Type_INSERT, Globals.Log_Leavel_INFO);
			
		}catch(Exception e){
			e.printStackTrace();
			message = "外协计划表添加失败";
			throw new BusinessException(e.getMessage());
		}
		j.setMsg(message);
		return j;
	}
	
	/**
	 * 更新外协计划表
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping(params = "doUpdate")
	@ResponseBody
	public AjaxJson doUpdate(SubcontractPlanEntity subcontractPlan, HttpServletRequest request) {
		String message = null;
		AjaxJson j = new AjaxJson();
		message = "外协计划表更新成功";
		SubcontractPlanEntity t = subcontractPlanService.get(SubcontractPlanEntity.class, subcontractPlan.getId());
		try {
			MyBeanUtils.copyBeanNotNull2Bean(subcontractPlan, t);
			subcontractPlanService.saveOrUpdate(t);
			systemService.addLog(message, Globals.Log_Type_UPDATE, Globals.Log_Leavel_INFO);
		} catch (Exception e) {
			e.printStackTrace();
			message = "外协计划表更新失败";
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
	public AjaxJson doConfirm(SubcontractPlanEntity subcontractPlan,String confrimStatus, HttpServletRequest request) {
		String message = null;
		AjaxJson j = new AjaxJson();
		SubcontractPlanEntity t = subcontractPlanService.get(SubcontractPlanEntity.class, subcontractPlan.getId());
		TSUser user = ResourceUtil.getSessionUser();
		String roles = "";
		List<TSRoleUser> rUsers = systemService.findByProperty(TSRoleUser.class, "TSUser.id", user.getId());
		for (TSRoleUser ru : rUsers) {
			TSRole role = ru.getTSRole();
			roles += role.getRoleName() + ",";
		}
		if("1".equals(confrimStatus)){
			if(roles.indexOf("部门主任")!=-1){
				subcontractPlan.setBpmStatus("3");
			}else if(roles.indexOf("科研生产人员")!=-1 ){
				subcontractPlan.setBpmStatus("7");
			}
		}else{
			if(roles.indexOf("部门主任")!=-1){
				subcontractPlan.setBpmStatus("11");
			}else if(roles.indexOf("科研生产人员")!=-1){
				subcontractPlan.setBpmStatus("21");
			}
		}
		try {
			MyBeanUtils.copyBeanNotNull2Bean(subcontractPlan, t);
			subcontractPlanService.saveOrUpdate(t);
			message = "审核"+t.getId()+"工单"+confrimStatus;
			systemService.addLog(message, Globals.Log_Type_CONFIRM, Globals.Log_Leavel_INFO);
		} catch (Exception e) {
			e.printStackTrace();
			message = "外协加工审核失败";
			throw new BusinessException(e.getMessage());
		}
		j.setMsg(message);
		return j;
	}

	/**
	 * 外协计划表新增页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "goAdd")
	public ModelAndView goAdd(SubcontractPlanEntity subcontractPlan, HttpServletRequest req) {
		if (StringUtil.isNotEmpty(subcontractPlan.getId())) {
			subcontractPlan = subcontractPlanService.getEntity(SubcontractPlanEntity.class, subcontractPlan.getId());
			req.setAttribute("subcontractPlan", subcontractPlan);
		}
		TSUser user = ResourceUtil.getSessionUser();
		req.setAttribute("orgCode", user.getCurrentDepart().getId());
		return new ModelAndView("com/jeecg/plan/subcontractPlan-add");
	}
	/**
	 * 外协计划表编辑页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "goUpdate")
	public ModelAndView goUpdate(SubcontractPlanEntity subcontractPlan, HttpServletRequest req) {
		if (StringUtil.isNotEmpty(subcontractPlan.getId())) {
			subcontractPlan = subcontractPlanService.getEntity(SubcontractPlanEntity.class, subcontractPlan.getId());
			req.setAttribute("subcontractPlan", subcontractPlan);
		}
		return new ModelAndView("com/jeecg/plan/subcontractPlan-update");
	}
	
	/**
	 * 外协加工申请编辑页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "goConfirm")
	public ModelAndView goConfirm(SubcontractPlanEntity subcontractPlan, HttpServletRequest req) {
		if (StringUtil.isNotEmpty(subcontractPlan.getId())) {
			subcontractPlan = subcontractPlanService.getEntity(SubcontractPlanEntity.class, subcontractPlan.getId());
			req.setAttribute("subcontractPlan", subcontractPlan);
		}
		return new ModelAndView("com/jeecg/plan/subcontractPlan-confirm");
	}
	
	/**
	 * 导入功能跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "upload")
	public ModelAndView upload(HttpServletRequest req) {
		req.setAttribute("controller_name","subcontractPlanController");
		return new ModelAndView("common/upload/pub_excel_upload");
	}
	
	/**
	 * 导出excel
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(params = "exportXls")
	public String exportXls(SubcontractPlanEntity subcontractPlan,HttpServletRequest request,HttpServletResponse response
			, DataGrid dataGrid,ModelMap modelMap) {
		CriteriaQuery cq = new CriteriaQuery(SubcontractPlanEntity.class, dataGrid);
		org.jeecgframework.core.extend.hqlsearch.HqlGenerateUtil.installHql(cq, subcontractPlan, request.getParameterMap());
		List<SubcontractPlanEntity> subcontractPlans = this.subcontractPlanService.getListByCriteriaQuery(cq,false);
		modelMap.put(NormalExcelConstants.FILE_NAME,"外协计划表");
		modelMap.put(NormalExcelConstants.CLASS,SubcontractPlanEntity.class);
		modelMap.put(NormalExcelConstants.PARAMS,new ExportParams("外协计划表列表", "导出人:"+ResourceUtil.getSessionUser().getRealName(),
			"导出信息"));
		modelMap.put(NormalExcelConstants.DATA_LIST,subcontractPlans);
		return NormalExcelConstants.JEECG_EXCEL_VIEW;
	}
	/**
	 * 导出excel 使模板
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(params = "exportXlsByT")
	public String exportXlsByT(SubcontractPlanEntity subcontractPlan,HttpServletRequest request,HttpServletResponse response
			, DataGrid dataGrid,ModelMap modelMap) {
    	modelMap.put(NormalExcelConstants.FILE_NAME,"外协计划表");
    	modelMap.put(NormalExcelConstants.CLASS,SubcontractPlanEntity.class);
    	modelMap.put(NormalExcelConstants.PARAMS,new ExportParams("外协计划表列表", "导出人:"+ResourceUtil.getSessionUser().getRealName(),
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
				List<SubcontractPlanEntity> listSubcontractPlanEntitys = ExcelImportUtil.importExcel(file.getInputStream(),SubcontractPlanEntity.class,params);
				for (SubcontractPlanEntity subcontractPlan : listSubcontractPlanEntitys) {
					subcontractPlanService.save(subcontractPlan);
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
