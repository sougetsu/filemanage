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
  <t:formvalid formid="formobj" dialog="true" usePlugin="password" layout="table" action="fileRawMaterialController.do?doAdd" callback="jeecgFormFileCallBack@Override">
					<input id="id" name="id" type="hidden" value="${fileRawMaterialPage.id }"/>
		<table style="width: 600px;" cellpadding="0" cellspacing="1" class="formtable">
				<tr>
					<td align="right">
						<label class="Validform_label">
							检验批次:
						</label>
					</td>
					<td class="value">
					     	 <input id="inspectionLot" name="inspectionLot" type="text" maxlength="32" style="width: 150px" class="inputxt"  datatype="*"  ignore="checked" />
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
							  <t:dictSelect field="materialType" type="list"  datatype="*"  typeGroupCode="ycllx"  defaultVal="${fileRawMaterialPage.materialType}" hasLabel="false"  title="原材料类型" ></t:dictSelect>     
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
					     	 <input id="model" name="model" type="text" maxlength="32" style="width: 150px" class="inputxt"  datatype="*"  ignore="checked" />
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
		<div class="form jeecgDetail">
			<t:upload name="fileattach" id="fileattach" queueID="filediv_fileattach" outhtml="false" uploader="cgUploadController.do?saveFiles"  extend="office" buttonText='添加文件'  onUploadStart="fileattachOnUploadStart"> </t:upload>
			<div class="form" id="filediv_fileattach"></div>
			<script type="text/javascript">
				function fileattachOnUploadStart(file){
					var cgFormId=$("input[name='id']").val();
					$('#fileattach').uploadify("settings", "formData", {
						'cgFormId':cgFormId,
						'cgFormName':'file_raw_material',
						'cgFormField':'FILEATTACH'
					});
				}
			</script>
		</div>
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">附件</label>
						</td>
				</tr>
				
				
			</table>
		</t:formvalid>
 </body>
	  	<script type="text/javascript">
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
					$('#fileattach').uploadify('upload', '*');	
			}
			
			var neibuClickFlag = false;
			function neibuClick() {
				neibuClickFlag = true; 
				$('#btn_sub').trigger('click');
			}
			function cancel() {
					$('#fileattach').uploadify('cancel', '*');
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
