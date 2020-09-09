<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<!DOCTYPE html>
<html>
 <head>
  <title>文件管理</title>
    <style>
	.title_label {
  		height:28px;
		font-size: 12px;
		font-weight: bold;
		color: rgb(51, 51, 51);
		padding: 5px 20px;
		white-space:nowrap;
		vertical-align:middle;
		line-height:16px;
		text-align:left; 
	}
  .ui-button {
  	  display: inline-block;
	  padding: 2px 2px;
	  margin-bottom: 0;
	  font-size: 8px;
	  font-weight: normal;
	  line-height: 1.42857143;
	  text-align: center;
	  white-space: nowrap;
	  vertical-align: middle;
	  -ms-touch-action: manipulation;
      touch-action: manipulation;
	  cursor: pointer;
	  -webkit-user-select: none;
      -moz-user-select: none;
      -ms-user-select: none;
      user-select: none;
	  background-image: none;
	  border: 1px solid transparent;
	  border-radius: 4px;
  }
  </style>
  <t:base type="jquery,easyui,tools,DatePicker"></t:base>
  <t:base type="uploadify"></t:base>
<link href="plug-in/select2/css/select2.css" rel="stylesheet">
<script type="text/javascript" src="plug-in/select2/js/select2.js"></script>
  <script type="text/javascript">
  $(document).ready(function(){
	$('#tt').tabs({
	   onSelect:function(title){
	       $('#tt .panel-body').css('width','auto');
		}
	});
	$(".tabs-wrap").css('width','100%');
  });
 </script>
 </head>
 <body style="overflow-x: hidden;">
  <t:formvalid formid="formobj" dialog="true" usePlugin="password" layout="table" tiptype="1" action="testFilestoreController.do?doUpdate" callback="jeecgFormFileCallBack@Override">
					<input id="id" name="id" type="hidden" value="${testFilestorePage.id }"/>
	<table cellpadding="0" cellspacing="1" class="formtable">
		<tr>
			<td class="title_label" colspan="1"> 
					基础信息
			</td>
			<td colspan="3"> 
			</td>
		</tr>
		<tr>
			<td align="right" width="25%">
				<label class="Validform_label">阶段标识:</label>
			</td>
			<td class="value" width="25%">
					<t:dictSelect field="bpmStatus" type="list"   typeGroupCode="filestatus"  defaultVal="${testFilestorePage.bpmStatus}" hasLabel="false"  title="阶段标识"></t:dictSelect>     
				<span class="Validform_checktip"></span>
				<label class="Validform_label" style="display: none;">阶段标识</label>
			</td>
			<td align="right" width="25%">
				<label class="Validform_label">产品名称:</label>
			</td>
			<td class="value" width="25%">
		     	 <input id="dlmc" name="dlmc" type="text" maxlength="100" style="width: 150px" class="inputxt"  ignore="checked"  value='${testFilestorePage.dlmc}'/>
				<span class="Validform_checktip"></span>
				<label class="Validform_label" style="display: none;">产品名称</label>
			</td>
			
		</tr>
		<tr>
			<td align="right">
				<label class="Validform_label">产品型号:</label>
			</td>
			<td class="value">
		     	 <input id="xh" name="xh" type="text" maxlength="32" style="width: 150px" class="inputxt"  ignore="checked"  value='${testFilestorePage.xh}'/>
				<span class="Validform_checktip"></span>
				<label class="Validform_label" style="display: none;">产品型号</label>
			</td>
			<td align="right">
				<label class="Validform_label">产品批次:</label>
			</td>
			<td class="value">
		     	 <input id="pc" name="pc" type="text" maxlength="200" style="width: 150px" class="inputxt"  ignore="checked"  value='${testFilestorePage.pc}'/>
				<span class="Validform_checktip"></span>
				<label class="Validform_label" style="display: none;">产品批次</label>
			</td>
		</tr>
		<tr>
			<td align="right">
				<label class="Validform_label">任务通知单号:</label>
			</td>
			<td class="value">
		     	 <input id="rwtzdh" name="rwtzdh" type="text" maxlength="50" style="width: 150px" class="inputxt"  ignore="checked"  value='${testFilestorePage.rwtzdh}'/>
				<span class="Validform_checktip"></span>
				<label class="Validform_label" style="display: none;">任务通知单号</label>
			</td>
			<t:hasPermission code="rwsl">
			<td align="right">
				<label class="Validform_label">任务数量:</label>
			</td>
			<td class="value">
		     	 <input id="rwsl" name="rwsl" type="text" maxlength="200" style="width: 150px" class="inputxt"  ignore="checked"  value='${testFilestorePage.rwsl}'/>
				<span class="Validform_checktip"></span>
				<label class="Validform_label" style="display: none;">任务数量</label>
			</td>
			</t:hasPermission>
		</tr>
		<tr>
			<td align="right">
				<label class="Validform_label">执行规范号:</label>
			</td>
			<td class="value">
		     	 <input id="zxgfh" name="zxgfh" type="text" maxlength="200" style="width: 150px" class="inputxt"  ignore="checked"  value='${testFilestorePage.zxgfh}'/>
				<span class="Validform_checktip"></span>
				<label class="Validform_label" style="display: none;">执行规范号</label>
			</td>
			<td align="right">
				<label class="Validform_label">质量等级:</label>
			</td>
			<td class="value">
		     	 <input id="zldj" name="zldj" type="text" maxlength="200" style="width: 150px" class="inputxt"  ignore="checked"  value='${testFilestorePage.zldj}'/>
				<span class="Validform_checktip"></span>
				<label class="Validform_label" style="display: none;">质量等级</label>
			</td>
		</tr>
		<tr>
			<td align="right">
				<label class="Validform_label">封装形式:</label>
			</td>
			<td class="value">
		     	 <input id="fzxs" name="fzxs" type="text" maxlength="50" style="width: 150px" class="inputxt"  ignore="checked"  value='${testFilestorePage.fzxs}'/>
				<span class="Validform_checktip"></span>
				<label class="Validform_label" style="display: none;">封装形式</label>
			</td>
			<t:hasPermission code="xpbs">
			<td align="right">
				<label class="Validform_label">芯片标识:</label>
			</td>
			<td class="value">
		     	 <input id="xpbs" name="xpbs" type="text" maxlength="50" style="width: 150px" class="inputxt"  ignore="ignore"  value='${testFilestorePage.xpbs}'/>
				<span class="Validform_checktip"></span>
				<label class="Validform_label" style="display: none;">芯片标识</label>
			</td>
			</t:hasPermission>
		</tr>
	</table>
	<div style="width: auto;height: auto;">
		<%-- 增加一个div，用于调节页面大小，否则默认太小 --%>
		<div style="width:auto;height:auto;"></div>
		<t:tabs id="add_fzbhgqk" iframe="false" tabPosition="top" fit="false">
			<t:tab href="testFilestoreController.do?subcontractJianzhiList&id=${testFilestorePage.id}" title="监制信息" id="subcontractJianzhi"></t:tab>
		</t:tabs>
	</div>
	<div style="width: auto;height: auto;">
		<div style="width:800px;height:1px;"></div>
		<t:tabs id="tt" iframe="false" tabPosition="top" fit="false">
			<t:tab href="testFilestoreController.do?subcontractYclList&id=${testFilestorePage.id}" icon="icon-search" title="原材料信息" id="subcontractYcl"></t:tab>
		</t:tabs>
	</div>
	<table cellpadding="0" cellspacing="1" class="formtable">
		<tr>
			<td class="title_label" colspan="1"> 
					封装信息
			</td>
			<td colspan="3"> 
			</td>
		</tr>
		<t:hasPermission code="qiangti">
		<tr>
			<td align="right" width="25%">
				<label class="Validform_label">腔体体积:</label>
			</td>
			<td class="value" width="25%">
		     	 <input id="qttj" name="qttj" type="text" maxlength="200" style="width: 150px" class="inputxt"  ignore="ignore"  value='${testFilestorePage.qttj}'/>
		     	 <span	lang=EN-US>cm</span>  
			    <sup>  
			        <span lang=EN-US style='mso-bidi-font-size:10.5pt'>3</span>  
			    </sup>
				<span class="Validform_checktip"></span>
				<label class="Validform_label" style="display: none;">腔体体积</label>
			</td>
			<td align="right" width="25%">
				<label class="Validform_label">腔体高度:</label>
			</td>
			<td class="value" width="25%">
		     	 <input id="qtgd" name="qtgd" type="text" maxlength="200" style="width: 150px" class="inputxt"  ignore="ignore"  value='${testFilestorePage.qtgd}'/>mm
				<span class="Validform_checktip"></span>
				<label class="Validform_label" style="display: none;">腔体高度</label>
			</td>
		</tr>
		</t:hasPermission>
		<t:hasPermission code="fzsl">
		<tr>
			<td align="right">
				<label class="Validform_label">投入封装数量:</label>
			</td>
			<td class="value">
		     	 <input id="trfzsl" name="trfzsl" type="text" maxlength="200" style="width: 150px" class="inputxt"  ignore="ignore"  value='${testFilestorePage.trfzsl}'/>
				<span class="Validform_checktip"></span>
				<label class="Validform_label" style="display: none;">投入封装数量</label>
			</td>
			
			<td align="right">
				<label class="Validform_label">封装合格数量:</label>
			</td>
			<td class="value">
		     	 <input id="fzhgsl" name="fzhgsl" type="text" maxlength="200" style="width: 150px" class="inputxt"  ignore="ignore"  value='${testFilestorePage.fzhgsl}'/>
				<span class="Validform_checktip"></span>
				<label class="Validform_label" style="display: none;">封装合格数量</label>
			</td>
		</tr>
		</t:hasPermission>
		<tr>
			<td align="right">
				<label class="Validform_label">封装成品率:</label>
			</td>
			<td class="value">
		     	<input id="fzcpl" name="fzcpl" type="text" maxlength="200" style="width: 150px" class="inputxt"  ignore="ignore" value='${testFilestorePage.fzcpl}'/>%	
				<span class="Validform_checktip"></span>
				<label class="Validform_label" style="display: none;">封装成品率</label>
			</td>
			<t:hasPermission code="fzbhg">
			<td align="right">
				<label class="Validform_label">封装不合格情况:</label>
			</td>
			<td class="value">
				<t:webUploader auto="true" udfpath="${testFilestorePage.xh }/${testFilestorePage.pc}"  pathValues="${testFilestorePage.fzbhgqk}" name="fzbhgqk" fileNumLimit="3"></t:webUploader>
				<span class="Validform_checktip Validform_right" style="display: none;">文件已上传</span>	
			</td>
			</t:hasPermission>
		</tr>
	</table>
	<t:hasPermission code="fzbhg">
	<div style="width: auto;height: auto;">
		<%-- 增加一个div，用于调节页面大小，否则默认太小 --%>
		<div style="width:800px;height:1px;"></div>
		<t:tabs id="tt" iframe="false" tabPosition="top" fit="false">
			<t:tab href="testFilestoreController.do?subcontractFzbhgqkList&id=${testFilestorePage.id}" icon="icon-search" title="封装不合格情况" id="subcontractFzbhgqk"></t:tab>
		</t:tabs>
	</div>
	</t:hasPermission>
	<table cellpadding="0" cellspacing="1" class="formtable">
		<tr>
			<td class="title_label" colspan="1"> 
					封装后测试信息
			</td>
			<td colspan="3"> 
			</td>
		</tr>
		<tr>
			<td align="right" width="25%">
				<label class="Validform_label">投入测试数量:</label>
			</td>
			<td class="value" width="25%">
		     	 <input id="fzhtrcssl" name="fzhtrcssl" type="text" maxlength="200" style="width: 150px" class="inputxt"  ignore="ignore" value='${testFilestorePage.fzhtrcssl}'/>
				<span class="Validform_checktip"></span>
				<label class="Validform_label" style="display: none;">投入测试数量</label>
			</td>
			<td align="right" width="25%">
				<label class="Validform_label">测试合格数量:</label>
			</td>
			<td class="value" width="25%">
		     	 <input id="fzhcshgsl" name="fzhcshgsl" type="text" maxlength="200" style="width: 150px" class="inputxt"  ignore="ignore" value='${testFilestorePage.fzhcshgsl}'/>
				<span class="Validform_checktip"></span>
				<label class="Validform_label" style="display: none;">测试合格数量</label>
			</td>
		</tr>
		<tr>
			<td align="right">
				<label class="Validform_label">封装后测试成品率:</label>
			</td>
			<td class="value">
		     	 <input id="fzhcscpl" name="fzhcscpl" type="text" maxlength="200" style="width: 150px" class="inputxt"  ignore="ignore" value='${testFilestorePage.fzhcscpl}'/>%
				<span class="Validform_checktip"></span>
				<label class="Validform_label" style="display: none;">封装后测试成品率</label>
			</td>
			<td align="right">
			</td>
			<td class="value">
			</td>
		</tr>
	</table>
	<t:hasPermission code="csbhgqk">
	<div style="width: auto;height: auto;">
		<%-- 增加一个div，用于调节页面大小，否则默认太小 --%>
		<div style="width:800px;height:1px;"></div>
		<t:tabs id="tt" iframe="false" tabPosition="top" fit="false">
		 <t:tab href="testFilestoreController.do?subcontractCsbhgqkList&id=${testFilestorePage.id}" icon="icon-search" title="测试不合格情况" id="subcontractCsbhgqk"></t:tab>
		</t:tabs>
	</div>
	</t:hasPermission>
	<table cellpadding="0" cellspacing="1" class="formtable">
		<tr>
			<td class="title_label" colspan="1"> 
					筛选信息
			</td>
			<td colspan="3"> 
			</td>
		</tr>
		<tr>
			<td align="right" width="25%">
				<label class="Validform_label">筛选报告号:</label>
			</td>
			<td class="value" width="25%">
		     	 <input id="sxbgh" name="sxbgh" type="text" maxlength="200" style="width: 150px" class="inputxt"  ignore="ignore" value='${testFilestorePage.sxbgh}'/>
				<span class="Validform_checktip"></span>
				<label class="Validform_label" style="display: none;">筛选报告号</label>
			</td>
			<t:hasPermission code="sxbgfj">
			<td align="right" width="25%">
				<label class="Validform_label">筛选报告附件:</label>
			</td>
			<td class="value" width="25%">
				<t:webUploader auto="true" udfpath="${testFilestorePage.xh }/${testFilestorePage.pc}"  pathValues="${testFilestorePage.sxbghfile}" name="sxbghfile" fileNumLimit="3"></t:webUploader>
				<span class="Validform_checktip Validform_right" style="display: none;">文件已上传</span>
			</td>
			</t:hasPermission>
		</tr>
		<t:hasPermission code="sxqzsj">
		<tr>
		
			<td align="right">
				<label class="Validform_label">筛选开始时间:</label>
			</td>
			<td class="value">
		     	 <input id="sxstarttime" name="sxstarttime" type="text" maxlength="200" style="width: 150px" class="inputxt"  ignore="ignore" value='${testFilestorePage.sxstarttime}'/>
				<span class="Validform_checktip"></span>
				<label class="Validform_label" style="display: none;">筛选开始时间</label>
			</td>
			<td align="right">
				<label class="Validform_label">筛选结束时间:</label>
			</td>
			<td class="value">
		     	 <input id="sxendtime" name="sxendtime" type="text" maxlength="200" style="width: 150px" class="inputxt"  ignore="ignore" value='${testFilestorePage.sxendtime}'/>
				<span class="Validform_checktip"></span>
				<label class="Validform_label" style="display: none;">筛选结束时间</label>
			</td>
		</tr>
		</t:hasPermission>
		<tr>
			<t:hasPermission code="sxgcpindcs">
			<td align="right">
				<label class="Validform_label">筛选过程PIND次数:</label>
			</td>
			<td class="value">
		     	 <input id="sxgcpindcs" name="sxgcpindcs" type="text" maxlength="200" style="width: 150px" class="inputxt"  ignore="ignore" value='${testFilestorePage.sxgcpindcs}'/>
				<span class="Validform_checktip"></span>
				<label class="Validform_label" style="display: none;">筛选过程PIND次数</label>
			</td>
			</t:hasPermission>
			<t:hasPermission code="trsxsl">
			<td align="right">
				<label class="Validform_label">投入筛选数量:</label>
			</td>
			<td class="value">
		     	 <input id="trsxsl" name="trsxsl" type="text" maxlength="200" style="width: 150px" class="inputxt"  ignore="ignore" value='${testFilestorePage.trsxsl}'/>
				<span class="Validform_checktip"></span>
				<label class="Validform_label" style="display: none;">投入筛选数量</label>
			</td>
			</t:hasPermission>
		</tr>
		<tr>
			<td align="right">
				<label class="Validform_label">PIND不合格数:</label>
			</td>
			<td class="value">
		     	 <input id="pindbhgs" name="pindbhgs" type="text" maxlength="200" style="width: 150px" class="inputxt"  ignore="ignore" value='${testFilestorePage.pindbhgs}'/>
				<span class="Validform_checktip"></span>
				<label class="Validform_label" style="display: none;">PIND不合格数</label>
			</td>
			<td align="right">
				<label class="Validform_label">PIND分析报告:</label>
			</td>
			<td class="value">
				<t:webUploader auto="true" udfpath="${testFilestorePage.xh }/${testFilestorePage.pc}"  pathValues="${testFilestorePage.pindfxbg}" name="pindfxbg" fileNumLimit="3"></t:webUploader>
				<span class="Validform_checktip Validform_right" style="display: none;">文件已上传</span>
			</td>
		</tr>
		
		<tr>
			<td align="right">
				<label class="Validform_label">筛选合格数量:</label>
			</td>
			<td class="value">
		     	 <input id="sxhgsl" name="sxhgsl" type="text" maxlength="200" style="width: 150px" class="inputxt"  ignore="ignore" value='${testFilestorePage.sxhgsl}'/>
				<span class="Validform_checktip"></span>
				<label class="Validform_label" style="display: none;">筛选合格数量</label>
			</td>
			<td align="right">
				<label class="Validform_label">筛选不合格情况:</label>
			</td>
			<td class="value">
				<t:webUploader auto="true" udfpath="${testFilestorePage.xh }/${testFilestorePage.pc}"  pathValues="${testFilestorePage.sxbhgqk}" name="sxbhgqk" fileNumLimit="3"></t:webUploader>
				<span class="Validform_checktip Validform_right" style="display: none;">文件已上传</span>
			</td>
		</tr>
	
		<tr>
			<td align="right">
				<label class="Validform_label">PDA:</label>
			</td>
			<td class="value">
		     	 <input id="pda" name="pda" type="text" maxlength="200" style="width: 150px" class="inputxt"  ignore="ignore" value='${testFilestorePage.pda}' />
				<span class="Validform_checktip"></span>
				<label class="Validform_label" style="display: none;">PDA</label>
			</td>
			<td align="right">
				<label class="Validform_label">成品率:</label>
			</td>
			<td class="value">
				<input id="cpl" name="cpl" type="text" maxlength="200" style="width: 150px" class="inputxt"  ignore="ignore" value='${testFilestorePage.cpl}' />
				<span class="Validform_checktip"></span>
				<label class="Validform_label" style="display: none;">成品率</label>
			</td>
		</tr>
		<tr>
			<td align="right">
				<label class="Validform_label">X光盘:</label>
			</td>
			<td class="value">
		     	 <input id="xgp" name="xgp" type="text" maxlength="200" style="width: 150px" class="inputxt"  ignore="ignore" value='${testFilestorePage.xgp}' />
				<span class="Validform_checktip"></span>
				<label class="Validform_label" style="display: none;">X光盘</label>
			</td>
			<td align="right">
				<label class="Validform_label">测试光盘:</label>
			</td>
			<td class="value">
		     	 <input id="csgp" name="csgp" type="text" maxlength="200" style="width: 150px" class="inputxt"  ignore="ignore" value='${testFilestorePage.csgp}'/>
				<span class="Validform_checktip"></span>
				<label class="Validform_label" style="display: none;">测试光盘</label>
			</td>
		</tr>
		<tr>
			<td align="right">
				<label class="Validform_label">3σ报告:</label>
			</td>
			<td class="value">
				<t:webUploader auto="true" udfpath="${testFilestorePage.xh }/${testFilestorePage.pc}"  pathValues="${testFilestorePage.threebg}" name="threebg" fileNumLimit="3"></t:webUploader>
				<span class="Validform_checktip Validform_right" style="display: none;">文件已上传</span>
			</td>
			<td align="right">
				<label class="Validform_label">低成品率质量分析报告:</label>
			</td>
			<td class="value">
				<t:webUploader auto="true" udfpath="${testFilestorePage.xh }/${testFilestorePage.pc}"  pathValues="${testFilestorePage.dcplzlfxbg}" name="dcplzlfxbg" fileNumLimit="3"></t:webUploader>
				<span class="Validform_checktip Validform_right" style="display: none;">文件已上传</span>
			</td>
		</tr>
		</table>
	<t:hasPermission code="sxbhgqk">
		<div style="width: auto;height: auto;">
			<%-- 增加一个div，用于调节页面大小，否则默认太小 --%>
			<div style="width:800px;height:1px;"></div>
			<t:tabs id="tt" iframe="false" tabPosition="top" fit="false">
			 <t:tab href="testFilestoreController.do?subcontractSxbhgqkList&id=${testFilestorePage.id}" icon="icon-search" title="筛选不合格情况" id="subcontractSxbhgqk"></t:tab>
			</t:tabs>
		</div>
	</t:hasPermission>
	<table cellpadding="0" cellspacing="1" class="formtable">	
		<tr>
			<td class="title_label" colspan="1"> 
					鉴定/一致性信息
			</td>
			<td colspan="3"> 
			</td>
		</tr>
		<tr>
			<td align="right" width="25%">
				<label class="Validform_label">鉴定/一致性检验报告编号:</label>
			</td>
			<td class="value" width="25%">
		     	 <input id="jdyzxjybgh" name="jdyzxjybgh" type="text" maxlength="200" style="width: 150px" class="inputxt"  ignore="ignore" value='${testFilestorePage.jdyzxjybgh}'/>
				<span class="Validform_checktip"></span>
				<label class="Validform_label" style="display: none;">鉴定/一致性检验报告编号</label>
			</td>
			<t:hasPermission code="jdbgbhfile">
			<td align="right" width="25%">
				<label class="Validform_label">鉴定/一致性检验报告附件:</label>
			</td>
			<td class="value" width="25%">
				<t:webUploader auto="true" udfpath="${testFilestorePage.xh }/${testFilestorePage.pc}"  pathValues="${testFilestorePage.jdbgbhfile}" name="jdbgbhfile" fileNumLimit="3"></t:webUploader>
				<span class="Validform_checktip Validform_right" style="display: none;">文件已上传</span>
			</td>
			</t:hasPermission>
		</tr>
		<tr>
			<t:hasPermission code="jdyzxfs">
			<td align="right">
				<label class="Validform_label">鉴定/一致性检验方式:</label>
			</td>
			<td class="value">
		     	 <input id="jdfs" name="jdfs" type="text" maxlength="200" style="width: 150px" class="inputxt"  ignore="ignore" value='${testFilestorePage.jdfs}'/>
				<span class="Validform_checktip"></span>
				<label class="Validform_label" style="display: none;">鉴定/一致性检验方式</label>
			</td>
			</t:hasPermission>
			<td align="right">
				<label class="Validform_label">鉴定/一致性检验起止时间:</label>
			</td>
			<td class="value">
		     	 <input id="jdqzsj" name="jdqzsj" type="text" maxlength="200" style="width: 150px" class="inputxt"  ignore="ignore" value='${testFilestorePage.jdqzsj}'/>
				<span class="Validform_checktip"></span>
				<label class="Validform_label" style="display: none;">鉴定/一致性检验起止时间</label>
			</td>
		</tr>
		<tr>
			<t:hasPermission code="sjjdml">
			<td align="right">
				<label class="Validform_label">首件鉴定目录:</label>
			</td>
			<td class="value">
				<t:webUploader auto="true" udfpath="${testFilestorePage.xh }/${testFilestorePage.pc}"  pathValues="${testFilestorePage.sjjdml}" name="sjjdml" fileNumLimit="3"></t:webUploader>
				<span class="Validform_checktip Validform_right" style="display: none;">文件已上传</span>
			</td>
			</t:hasPermission>
			<t:hasPermission code="sjjdbg">
			<td align="right">
				<label class="Validform_label">首件鉴定报告:</label>
			</td>
			<td class="value">
				<t:webUploader auto="true" udfpath="${testFilestorePage.xh }/${testFilestorePage.pc}"  pathValues="${testFilestorePage.sjjdbg}" name="sjjdbg" fileNumLimit="3"></t:webUploader>
				<span class="Validform_checktip Validform_right" style="display: none;">文件已上传</span>
			</td>
			</t:hasPermission>
		</tr>
		<tr>
			<t:hasPermission code="zlps">
			<td align="right">
				<label class="Validform_label">质量评审:</label>
			</td>
			<td class="value">
				<t:webUploader auto="true" udfpath="${testFilestorePage.xh }/${testFilestorePage.pc}"  pathValues="${testFilestorePage.zlps}" name="zlps" fileNumLimit="3"></t:webUploader>
				<span class="Validform_checktip Validform_right" style="display: none;">文件已上传</span>
			</td>
			</t:hasPermission>
			<t:hasPermission code="yhpsyj">
			<td align="right">
				<label class="Validform_label">用户评审意见:</label>
			</td>
			<td class="value">
				<t:webUploader auto="true" udfpath="${testFilestorePage.xh }/${testFilestorePage.pc}"  pathValues="${testFilestorePage.yhpsyj}" name="yhpsyj" fileNumLimit="3"></t:webUploader>
				<span class="Validform_checktip Validform_right" style="display: none;">文件已上传</span>
			</td>
			</t:hasPermission>
		</tr>
		<tr>
			<t:hasPermission code="kssfa">
			<td align="right">
				<label class="Validform_label">抗闩锁方案:</label>
			</td>
			<td class="value">
				<t:webUploader auto="true" udfpath="${testFilestorePage.xh }/${testFilestorePage.pc}"  pathValues="${testFilestorePage.kssfa}" name="kssfa" fileNumLimit="3"></t:webUploader>
				<span class="Validform_checktip Validform_right" style="display: none;">文件已上传</span>
			</td>
			</t:hasPermission>
			<t:hasPermission code="kssbgjl">
			<td align="right">
				<label class="Validform_label">抗闩锁报告记录:</label>
			</td>
			<td class="value">
				<t:webUploader auto="true" udfpath="${testFilestorePage.xh }/${testFilestorePage.pc}"  pathValues="${testFilestorePage.kss}" name="kss" fileNumLimit="3"></t:webUploader>
				<span class="Validform_checktip Validform_right" style="display: none;">文件已上传</span>
			</td>
			</t:hasPermission>
		</tr>
		<tr>
			<t:hasPermission code="zjlfa">
			<td align="right">
				<label class="Validform_label">总剂量方案:</label>
			</td>
			<td class="value">
				<t:webUploader auto="true" udfpath="${testFilestorePage.xh }/${testFilestorePage.pc}"  pathValues="${testFilestorePage.zjlfa}" name="zjlfa" fileNumLimit="3"></t:webUploader>
				<span class="Validform_checktip Validform_right" style="display: none;">文件已上传</span>
			</td>
			</t:hasPermission>
			<t:hasPermission code="zjlbg">
			<td align="right">
				<label class="Validform_label">总剂量报告:</label>
			</td>
			<td class="value">
				<t:webUploader auto="true" udfpath="${testFilestorePage.xh }/${testFilestorePage.pc}"  pathValues="${testFilestorePage.zjl}" name="zjl" fileNumLimit="3"></t:webUploader>
				<span class="Validform_checktip Validform_right" style="display: none;">文件已上传</span>
			</td>
			</t:hasPermission>
		</tr>
		<tr>
			<t:hasPermission code="dlzfa">
			<td align="right">
				<label class="Validform_label">单粒子方案:</label>
			</td>
			<td class="value">
				<t:webUploader auto="true" udfpath="${testFilestorePage.xh }/${testFilestorePage.pc}"  pathValues="${testFilestorePage.dlzfa}" name="dlzfa" fileNumLimit="3"></t:webUploader>
				<span class="Validform_checktip Validform_right" style="display: none;">文件已上传</span>
			</td>
			</t:hasPermission>
			<t:hasPermission code="dlzbg">
			<td align="right">
				<label class="Validform_label">单粒子报告:</label>
			</td>
			<td class="value">
				<t:webUploader auto="true" udfpath="${testFilestorePage.xh }/${testFilestorePage.pc}"  pathValues="${testFilestorePage.dlz}" name="dlz" fileNumLimit="3"></t:webUploader>
				<span class="Validform_checktip Validform_right" style="display: none;">文件已上传</span>
			</td>
			</t:hasPermission>
		</tr>
		<tr>
			<t:hasPermission code="smhsqqbgjl">
			<td align="right">
				<label class="Validform_label">寿命后水汽报告记录:</label>
			</td>
			<td class="value">
				<t:webUploader auto="true" udfpath="${testFilestorePage.xh }/${testFilestorePage.pc}"  pathValues="${testFilestorePage.smhsq}" name="smhsq" fileNumLimit="3"></t:webUploader>
				<span class="Validform_checktip Validform_right" style="display: none;">文件已上传</span>
			</td>
			</t:hasPermission>
			<t:hasPermission code="shsqbgjl">
			<td align="right">
				<label class="Validform_label">筛合水汽报告记录:</label>
			</td>
			<td class="value">
				<t:webUploader auto="true" udfpath="${testFilestorePage.xh }/${testFilestorePage.pc}"  pathValues="${testFilestorePage.shsq}" name="shsq" fileNumLimit="3"></t:webUploader>
				<span class="Validform_checktip Validform_right" style="display: none;">文件已上传</span>
			</td>
			</t:hasPermission>
		</tr>
		<tr>
			<t:hasPermission code="esdbgjl">
			<td align="right">
				<label class="Validform_label">ESD报告记录:</label>
			</td>
			<td class="value">
				<t:webUploader auto="true" udfpath="${testFilestorePage.xh }/${testFilestorePage.pc}"  pathValues="${testFilestorePage.esd}" name="esd" fileNumLimit="3"></t:webUploader>
				<span class="Validform_checktip Validform_right" style="display: none;">文件已上传</span>
			</td>
			</t:hasPermission>
			<t:hasPermission code="jdyzzdy">
			<td align="right">
				<label class="Validform_label">鉴定/一致性自定义上传:</label>
			</td>
			<td class="value">
				<t:webUploader auto="true" udfpath="${testFilestorePage.xh }/${testFilestorePage.pc}"  pathValues="${testFilestorePage.jdyzzdy}" name="jdyzzdy" fileNumLimit="3"></t:webUploader>
				<span class="Validform_checktip Validform_right" style="display: none;">文件已上传</span>
			</td>
			</t:hasPermission>
		</tr>
	</table>
	<t:hasPermission code="dpaxx">
	<div style="width: auto;height: auto;">
		<%-- 增加一个div，用于调节页面大小，否则默认太小 --%>
		<div style="width:800px;height:1px;"></div>
		<t:tabs id="tt" iframe="false" tabPosition="top" fit="false">
			<t:tab href="testFilestoreController.do?subcontractDpaList&id=${testFilestorePage.id}" icon="icon-search" title="dpa信息" id="subcontractDpa"></t:tab>
		 </t:tabs>
	</div>
	</t:hasPermission>
	<t:hasPermission code="ddsqbg">
	<div style="width: auto;height: auto;">
		<%-- 增加一个div，用于调节页面大小，否则默认太小 --%>
		<div style="width:800px;height:1px;"></div>
		<t:tabs id="tt" iframe="false" tabPosition="top" fit="false">
			<t:tab href="testFilestoreController.do?subcontractDdsqbgList&id=${testFilestorePage.id}" icon="icon-search" title="单独水汽报告" id="subcontractDdsqbg"></t:tab>
		</t:tabs>
	</div>
	</t:hasPermission>
	<t:hasPermission code="bcsxxx">
	<div style="width: auto;height: auto;">
		<%-- 增加一个div，用于调节页面大小，否则默认太小 --%>
		<div style="width:800px;height:1px;"></div>
		<t:tabs id="tt" iframe="false" tabPosition="top" fit="false">
			<t:tab href="testFilestoreController.do?subcontractBcsxxxList&id=${testFilestorePage.id}" icon="icon-search" title="补充筛选信息" id="subcontractBcsxxx"></t:tab>
		</t:tabs>
	</div>
	</t:hasPermission>
	<t:hasPermission code="cqfyxx">
	<div style="width: auto;height: auto;">
		<%-- 增加一个div，用于调节页面大小，否则默认太小 --%>
		<div style="width:800px;height:1px;"></div>
		<t:tabs id="tt" iframe="false" tabPosition="top" fit="false">
			<t:tab href="testFilestoreController.do?subcontractCqfxxxList&id=${testFilestorePage.id}" icon="icon-search" title="超期复验信息" id="subcontractCqfxxx"></t:tab>
		 </t:tabs>
	</div>
	</t:hasPermission>
	<t:hasPermission code="ysxx">
	<div style="width: auto;height: auto;">
		<%-- 增加一个div，用于调节页面大小，否则默认太小 --%>
		<div style="width:800px;height:1px;"></div>
		<t:tabs id="tt" iframe="false" tabPosition="top" fit="false">
			<t:tab href="testFilestoreController.do?subcontractYsxxList&id=${testFilestorePage.id}" icon="icon-search" title="验收信息" id="subcontractYsxx"></t:tab>
		</t:tabs>
	</div>
	</t:hasPermission>
	<table cellpadding="0" cellspacing="1" class="formtable">	
		<tr>
			<td align="right" width="25%">
				<label class="Validform_label">补充检验报告:</label>
			</td>
			<td class="value" width="25%">
		     	 <input id="bcjybg" name="bcjybg" type="text" maxlength="200" style="width: 150px" class="inputxt"  ignore="ignore" value='${testFilestorePage.bcjybg}'/>
				<span class="Validform_checktip"></span>
				<label class="Validform_label" style="display: none;">补充检验报告</label>
			</td>
			<td align="right" width="25%">
				<label class="Validform_label">单批质保报告:</label>
			</td>
			<td class="value" width="25%">
		     	 <input id="dpzbbg" name="dpzbbg" type="text" maxlength="200" style="width: 150px" class="inputxt"  ignore="ignore" value='${testFilestorePage.dpzbbg}'/>
				<span class="Validform_checktip"></span>
				<label class="Validform_label" style="display: none;">单批质保报告</label>
			</td>
			
		</tr>
		<tr>
			<td align="right">
				<label class="Validform_label">归档卷宗号:</label>
			</td>
			<td class="value">
		     	 <input id="gdjzh" name="gdjzh" type="text" maxlength="200" style="width: 150px" class="inputxt"  ignore="ignore" value='${testFilestorePage.gdjzh}'/>
				<span class="Validform_checktip"></span>
				<label class="Validform_label" style="display: none;">归档卷宗号</label>
			</td>
			<td align="right">
				<label class="Validform_label">其他信息附件:</label>
			</td>
			<td class="value">
				<t:webUploader auto="true" udfpath="${testFilestorePage.xh }/${testFilestorePage.pc}"  pathValues="${testFilestorePage.otherfileattach}" name="otherfileattach" fileNumLimit="3"></t:webUploader>
				<span class="Validform_checktip Validform_right" style="display: none;">文件已上传</span>
			</td>
		</tr>
	</table>
