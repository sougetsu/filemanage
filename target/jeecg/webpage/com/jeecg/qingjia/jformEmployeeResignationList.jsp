<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<t:base type="jquery,easyui,tools,DatePicker"></t:base>
<div class="easyui-layout" fit="true">
  <div region="center" style="padding:0px;border:0px">
  <t:datagrid name="jformEmployeeResignationList" checkbox="false" pagination="true" fitColumns="true" title="员工离职单" actionUrl="jformEmployeeResignationController.do?datagrid" idField="id" sortName="createDate" fit="true" queryMode="group">
   <t:dgCol title="主键"  field="id"  hidden="true"  queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="创建人名称"  field="createName"  hidden="true"  queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="创建人登录名称"  field="createBy"  hidden="true"  queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="创建日期"  field="createDate"  formatter="yyyy-MM-dd"  hidden="true"  queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="更新人名称"  field="updateName"  hidden="true"  queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="更新人登录名称"  field="updateBy"  hidden="true"  queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="更新日期"  field="updateDate"  formatter="yyyy-MM-dd"  hidden="true"  queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="所属部门"  field="sysOrgCode"  hidden="true"  queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="所属公司"  field="sysCompanyCode"  hidden="true"  queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="姓名"  field="name"  queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="员工编号"  field="code"  queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="职务"  field="job"  queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="入职时间"  field="joinTime"  formatter="yyyy-MM-dd hh:mm:ss"  queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="离职方式"  field="outType"  hidden="true"  queryMode="single"  dictionary="outType"  width="120"></t:dgCol>
   <t:dgCol title="申请离职日期"  field="applyOutTime"  formatter="yyyy-MM-dd hh:mm:ss"  hidden="true"  queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="正式离职日期"  field="outTime"  formatter="yyyy-MM-dd hh:mm:ss"  hidden="true"  queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="身份证编号"  field="idCard"  hidden="true"  queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="离职须知"  field="outContent"  hidden="true"  queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="离职原因"  field="outReason"  hidden="true"  queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="面谈记录"  field="interviewRecord"  hidden="true"  queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="办公物品移交"  field="officeChange"  hidden="true"  queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="人力资源部审核"  field="hrCheck"  hidden="true"  queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="应发薪资"  field="shouldSendSalary"  hidden="true"  queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="应扣薪资"  field="shouldDeductPay"  hidden="true"  queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="实发薪资"  field="pay"  hidden="true"  queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="领取日期"  field="getTime"  formatter="yyyy-MM-dd hh:mm:ss"  hidden="true"  queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="总经理审批"  field="bossCheck"  hidden="true"  queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="说明"  field="description"  hidden="true"  queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="操作" field="opt" width="100"></t:dgCol>
   <t:dgDelOpt title="删除" url="jformEmployeeResignationController.do?doDel&id={id}" urlclass="ace_button"  urlfont="fa-trash-o"/>
   <t:dgToolBar title="录入" icon="icon-add" url="jformEmployeeResignationController.do?goAdd" funname="add"  width="800" height="500"></t:dgToolBar>
   <t:dgToolBar title="编辑" icon="icon-edit" url="jformEmployeeResignationController.do?goUpdate" funname="update"  width="800" height="500"></t:dgToolBar>
   <t:dgToolBar title="批量删除"  icon="icon-remove" url="jformEmployeeResignationController.do?doBatchDel" funname="deleteALLSelect"></t:dgToolBar>
   <t:dgToolBar title="查看" icon="icon-search" url="jformEmployeeResignationController.do?goUpdate" funname="detail"  width="800" height="500"></t:dgToolBar>
   <t:dgToolBar title="导入" icon="icon-put" funname="ImportXls"></t:dgToolBar>
   <t:dgToolBar title="导出" icon="icon-putout" funname="ExportXls"></t:dgToolBar>
   <t:dgToolBar title="模板下载" icon="icon-putout" funname="ExportXlsByT"></t:dgToolBar>
  </t:datagrid>
  </div>
 </div>
 <script type="text/javascript">
 $(document).ready(function(){
 });
 
   
 
//导入
function ImportXls() {
	openuploadwin('Excel导入', 'jformEmployeeResignationController.do?upload', "jformEmployeeResignationList");
}

//导出
function ExportXls() {
	JeecgExcelExport("jformEmployeeResignationController.do?exportXls","jformEmployeeResignationList");
}

//模板下载
function ExportXlsByT() {
	JeecgExcelExport("jformEmployeeResignationController.do?exportXlsByT","jformEmployeeResignationList");
}

//bootstrap列表图片格式化
function btListImgFormatter(value,row,index){
	return listFileImgFormat(value,"image");
}
//bootstrap列表文件格式化
function btListFileFormatter(value,row,index){
	return listFileImgFormat(value);
}

</script>
