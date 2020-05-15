package com.jeecg.inspection.controller;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
import org.jeecgframework.jwt.util.DateUtil;
import org.jeecgframework.jwt.util.UtilValidate;
import org.jeecgframework.jwt.util.doc.MDoc;
import org.jeecgframework.poi.excel.ExcelImportUtil;
import org.jeecgframework.poi.excel.entity.ExportParams;
import org.jeecgframework.poi.excel.entity.ImportParams;
import org.jeecgframework.poi.excel.entity.vo.NormalExcelConstants;
import org.jeecgframework.tag.core.easyui.TagUtil;
import org.jeecgframework.web.cgform.entity.upload.CgUploadEntity;
import org.jeecgframework.web.cgform.service.config.CgFormFieldServiceI;
import org.jeecgframework.web.system.pojo.base.TSDepart;
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

import com.jeecg.inspection.service.SubcontractInspectionServiceI;
import com.jeecg.waixieapply.entity.SubcontractApplyEntity;
import com.jeecg.waixieapply.service.SubcontractApplyServiceI;
import com.jeecg.waixieapply.vo.OperatorQueryType;
import com.jeecg.waixieapply.vo.SubcontractApplyVO;

/**   
 * @Title: Controller  
 * @Description: 检验外协加工申请
 * @author onlineGenerator
 * @date 2019-03-24 23:51:41
 * @version V1.0   
 *
 */
@Controller
@RequestMapping("/subcontractInspectionController")
public class SubcontractInspectionController extends BaseController {
	private static final Logger logger = LoggerFactory.getLogger(SubcontractInspectionController.class);

	@Autowired
	private SubcontractApplyServiceI subcontractApplyService;
	@Autowired
	private SystemService systemService;
	@Autowired
	private CgFormFieldServiceI cgFormFieldService;
	


	/**
	 * 外协加工申请列表 页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "list")
	public ModelAndView list(HttpServletRequest request) {
		return new ModelAndView("com/jeecg/inspection/subcontractInspectionList");
	}

	/**
	 * 外协加工申请列表 页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "todolist")
	public ModelAndView todolist(HttpServletRequest request) {
		return new ModelAndView("com/jeecg/inspection/subcontractInspectionTodoList");
	}
	
	/**
	 * 外协加工委托单列表 页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "wtdlist")
	public ModelAndView wtdlist(HttpServletRequest request) {
		return new ModelAndView("com/jeecg/inspection/subcontractInspectionWtdList");
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
	public void datagrid(SubcontractApplyEntity subcontractApply,HttpServletRequest request, HttpServletResponse response, DataGrid dataGrid) {
		CriteriaQuery cq = new CriteriaQuery(SubcontractApplyEntity.class, dataGrid);
		//查询条件组装器
		org.jeecgframework.core.extend.hqlsearch.HqlGenerateUtil.installHql(cq, subcontractApply, request.getParameterMap());
		String roles = "";
		TSUser user = ResourceUtil.getSessionUser();
		
		List<TSRoleUser> rUsers = systemService.findByProperty(TSRoleUser.class, "TSUser.id", user.getId());
		for (TSRoleUser ru : rUsers) {
			TSRole role = ru.getTSRole();
			roles += role.getRoleName() + ",";
		}
		cq = addWhere(cq,OperatorQueryType.AllQuery.getValue(),roles);
		cq.add();
		this.subcontractApplyService.getDataGridReturn(cq, true);
		
		List<SubcontractApplyEntity> sae = dataGrid.getResults();
		String filed = dataGrid.getField();
		filed = filed+"confirmState,completeState,";
		int countnum = dataGrid.getRows();
		
		
		List<SubcontractApplyVO> savoList  = addBussinessColum(sae,roles);
		dataGrid.clear();
		dataGrid.setResults(savoList);
		dataGrid.setRows(countnum);
		dataGrid.setField(filed);
		TagUtil.datagrid(response, dataGrid);
	}
	
	/**
	 * easyui AJAX请求数据
	 * 
	 * @param request
	 * @param response
	 * @param dataGrid
	 * @param user
	 */

	@RequestMapping(params = "tododatagrid")
	public void tododatagrid(SubcontractApplyEntity subcontractApply,HttpServletRequest request, HttpServletResponse response, DataGrid dataGrid) {
		CriteriaQuery cq = new CriteriaQuery(SubcontractApplyEntity.class, dataGrid);
		//查询条件组装器
		org.jeecgframework.core.extend.hqlsearch.HqlGenerateUtil.installHql(cq, subcontractApply, request.getParameterMap());
		String roles = "";
		TSUser user = ResourceUtil.getSessionUser();
		
		List<TSRoleUser> rUsers = systemService.findByProperty(TSRoleUser.class, "TSUser.id", user.getId());
		for (TSRoleUser ru : rUsers) {
			TSRole role = ru.getTSRole();
			roles += role.getRoleName() + ",";
		}
		cq = addWhere(cq,OperatorQueryType.SuspendingQuery.getValue(),roles);
		cq.add();
		this.subcontractApplyService.getDataGridReturn(cq, true);
		
		List<SubcontractApplyEntity> sae = dataGrid.getResults();
		String filed = dataGrid.getField();
		filed = filed+"confirmState,completeState,";
		int countnum = dataGrid.getRows();
		
		
		List<SubcontractApplyVO> savoList  = addBussinessColum(sae,roles);
		dataGrid.clear();
		dataGrid.setResults(savoList);
		dataGrid.setRows(countnum);
		dataGrid.setField(filed);
		TagUtil.datagrid(response, dataGrid);
	}
	
