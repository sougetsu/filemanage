<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<script type="text/javascript">
	$('#addSubcontractCqfxxxBtn').linkbutton({   
	    iconCls: 'icon-add'  
	});  
	$('#delSubcontractCqfxxxBtn').linkbutton({   
	    iconCls: 'icon-remove'  
	}); 
	$('#addSubcontractCqfxxxBtn').bind('click', function(){   
 		 var tr =  $("#add_subcontractCqfxxx_table_template tr").clone();
	 	 $("#add_subcontractCqfxxx_table").append(tr);
	 	resetTrNumByRow('add_subcontractCqfxxx_table',3);
	 	 return false;
    });  
	$('#delSubcontractCqfxxxBtn').bind('click', function(){   
		$("#add_subcontractCqfxxx_table").find("input[name$='ck']:checked").parent().parent().next().remove();
		$("#add_subcontractCqfxxx_table").find("input[name$='ck']:checked").parent().parent().next().remove();
		$("#add_subcontractCqfxxx_table").find("input[name$='ck']:checked").parent().parent().remove();  
		resetTrNumByRow('add_subcontractCqfxxx_table',3); 
        return false;
    }); 
    $(document).ready(function(){
    	$(".datagrid-toolbar").parent().css("width","auto");
    	$(".datagrid-toolbar").parent().css("overflow","hidden");
    	if(location.href.indexOf("load=detail")!=-1){
			$(":input").attr("disabled","true");
			$(".datagrid-toolbar").hide();
		}
    });
</script>
<div style="padding: 3px; height: 25px;width:auto;" class="datagrid-toolbar">
	<a id="addSubcontractCqfxxxBtn" href="#">添加</a> <a id="delSubcontractCqfxxxBtn" href="#">删除</a> 