</t:formvalid>
			<!-- 添加 附表明细 模版 -->
		<table style="display:none">
		 <tbody id="add_subcontractYsxx_table_template">
			<tr>
				<td align="right" width="25%">
					<input style="width:20px;"  type="checkbox" name="ck"/>
					<label class="Validform_label">验收报告号:</label>
				</td>
				<td class="value" width="25%">
					<input name="subcontractYsxxList[#index#].ysbgh" maxlength="200" type="text" class="inputxt"  style="width:150px;"  ignore="ignore" />
					<span class="Validform_checktip"></span>
					<label class="Validform_label" style="display: none;">验收报告号</label>
				</td>
				<td align="right" width="25%">
					<label class="Validform_label">验收附件:</label>
				</td>
				<td class="value" width="25%">
			     	<input type="hidden" id="subcontractYsxxList[#index#].ysfileattach" name="subcontractYsxxList[#index#].ysfileattach" />
					<input class="ui-button" type="button" value="上传附件" name="subcontractYsxxList[#index#].imgBtn"
								onclick="commonUpload(commonUploadDefaultCallBack,'subcontractYsxxList\\[#index#\\]\\.ysfileattach')"/>
					<a  target="_blank" id="subcontractYsxxList[#index#].ysfileattach_href"></a>
					<label class="Validform_label" style="display: none;">验收附件</label>
				</td>
			</tr>
		</tbody>
		<tbody id="add_subcontractCqfxxx_table_template">
			<tr>
				<td align="right" width="25%">
					<input style="width:20px;"  type="checkbox" name="ck"/>
					<label class="Validform_label">超期复验报告号:</label>
				</td>
				<td class="value" width="25%">
					<input name="subcontractCqfxxxList[#index#].cqfybgh" maxlength="200" type="text" class="inputxt"  style="width:150px;"  ignore="ignore" />
					<span class="Validform_checktip"></span>
					<label class="Validform_label" style="display: none;">超期复验报告号</label>
				</td>
				<td align="right" width="25%">
					<label class="Validform_label">超期复验开始时间:</label>
				</td>
				<td class="value" width="25%">
			     	<input name="subcontractCqfxxxList[#index#].cqfystarttime" maxlength="200" type="text" class="inputxt"  style="width:150px;"  ignore="ignore" />
					<span class="Validform_checktip"></span>
					<label class="Validform_label" style="display: none;">超期复验开始时间</label>
				</td>
			</tr>
			<tr>
				<td align="right" width="25%">
					<label class="Validform_label">超期复验结束时间:</label>
				</td>
				<td class="value" width="25%">
					<input name="subcontractCqfxxxList[#index#].cqfyendtime" maxlength="200" type="text" class="inputxt"  style="width:150px;"  ignore="ignore" />
					<span class="Validform_checktip"></span>
					<label class="Validform_label" style="display: none;">超期复验结束时间</label>
				</td>
				<td align="right" width="25%">
					<label class="Validform_label">超期复验类别:</label>
				</td>
				<td class="value" width="25%">
			     	<input name="subcontractCqfxxxList[#index#].cqfylb" maxlength="200" type="text" class="inputxt"  style="width:150px;"  ignore="ignore" />
					<span class="Validform_checktip"></span>
					<label class="Validform_label" style="display: none;">超期复验类别</label>
				</td>
			</tr>
			<tr>
				<td align="right" width="25%">
					<label class="Validform_label">超期复验合格数量:</label>
				</td>
				<td class="value" width="25%">
					<input name="subcontractCqfxxxList[#index#].cqfyhgzl" maxlength="200" type="text" class="inputxt"  style="width:150px;"  ignore="ignore" />
					<span class="Validform_checktip"></span>
					<label class="Validform_label" style="display: none;">超期复验合格数量</label>
				</td>
				<td align="right" width="25%">
					<label class="Validform_label">超期复验附件:</label>
				</td>
				<td class="value" width="25%">
			     	<input type="hidden" id="subcontractCqfxxxList[#index#].cqfyfileattach" name="subcontractCqfxxxList[#index#].cqfyfileattach" />
				   	<input class="ui-button" type="button" value="上传附件" name="subcontractCqfxxxList[#index#].imgBtn"
								onclick="commonUpload(commonUploadDefaultCallBack,'subcontractCqfxxxList\\[#index#\\]\\.cqfyfileattach')"/>
					<a  target="_blank" id="subcontractCqfxxxList[#index#].cqfyfileattach_href"></a>
			  		<label class="Validform_label" style="display: none;">超期复验附件</label>
				</td>
			</tr>
		</tbody> 
		<tbody id="add_subcontractBcsxxx_table_template">
			<tr>
				<td align="right" width="25%">
					<input style="width:20px;"  type="checkbox" name="ck"/>
					<label class="Validform_label">补充筛选报告号:</label>
				</td>
				<td class="value" width="25%">
					<input name="subcontractBcsxxxList[#index#].bcsxbgh" maxlength="200" type="text" class="inputxt"  style="width:150px;"  ignore="ignore" />
					<span class="Validform_checktip"></span>
					<label class="Validform_label" style="display: none;">补充筛选报告号</label>
				</td>
				<td align="right" width="25%">
					<label class="Validform_label">补充筛选开始时间:</label>
				</td>
				<td class="value" width="25%">
			     	<input name="subcontractBcsxxxList[#index#].bcsxstarttime" maxlength="200" type="text" class="inputxt"  style="width:150px;"  ignore="ignore" />
					<span class="Validform_checktip"></span>
					<label class="Validform_label" style="display: none;">补充筛选开始时间</label>
				</td>
			</tr>
			<tr>
				<td align="right" width="25%">
					<label class="Validform_label">补充筛选结束时间:</label>
				</td>
				<td class="value" width="25%">
			     	<input name="subcontractBcsxxxList[#index#].bcsxendtime" maxlength="200" type="text" class="inputxt"  style="width:150px;"  ignore="ignore" />
					<span class="Validform_checktip"></span>
					<label class="Validform_label" style="display: none;">补充筛选结束时间</label>
				</td>
				<td align="right" width="25%">
					<label class="Validform_label">补充筛选委托单位:</label>
				</td>
				<td class="value" width="25%">
			     	<input name="subcontractBcsxxxList[#index#].bcsxwtdw" maxlength="100" type="text" class="inputxt"  style="width:150px;"  ignore="ignore" />
					<span class="Validform_checktip"></span>
					<label class="Validform_label" style="display: none;">补充筛选委托单位</label>
				</td>
			</tr>
			<tr>
				<td align="right" width="25%">
					<label class="Validform_label">补充筛选投入数量:</label>
				</td>
				<td class="value" width="25%">
			     	<input name="subcontractBcsxxxList[#index#].bcsxtrsl" maxlength="200" type="text" class="inputxt"  style="width:150px;"  ignore="ignore" />
					<span class="Validform_checktip"></span>
					<label class="Validform_label" style="display: none;">补充筛选投入数量</label>
				</td>
				<td align="right" width="25%">
					<label class="Validform_label">补充筛选合格数量:</label>
				</td>
				<td class="value" width="25%">
			     	<input name="subcontractBcsxxxList[#index#].bcsxhgzl" maxlength="200" type="text" class="inputxt"  style="width:150px;"  ignore="ignore" />
					<span class="Validform_checktip"></span>
					<label class="Validform_label" style="display: none;">补充筛选合格数量</label>
				</td>
			</tr>
			<tr>
				<td align="right" width="25%">
					<label class="Validform_label">补充筛选附件:</label>
				</td>
				<td class="value" width="25%">
			     	<input type="hidden" id="subcontractBcsxxxList[#index#].bcsxfileattach" name="subcontractBcsxxxList[#index#].bcsxfileattach" />
										   <input class="ui-button" type="button" value="上传附件" name="subcontractBcsxxxList[#index#].imgBtn"
														onclick="commonUpload(commonUploadDefaultCallBack,'subcontractBcsxxxList\\[#index#\\]\\.bcsxfileattach')"/>
											<a  target="_blank" id="subcontractBcsxxxList[#index#].bcsxfileattach_href"></a>
						  <label class="Validform_label" style="display: none;">补充筛选附件</label>
				</td>
				<td align="right" width="25%">
				</td>
				<td class="value" width="25%">
				</td>
			</tr>
		</tbody>
		<tbody id="add_subcontractDdsqbg_table_template">
			<tr>
				<td align="right" width="25%">
					<input style="width:20px;"  type="checkbox" name="ck"/>
					<label class="Validform_label">单独水汽报告号:</label>
				</td>
				<td class="value" width="25%">
					<input name="subcontractDdsqbgList[#index#].ddsqbgh" maxlength="200" type="text" class="inputxt"  style="width:150px;"  ignore="ignore" />
					<span class="Validform_checktip"></span>
					<label class="Validform_label" style="display: none;">单独水汽报告号</label>
				</td>
				<td align="right" width="25%">
					<label class="Validform_label">水汽检测机构:</label>
				</td>
				<td class="value" width="25%">
			     	<input name="subcontractDdsqbgList[#index#].sqjcjg" maxlength="200" type="text" class="inputxt"  style="width:150px;"  ignore="ignore" />
					<span class="Validform_checktip"></span>
					<label class="Validform_label" style="display: none;">水汽检测机构</label>
				</td>
			</tr>
			<tr>
				<td align="right" width="25%">
					<label class="Validform_label">水汽检测开始时间:</label>
				</td>
				<td class="value" width="25%">
					<input name="subcontractDdsqbgList[#index#].sqjcstarttime" maxlength="200" type="text" class="inputxt"  style="width:150px;"  ignore="ignore" />
					<span class="Validform_checktip"></span>
					<label class="Validform_label" style="display: none;">水汽检测开始时间</label>
				</td>
				<td align="right" width="25%">
					<label class="Validform_label">水汽检测结束时间:</label>
				</td>
				<td class="value" width="25%">
			     	<input name="subcontractDdsqbgList[#index#].sqjcendtime" maxlength="200" type="text" class="inputxt"  style="width:150px;"  ignore="ignore" />
					<span class="Validform_checktip"></span>
					<label class="Validform_label" style="display: none;">水汽检测结束时间</label>
				</td>
			</tr>
			<tr>
				<td align="right" width="25%">
					<label class="Validform_label">水汽附件:</label>
				</td>
				<td class="value" width="25%">
					<input type="hidden" id="subcontractDdsqbgList[#index#].fileattach" name="subcontractDdsqbgList[#index#].fileattach" />
								   <input class="ui-button" type="button" value="上传附件" name="subcontractDdsqbgList[#index#].imgBtn"
												onclick="commonUpload(commonUploadDefaultCallBack,'subcontractDdsqbgList\\[#index#\\]\\.fileattach')"/>
									<a  target="_blank" id="subcontractDdsqbgList[#index#].fileattach_href"></a>
				  <label class="Validform_label" style="display: none;">文件上传</label>
				</td>
				<td align="right" width="25%">
				</td>
				<td class="value" width="25%">
				</td>
			</tr>
		</tbody>
		<tbody id="add_subcontractDpa_table_template">
			<tr>
				<td align="right" width="25%">
					<input style="width:20px;"  type="checkbox" name="ck"/>
					<label class="Validform_label">DPA报告号:</label>
				</td>
				<td class="value" width="25%">
					<input name="subcontractDpaList[#index#].dpabgh" maxlength="200" type="text" class="inputxt"  style="width:150px;"  ignore="ignore" />
					<span class="Validform_checktip"></span>
					<label class="Validform_label" style="display: none;">DPA报告号</label>
				</td>
				<td align="right" width="25%">
					<label class="Validform_label">DPA检测机构:</label>
				</td>
				<td class="value" width="25%">
			     	<input name="subcontractDpaList[#index#].dpajcjg" maxlength="200" type="text" class="inputxt"  style="width:150px;"  ignore="ignore" />
					<span class="Validform_checktip"></span>
					<label class="Validform_label" style="display: none;">DPA检测机构</label>
				</td>
			</tr>
			<tr>
				<td align="right" width="25%">
					<label class="Validform_label">DPA样品数量:</label>
				</td>
				<td class="value" width="25%">
					<input name="subcontractDpaList[#index#].dpaypsl" maxlength="200" type="text" class="inputxt"  style="width:150px;"  ignore="ignore" />
					<span class="Validform_checktip"></span>
					<label class="Validform_label" style="display: none;">DPA样品数量</label>
				</td>
				<td align="right" width="25%">
					<label class="Validform_label">DPA试验开始时间:</label>
				</td>
				<td class="value" width="25%">
			     	<input name="subcontractDpaList[#index#].dpastarttime" maxlength="200" type="text" class="inputxt"  style="width:150px;"  ignore="ignore" />
					<span class="Validform_checktip"></span>
					<label class="Validform_label" style="display: none;">DPA试验开始时间</label>
				</td>
			</tr>
			<tr>
				<td align="right" width="25%">
					<label class="Validform_label">DPA试验结束时间:</label>
				</td>
				<td class="value" width="25%">
					<input name="subcontractDpaList[#index#].dpaendtime" maxlength="200" type="text" class="inputxt"  style="width:150px;"  ignore="ignore" />
					<span class="Validform_checktip"></span>
					<label class="Validform_label" style="display: none;">DPA试验结束时间</label>
				</td>
				<td align="right" width="25%">
					<label class="Validform_label">DPA附件:</label>
				</td>
				<td class="value" width="25%">
			     	<input type="hidden" id="subcontractDpaList[#index#].dpafileattach" name="subcontractDpaList[#index#].dpafileattach" />
										   <input class="ui-button" type="button" value="上传附件" name="subcontractDpaList[#index#].imgBtn"
														onclick="commonUpload(commonUploadDefaultCallBack,'subcontractDpaList\\[#index#\\]\\.dpafileattach')"/>
											<a  target="_blank" id="subcontractDpaList[#index#].dpafileattach_href"></a>
						  <label class="Validform_label" style="display: none;">文件上传</label>
				</td>
			</tr>
		</tbody>
		<tbody id="add_subcontractJianzhi_table_template">
			<tr>
				<td align="right" width="25%">
					<input style="width:20px;"  type="checkbox" name="ck"/>
					<label class="Validform_label">监制报告号:</label>
				</td>
				<td class="value" width="25%">
					<input name="subcontractJianzhiList[#index#].jzbgh" maxlength="100" type="text" class="inputxt"  style="width:150px;"  ignore="ignore" >
					<span class="Validform_checktip"></span>
					<label class="Validform_label" style="display: none;">监制报告号</label>
				</td>
				<td align="right" width="25%">
					<label class="Validform_label">监制单位:</label>
				</td>
				<td class="value" width="25%">
			     	<input name="subcontractJianzhiList[#index#].jzdw" maxlength="200" type="text" class="inputxt"  style="width:150px;"  ignore="ignore" >
					<span class="Validform_checktip"></span>
					<label class="Validform_label" style="display: none;">监制单位</label>
				</td>
			</tr>
			<tr>
				<td align="right">
					<label class="Validform_label">监制数量:</label>
				</td>
				<td class="value">
					<input name="subcontractJianzhiList[#index#].jzsl" maxlength="32" type="text" class="inputxt"  style="width:150px;"  ignore="ignore" >
					<span class="Validform_checktip"></span>
					<label class="Validform_label" style="display: none;">监制数量</label>
				</td>
				<td align="right">
					<label class="Validform_label">监制时间:</label>
				</td>
				<td class="value">
			     	<input name="subcontractJianzhiList[#index#].jzsj" maxlength="32" type="text" class="inputxt"  style="width:150px;"  ignore="ignore" >
					<span class="Validform_checktip"></span>
					<label class="Validform_label" style="display: none;">监制时间</label>
				</td>
			</tr>
			<tr>
				<td align="right">
					<label class="Validform_label">附件:</label>
				</td>
				<td class="value">
						<input type="hidden" id="subcontractJianzhiList[#index#].jzfileattach" name="subcontractJianzhiList[#index#].jzfileattach" />
								    <input class="ui-button" type="button" value="上传附件"  name="subcontractJianzhiList[#index#].imgBtn" onclick="commonUpload(commonUploadDefaultCallBack,'subcontractJianzhiList\\[#index#\\]\\.jzfileattach')"/> 
									<a  target="_blank" id="subcontractJianzhiList[#index#].jzfileattach_href">未上传</a>
				  <label class="Validform_label" style="display: none;">文件</label>
				</td>
				<td align="right">
					<label class="Validform_label">附件:</label>
				</td>
				<td class="value">
				</td>
	   		</tr>
	 	</tbody>
	 	
		<tbody id="add_subcontractCsbhgqk_table_template">
			<tr>
				<td align="right" width="25%">
					<label class="Validform_label">常温:</label>
				</td>
				<td class="value" width="25%">
					<input name="subcontractCsbhgqkList[#index#].normal" maxlength="32" type="text" class="inputxt"  style="width:150px;"  ignore="ignore" >
					<span class="Validform_checktip"></span>
					<label class="Validform_label" style="display: none;">常温</label>
				</td>
				<td align="right" width="25%">
					<label class="Validform_label">高温:</label>
				</td>
				<td class="value" width="25%">
			     	<input name="subcontractCsbhgqkList[#index#].high" maxlength="32" type="text" class="inputxt"  style="width:150px;"  ignore="ignore" >
					<span class="Validform_checktip"></span>
					<label class="Validform_label" style="display: none;">高温</label>
				</td>
			</tr>
			<tr>
				<td align="right" width="25%">
					<label class="Validform_label">低温:</label>
				</td>
				<td class="value" width="25%">
					<input name="subcontractCsbhgqkList[#index#].low" maxlength="32" type="text" class="inputxt"  style="width:150px;"  ignore="ignore" >
					<span class="Validform_checktip"></span>
					<label class="Validform_label" style="display: none;">低温</label>
				</td>
				<td align="right" width="25%">
					<label class="Validform_label"></label>
				</td>
				<td class="value" width="25%">
				</td>
			</tr>
		</tbody>
		<tbody id="add_subcontractFzbhgqk_table_template">
		<tr>
			<td align="right" width="25%">
				<input style="width:20px;"  type="checkbox" name="ck"/>
				<label class="Validform_label">不合格项目:</label>
			</td>
			<td class="value" width="25%">
				<t:dictSelect field="subcontractFzbhgqkList[#index#].bhgxm" type="list"   typeGroupCode="fzbhgqk"  extendJson="{class:'form-control input-sm'}" hasLabel="false"  title="封装不合格情况" ></t:dictSelect>
				<span class="Validform_checktip"></span>
				<label class="Validform_label" style="display: none;">不合格项目</label>
			</td>
			<td align="right" width="25%">
				<label class="Validform_label">不合格数量:</label>
			</td>
			<td class="value" width="25%">
				<input name="subcontractFzbhgqkList[#index#].bhgsl" maxlength="32" type="text" class="inputxt"  style="width:150px;"  ignore="ignore"/>
				<span class="Validform_checktip"></span>
				<label class="Validform_label" style="display: none;">不合格数量</label>
			</td>
		</tr>
	</tbody>
	<tbody id="add_subcontractSxbhgqk_table_template">
		<tr>
			<td align="right" width="25%">
				<input style="width:20px;"  type="checkbox" name="ck"/>
				<label class="Validform_label">不合格项目:</label>
			</td>
			<td class="value" width="25%">
				<t:dictSelect field="subcontractSxbhgqkList[#index#].bhgxm" type="list"   typeGroupCode="sxbhgqk"  extendJson="{class:'form-control input-sm'}" hasLabel="false"  title="筛选不合格情况" ></t:dictSelect>
				<span class="Validform_checktip"></span>
				<label class="Validform_label" style="display: none;">不合格项目</label>
			</td>
			<td align="right" width="25%">
				<label class="Validform_label">不合格数量:</label>
			</td>
			<td class="value" width="25%">
				<input name="subcontractSxbhgqkList[#index#].bhgsl" maxlength="32" type="text" class="inputxt"  style="width:150px;"  ignore="ignore"/>
				<span class="Validform_checktip"></span>
				<label class="Validform_label" style="display: none;">不合格数量</label>
			</td>
		</tr>
	</tbody>
		<tbody id="add_subcontractYcl_table_template">
			<tr>
				<td align="right" width="25%">
					<input style="width:20px;"  type="checkbox" name="ck"/>
					<label class="Validform_label">原材料类型:</label>
				</td>
				<td class="value" width="25%">
					<t:dictSelect field="subcontractYclList[#index#].materialType" type="list"   typeGroupCode="ycllx"   hasLabel="false"  title="阶段标识" ></t:dictSelect>
					<span class="Validform_checktip"></span>
					<label class="Validform_label" style="display: none;">原材料类型</label>
				</td>
				<td align="right" width="25%">
					<label class="Validform_label">产品型号:</label>
				</td>
				<td class="value" width="25%">
					<t:dictSelect  field="subcontractYclList[#index#].cpxh" type="select"  hasLabel="false"  extendJson="{class:'form-control input-sm ',style='width:150px'}" dictTable="file_raw_material" dictField="model" dictText="model" ></t:dictSelect>
					<span class="Validform_checktip"></span>
					<label class="Validform_label" style="display: none;">监制单位</label>
				</td>
			</tr>
			<tr>
				<td align="right" width="25%">
					<label class="Validform_label">产品批次:</label>
				</td>
				<td class="value" width="25%">
					<t:dictSelect  field="subcontractYclList[#index#].cppc" type="select"  hasLabel="false"  extendJson="{class:'form-control input-sm ',style='width:150px'}" dictTable="file_raw_material" dictField="inspection_lot" dictText="inspection_lot" ></t:dictSelect>
					<span class="Validform_checktip"></span>
					<label class="Validform_label" style="display: none;">产品批次</label>
				</td>
				<td align="right" width="25%">
					<label class="Validform_label">文件附件:</label>
				</td>
				<td class="value" width="25%">
				</td>
			</tr>
		</tbody>
		</table>
 </body>
 <script src = "webpage/com/jeecg/filemanage/testFilestore.js"></script>	
  	<script type="text/javascript">
	  	//加载 已存在的 文件
	  	$(function(){
	  		var cgFormId=$("input[name='id']").val();
	  		$.ajax({
	  		   type: "post",
	  		   url: "testFilestoreController.do?getFiles&id=" +  cgFormId,
	  		   success: function(data){
	  			 var arrayFileObj = jQuery.parseJSON(data).obj;
	  			 
	  			$.each(arrayFileObj,function(n,file){
	  				var fieldName = file.field.toLowerCase();
	  				var table = $("#"+fieldName+"_fileTable");
	  				var tr = $("<tr style=\"height:34px;\"></tr>");
	  				var title = file.title;
	  				if(title.length > 15){
	  					title = title.substring(0,12) + "...";
	  				}
	  				var td_title = $("<td>" + title + "</td>");
	  		  		var td_download = $("<td><a style=\"margin-left:10px;\" href=\"commonController.do?viewFile&fileid=" + file.fileKey + "&subclassname=org.jeecgframework.web.cgform.entity.upload.CgUploadEntity\" title=\"下载\">下载</a></td>")
	  		  		var td_view = $("<td><a style=\"margin-left:10px;\" href=\"javascript:void(0);\" onclick=\"openwindow('预览','commonController.do?openViewFile&fileid=" + file.fileKey + "&subclassname=org.jeecgframework.web.cgform.entity.upload.CgUploadEntity','fList',700,500)\">预览</a></td>");
	  		  		tr.appendTo(table);
	  		  		td_title.appendTo(tr);
	  		  		td_download.appendTo(tr);
	  		  		td_view.appendTo(tr);
		  		  		if(location.href.indexOf("load=detail")==-1){
			  		  		var td_del = $("<td><a style=\"margin-left:10px;\" href=\"javascript:void(0)\" class=\"jeecgDetail\" onclick=\"del('cgUploadController.do?delFile&id=" + file.fileKey + "',this)\">删除</a></td>");
			  		  		td_del.appendTo(tr);
		  		  		}
	  		  		
	  			 });
	  		   }
	  		});
			$("#fileadd_jdfs").change(function(){
			var jdfs = $("#fileadd_jdfs").val();
			alert(jdfs);
			if(jdfs="SXHGPRK"){
				$('input[name="jdbgbh"]').attr("datatype","*");
				$('input[name="jdqzsj"]').attr("datatype","*");
				$('input[name="sjjdbg"]').attr("datatype","*");
				$('input[name="sjjdml"]').attr("datatype","*");
			}else{
				$('input[name="jdbgbh"]').removeAttr("datatype");
				$('input[name="jdqzsj"]').removeAttr("datatype");
				$('input[name="sjjdbg"]').removeAttr("datatype");
				$('input[name="sjjdml"]').removeAttr("datatype");
			}
			$("#formobj").Validform();
		});
	
		$("#fileadd_yph").combotree({
			onSelect:function(node){
				var cpxh = node.text; 
				$.ajax({
					type: "POST",
					url:'fileRawMaterialController.do?getPcListByxh',
					data: {xh:cpxh,type:"wafer"},
					dataType : 'json',
					success : function(data) {
						if (data.success) {
							$("#fileadd_yppc").combotree({
								data: data.obj,
								valueField: 'id',
								textField: 'text',
							});
						}
					}
				});
			}    
		});
		$("#fileadd_wjxh").combotree({
			onSelect:function(node){
				var cpxh = node.text; 
				$.ajax({
					type: "POST",
					url:'fileRawMaterialController.do?getPcListByxh',
					data: {xh:cpxh,type:"shell"},
					dataType : 'json',
					success : function(data) {
						if (data.success) {
							$("#fileadd_wkjypc").combotree({
								data: data.obj,
								valueField: 'id',
								textField: 'text',
							});
						}
					}
				});
			}    
		});
		$("#fileadd_gbxh").combotree({
			onSelect:function(node){
				var cpxh = node.text; 
				$.ajax({
					type: "POST",
					url:'fileRawMaterialController.do?getPcListByxh',
					data: {xh:cpxh,type:"coverplate"},
					dataType : 'json',
					success : function(data) {
						if (data.success) {
							$("#fileadd_gbjypc").combotree({
								data: data.obj,
								valueField: 'id',
								textField: 'text',
							});
						}
					}
				});
			}    
		});
		$("#fileadd_jhsxh").combotree({
			onSelect:function(node){
				var cpxh = node.text; 
				$.ajax({
					type: "POST",
					url:'fileRawMaterialController.do?getPcListByxh',
					data: {xh:cpxh,type:"bondingwire"},
					dataType : 'json',
					success : function(data) {
						if (data.success) {
							$("#fileadd_jhsjypc").combotree({
								data: data.obj,
								valueField: 'id',
								textField: 'text',
							});
						}
					}
				});
			}    
		});
		$("#fileadd_zpjxh").combotree({
			onSelect:function(node){
				var cpxh = node.text; 
				$.ajax({
					type: "POST",
					url:'fileRawMaterialController.do?getPcListByxh',
					data: {xh:cpxh,type:"adhesivetape"},
					dataType : 'json',
					success : function(data) {
						if (data.success) {
							$("#fileadd_zpjyjpc").combotree({
								data: data.obj,
								valueField: 'id',
								textField: 'text',
							});
						}
					}
				});
			}    
		});
		$("#fileadd_dbmxh").combotree({
			onSelect:function(node){
				var cpxh = node.text; 
				$.ajax({
					type: "POST",
					url:'fileRawMaterialController.do?getPcListByxh',
					data: {xh:cpxh,type:"markingink"},
					dataType : 'json',
					success : function(data) {
						if (data.success) {
							$("#fileadd_dbmjypc").combotree({
								data: data.obj,
								valueField: 'id',
								textField: 'text',
							});
						}
					}
				});
			}    
		});
	  	})
	  	
		  	/**
		 	 * 删除图片数据资源
		 	 */
		  	function del(url,obj){
		  		var content = "请问是否要删除该资源";
		  		var navigatorName = "Microsoft Internet Explorer"; 
		  		if( navigator.appName == navigatorName ){ 
		  			$.dialog.confirm(content, function(){
		  				submit(url,obj);
		  			}, function(){
		  			});
		  		}else{
		  			layer.open({
						title:"提示",
						content:content,
						icon:7,
						yes:function(index){
							submit(url,obj);
						},
						btn:['确定','取消'],
						btn2:function(index){
							layer.close(index);
						}
					});
		  		}
		  	}
		  	
		  	function submit(url,obj){
		  		$.ajax({
		  			async : false,
		  			cache : false,
		  			type : 'POST',
		  			url : url,// 请求的action路径
		  			error : function() {// 请求失败处理函数
		  			},
		  			success : function(data) {
		  				var d = $.parseJSON(data);
		  				if (d.success) {
		  					var msg = d.msg;
		  					tip(msg);
		  					obj.parentNode.parentNode.parentNode.deleteRow(obj.parentNode.parentNode);
		  				} else {
		  					tip(d.msg);
		  				}
		  			}
		  		});
		  	}
	  	
  		function jeecgFormFileCallBack(data){
  			if (data.success == true) {
				uploadFile(data);
			} else {
				if (data.responseText == '' || data.responseText == undefined) {
					$.messager.alert('错误', data.msg);
					$.Hidemsg();
				} else {
					try {
						var emsg = data.responseText.substring(data.responseText.indexOf('错误描述'), data.responseText.indexOf('错误信息'));
						$.messager.alert('错误', emsg);
						$.Hidemsg();
					} catch(ex) {
						$.messager.alert('错误', data.responseText + '');
					}
				}
				return false;
			}
			if (!neibuClickFlag) {
				var win = frameElement.api.opener;
				win.reloadTable();
			}
  		}
  		function upload() {
					$('#jzbgh').uploadify('upload', '*');
					$('#fzbhgqk').uploadify('upload', '*');
					$('#sxbghfile').uploadify('upload', '*');
					$('#sxqzsj').uploadify('upload', '*');
					$('#sxbhgqk').uploadify('upload', '*');
					$('#threebg').uploadify('upload', '*');
					$('#dcplzlfxbg').uploadify('upload', '*');
					$('#jdbgbhfile').uploadify('upload', '*');
					$('#sjjdbg').uploadify('upload', '*');
					$('#sjjdml').uploadify('upload', '*');
					$('#yhpsyj').uploadify('upload', '*');
					$('#zlps').uploadify('upload', '*');
					$('#esd').uploadify('upload', '*');
					$('#kss').uploadify('upload', '*');
					$('#zjl').uploadify('upload', '*');
					$('#dlz').uploadify('upload', '*');
					$('#smhsq').uploadify('upload', '*');
					$('#shsq').uploadify('upload', '*');
					$('#otherfileattach').uploadify('upload', '*');
					$('#kssfa').uploadify('upload', '*');
					$('#zjlfa').uploadify('upload', '*');
					$('#dlzfa').uploadify('upload', '*');
					$('#jdyzzdy').uploadify('upload', '*');
					$('#pindfxbg').uploadify('upload', '*');
		}
		
		var neibuClickFlag = false;
		function neibuClick() {
			neibuClickFlag = true; 
			$('#btn_sub').trigger('click');
		}
		function cancel() {
					$('#jzbgh').uploadify('cancel', '*');
					$('#fzbhgqk').uploadify('cancel', '*');
					$('#sxbghfile').uploadify('cancel', '*');
					$('#sxqzsj').uploadify('cancel', '*');
					$('#sxbhgqk').uploadify('cancel', '*');
					$('#threebg').uploadify('cancel', '*');
					$('#dcplzlfxbg').uploadify('cancel', '*');
					$('#jdbgbhfile').uploadify('cancel', '*');
					$('#sjjdbg').uploadify('cancel', '*');
					$('#sjjdml').uploadify('cancel', '*');
					$('#yhpsyj').uploadify('cancel', '*');
					$('#zlps').uploadify('cancel', '*');
					$('#esd').uploadify('cancel', '*');
					$('#kss').uploadify('cancel', '*');
					$('#zjl').uploadify('cancel', '*');
					$('#dlz').uploadify('cancel', '*');
					$('#smhsq').uploadify('cancel', '*');
					$('#shsq').uploadify('cancel', '*');
					$('#otherfileattach').uploadify('cancel', '*');
					$('#kssfa').uploadify('cancel', '*');
					$('#zjlfa').uploadify('cancel', '*');
					$('#dlzfa').uploadify('cancel', '*');
					$('#jdyzzdy').uploadify('cancel', '*');
					$('#pindfxbg').uploadify('cancel', '*');
		}
		function uploadFile(data){
			if(!$("input[name='id']").val()){
				if(data.obj!=null && data.obj!='undefined'){
					$("input[name='id']").val(data.obj.id);
				}
			}
			if($(".uploadify-queue-item").length>0){
				upload();
			}else{
				if (neibuClickFlag){
					alert(data.msg);
					neibuClickFlag = false;
				}else {
					var win = frameElement.api.opener;
					win.reloadTable();
					win.tip(data.msg);
					frameElement.api.close();
				}
			}
		}
  	</script>