	/**
	 * easyui AJAX请求数据
	 * 
	 * @param request
	 * @param response
	 * @param dataGrid
	 * @param user
	 */

	@RequestMapping(params = "todonum")
	@ResponseBody
	public AjaxJson todonum(HttpServletRequest request) {
		String message = null;
		AjaxJson j = new AjaxJson();
		
		CriteriaQuery cq = new CriteriaQuery(SubcontractApplyEntity.class);
		SubcontractApplyEntity subcontractApply = new SubcontractApplyEntity();
		//查询条件组装器
		org.jeecgframework.core.extend.hqlsearch.HqlGenerateUtil.installHql(cq, subcontractApply, request.getParameterMap());
		String roles = "";
		TSUser user = ResourceUtil.getSessionUser();
		
		List<TSRoleUser> rUsers = systemService.findByProperty(TSRoleUser.class, "TSUser.id", user.getId());
		for (TSRoleUser ru : rUsers) {
			TSRole role = ru.getTSRole();
			roles += role.getRoleName() + ",";
		}
		cq = addWhere(cq,OperatorQueryType.SuspendingQuery.getValue(),roles);
		cq.add();
		List<SubcontractApplyEntity> list = this.subcontractApplyService
				.getListByCriteriaQuery(cq, false);
		int todonum = list.size();
		j.setObj(todonum);
		j.setMsg(message);
		return j;
	}
	private CriteriaQuery addWhere(CriteriaQuery cq,String type,String roles) {
		try{
			//自定义追加查询条件
			TSUser user = ResourceUtil.getSessionUser();
			//applytype 为1代表是外协，2为检验外协
			cq.add(Restrictions.eq("applytype", "2"));
			if(roles.indexOf("部门设计人员")!=-1){
				//设计人员只能查看自己名下的
				cq.add(Restrictions.eq("createBy", user.getUserName()));
				//待处理
				if(type.equals(OperatorQueryType.SuspendingQuery.getValue())) {
					cq.add(Restrictions.in("bpmStatus", new Object[] {"6","11"}));
				}
			}else if(roles.indexOf("部门调度人员")!=-1){
				//部门调度人员能查看自己部门
				cq.add(Restrictions.eq("sqbm", user.getDepartid()));
			}else if(roles.indexOf("部门主任")!=-1){
				//部门主任只能查看自己部门
				cq.add(Restrictions.eq("sqbm", user.getDepartid()));
				//待处理
				if(type.equals(OperatorQueryType.SuspendingQuery.getValue())) {
					cq.add(Restrictions.in("bpmStatus", new Object[] {"2","21"}));
				}
			}else if(roles.indexOf("科研生产人员")!=-1){
				//待处理
				if(type.equals(OperatorQueryType.SuspendingQuery.getValue())) {
					cq.add(Restrictions.in("bpmStatus", new Object[] {"3","31","32"}));
				}
			}else if(roles.indexOf("检验处人员")!=-1){
				//待处理
				if(type.equals(OperatorQueryType.SuspendingQuery.getValue())) {
					cq.add(Restrictions.in("bpmStatus", new Object[] {"8","81","82"}));
				}
			}else if(roles.indexOf("主管领导")!=-1){
				//主管领导能查看指定的多个部门
				List<Map<String, Object>> deptList = systemService.findForJdbc("select org_id as orgId from t_s_user_org where user_id=? ", user.getId());
				Object depts[] = new Object[deptList.size()];
				for (int i = 0; i < deptList.size(); i++) {
					depts[i] = deptList.get(i).get("orgId");
				}
				cq.add(Restrictions.in("sqbm", depts));
				//待处理
				if(type.equals(OperatorQueryType.SuspendingQuery.getValue())) {
					cq.add(Restrictions.in("bpmStatus", new Object[] {"4","41","42"}));
				}
			}else if(roles.indexOf("公司领导")!=-1){
				//待处理
				if(type.equals(OperatorQueryType.SuspendingQuery.getValue())) {
					cq.add(Restrictions.in("bpmStatus", new Object[] {"5"}));
				}
			}
		} catch (Exception e) {
			throw new BusinessException(e.getMessage());
		}
		return cq;
	}
	private List<SubcontractApplyVO> addBussinessColum (List<SubcontractApplyEntity> sae ,String roles) {
		List<SubcontractApplyVO> savoList = new ArrayList<SubcontractApplyVO>();
		try{
			for (SubcontractApplyEntity subcontractApplyEntity : sae) {
				SubcontractApplyVO savo = new SubcontractApplyVO();
				MyBeanUtils.copyBeanNotNull2Bean(subcontractApplyEntity, savo);
				//增加查询后返回的业务字段状态
				if(roles.indexOf("部门设计人员")!=-1 || roles.indexOf("部门调度人员")!=-1){
					if("6".equals(savo.getBpmStatus()))
					{
						savo.setCompleteState(1);
					}
				}else if(roles.indexOf("部门主任")!=-1){
					if("2".equals(savo.getBpmStatus()) || "22".equals(savo.getBpmStatus()))
					{
						savo.setConfirmState(1);
					}
				}else if(roles.indexOf("检验处人员")!=-1){
					if("8".equals(savo.getBpmStatus()) || "81".equals(savo.getBpmStatus()))
					{
						savo.setConfirmState(1);
					}
				}else if(roles.indexOf("主管领导")!=-1){
					if("4".equals(savo.getBpmStatus()) || "41".equals(savo.getBpmStatus()))
					{
						savo.setConfirmState(1);
					}
				}else if(roles.indexOf("公司领导")!=-1){
					if("5".equals(savo.getBpmStatus()))
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
		return savoList;
	}
	
	@RequestMapping(params = "wtddatagrid")
	public void wtddatagrid(SubcontractApplyEntity subcontractApply,HttpServletRequest request, HttpServletResponse response, DataGrid dataGrid) {
		CriteriaQuery cq = new CriteriaQuery(SubcontractApplyEntity.class, dataGrid);
		//查询条件组装器
		org.jeecgframework.core.extend.hqlsearch.HqlGenerateUtil.installHql(cq, subcontractApply, request.getParameterMap());
		String roles = "";
		try{
			//自定义追加查询条件
			TSUser user = ResourceUtil.getSessionUser();
			
			List<TSRoleUser> rUsers = systemService.findByProperty(TSRoleUser.class, "TSUser.id", user.getId());
			for (TSRoleUser ru : rUsers) {
				TSRole role = ru.getTSRole();
				roles += role.getRoleName() + ",";
			}
			cq.add(Restrictions.eq("applytype", "2"));
			if(roles.indexOf("部门主任")!=-1){
				cq.add(Restrictions.eq("sqbm", user.getDepartid()));
			}else if(roles.indexOf("部门设计人员")!=-1){
				cq.add(Restrictions.eq("createBy", user.getUserName()));
			}else if(roles.indexOf("部门调度人员")!=-1){
				cq.add(Restrictions.eq("sqbm", user.getDepartid()));
			}else if(roles.indexOf("主管领导")!=-1){
				cq.add(Restrictions.eq("sqbm", user.getDepartid()));
			}
			cq.add(Restrictions.eq("bpmStatus", "6"));
		} catch (Exception e) {
			throw new BusinessException(e.getMessage());
		}
		cq.add();
		this.subcontractApplyService.getDataGridReturn(cq, true);
		List<SubcontractApplyEntity> sae = dataGrid.getResults();
		String filed = dataGrid.getField();
		filed = filed+"confirmState,completeState,";
		int countnum = dataGrid.getRows();
		List<SubcontractApplyVO> savoList = new ArrayList<SubcontractApplyVO>();
		try{
			for (SubcontractApplyEntity subcontractApplyEntity : sae) {
				SubcontractApplyVO savo = new SubcontractApplyVO();
				MyBeanUtils.copyBeanNotNull2Bean(subcontractApplyEntity, savo);
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
	 * 删除外协加工申请
	 * 
	 * @return
	 */
	@RequestMapping(params = "doDel")
	@ResponseBody
	public AjaxJson doDel(SubcontractApplyEntity subcontractApply, HttpServletRequest request) {
		String message = null;
		AjaxJson j = new AjaxJson();
		subcontractApply = systemService.getEntity(SubcontractApplyEntity.class, subcontractApply.getId());
		message = "外协加工申请删除成功";
		try{
			subcontractApplyService.delete(subcontractApply);
			systemService.addLog(message, Globals.Log_Type_DEL, Globals.Log_Leavel_INFO);
		}catch(Exception e){
			e.printStackTrace();
			message = "外协加工申请删除失败";
			throw new BusinessException(e.getMessage());
		}
		j.setMsg(message);
		return j;
	}
	
	/**
	 * 完成外协加工申请
	 * 
	 * @return
	 */
	@RequestMapping(params = "doComplete")
	@ResponseBody
	public AjaxJson doComplete(SubcontractApplyEntity subcontractApply, HttpServletRequest request) {
		String message = null;
		AjaxJson j = new AjaxJson();
		subcontractApply = systemService.getEntity(SubcontractApplyEntity.class, subcontractApply.getId());
		message = "外协加工流程确认完成";
		try{
			subcontractApply.setBpmStatus("7");
			subcontractApplyService.saveOrUpdate(subcontractApply);
			systemService.addLog(message, Globals.Log_Type_COMPLETE, Globals.Log_Leavel_INFO);
		}catch(Exception e){
			e.printStackTrace();
			message = "外协加工确认完成失败";
			throw new BusinessException(e.getMessage());
		}
		j.setMsg(message);
		return j;
	}
	
	/**
	 * 批量删除外协加工申请
	 * 
	 * @return
	 */
	 @RequestMapping(params = "doBatchDel")
	@ResponseBody
	public AjaxJson doBatchDel(String ids,HttpServletRequest request){
		String message = null;
		AjaxJson j = new AjaxJson();
		message = "外协加工申请删除成功";
		try{
			for(String id:ids.split(",")){
				SubcontractApplyEntity subcontractApply = systemService.getEntity(SubcontractApplyEntity.class, 
				Integer.parseInt(id)
				);
				subcontractApplyService.delete(subcontractApply);
				systemService.addLog(message, Globals.Log_Type_DEL, Globals.Log_Leavel_INFO);
			}
		}catch(Exception e){
			e.printStackTrace();
			message = "外协加工申请删除失败";
			throw new BusinessException(e.getMessage());
		}
		j.setMsg(message);
		return j;
	}


	/**
	 * 添加外协加工申请
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping(params = "doAdd")
	@ResponseBody
	public AjaxJson doAdd(SubcontractApplyEntity subcontractApply, HttpServletRequest request) {
		String message = null;
		AjaxJson j = new AjaxJson();
		message = "外协加工申请添加成功";
		try{
			TSUser user = ResourceUtil.getSessionUser();
			String roles = "";
			List<TSRoleUser> rUsers = systemService.findByProperty(TSRoleUser.class, "TSUser.id", user.getId());
			for (TSRoleUser ru : rUsers) {
				TSRole role = ru.getTSRole();
				roles += role.getRoleName() + ",";
			}
			if(roles.indexOf("部门主任")!=-1){
				subcontractApply.setBpmStatus("8");
			}else if(roles.indexOf("检验处人员")!=-1 ){
				subcontractApply.setBpmStatus("4");
			}else{
				subcontractApply.setBpmStatus("2");
			}
			String wxjglsh = subcontractApplyService.getWxjgLsh();
			subcontractApply.setApplybh(wxjglsh);
			subcontractApply.setApplytype("2");
			subcontractApplyService.save(subcontractApply);
			systemService.addLog(message, Globals.Log_Type_INSERT, Globals.Log_Leavel_INFO);
		}catch(Exception e){
			e.printStackTrace();
			message = "外协加工申请添加失败";
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
	@RequestMapping(params = "doUpdate")
	@ResponseBody
	public AjaxJson doUpdate(SubcontractApplyEntity subcontractApply, HttpServletRequest request) {
		String message = null;
		AjaxJson j = new AjaxJson();
		message = "外协加工申请更新成功";
		SubcontractApplyEntity t = subcontractApplyService.get(SubcontractApplyEntity.class, subcontractApply.getId());
		try {
			TSUser user = ResourceUtil.getSessionUser();
			String roles = "";
			List<TSRoleUser> rUsers = systemService.findByProperty(TSRoleUser.class, "TSUser.id", user.getId());
			for (TSRoleUser ru : rUsers) {
				TSRole role = ru.getTSRole();
				roles += role.getRoleName() + ",";
			}
			if(roles.indexOf("部门主任")!=-1){
				subcontractApply.setBpmStatus("8");
			}else if(roles.indexOf("部门设计人员")!=-1 || roles.indexOf("部门调度人员")!=-1) {
				subcontractApply.setBpmStatus("2");
			}
			MyBeanUtils.copyBeanNotNull2Bean(subcontractApply, t);
			subcontractApplyService.saveOrUpdate(t);
			systemService.addLog(message, Globals.Log_Type_UPDATE, Globals.Log_Leavel_INFO);
		} catch (Exception e) {
			e.printStackTrace();
			message = "外协加工申请更新失败";
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
	public AjaxJson doConfirm(SubcontractApplyEntity subcontractApply,String confrimStatus, HttpServletRequest request) {
		String message = null;
		AjaxJson j = new AjaxJson();
		SubcontractApplyEntity t = subcontractApplyService.get(SubcontractApplyEntity.class, subcontractApply.getId());
		TSUser user = ResourceUtil.getSessionUser();
		String roles = "";
		List<TSRoleUser> rUsers = systemService.findByProperty(TSRoleUser.class, "TSUser.id", user.getId());
		for (TSRoleUser ru : rUsers) {
			TSRole role = ru.getTSRole();
			roles += role.getRoleName() + ",";
		}
		if("1".equals(confrimStatus)){
			if(roles.indexOf("部门主任")!=-1){
				subcontractApply.setBpmStatus("8");
				if(UtilValidate.isEmpty(subcontractApply.getBmyj()) || "不同意".equals(subcontractApply.getBmyj())){
					subcontractApply.setBmyj("同意");
				}
				subcontractApply.setBmyjxm(user.getRealName());
				subcontractApply.setBmshsj(new Date());
			}else if(roles.indexOf("检验处人员")!=-1 ){
				if(subcontractApply.getPlancost()!=null && subcontractApply.getPlancost()>10000)
				{
					subcontractApply.setBpmStatus("4");
				}else{
					subcontractApply.setBpmStatus("6");
				}
			}else if(roles.indexOf("主管领导")!=-1 ){
				if(subcontractApply.getPlancost()!=null && subcontractApply.getPlancost()>500000){
					subcontractApply.setBpmStatus("5");
				}else{
					subcontractApply.setBpmStatus("6");
				}
				if(UtilValidate.isEmpty(subcontractApply.getBmldyj()) || "不同意".equals(subcontractApply.getBmldyj())){
					subcontractApply.setBmldyj("同意");
				}
				subcontractApply.setBmzgldxm(user.getRealName());
				subcontractApply.setBmzgshsj(new Date());
			}else if(roles.indexOf("公司领导")!=-1 ){
				subcontractApply.setBpmStatus("6");
				if(UtilValidate.isEmpty(subcontractApply.getGsldyj()) || "不同意".equals(subcontractApply.getGsldyj())){
					subcontractApply.setGsldyj("同意");
				}
				subcontractApply.setGsldxm(user.getRealName());
				subcontractApply.setGsldshsj(new Date());
			}
		}else{
			if(roles.indexOf("部门主任")!=-1){
				subcontractApply.setBpmStatus("11");
				if(UtilValidate.isEmpty(subcontractApply.getBmyj()) || "同意".equals(subcontractApply.getBmyj())){
					subcontractApply.setBmyj("不同意");
				}
				subcontractApply.setBmyjxm(user.getRealName());
				subcontractApply.setBmshsj(new Date());
			}else if(roles.indexOf("检验处人员")!=-1){
				subcontractApply.setBpmStatus("22");
			}else if(roles.indexOf("主管领导")!=-1 ){
				subcontractApply.setBpmStatus("81");
				if(UtilValidate.isEmpty(subcontractApply.getBmldyj()) || "同意".equals(subcontractApply.getBmldyj())){
					subcontractApply.setBmldyj("不同意");
				}
				subcontractApply.setBmzgldxm(user.getRealName());
				subcontractApply.setBmzgshsj(new Date());
			}else if(roles.indexOf("公司领导")!=-1 ){
				subcontractApply.setBpmStatus("41");
				if(UtilValidate.isEmpty(subcontractApply.getGsldyj()) || "同意".equals(subcontractApply.getGsldyj())){
					subcontractApply.setGsldyj("不同意");
				}
				subcontractApply.setGsldxm(user.getRealName());
				subcontractApply.setGsldshsj(new Date());
			}
		}
		try {
			MyBeanUtils.copyBeanNotNull2Bean(subcontractApply, t);
			subcontractApplyService.saveOrUpdate(t);
			message = "审核"+t.getApplybh()+"工单成功";
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
	 * 外协加工申请新增页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "goAdd")
	public ModelAndView goAdd(SubcontractApplyEntity subcontractApply, HttpServletRequest req) {
		if (StringUtil.isNotEmpty(subcontractApply.getId())) {
			subcontractApply = subcontractApplyService.getEntity(SubcontractApplyEntity.class, subcontractApply.getId());
			req.setAttribute("subcontractApply", subcontractApply);
		}
		int feeflag = 0;
		TSUser user = ResourceUtil.getSessionUser();
		String roles = "";
		List<TSRoleUser> rUsers = systemService.findByProperty(TSRoleUser.class, "TSUser.id", user.getId());
		for (TSRoleUser ru : rUsers) {
			TSRole role = ru.getTSRole();
			roles += role.getRoleName() + ",";
		}
		if(roles.indexOf("检验处人员")!=-1){
			feeflag = 1;
		}
		req.setAttribute("feeFlag", feeflag);
		req.setAttribute("orgCode", user.getCurrentDepart().getId());
		req.setAttribute("username", user.getRealName());
		return new ModelAndView("com/jeecg/inspection/subcontractInspection-add");
	}
	/**
	 * 外协加工申请编辑页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "goUpdate")
	public ModelAndView goUpdate(SubcontractApplyEntity subcontractApply, HttpServletRequest req) {
		if (StringUtil.isNotEmpty(subcontractApply.getId())) {
			subcontractApply = subcontractApplyService.getEntity(SubcontractApplyEntity.class, subcontractApply.getId());
			req.setAttribute("subcontractApply", subcontractApply);
		}
		int feeflag = 0;
		TSUser user = ResourceUtil.getSessionUser();
		String roles = "";
		List<TSRoleUser> rUsers = systemService.findByProperty(TSRoleUser.class, "TSUser.id", user.getId());
		for (TSRoleUser ru : rUsers) {
			TSRole role = ru.getTSRole();
			roles += role.getRoleName() + ",";
		}
		if(roles.indexOf("检验处人员")!=-1){
			feeflag = 1;
		}
		req.setAttribute("feeFlag", feeflag);
		return new ModelAndView("com/jeecg/inspection/subcontractInspection-update");
	}
	
	/**
	 * 外协加工申请编辑页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "goConfirm")
	public ModelAndView goConfirm(SubcontractApplyEntity subcontractApply, HttpServletRequest req) {
		if (StringUtil.isNotEmpty(subcontractApply.getId())) {
			subcontractApply = subcontractApplyService.getEntity(SubcontractApplyEntity.class, subcontractApply.getId());
			req.setAttribute("subcontractApply", subcontractApply);
		}
		int feeflag = 0;
		TSUser user = ResourceUtil.getSessionUser();
		String roles = "";
		List<TSRoleUser> rUsers = systemService.findByProperty(TSRoleUser.class, "TSUser.id", user.getId());
		for (TSRoleUser ru : rUsers) {
			TSRole role = ru.getTSRole();
			roles += role.getRoleName() + ",";
		}
		if(roles.indexOf("检验处人员")!=-1){
			feeflag = 1;
		}
		req.setAttribute("feeFlag",feeflag);
		return new ModelAndView("com/jeecg/inspection/subcontractInspection-confirm");
	}
	/**
	 * 导入功能跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "upload")
	public ModelAndView upload(HttpServletRequest req) {
		req.setAttribute("controller_name","subcontractApplyController");
		return new ModelAndView("common/upload/pub_excel_upload");
	}
	
	/**
	 * 导出excel
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(params = "exportXls")
	public String exportXls(SubcontractApplyEntity subcontractApply,HttpServletRequest request,HttpServletResponse response
			, DataGrid dataGrid,ModelMap modelMap) {
		CriteriaQuery cq = new CriteriaQuery(SubcontractApplyEntity.class, dataGrid);
		cq.add(Restrictions.eq("applytype", "2"));
		org.jeecgframework.core.extend.hqlsearch.HqlGenerateUtil.installHql(cq, subcontractApply, request.getParameterMap());
		List<SubcontractApplyEntity> subcontractApplys = this.subcontractApplyService.getListByCriteriaQuery(cq,false);
		modelMap.put(NormalExcelConstants.FILE_NAME,"外协加工申请");
		modelMap.put(NormalExcelConstants.CLASS,SubcontractApplyEntity.class);
		modelMap.put(NormalExcelConstants.PARAMS,new ExportParams("外协加工申请列表", "导出人:"+ResourceUtil.getSessionUser().getRealName(),
			"导出信息"));
		modelMap.put(NormalExcelConstants.DATA_LIST,subcontractApplys);
		return NormalExcelConstants.JEECG_EXCEL_VIEW;
	}
	/**
	 * 导出excel 使模板
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(params = "exportXlsByT")
	public String exportXlsByT(SubcontractApplyEntity subcontractApply,HttpServletRequest request,HttpServletResponse response
			, DataGrid dataGrid,ModelMap modelMap) {
    	modelMap.put(NormalExcelConstants.FILE_NAME,"外协加工申请");
    	modelMap.put(NormalExcelConstants.CLASS,SubcontractApplyEntity.class);
    	modelMap.put(NormalExcelConstants.PARAMS,new ExportParams("外协加工申请列表", "导出人:"+ResourceUtil.getSessionUser().getRealName(),
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
				List<SubcontractApplyEntity> listSubcontractApplyEntitys = ExcelImportUtil.importExcel(file.getInputStream(),SubcontractApplyEntity.class,params);
				for (SubcontractApplyEntity subcontractApply : listSubcontractApplyEntitys) {
					subcontractApplyService.save(subcontractApply);
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
	 * 获取文件附件信息
	 * 
	 * @param id subcontractApply主键id
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
	 * 查询数据word导出
	 * @param consult
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value = "/exportWord",method=RequestMethod.GET)  
    public void exportWord(HttpServletRequest request,
			HttpServletResponse response, HttpSession session,SubcontractApplyEntity subcontractApply) throws Exception{
		    SubcontractApplyEntity t = subcontractApplyService.get(SubcontractApplyEntity.class, subcontractApply.getId());
			String filePath = createWordByVO(t);
			File uploadedFile = new File(filePath);
			if (uploadedFile.exists()) {
				try {
					response.setContentType(this.getContentType(filePath));
					response.setHeader("Content-disposition",
							"attachment;filename="+t.getApplybh()+".doc");
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
	private String createWordByVO(SubcontractApplyEntity subcontractApply) throws Exception{
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("createtime", DateUtil.formatYMD(subcontractApply.getCreateDate()));
		TSDepart depart = systemService.getEntity(TSDepart.class,(subcontractApply.getSqbm()));
		dataMap.put("sqbh",  UtilValidate.isEmpty(subcontractApply.getApplybh())?"":subcontractApply.getApplybh());
		dataMap.put("xmmc",  UtilValidate.isEmpty(subcontractApply.getXmmc())?"":subcontractApply.getXmmc());
		dataMap.put("sqbm",  UtilValidate.isEmpty(depart.getDepartname())?"":depart.getDepartname());
		dataMap.put("snxh",  UtilValidate.isEmpty(subcontractApply.getSnxh())?"":subcontractApply.getSnxh());
		dataMap.put("kth",  UtilValidate.isEmpty(subcontractApply.getKth())?"":subcontractApply.getKth());
		dataMap.put("xmfzr",  UtilValidate.isEmpty(subcontractApply.getXmfzr())?"":subcontractApply.getXmfzr());
		dataMap.put("wxjgdw",  UtilValidate.isEmpty(subcontractApply.getWxjgdw())?"":subcontractApply.getWxjgdw());
		dataMap.put("dz",  UtilValidate.isEmpty(subcontractApply.getDz())?"":subcontractApply.getDz());
		dataMap.put("sl",  UtilValidate.isEmpty(subcontractApply.getSl())?"":subcontractApply.getSl());
		dataMap.put("bh",  UtilValidate.isEmpty(subcontractApply.getBh())?"":subcontractApply.getBh());
		dataMap.put("sm",  UtilValidate.isEmpty(subcontractApply.getSm())?"":subcontractApply.getSm());
		dataMap.put("sqrq",  UtilValidate.isEmpty(subcontractApply.getApplydate())?"":DateUtil.formatYMD(subcontractApply.getApplydate()));
		dataMap.put("yqwcsj",   UtilValidate.isEmpty(subcontractApply.getCompletedate())?"":DateUtil.formatYMD(subcontractApply.getCompletedate()));
		dataMap.put("attachflag",  UtilValidate.isEmpty(subcontractApply.getAttach())?"否":"是");
		dataMap.put("wtnr",  UtilValidate.isEmpty(subcontractApply.getWtlr())?"":subcontractApply.getWtlr());
		dataMap.put("jtyq",  UtilValidate.isEmpty(subcontractApply.getJtyq())?"":subcontractApply.getJtyq());
		dataMap.put("bz",  UtilValidate.isEmpty(subcontractApply.getBz())?"":subcontractApply.getBz());
		dataMap.put("bmfzryj",  UtilValidate.isEmpty(subcontractApply.getBmyj())?"":subcontractApply.getBmyj());
		dataMap.put("bmfzrxm",  UtilValidate.isEmpty(subcontractApply.getBmyjxm())?"":subcontractApply.getBmyjxm());
		dataMap.put("bmfzrshsj",  UtilValidate.isEmpty(subcontractApply.getBmshsj())?"":DateUtil.formatYMD(subcontractApply.getBmshsj()));
		dataMap.put("bmzgyj",  UtilValidate.isEmpty(subcontractApply.getBmldyj())?"":subcontractApply.getBmldyj());
		dataMap.put("bmzgxm",  UtilValidate.isEmpty(subcontractApply.getBmzgldxm())?"":subcontractApply.getBmzgldxm());
		dataMap.put("bmzgshsj",  UtilValidate.isEmpty(subcontractApply.getBmzgshsj())?"":DateUtil.formatYMD(subcontractApply.getBmzgshsj()));
		dataMap.put("gsldyj",  UtilValidate.isEmpty(subcontractApply.getGsldyj())?"":subcontractApply.getGsldyj());
		dataMap.put("gsldxm",  UtilValidate.isEmpty(subcontractApply.getGsldxm())?"":subcontractApply.getGsldxm());
		dataMap.put("gsldshsj",  UtilValidate.isEmpty(subcontractApply.getGsldshsj())?"":DateUtil.formatYMD(subcontractApply.getGsldshsj()));
		
		MDoc mdoc = new MDoc();
		String newFileName = UUID.randomUUID().toString()
				.replaceAll("-", "")+".doc";
		String fileName="C:/download/"+newFileName;
		mdoc.createDoc(dataMap, fileName,"wxjg1.ftl");
		return fileName;
	}
	/**
	 * 查询数据word导出
	 * @param consult
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value = "/exportWtdWord",method=RequestMethod.GET)
    public void exportWtdWord(HttpServletRequest request,
			HttpServletResponse response, HttpSession session,SubcontractApplyEntity subcontractApply) throws Exception{
		    SubcontractApplyEntity t = subcontractApplyService.get(SubcontractApplyEntity.class, subcontractApply.getId());
			String filePath = createWtdWordByVO(t);
			File uploadedFile = new File(filePath);
			if (uploadedFile.exists()) {
				try {
					response.setContentType(this.getContentType(filePath));
					response.setHeader("Content-disposition",
							"attachment;filename="+t.getApplybh()+".doc");
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
	private String createWtdWordByVO(SubcontractApplyEntity subcontractApply) throws Exception{
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("createtime", DateUtil.formatYMD(subcontractApply.getCreateDate()));
		TSDepart depart = systemService.getEntity(TSDepart.class,(subcontractApply.getSqbm()));
		dataMap.put("sqbh",  UtilValidate.isEmpty(subcontractApply.getApplybh())?"":subcontractApply.getApplybh());
		dataMap.put("wtf",  depart.getDepartname());
		String jjcd="";
		String ydwcsj="";
		if(UtilValidate.isEmpty(subcontractApply.getUrgentdate()))
		{
			jjcd="一般";
			ydwcsj = UtilValidate.isEmpty(subcontractApply.getCompletedate())?"":DateUtil.formatYMD(subcontractApply.getCompletedate());
		}else{
			if(UtilValidate.isEmpty(subcontractApply.getCompletedate())){
				jjcd="一般";
			}else{
				if(DateUtil.differentDays(subcontractApply.getCompletedate(), subcontractApply.getUrgentdate()) >5){
					jjcd="特急";
				}else{
					jjcd="紧急";
				}
			}
			ydwcsj = UtilValidate.isEmpty(subcontractApply.getUrgentdate())?"":DateUtil.formatYMD(subcontractApply.getUrgentdate());
		}
		dataMap.put("jjcd",  jjcd);
		dataMap.put("jgf",  UtilValidate.isEmpty(subcontractApply.getWxjgdw())?"":subcontractApply.getWxjgdw());
		dataMap.put("lxr",  UtilValidate.isEmpty(subcontractApply.getLxr())?"":subcontractApply.getLxr());
		dataMap.put("lxfs",  UtilValidate.isEmpty(subcontractApply.getDh())?"":subcontractApply.getDh());
		//dataMap.put("wtdlist",  UtilValidate.isEmpty(subcontractApply.getDh())?"":subcontractApply.getDh());
		dataMap.put("cpdh",  UtilValidate.isEmpty(subcontractApply.getBh())?"":subcontractApply.getBh());
		dataMap.put("cpmc",  UtilValidate.isEmpty(subcontractApply.getWxjglx())?"":subcontractApply.getWxjglx());
		dataMap.put("sl",  UtilValidate.isEmpty(subcontractApply.getSl())?"":subcontractApply.getSl());
		dataMap.put("wtxm",  UtilValidate.isEmpty(subcontractApply.getWtlr())?"":subcontractApply.getWtlr());
		dataMap.put("ydwcsj", ydwcsj);
		dataMap.put("bz",  UtilValidate.isEmpty(subcontractApply.getBz())?"":subcontractApply.getBz());
		TSUser user = ResourceUtil.getSessionUser();
		dataMap.put("wtjbr",  user.getRealName());
		MDoc mdoc = new MDoc();
		String newFileName = UUID.randomUUID().toString()
				.replaceAll("-", "")+".doc";
		String fileName="C:/download/"+newFileName;
		mdoc.createDoc(dataMap, fileName,"jgwtd1.ftl");
		return fileName;
	}
	/**
	 * 设置文件类型
	 * 
	 * @param fileName
	 * @return
	 */
	private String getContentType(String fileName) {
		String fileNameTmp = fileName.toLowerCase();
		String ret = "";
		if (fileNameTmp.endsWith("txt")) {
			ret = "text/plain";
		}
		if (fileNameTmp.endsWith("gif")) {
			ret = "image/gif";
		}
		if (fileNameTmp.endsWith("jpg")) {
			ret = "image/jpeg";
		}
		if (fileNameTmp.endsWith("jpeg")) {
			ret = "image/jpeg";
		}
		if (fileNameTmp.endsWith("jpe")) {
			ret = "image/jpeg";
		}
		if (fileNameTmp.endsWith("zip")) {
			ret = "application/zip";
		}
		if (fileNameTmp.endsWith("rar")) {
			ret = "application/rar";
		}
		if (fileNameTmp.endsWith("doc")) {
			ret = "application/msword";
		}
		if (fileNameTmp.endsWith("ppt")) {
			ret = "application/vnd.ms-powerpoint";
		}
		if (fileNameTmp.endsWith("xls")) {
			ret = "application/vnd.ms-excel";
		}
		if (fileNameTmp.endsWith("html")) {
			ret = "text/html";
		}
		if (fileNameTmp.endsWith("htm")) {
			ret = "text/html";
		}
		if (fileNameTmp.endsWith("tif")) {
			ret = "image/tiff";
		}
		if (fileNameTmp.endsWith("tiff")) {
			ret = "image/tiff";
		}
		if (fileNameTmp.endsWith("pdf")) {
			ret = "application/pdf";
		}
		return ret;
	}
}
