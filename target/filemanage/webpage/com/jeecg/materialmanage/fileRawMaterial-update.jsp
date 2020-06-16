<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<!DOCTYPE html>
<html>
 <head>
  <title>原材料库</title>
  <t:base type="jquery,easyui,tools,DatePicker"></t:base>
  <t:base type="uploadify"></t:base>
  <script type="text/javascript">
  //编写自定义JS代码
  </script>
 </head>
 <body>
		<t:formvalid formid="formobj" dialog="true" usePlugin="password" layout="table" action="fileRawMaterialController.do?doUpdate">
					<input id="id" name="id" type="hidden" value="${fileRawMaterialPage.id }"/>
		<table style="width: 600px;" cellpadding="0" cellspacing="1" class="formtable">
					<tr>
						<td align="right">
							<label class="Validform_label">
								检验批次:
							</label>
						</td>
						<td class="value">
						    <input id="inspectionLot" name="inspectionLot" type="text" maxlength="32" style="width: 150px" class="inputxt"  datatype="*"  ignore="checked"  value='${fileRawMaterialPage.inspectionLot}'/>
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">检验批次</label>
						</td>
					</tr>
					<tr>
						<td align="right">
							<label class="Validform_label">
								原材料类型:
							</label>
						</td>
						<td class="value">
									<t:dictSelect field="materialType" type="list"  datatype="*"  typeGroupCode="ycllx"   defaultVal="${fileRawMaterialPage.materialType}" hasLabel="false"  title="原材料类型" ></t:dictSelect>     
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">原材料类型</label>
						</td>
					</tr>
					<tr>
						<td align="right">
							<label class="Validform_label">
								型号:
							</label>
						</td>
						<td class="value">
						    <input id="model" name="model" type="text" maxlength="32" style="width: 150px" class="inputxt"  datatype="*"  ignore="checked"  value='${fileRawMaterialPage.model}'/>
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">型号</label>
						</td>
					</tr>
					<tr>
						<td align="right">
							<label class="Validform_label">
								附件:
							</label>
						</td>
						<td class="value">
							<t:webUploader auto="true" pathValues="${fileRawMaterialPage.fileattach}" name="fileattach" duplicate="true" fileNumLimit="10"></t:webUploader>
						</td>
					</tr>
			</table>
		</t:formvalid>
 </body>