</div>
<table border="0" cellpadding="2" cellspacing="0" id="subcontractCqfxxx_table" class="formtable">
	<tbody id="add_subcontractCqfxxx_table">
	<c:if test="${fn:length(subcontractCqfxxxList)  <= 0 }">
		<tr>
			<input name="subcontractCqfxxxList[0].id" type="hidden"/>
			<input name="subcontractCqfxxxList[0].createName" type="hidden"/>
			<input name="subcontractCqfxxxList[0].createBy" type="hidden"/>
			<input name="subcontractCqfxxxList[0].createDate" type="hidden"/>
			<input name="subcontractCqfxxxList[0].updateName" type="hidden"/>
			<input name="subcontractCqfxxxList[0].updateBy" type="hidden"/>
			<input name="subcontractCqfxxxList[0].updateDate" type="hidden"/>
			<input name="subcontractCqfxxxList[0].sysOrgCode" type="hidden"/>
			<input name="subcontractCqfxxxList[0].sysCompanyCode" type="hidden"/>
			<input name="subcontractCqfxxxList[0].bpmStatus" type="hidden"/>
			<input name="subcontractCqfxxxList[0].fileid" type="hidden"/>
			<td align="right" width="25%">
				<input style="width:20px;"  type="checkbox" name="ck"/>
				<label class="Validform_label">超期复验报告号:</label>
			</td>
			<td class="value" width="25%">
				<input name="subcontractCqfxxxList[0].cqfybgh" maxlength="200" type="text" class="inputxt"  style="width:150px;"  ignore="ignore" />
				<span class="Validform_checktip"></span>
				<label class="Validform_label" style="display: none;">超期复验报告号</label>
			</td>
			<td align="right" width="25%">
				<label class="Validform_label">超期复验附件:</label>
			</td>
			<td class="value" width="25%">
		     	<input type="hidden" id="subcontractCqfxxxList[0].cqfyfileattach" name="subcontractCqfxxxList[0].cqfyfileattach" />
			    <input class="ui-button" type="button" value="上传附件"  name="subcontractCqfxxxList[0].imgBtn" onclick="commonUpload(commonUploadDefaultCallBack,'subcontractCqfxxxList\\[0\\]\\.cqfyfileattach')"/> 
				<a  target="_blank" id="subcontractCqfxxxList[0].cqfyfileattach_href">未上传</a>
			  	<label class="Validform_label" style="display: none;">超期复验附件</label>
			</td>
		</tr>
		<tr>
			<td align="right" width="25%">
				<label class="Validform_label">超期复验开始时间:</label>
			</td>
			<td class="value" width="25%">
				<input id="subcontractCqfxxxList0cqfystarttime" name="subcontractCqfxxxList[0].cqfystarttime" type="text" errormsg="该字段不为空"/>
				<img onclick="WdatePicker({el:'subcontractCqfxxxList0cqfystarttime'})" src="plug-in/easyui/themes/black/images/datebox_arrow.png" style="opacity: 0.6;height:17px;width:17px;" align="absmiddle">
				<span class="Validform_checktip"></span>
			</td>
			<td align="right" width="25%">
				<label class="Validform_label">超期复验结束时间:</label>
			</td>
			<td class="value" width="25%">
				<input id="subcontractCqfxxxList0cqfyendtime" name="subcontractCqfxxxList[0].cqfyendtime" type="text" errormsg="该字段不为空"/>
				<img onclick="WdatePicker({el:'subcontractCqfxxxList0cqfyendtime'})" src="plug-in/easyui/themes/black/images/datebox_arrow.png" style="opacity: 0.6;height:17px;width:17px;" align="absmiddle">
				<span class="Validform_checktip"></span>
			</td>
		</tr>
		<tr>
			<td align="right" width="25%">
				<label class="Validform_label">超期复验类别:</label>
			</td>
			<td class="value" width="25%">
		     	<input name="subcontractCqfxxxList[0].cqfylb" maxlength="200" type="text" class="inputxt"  style="width:150px;"  ignore="ignore" />
				<span class="Validform_checktip"></span>
				<label class="Validform_label" style="display: none;">超期复验类别</label>
			</td>
			<td align="right" width="25%">
				<label class="Validform_label">超期复验合格数量:</label>
			</td>
			<td class="value" width="25%">
				<input name="subcontractCqfxxxList[0].cqfyhgzl" maxlength="200" type="text" class="inputxt"  style="width:150px;"  ignore="ignore" />
				<span class="Validform_checktip"></span>
				<label class="Validform_label" style="display: none;">超期复验合格数量</label>
			</td>
			
		</tr>
	</c:if>
	<c:if test="${fn:length(subcontractCqfxxxList)  > 0 }">
		<c:forEach items="${subcontractCqfxxxList}" var="poVal" varStatus="stuts">
			<tr>
				<input name="subcontractCqfxxxList[${stuts.index }].id" type="hidden" value="${poVal.id }"/>
				<input name="subcontractCqfxxxList[${stuts.index }].createName" type="hidden" value="${poVal.createName }"/>
				<input name="subcontractCqfxxxList[${stuts.index }].createBy" type="hidden" value="${poVal.createBy }"/>
				<input name="subcontractCqfxxxList[${stuts.index }].createDate" type="hidden" value="${poVal.createDate }"/>
				<input name="subcontractCqfxxxList[${stuts.index }].updateName" type="hidden" value="${poVal.updateName }"/>
				<input name="subcontractCqfxxxList[${stuts.index }].updateBy" type="hidden" value="${poVal.updateBy }"/>
				<input name="subcontractCqfxxxList[${stuts.index }].updateDate" type="hidden" value="${poVal.updateDate }"/>
				<input name="subcontractCqfxxxList[${stuts.index }].sysOrgCode" type="hidden" value="${poVal.sysOrgCode }"/>
				<input name="subcontractCqfxxxList[${stuts.index }].sysCompanyCode" type="hidden" value="${poVal.sysCompanyCode }"/>
				<input name="subcontractCqfxxxList[${stuts.index }].bpmStatus" type="hidden" value="${poVal.bpmStatus }"/>
				<input name="subcontractCqfxxxList[${stuts.index }].fileid" type="hidden" value="${poVal.fileid }"/>
				<td align="right" width="25%">
					<input style="width:20px;"  type="checkbox" name="ck"/>
					<label class="Validform_label">超期复验报告号:</label>
				</td>
				<td class="value" width="25%">
					<input name="subcontractCqfxxxList[${stuts.index }].cqfybgh" maxlength="32" type="text" class="inputxt"  style="width:150px;"  ignore="ignore"  value="${poVal.cqfybgh }"/>
					<span class="Validform_checktip"></span>
					<label class="Validform_label" style="display: none;">超期复验报告号</label>
				</td>
				<td align="right" width="25%">
					<label class="Validform_label">超期复验附件:</label>
				</td>
				<td class="value" width="25%">
			     	<input type="hidden" id="subcontractCqfxxxList[${stuts.index }].cqfyfileattach" name="subcontractCqfxxxList[${stuts.index }].cqfyfileattach"  value="${poVal.cqfyfileattach }"/>
									   <input class="ui-button" type="button" value="上传附件" name="subcontractCqfxxxList[${stuts.index }].imgBtn"
													onclick="commonUpload(commonUploadDefaultCallBack,'subcontractCqfxxxList\\[${stuts.index }\\]\\.cqfyfileattach')"/>
					  	 		<c:if test="${empty poVal.cqfyfileattach}">
											<a  target="_blank" id="subcontractCqfxxxList[${stuts.index }].cqfyfileattach_href"></a>
										</c:if>
										<c:if test="${!empty poVal.cqfyfileattach}">
											<a  href="img/server/${poVal.cqfyfileattach}"  target="_blank" id="subcontractCqfxxxList[${stuts.index }].cqfyfileattach_href">下载</a>
										</c:if>
					  <label class="Validform_label" style="display: none;">超期复验附件</label>
				</td>
			</tr>
			<tr>
				<td align="right" width="25%">
					<label class="Validform_label">超期复验开始时间:</label>
				</td>
				<td class="value" width="25%">
					<input id="subcontractCqfxxxList${stuts.index }cqfystarttime" name="subcontractCqfxxxList[${stuts.index }].cqfystarttime" type="text" errormsg="该字段不为空" value="${poVal.cqfystarttime }"/>
					<img onclick="WdatePicker({el:'subcontractCqfxxxList${stuts.index }cqfystarttime'})" src="plug-in/easyui/themes/black/images/datebox_arrow.png" style="opacity: 0.6;height:17px;width:17px;" align="absmiddle">
					<span class="Validform_checktip"></span>
				</td>
				<td align="right" width="25%">
					<label class="Validform_label">超期复验结束时间:</label>
				</td>
				<td class="value" width="25%">
					<input id="subcontractCqfxxxList${stuts.index }cqfyendtime" name="subcontractCqfxxxList[${stuts.index }].cqfyendtime" type="text" errormsg="该字段不为空" value="${poVal.cqfyendtime }"/>
					<img onclick="WdatePicker({el:'subcontractCqfxxxList${stuts.index }cqfyendtime'})" src="plug-in/easyui/themes/black/images/datebox_arrow.png" style="opacity: 0.6;height:17px;width:17px;" align="absmiddle">
					<span class="Validform_checktip"></span>
				</td>
			</tr>
			<tr>
				<td align="right" width="25%">
					<label class="Validform_label">超期复验类别:</label>
				</td>
				<td class="value" width="25%">
			     	<input name="subcontractCqfxxxList[${stuts.index }].cqfylb" maxlength="32" type="text" class="inputxt"  style="width:150px;"  ignore="ignore"  value="${poVal.cqfylb }"/>
					<span class="Validform_checktip"></span>
					<label class="Validform_label" style="display: none;">超期复验类别</label>
				</td>
				<td align="right" width="25%">
					<label class="Validform_label">超期复验合格数量:</label>
				</td>
				<td class="value" width="25%">
					<input name="subcontractCqfxxxList[${stuts.index }].cqfyhgzl" maxlength="32" type="text" class="inputxt"  style="width:150px;"  ignore="ignore"  value="${poVal.cqfyhgzl }"/>
					<span class="Validform_checktip"></span>
					<label class="Validform_label" style="display: none;">超期复验合格数量</label>
				</td>
			</tr>
		</c:forEach>
	</c:if>	
	</tbody>
</table>
