<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<!DOCTYPE html>
<html>
 <head>
  <title>原材料库</title>
  <t:base type="jquery,easyui,tools,DatePicker"></t:base>
  <t:base type="uploadify"></t:base>
  <link href="plug-in/select2/css/select2.css" rel="stylesheet">
<script type="text/javascript" src="plug-in/select2/js/select2.js"></script>
  <script type="text/javascript">
  //编写自定义JS代码
  $(document).ready(function() {
  	$(".select2").select2();
  });
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
						    <input id="update_inspectionLot" name="inspectionLot" type="text" maxlength="32" style="width: 150px" class="inputxt"  datatype="*"  ignore="checked"  value='${fileRawMaterialPage.inspectionLot}'/>
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">检验批次</label>
						</td>
					</tr>
					<tr>
						<td align="right">
							<label class="Validform_label">
								检验报告编号:
							</label>
						</td>
						<td class="value">
						    <input id="update_inspectionReportno" name="inspectionReportno" type="text" maxlength="32" style="width: 150px" class="inputxt"  datatype="*"  ignore="checked"  value='${fileRawMaterialPage.inspectionReportno}'/>
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">检验报告编号</label>
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
								生产商:
							</label>
						</td>
						<td class="value">
							<t:dictSelect id="update_producer" field="producer" type="select"  hasLabel="false"  title="生产商" extendJson="{class:'form-control input-sm select2',style='width:100%'}"  defaultVal="${fileRawMaterialPage.producer}"  dictTable="subcontract_supplier_module" dictField="dwmc" dictText="dwmc" ></t:dictSelect>
						</td>
					</tr>
					<tr>
						<td align="right">
							<label class="Validform_label">
								供应商:
							</label>
						</td>
						<td class="value">
							<t:dictSelect id="update_supplier" field="supplier" type="select"  hasLabel="false"  title="供应商" extendJson="{class:'form-control input-sm select2',style='width:100%'}"  defaultVal="${fileRawMaterialPage.supplier}"  dictTable="subcontract_supplier" dictField="dwmc" dictText="dwmc" ></t:dictSelect>
						</td>
					</tr>
					<tr>
						<td align="right">
							<label class="Validform_label">
								检验数量:
							</label>
						</td>
						<td class="value">
						     	 <input id="update_inspectiocount" name="inspectiocount" type="text" maxlength="32" style="width: 150px" class="inputxt"  datatype="*"  ignore="checked" value='${fileRawMaterialPage.inspectiocount}' />
								<span class="Validform_checktip"></span>
								<label class="Validform_label" style="display: none;">检验数量</label>
							</td>
					</tr>
					<tr>
						<td align="right">
							<label class="Validform_label">
								合格数量:
							</label>
						</td>
						<td class="value">
						     	 <input id="update_qualifiedcount" name="qualifiedcount" type="text" maxlength="32" style="width: 150px" class="inputxt"  datatype="*"  ignore="checked" value='${fileRawMaterialPage.qualifiedcount}' />
								<span class="Validform_checktip"></span>
								<label class="Validform_label" style="display: none;">合格数量</label>
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
