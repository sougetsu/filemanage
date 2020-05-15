<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<!DOCTYPE html>
<html>
 <head>
  <title>产品基础信息</title>
  <t:base type="jquery,easyui,tools,DatePicker"></t:base>
  <script type="text/javascript">
  //编写自定义JS代码
  </script>
 </head>
 <body>
		<t:formvalid formid="formobj" dialog="true" usePlugin="password" layout="table" action="cerProductInfoController.do?doUpdate" >
					<input id="id" name="id" type="hidden" value="${cerProductInfoPage.id }"/>
		<table style="width: 600px;" cellpadding="0" cellspacing="1" class="formtable">
					<tr>
						<td align="right">
							<label class="Validform_label">
								产品型号:
							</label>
						</td>
						<td class="value">
						    <input id="cpxh" name="cpxh" type="text" maxlength="32" style="width: 150px" class="inputxt"  datatype="*"  ignore="checked"  value='${cerProductInfoPage.cpxh}'/>
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">产品型号</label>
						</td>
					</tr>
					<tr>
						<td align="right">
							<label class="Validform_label">
								产品批次:
							</label>
						</td>
						<td class="value">
						    <input id="cppc" name="cppc" type="text" maxlength="32" style="width: 150px" class="inputxt"  datatype="*"  ignore="checked"  value='${cerProductInfoPage.cppc}'/>
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
						    <input id="cpmc" name="cpmc" type="text" maxlength="32" style="width: 150px" class="inputxt"  datatype="*"  ignore="checked"  value='${cerProductInfoPage.cpmc}'/>
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">产品名称</label>
						</td>
					</tr>
					<tr>
						<td align="right">
							<label class="Validform_label">
								产品数量:
							</label>
						</td>
						<td class="value">
						    <input id="cpsl" name="cpsl" type="text" maxlength="32" style="width: 150px" class="inputxt"  datatype="*"  ignore="checked"  value='${cerProductInfoPage.cpsl}'/>
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">产品数量</label>
						</td>
					</tr>
					<tr>
						<td align="right">
							<label class="Validform_label">
								产品检测标准:
							</label>
						</td>
						<td class="value">
						    <input id="cpjcbz" name="cpjcbz" type="text" maxlength="32" style="width: 150px" class="inputxt"  datatype="*"  ignore="checked"  value='${cerProductInfoPage.cpjcbz}'/>
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">产品检测标准</label>
						</td>
					</tr>
					<tr>
						<td align="right">
							<label class="Validform_label">
								检测报告号:
							</label>
						</td>
						<td class="value">
						    <input id="jcbgh" name="jcbgh" type="text" maxlength="32" style="width: 150px" class="inputxt"  ignore="checked"  value='${cerProductInfoPage.jcbgh}'/>
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">检测报告号</label>
						</td>
					</tr>
				
			</table>
		</t:formvalid>
 </body>
