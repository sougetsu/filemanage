<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<t:base type="jquery,easyui,tools,DatePicker"></t:base>
<div class="easyui-layout" fit="true">
  <div region="center" style="padding:0px;border:0px">
  <t:datagrid name="fileRawMaterialList" checkbox="true" pagination="true" fitColumns="true" title="原材料库" sortName="createDate" actionUrl="fileRawMaterialController.do?datagrid" idField="id" fit="true" queryMode="group">
   <t:dgCol title="主键"  field="id"  hidden="true"  queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="创建人名称"  field="createName"  hidden="true"  queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="创建人登录名称"  field="createBy"  hidden="true"  queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="创建日期"  field="createDate"  formatter="yyyy-MM-dd"  hidden="true"  queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="更新人名称"  field="updateName"  hidden="true"  queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="更新人登录名称"  field="updateBy"  hidden="true"  queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="更新日期"  field="updateDate"  formatter="yyyy-MM-dd"  hidden="true"  queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="所属部门"  field="sysOrgCode"  hidden="true"  queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="所属公司"  field="sysCompanyCode"  hidden="true"  queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="检验批次"  field="inspectionLot"  query="true"  queryMode="single"  width="80"></t:dgCol>
   <t:dgCol title="检验报告编号"  field="inspectionReportno"  query="true"  queryMode="single"  width="80"></t:dgCol>
   <t:dgCol title="原材料类型"  field="materialType"  query="true"  queryMode="single"  dictionary="ycllx"  width="80"></t:dgCol>
   <t:dgCol title="型号"  field="model"  query="true"  queryMode="single"  width="80"></t:dgCol>
   <t:dgCol title="生产商"  field="producer" width="80"></t:dgCol>
   <t:dgCol title="供应商"  field="supplier" width="80"></t:dgCol>
   <t:dgCol title="检验数量"  field="inspectiocount" width="80"></t:dgCol>
   <t:dgCol title="合格数量"  field="qualifiedcount" width="80"></t:dgCol>
   <t:dgCol title="附件"  field="fileattach"  hidden="true"  queryMode="single"  downloadName="附件下载"  width="120"></t:dgCol>
   <t:dgCol title="操作" field="opt" width="100"></t:dgCol>
   <t:dgFunOpt title="附件下载"  operationCode="filedownload" exp="fileattach#ne#" funname="downzipfile(id)" urlclass="ace_button"  urlfont="fa-download" />
   <t:dgDelOpt title="删除" operationCode="deleteycl" url="fileRawMaterialController.do?doDel&id={id}" urlclass="ace_button"  urlfont="fa-trash-o"/>
   <t:dgToolBar title="录入" icon="icon-add" url="fileRawMaterialController.do?goAdd" funname="add"></t:dgToolBar>
	<t:dgToolBar title="编辑" icon="icon-edit" url="fileRawMaterialController.do?goUpdate" funname="update"></t:dgToolBar>
   <t:dgToolBar title="批量删除" operationCode="batchdeleteycl" icon="icon-remove" url="fileRawMaterialController.do?doBatchDel" funname="deleteALLSelect"></t:dgToolBar>
   <t:dgToolBar title="查看" icon="icon-search" url="fileRawMaterialController.do?goUpdate" funname="detail"></t:dgToolBar>
   <t:dgToolBar title="导入" operationCode="importycl" icon="icon-put" funname="ImportXls"></t:dgToolBar>
   <t:dgToolBar title="导出" operationCode="exportexcel" icon="icon-putout" funname="ExportXls"></t:dgToolBar>
   <t:dgToolBar title="模板下载" operationCode="dowloadtemple" icon="icon-putout" funname="ExportXlsByT"></t:dgToolBar>
  </t:datagrid>
  </div>
 </div>
 <script type="text/javascript">
 $(document).ready(function(){
 });
 
 function downzipfile(id) {
	window.location.href = "fileRawMaterialController.do?downzipFile&id="+id;
 }
 
//导入
function ImportXls() {
	openuploadwin('Excel导入', 'fileRawMaterialController.do?upload', "fileRawMaterialList");
}

//导出
function ExportXls() {
	JeecgExcelExport("fileRawMaterialController.do?exportXls","fileRawMaterialList");
}

//模板下载
function ExportXlsByT() {
	JeecgExcelExport("fileRawMaterialController.do?exportXlsByT","fileRawMaterialList");
}

 </script>
