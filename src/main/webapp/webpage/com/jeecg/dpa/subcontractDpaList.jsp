<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<script type="text/javascript">
	$('#addSubcontractDpaBtn').linkbutton({   
	    iconCls: 'icon-add'  
	});  
	$('#delSubcontractDpaBtn').linkbutton({   
	    iconCls: 'icon-remove'  
	}); 
	$('#addSubcontractDpaBtn').bind('click', function(){   
 		 var tr =  $("#add_subcontractDpa_table_template tr").clone();
	 	 $("#add_subcontractDpa_table").append(tr);
	 	 resetTrNumByRow('add_subcontractDpa_table',3);
	 	 return false;
    });  
	$('#delSubcontractDpaBtn').bind('click', function(){  
		$("#add_subcontractDpa_table").find("input[name$='ck']:checked").parent().parent().next().remove();  
		$("#add_subcontractDpa_table").find("input[name$='ck']:checked").parent().parent().next().remove();  
		$("#add_subcontractDpa_table").find("input[name$='ck']:checked").parent().parent().remove();  
		//resetTrNumByRow('add_subcontractDpa_table',3); 
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
	<a id="addSubcontractDpaBtn" href="#">添加</a> <a id="delSubcontractDpaBtn" href="#">删除</a> 
</div>
<table cellpadding="0" cellspacing="1" id="subcontractDpa_table" class="formtable">
	<tbody id="add_subcontractDpa_table">
	<c:if test="${fn:length(subcontractDpaList)  <= 0 }">
		<tr>
			<input name="subcontractDpaList[0].id" type="hidden"/>
			<input name="subcontractDpaList[0].createName" type="hidden"/>
			<input name="subcontractDpaList[0].createBy" type="hidden"/>
			<input name="subcontractDpaList[0].createDate" type="hidden"/>
			<input name="subcontractDpaList[0].updateName" type="hidden"/>
			<input name="subcontractDpaList[0].updateBy" type="hidden"/>
			<input name="subcontractDpaList[0].updateDate" type="hidden"/>
			<input name="subcontractDpaList[0].sysOrgCode" type="hidden"/>
			<input name="subcontractDpaList[0].sysCompanyCode" type="hidden"/>
			<input name="subcontractDpaList[0].bpmStatus" type="hidden"/>
			<input name="subcontractDpaList[0].fileid" type="hidden"/>
			<td align="right" width="25%">
				<input style="width:20px;"  type="checkbox" name="ck"/>
				<label class="Validform_label">DPA报告号:</label>
			</td>
			<td class="value" width="25%">
				<input name="subcontractDpaList[0].dpabgh" maxlength="200" type="text" class="inputxt"  style="width:150px;"  ignore="ignore" />
				<span class="Validform_checktip"></span>
				<label class="Validform_label" style="display: none;">DPA报告号</label>
			</td>
			<td align="right" width="25%">
				<label class="Validform_label">DPA附件:</label>
			</td>
			<td class="value" width="25%">
		     	<input type="hidden" id="subcontractDpaList[0].dpafileattach" name="subcontractDpaList[0].dpafileattach" />
									    <input class="ui-button" type="button" value="上传附件"  name="subcontractDpaList[0].imgBtn" onclick="commonUpload(commonUploadDefaultCallBack,'subcontractDpaList\\[0\\]\\.dpafileattach')"/> 
										<a  target="_blank" id="subcontractDpaList[0].dpafileattach_href">未上传</a>
					  <label class="Validform_label" style="display: none;">文件上传</label>
			</td>
			
		</tr>
		<tr>
			<td align="right" width="25%">
				<label class="Validform_label">DPA试验开始时间:</label>
			</td>
			<td class="value" width="25%">
				<input id="subcontractDpaList0dpastarttime" name="subcontractDpaList[0].dpastarttime" type="text" errormsg="该字段不为空" />
				<img onclick="WdatePicker({el:'subcontractDpaList0dpastarttime'})" src="plug-in/easyui/themes/black/images/datebox_arrow.png" style="opacity: 0.6;height:17px;width:17px;" align="absmiddle">
				<span class="Validform_checktip"></span>
			</td>
			<td align="right" width="25%">
				<label class="Validform_label">DPA试验结束时间:</label>
			</td>
			<td class="value" width="25%">
				<input id="subcontractDpaList0dpaendtime" name="subcontractDpaList[0].dpaendtime" type="text" errormsg="该字段不为空" />
				<img onclick="WdatePicker({el:'subcontractDpaList0dpaendtime'})" src="plug-in/easyui/themes/black/images/datebox_arrow.png" style="opacity: 0.6;height:17px;width:17px;" align="absmiddle">
				<span class="Validform_checktip"></span>
			</td>
		</tr>
		<tr>
			<td align="right" width="25%">
				<label class="Validform_label">DPA检测机构:</label>
			</td>
			<td class="value" width="25%">
				<t:dictSelect  field="subcontractDpaList[0].dpajcjg" type="select"  hasLabel="false"  extendJson="{class:'form-control input-sm ',style='width:150px'}" dictTable="file_dpaname" dictField="dpaname" dictText="dpaname" ></t:dictSelect>
				<span class="Validform_checktip"></span>
				<label class="Validform_label" style="display: none;">DPA检测机构</label>
			</td>
			<td align="right" width="25%">
				<label class="Validform_label">DPA样品数量:</label>
			</td>
			<td class="value" width="25%">
				<input name="subcontractDpaList[0].dpaypsl" maxlength="200" type="text" class="inputxt"  style="width:150px;"  ignore="ignore" />
				<span class="Validform_checktip"></span>
				<label class="Validform_label" style="display: none;">DPA样品数量</label>
			</td>
		</tr>
	</c:if>
	<c:if test="${fn:length(subcontractDpaList)  > 0 }">
		<c:forEach items="${subcontractDpaList}" var="poVal" varStatus="stuts">
			<tr>
				<input name="subcontractDpaList[${stuts.index }].id" type="hidden" value="${poVal.id }"/>
				<input name="subcontractDpaList[${stuts.index }].createName" type="hidden" value="${poVal.createName }"/>
				<input name="subcontractDpaList[${stuts.index }].createBy" type="hidden" value="${poVal.createBy }"/>
				<input name="subcontractDpaList[${stuts.index }].createDate" type="hidden" value="${poVal.createDate }"/>
				<input name="subcontractDpaList[${stuts.index }].updateName" type="hidden" value="${poVal.updateName }"/>
				<input name="subcontractDpaList[${stuts.index }].updateBy" type="hidden" value="${poVal.updateBy }"/>
				<input name="subcontractDpaList[${stuts.index }].updateDate" type="hidden" value="${poVal.updateDate }"/>
				<input name="subcontractDpaList[${stuts.index }].sysOrgCode" type="hidden" value="${poVal.sysOrgCode }"/>
				<input name="subcontractDpaList[${stuts.index }].sysCompanyCode" type="hidden" value="${poVal.sysCompanyCode }"/>
				<input name="subcontractDpaList[${stuts.index }].bpmStatus" type="hidden" value="${poVal.bpmStatus }"/>
				<input name="subcontractDpaList[${stuts.index }].fileid" type="hidden" value="${poVal.fileid }"/>
				<td align="right" width="25%">
				<input style="width:20px;"  type="checkbox" name="ck"/>
				<label class="Validform_label">DPA报告号:</label>
			</td>
			<td class="value" width="25%">
				<input name="subcontractDpaList[${stuts.index }].dpabgh" maxlength="32" type="text" class="inputxt"  style="width:150px;"  ignore="ignore"  value="${poVal.dpabgh }"/>
				<span class="Validform_checktip"></span>
				<label class="Validform_label" style="display: none;">DPA报告号</label>
			</td>
			<td align="right" width="25%">
				<label class="Validform_label">DPA附件:</label>
			</td>
			<td class="value" width="25%">
		     	<input type="hidden" id="subcontractDpaList[${stuts.index }].dpafileattach" name="subcontractDpaList[${stuts.index }].dpafileattach"  value="${poVal.dpafileattach }"/>
									   <input class="ui-button" type="button" value="上传附件" name="subcontractDpaList[${stuts.index }].imgBtn"
													onclick="commonUpload(commonUploadDefaultCallBack,'subcontractDpaList\\[${stuts.index }\\]\\.dpafileattach')"/>
					  	 		<c:if test="${empty poVal.dpafileattach}">
											<a  target="_blank" id="subcontractDpaList[${stuts.index }].dpafileattach_href"></a>
										</c:if>
										<c:if test="${!empty poVal.dpafileattach}">
											<a  href="img/server/${poVal.dpafileattach}"  target="_blank" id="subcontractDpaList[${stuts.index }].dpafileattach_href">下载</a>
										</c:if>
					  <label class="Validform_label" style="display: none;">文件上传</label>
			</td>
		</tr>
		<tr>
			<td align="right" width="25%">
				<label class="Validform_label">DPA试验开始时间:</label>
			</td>
			<td class="value" width="25%">
				<input id="subcontractDpaList[${stuts.index }]dpastarttime" name="subcontractDpaList[${stuts.index }].dpastarttime" type="text" errormsg="该字段不为空" value="${poVal.dpastarttime }" />
				<img onclick="WdatePicker({el:'subcontractDpaList[${stuts.index }]dpastarttime'})" src="plug-in/easyui/themes/black/images/datebox_arrow.png" style="opacity: 0.6;height:17px;width:17px;" align="absmiddle">
				<span class="Validform_checktip"></span>
			</td>
			<td align="right" width="25%">
				<label class="Validform_label">DPA试验结束时间:</label>
			</td>
			<td class="value" width="25%">
				<input id="subcontractDpaList[${stuts.index }]dpaendtime" name="subcontractDpaList[${stuts.index }].dpaendtime" type="text" errormsg="该字段不为空" value="${poVal.dpaendtime }" />
				<img onclick="WdatePicker({el:'subcontractDpaList[${stuts.index }]dpaendtime'})" src="plug-in/easyui/themes/black/images/datebox_arrow.png" style="opacity: 0.6;height:17px;width:17px;" align="absmiddle">
				<span class="Validform_checktip"></span>
			</td>
		</tr>
		<tr>
			<td align="right" width="25%">
				<label class="Validform_label">DPA检测机构:</label>
			</td>
			<td class="value" width="25%">
				<t:dictSelect  field="subcontractDpaList[${stuts.index }].dpajcjg" type="select"  hasLabel="false"  defaultVal="${poVal.dpajcjg }" extendJson="{class:'form-control input-sm ',style='width:150px'}" dictTable="file_dpaname" dictField="dpaname" dictText="dpaname" ></t:dictSelect>
				<span class="Validform_checktip"></span>
				<label class="Validform_label" style="display: none;">DPA检测机构</label>
			</td>
			<td align="right" width="25%">
				<label class="Validform_label">DPA样品数量:</label>
			</td>
			<td class="value" width="25%">
				<input name="subcontractDpaList[${stuts.index }].dpaypsl" maxlength="32" type="text" class="inputxt"  style="width:150px;"  ignore="ignore"  value="${poVal.dpaypsl }"/>
				<span class="Validform_checktip"></span>
				<label class="Validform_label" style="display: none;">DPA样品数量</label>
			</td>
		</tr>
		</c:forEach>
	</c:if>	
	</tbody>
</table>
