<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<t:base type="jquery,easyui,tools,DatePicker"></t:base>
<div class="easyui-layout" fit="true">
  <div region="center" style="padding:0px;border:0px">
  <t:datagrid name="testFilestoreList" checkbox="false" pagination="true" fitColumns="true" title="文件管理" sortName="createDate" actionUrl="testFilestoreController.do?datagrid" idField="id" fit="true" queryMode="group">
   <t:dgCol title="主键"  field="id"  hidden="true"  queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="创建人名称"  field="createName"  hidden="true"  queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="创建人登录名称"  field="createBy"  hidden="true"  queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="创建日期"  field="createDate"  formatter="yyyy-MM-dd"  hidden="true"  queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="更新人名称"  field="updateName"  hidden="true"  queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="更新人登录名称"  field="updateBy"  hidden="true"  queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="更新日期"  field="updateDate"  formatter="yyyy-MM-dd"  hidden="true"  queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="所属部门"  field="sysOrgCode"  hidden="true"  queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="所属公司"  field="sysCompanyCode"  hidden="true"  queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="阶段标识"  field="bpmStatus"  query="true"  queryMode="single"  dictionary="filestatus"  width="120"></t:dgCol>
   <t:dgCol title="型号"  field="xh"  query="true"  queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="电路名称"  field="dlmc"  query="true"  queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="批次"  field="pc"  query="true"  queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="任务通知单号"  field="rwtzdh"  query="true"  queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="任务数量"  field="rwsl"  queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="执行规范号"  field="zxgfh"  query="true"  queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="质量等级"  field="zldj"  query="true"  queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="封装形式"  field="fzxs"  query="true"  queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="芯片标识"  field="xpbs"  queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="圆片批次"  field="yppc"  hidden="true"  queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="圆片号"  field="yph"  hidden="true"  queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="监制报告号"  field="jzbgh"  hidden="true"  queryMode="single"  downloadName="附件下载"  width="120"></t:dgCol>
   <t:dgCol title="监制单位"  field="jzdw"  hidden="true"  queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="监制数量"  field="jzsl"  hidden="true"  queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="监制时间"  field="jzsj"  hidden="true"  queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="外壳型号"  field="wjxh"  hidden="true"  queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="外壳检验批次"  field="wkjypc"  hidden="true"  queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="盖板型号"  field="gbxh"  hidden="true"  queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="盖板检验批次"  field="gbjypc"  hidden="true"  queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="键合丝型号"  field="jhsxh"  hidden="true"  queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="键合丝检验批次"  field="jhsjypc"  hidden="true"  queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="粘片胶型号"  field="zpjxh"  hidden="true"  queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="粘片胶检验批次"  field="zpjyjpc"  hidden="true"  queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="打标墨型号"  field="dbmxh"  hidden="true"  queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="打标墨检验批次"  field="dbmjypc"  hidden="true"  queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="腔体体积"  field="qttj"  hidden="true"  queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="腔体高度"  field="qtgd"  hidden="true"  queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="投入封装数量"  field="trfzsl"  hidden="true"  queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="封装合格数量"  field="fzhgsl"  hidden="true"  queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="监制电路起止序号"  field="jzdlqzxh"  hidden="true"  queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="封装不合格情况"  field="fzbhgqk"  hidden="true"  queryMode="single"  downloadName="附件下载"  width="120"></t:dgCol>
   <t:dgCol title="筛选报告号"  field="sxbgh"  hidden="true"  queryMode="single"  downloadName="附件下载"  width="120"></t:dgCol>
   <t:dgCol title="筛选起止时间"  field="sxqzsj"  hidden="true"  queryMode="single"  downloadName="附件下载"  width="120"></t:dgCol>
   <t:dgCol title="筛选过程PIND次数"  field="sxgcpindcs"  hidden="true"  queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="投入筛选数量"  field="trsxsl"  hidden="true"  queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="筛选合格数量"  field="sxhgsl"  hidden="true"  queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="筛选不合格情况"  field="sxbhgqk"  hidden="true"  queryMode="single"  downloadName="附件下载"  width="120"></t:dgCol>
   <t:dgCol title="PDA"  field="pda"  hidden="true"  queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="成品率"  field="cpl"  hidden="true"  queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="X光盘"  field="xgp"  hidden="true"  queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="测试光盘"  field="csgp"  hidden="true"  queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="报告"  field="threebg"  hidden="true"  queryMode="single"  downloadName="附件下载"  width="120"></t:dgCol>
   <t:dgCol title="低成品率质量分析报告"  field="dcplzlfxbg"  hidden="true"  queryMode="single"  downloadName="附件下载"  width="120"></t:dgCol>
   <t:dgCol title="鉴定一致性检验方式"  field="jdfs"  hidden="true"  queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="鉴定一致性检验报告编号"  field="jdbgbh"  hidden="true"  queryMode="single"  downloadName="附件下载"  width="120"></t:dgCol>
   <t:dgCol title="鉴定一致性检验起止时间"  field="jdqzsj"  hidden="true"  queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="首件鉴定报告"  field="sjjdbg"  hidden="true"  queryMode="single"  downloadName="附件下载"  width="120"></t:dgCol>
   <t:dgCol title="首件鉴定目录"  field="sjjdml"  hidden="true"  queryMode="single"  downloadName="附件下载"  width="120"></t:dgCol>
   <t:dgCol title="用户评审意见"  field="yhpsyj"  hidden="true"  queryMode="single"  downloadName="附件下载"  width="120"></t:dgCol>
   <t:dgCol title="质量评审"  field="zlps"  hidden="true"  queryMode="single"  downloadName="附件下载"  width="120"></t:dgCol>
   <t:dgCol title="ESD"  field="esd"  hidden="true"  queryMode="single"  downloadName="附件下载"  width="120"></t:dgCol>
   <t:dgCol title="抗闩锁"  field="kss"  hidden="true"  queryMode="single"  downloadName="附件下载"  width="120"></t:dgCol>
   <t:dgCol title="总剂量"  field="zjl"  hidden="true"  queryMode="single"  downloadName="附件下载"  width="120"></t:dgCol>
   <t:dgCol title="单粒子"  field="dlz"  hidden="true"  queryMode="single"  downloadName="附件下载"  width="120"></t:dgCol>
   <t:dgCol title="寿命后水汽"  field="smhsq"  hidden="true"  queryMode="single"  downloadName="附件下载"  width="120"></t:dgCol>
   <t:dgCol title="筛合水汽"  field="shsq"  hidden="true"  queryMode="single"  downloadName="附件下载"  width="120"></t:dgCol>
   <t:dgCol title="DPA报告号"  field="dpabgh"  hidden="true"  queryMode="single"  downloadName="附件下载"  width="120"></t:dgCol>
   <t:dgCol title="DPA检测机构"  field="dpajcjg"  hidden="true"  queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="DPA样品数量"  field="dpaypsl"  hidden="true"  queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="DPA试验开始时间"  field="dpakssj"  hidden="true"  queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="DPA试验结束时间"  field="dpajssj"  hidden="true"  queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="单独水汽报告"  field="ddsqbg"  hidden="true"  queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="水汽检测机构"  field="sqjcjg"  hidden="true"  queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="水汽检测开始时间"  field="sqjckssj"  hidden="true"  queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="水汽检测结束时间"  field="sqjcjssj"  hidden="true"  queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="补充筛选报告号"  field="bcsxbgh"  hidden="true"  queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="补充筛选开始时间"  field="bcsxkssj"  hidden="true"  queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="补充筛选结束时间"  field="bcsxjssj"  hidden="true"  queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="补充筛选委托单位"  field="bcsxwtdw"  hidden="true"  queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="补充筛选投入数量"  field="bcsxtrsl"  hidden="true"  queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="补充筛选合格数量"  field="bcsxhgsl"  hidden="true"  queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="补充筛选不合格情况"  field="bcsxbhgqk"  hidden="true"  queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="超期复验报告号"  field="cqfybgh"  hidden="true"  queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="超期复验开始时间"  field="cqfykssj"  hidden="true"  queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="超期复验结束时间"  field="cqfyjssj"  hidden="true"  queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="超期复验类别"  field="cqfylb"  hidden="true"  queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="超期复验合格数量"  field="cqfyhgsl"  hidden="true"  queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="补充检验报告"  field="bcjybg"  hidden="true"  queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="单批质保报告"  field="dpzbbg"  hidden="true"  queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="操作" field="opt" width="100"></t:dgCol>
   <t:dgDelOpt title="删除" url="testFilestoreController.do?doDel&id={id}" urlclass="ace_button"  urlfont="fa-trash-o"/>
   <t:dgToolBar title="录入" icon="icon-add" url="testFilestoreController.do?goAdd" funname="add"></t:dgToolBar>
	<t:dgToolBar title="编辑" icon="icon-edit" url="testFilestoreController.do?goUpdate" funname="update"></t:dgToolBar>
   <t:dgToolBar title="批量删除"  icon="icon-remove" url="testFilestoreController.do?doBatchDel" funname="deleteALLSelect"></t:dgToolBar>
   <t:dgToolBar title="查看" icon="icon-search" url="testFilestoreController.do?goUpdate" funname="detail"></t:dgToolBar>
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
	openuploadwin('Excel导入', 'testFilestoreController.do?upload', "testFilestoreList");
}

//导出
function ExportXls() {
	JeecgExcelExport("testFilestoreController.do?exportXls","testFilestoreList");
}

//模板下载
function ExportXlsByT() {
	JeecgExcelExport("testFilestoreController.do?exportXlsByT","testFilestoreList");
}

 </script>
