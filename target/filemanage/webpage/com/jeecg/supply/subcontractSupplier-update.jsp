<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<!DOCTYPE html>
<html>
 <head>
  <title>供应商管理</title>
  <t:base type="jquery,easyui,tools,DatePicker"></t:base>
  <script type="text/javascript">
  //编写自定义JS代码
  </script>
 </head>
 <body>
		<t:formvalid formid="formobj" dialog="true" usePlugin="password" layout="table" action="subcontractSupplierController.do?doUpdate" >
					<input id="id" name="id" type="hidden" value="${subcontractSupplierPage.id }"/>
		<table style="width: 600px;" cellpadding="0" cellspacing="1" class="formtable">
					<tr>
						<td align="right">
							<label class="Validform_label">
								外包单位名称:
							</label>
						</td>
						<td class="value">
						    <input id="dwmc" name="dwmc" type="text" maxlength="32" style="width: 150px" class="inputxt"  ignore="ignore"  value='${subcontractSupplierPage.dwmc}'/>
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">外包单位名称</label>
						</td>
					</tr>
					<tr>
						<td align="right">
							<label class="Validform_label">
								地址:
							</label>
						</td>
						<td class="value">
						    <input id="dz" name="dz" type="text" maxlength="32" style="width: 150px" class="inputxt"  ignore="ignore"  value='${subcontractSupplierPage.dz}'/>
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">地址</label>
						</td>
					</tr>
					<tr>
						<td align="right">
							<label class="Validform_label">
								外包产品名称:
							</label>
						</td>
						<td class="value">
									<t:dictSelect field="cpmc" type="list"  typeGroupCode="jglx"   defaultVal="${subcontractSupplierPage.cpmc}" hasLabel="false"  title="外包产品名称" ></t:dictSelect>     
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">外包产品名称</label>
						</td>
					</tr>
					<tr>
						<td align="right">
							<label class="Validform_label">
								联系人:
							</label>
						</td>
						<td class="value">
						    <input id="lxr" name="lxr" type="text" maxlength="32" style="width: 150px" class="inputxt"  ignore="ignore"  value='${subcontractSupplierPage.lxr}'/>
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">联系人</label>
						</td>
					</tr>
					<tr>
						<td align="right">
							<label class="Validform_label">
								联系方式:
							</label>
						</td>
						<td class="value">
						    <input id="lxfs" name="lxfs" type="text" maxlength="32" style="width: 150px" class="inputxt"  ignore="ignore"  value='${subcontractSupplierPage.lxfs}'/>
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">联系方式</label>
						</td>
					</tr>
					<tr>
						<td align="right">
							<label class="Validform_label">
								级别:
							</label>
						</td>
						<td class="value">
						    <input id="level" name="level" type="text" maxlength="32" style="width: 150px" class="inputxt"  ignore="ignore"  value='${subcontractSupplierPage.level}'/>
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">级别</label>
						</td>
					</tr>
					<tr>
						<td align="right">
							<label class="Validform_label">
								备注:
							</label>
						</td>
						<td class="value">
						    <input id="remark" name="remark" type="text" maxlength="32" style="width: 150px" class="inputxt"  ignore="ignore"  value='${subcontractSupplierPage.remark}'/>
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">备注</label>
						</td>
					</tr>
				
			</table>
		</t:formvalid>
 </body>
