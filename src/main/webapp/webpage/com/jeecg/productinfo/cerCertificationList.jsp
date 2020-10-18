<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<t:base type="jquery,easyui,tools,DatePicker"></t:base>
<div class="easyui-layout" fit="true">
  <div region="center" style="padding:0px;border:0px">
  <t:datagrid name="cerCertificationList" checkbox="true" pagination="true" fitColumns="true" title="合格证管理" sortName="createDate" actionUrl="cerCertificationController.do?datagrid" idField="id" fit="true" queryMode="group">
   <t:dgCol title="主键"  field="id"  hidden="true"  queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="创建人名称"  field="createName"  hidden="true"  queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="创建人登录名称"  field="createBy"  hidden="true"  queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="创建日期"  field="createDate"  formatter="yyyy-MM-dd"  hidden="true"  queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="更新人名称"  field="updateName"  hidden="true"  queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="更新人登录名称"  field="updateBy"  hidden="true"  queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="更新日期"  field="updateDate"  formatter="yyyy-MM-dd"  hidden="true"  queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="所属部门"  field="sysOrgCode"  hidden="true"  queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="所属公司"  field="sysCompanyCode"  hidden="true"  queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="流程状态"  field="bpmStatus" queryMode="single"  dictionary="bpm_status"  width="120"></t:dgCol>
   <t:dgCol title="合格证编号"  field="hgzbh"  queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="产品型号"  field="cpxh"  query="true"  queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="产品批次"  field="cppc"  query="true"  queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="产品名称"  field="cpmc"  queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="产品数量 "  field="cpsl"  queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="产品规范"  field="cpjcbz"  queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="检测报告号"  field="jcbgh"  hidden="true" queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="质量等级"  field="zlbzdj"  hidden="true" queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="用户单位"  field="yhdw"  hidden="true" query="true"  queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="检验员"  field="jyy" hidden="true" queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="签发日期"  field="qfrq" hidden="true" formatter="yyyy-MM-dd"  query="true"  queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="备注"  field="bz"  hidden="true"  queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="质量标识"  field="zlbs"  hidden="true"  queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="操作" field="opt" width="100"></t:dgCol>
   <t:dgDelOpt title="删除" operationCode="deletehgz" url="cerCertificationController.do?doDel&id={id}" urlclass="ace_button"  urlfont="fa-trash-o"/>
   <t:dgToolBar title="录入" icon="icon-add" url="cerCertificationController.do?goAdd" funname="add"></t:dgToolBar>
   <t:dgToolBar title="编辑" icon="icon-edit" url="cerCertificationController.do?goUpdate" funname="update"></t:dgToolBar>
   <t:dgToolBar title="批量删除" operationCode="batchdeletehgz" icon="icon-remove" url="cerCertificationController.do?doBatchDel" funname="deleteALLSelect"></t:dgToolBar>
   <t:dgToolBar title="查看" icon="icon-search" url="cerCertificationController.do?goUpdate" funname="detail"></t:dgToolBar>
   <t:dgToolBar title="导入" icon="icon-put" operationCode="importtable" funname="ImportXls"></t:dgToolBar>
   <t:dgToolBar title="导出Excel" icon="icon-putout" operationCode="exportexcel" funname="ExportXls"></t:dgToolBar>
   <t:dgToolBar title="导出Word" icon="icon-put" operationCode="exportword" funname="ExportDoc"></t:dgToolBar>
   <t:dgToolBar title="模板下载" icon="icon-putout" operationCode="exporttabledown" funname="ExportXlsByT"></t:dgToolBar>
   <t:dgFunOpt  title="审核" operationCode="confirmButton" exp="bpmStatus#eq#2" funname ="confirmCer(id)" urlclass="ace_button"  urlfont="fa-edit"></t:dgFunOpt>
  </t:datagrid>
  </div>
 </div>
 <script type="text/javascript">
 $(document).ready(function(){
 });
 
//导入
 function confirmCer(id) {
	 confirmtask('审核', 'cerCertificationController.do?goConfirm&id='+id, "cerCertificationList","100%","100%");
 } 

//导入
function ImportXls() {
	openuploadwin('Excel导入', 'cerCertificationController.do?upload', "cerCertificationList");
}

//导出
function ExportXls() {
	JeecgExcelExport("cerCertificationController.do?exportXls","cerCertificationList");
}
//导出
function ExportDoc() {
	JeecgExcelExport("cerCertificationController.do?exportDoc","cerCertificationList");
}

//模板下载
function ExportXlsByT() {
	JeecgExcelExport("cerCertificationController.do?exportXlsByT","cerCertificationList");
}

 </script>
