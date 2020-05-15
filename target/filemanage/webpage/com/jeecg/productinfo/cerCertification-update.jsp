<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<!DOCTYPE html>
<html>
 <head>
  <title>合格证管理</title>
  <t:base type="jquery,easyui,tools,DatePicker"></t:base>
  <script type="text/javascript">
  //编写自定义JS代码
  </script>
 </head>
 <body>
		<t:formvalid formid="formobj" dialog="true" usePlugin="password" layout="table" action="cerCertificationController.do?doUpdate" >
					<input id="id" name="id" type="hidden" value="${cerCertificationPage.id }"/>
		<table style="width: 600px;" cellpadding="0" cellspacing="1" class="formtable">
					<tr>
						<td align="right">
							<label class="Validform_label">
								产品型号:
							</label>
						</td>
						<td class="value">
						    <input id="cpxh" name="cpxh" type="text" maxlength="32" style="width: 150px" class="inputxt"  datatype="*"  ignore="checked"  value='${cerCertificationPage.cpxh}'/>
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">产品型号</label>
						</td>
						<td align="right">
							<label class="Validform_label">
								产品批次:
							</label>
						</td>
						<td class="value">
						    <input id="cppc" name="cppc" type="text" maxlength="32" style="width: 150px" class="inputxt"  datatype="*"  ignore="checked"  value='${cerCertificationPage.cppc}'/>
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
						    <input id="cpmc" name="cpmc" type="text" maxlength="32" style="width: 150px" class="inputxt"  datatype="*"  ignore="checked"  value='${cerCertificationPage.cpmc}'/>
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">产品名称</label>
						</td>
						<td align="right">
							<label class="Validform_label">
								产品数量 :
							</label>
						</td>
						<td class="value">
						    <input id="cpsl" name="cpsl" type="text" maxlength="32" style="width: 150px" class="inputxt"  datatype="*"  ignore="checked"  value='${cerCertificationPage.cpsl}'/>
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
						    <input id="cpjcbz" name="cpjcbz" type="text" maxlength="32" style="width: 150px" class="inputxt"  datatype="*"  ignore="checked"  value='${cerCertificationPage.cpjcbz}'/>
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">产品检测标准</label>
						</td>
						<td align="right">
							<label class="Validform_label">
								检测报告号:
							</label>
						</td>
						<td class="value">
						    <input id="jcbgh" name="jcbgh" type="text" maxlength="32" style="width: 150px" class="inputxt"  datatype="*"  ignore="checked"  value='${cerCertificationPage.jcbgh}'/>
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">检测报告号</label>
						</td>
					</tr>
					<tr>
						<td align="right">
							<label class="Validform_label">
								质量保证等级:
							</label>
						</td>
						<td class="value">
						    <input id="zlbzdj" name="zlbzdj" type="text" maxlength="32" style="width: 150px" class="inputxt"  ignore="ignore"  value='${cerCertificationPage.zlbzdj}'/>
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">质量保证等级</label>
						</td>
						<td align="right">
							<label class="Validform_label">
								质量状态:
							</label>
						</td>
						<td class="value">
						    <input id="zlzt" name="zlzt" type="text" maxlength="32" style="width: 150px" class="inputxt"  ignore="ignore"  value='${cerCertificationPage.zlzt}'/>
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">质量状态</label>
						</td>
					</tr>
					<tr>
						<td align="right">
							<label class="Validform_label">
								用户单位:
							</label>
						</td>
						<td class="value">
						    <input id="yhdw" name="yhdw" type="text" maxlength="32" style="width: 150px" class="inputxt"  datatype="*"  ignore="checked"  value='${cerCertificationPage.yhdw}'/>
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">用户单位</label>
						</td>
						<td align="right">
							<label class="Validform_label">
								检验员:
							</label>
						</td>
						<td class="value">
						    <input id="jyy" name="jyy" type="text" maxlength="32" style="width: 150px" class="inputxt"  datatype="*"  ignore="checked"  value='${cerCertificationPage.jyy}'/>
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">检验员</label>
						</td>
					</tr>
					<tr>
						<td align="right">
							<label class="Validform_label">
								签发日期:
							</label>
						</td>
						<td class="value">
									  <input id="qfrq" name="qfrq" type="text" style="width: 150px"  class="Wdate" onClick="WdatePicker()"  datatype="*"  ignore="checked" value='<fmt:formatDate value='${cerCertificationPage.qfrq}' type="date" pattern="yyyy-MM-dd"/>'/>
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">签发日期</label>
						</td>
						<td align="right">
							<label class="Validform_label">
								备注:
							</label>
						</td>
						<td class="value">
						    <input id="bz" name="bz" type="text" maxlength="32" style="width: 150px" class="inputxt"  ignore="ignore"  value='${cerCertificationPage.bz}'/>
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">备注</label>
						</td>
					</tr>
				
			</table>
		</t:formvalid>
 </body>
