<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<!DOCTYPE html>
<html>
 <head>
  <title>合格证管理</title>
  <t:base type="jquery,easyui,tools,DatePicker"></t:base>
  <script src="plug-in/easyui/extEasyUI.js"></script>
  <script type="text/javascript">
  //编写自定义JS代码
  </script>
 </head>
 <body>
  <t:formvalid formid="formobj" dialog="true" usePlugin="password" layout="table" action="cerCertificationController.do?doAdd" >
					<input id="id" name="id" type="hidden" value="${cerCertificationPage.id }"/>
		<table style="width: 100%;" cellpadding="0" cellspacing="1" class="formtable">
				<tr>
					<td rowspan="2" style="text-align:center;"><img src="images/cslog.png"/></td>
					<td colspan="3" style="text-align:center;height:38px;font-size:16px;font-weight:bold;padding-right:20%;">
							产品合格证
					</td>
				</tr>
				<tr>
					<td></td>
					<td style="text-align:right;height:38px;font-weight:bold;">
						<label class="Validform_label">
							合格证编号：
						</label
					</td>
					<td ></td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							产品型号:
						</label>
					</td>
					<td class="value">
							<input id="Add_projectId" name="projectId" class="easyui-combotree" style="width:330px" data-options="url:'${pageContext.request.contextPath}/dictionary/projectList',parentField : 'pid',required:'true'"
								lines="true" cascadeCheck="false" />
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">产品型号</label>
						</td>
					<td align="right">
						<label class="Validform_label">
							产品批次:
						</label>
					</td>
					<td class="value">
					     	 <input id="cppc" name="cppc" type="text" maxlength="32" style="width: 150px" class="inputxt"  datatype="*"  ignore="checked" />
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">产品批次</label>
						</td>
					</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							产品名称:
						</label>
					</td>
					<td class="value">
					     	 <input id="cpmc" name="cpmc" type="text" maxlength="32" style="width: 150px" class="inputxt"  datatype="*"  ignore="checked" />
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">产品名称</label>
						</td>
					<td align="right">
						<label class="Validform_label">
							产品数量 :
						</label>
					</td>
					<td class="value">
					     	 <input id="cpsl" name="cpsl" type="text" maxlength="32" style="width: 150px" class="inputxt"  datatype="*"  ignore="checked" />
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">产品数量 </label>
						</td>
					</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							产品检测标准:
						</label>
					</td>
					<td class="value">
					     	 <input id="cpjcbz" name="cpjcbz" type="text" maxlength="32" style="width: 150px" class="inputxt"  datatype="*"  ignore="checked" />
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">产品检测标准</label>
						</td>
					<td align="right">
						<label class="Validform_label">
							检测报告号:
						</label>
					</td>
					<td class="value">
					     	 <input id="jcbgh" name="jcbgh" type="text" maxlength="32" style="width: 150px" class="inputxt"  datatype="*"  ignore="checked" />
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">检测报告号</label>
						</td>
					</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							<t:dictSelect field="cpmc" type="list"  typeGroupCode="zllx"  defaultVal="0" hasLabel="false"  title="质量类型" >
							</t:dictSelect>
						</label>
					</td>
					<td class="value">
					     	 <input id="zlbzdj" name="zlbzdj" type="text" maxlength="32" style="width: 150px" class="inputxt"  ignore="ignore" />
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">质量保证等级</label>
						</td>
					<td align="right">
						<label class="Validform_label">
							用户单位:
						</label>
					</td>
					<td class="value">
					     	 <input id="yhdw" name="yhdw" type="text" maxlength="32" style="width: 150px" class="inputxt"  datatype="*"  ignore="checked" />
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">用户单位</label>
						</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							检验员:
						</label>
					</td>
					<td class="value">
					     	 <input id="jyy" name="jyy" type="text" maxlength="32" style="width: 150px" class="inputxt"  datatype="*"  ignore="checked" />
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">检验员</label>
						</td>
					<td align="right">
						<label class="Validform_label">
							签发日期:
						</label>
					</td>
					<td class="value">
							   <input id="qfrq" name="qfrq" type="text" style="width: 150px" class="Wdate" onClick="WdatePicker()"  datatype="*"  ignore="checked" />    
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">签发日期</label>
						</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							备注:
						</label>
					</td>
					<td colspan="3" class="value">
					     	 <input id="bz" name="bz" type="text" maxlength="32" style="width: 85%" class="inputxt"  ignore="ignore" />
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">备注</label>
						</td>
					</tr>
				<tr>
						<td colspan="4"
							style="text-align:center;height:38px;font-size:12px;font-weight:bold">中国航天科技集团公司第九研究院第七七二研究所</td>
					</tr>
			</table>
		</t:formvalid>
 </body>
<script type="text/javascript">
$(document).ready(function() {
});
</script>