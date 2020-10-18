<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<script type="text/javascript">
	$('#addSubcontractDdsqbgBtn').linkbutton({   
	    iconCls: 'icon-add'  
	});  
	$('#delSubcontractDdsqbgBtn').linkbutton({   
	    iconCls: 'icon-remove'  
	}); 
	$('#addSubcontractDdsqbgBtn').bind('click', function(){   
 		 var tr =  $("#add_subcontractDdsqbg_table_template tr").clone();
	 	 $("#add_subcontractDdsqbg_table").append(tr);
	 	resetTrNumByRow('add_subcontractDdsqbg_table',3);
	 	 return false;
    });  
	$('#delSubcontractDdsqbgBtn').bind('click', function(){
		$("#add_subcontractDdsqbg_table").find("input[name$='ck']:checked").parent().parent().next().remove(); 
		$("#add_subcontractDdsqbg_table").find("input[name$='ck']:checked").parent().parent().next().remove(); 
		$("#add_subcontractDdsqbg_table").find("input[name$='ck']:checked").parent().parent().remove();  
		resetTrNumByRow('add_subcontractDdsqbg_table',3); 
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
	<a id="addSubcontractDdsqbgBtn" href="#">添加</a> <a id="delSubcontractDdsqbgBtn" href="#">删除</a> 
</div>
<table border="0" cellpadding="2" cellspacing="0" id="subcontractDdsqbg_table" class="formtable">
	<tbody id="add_subcontractDdsqbg_table">
	<c:if test="${fn:length(subcontractDdsqbgList)  <= 0 }">
		<tr>
			<input name="subcontractDdsqbgList[0].id" type="hidden"/>
			<input name="subcontractDdsqbgList[0].createName" type="hidden"/>
			<input name="subcontractDdsqbgList[0].createBy" type="hidden"/>
			<input name="subcontractDdsqbgList[0].createDate" type="hidden"/>
			<input name="subcontractDdsqbgList[0].updateName" type="hidden"/>
			<input name="subcontractDdsqbgList[0].updateBy" type="hidden"/>
			<input name="subcontractDdsqbgList[0].updateDate" type="hidden"/>
			<input name="subcontractDdsqbgList[0].sysOrgCode" type="hidden"/>
			<input name="subcontractDdsqbgList[0].sysCompanyCode" type="hidden"/>
			<input name="subcontractDdsqbgList[0].bpmStatus" type="hidden"/>
			<input name="subcontractDdsqbgList[0].fileid" type="hidden"/>
			<td align="right" width="25%">
				<input style="width:20px;"  type="checkbox" name="ck"/>
				<label class="Validform_label">单独水汽报告号:</label>
			</td>
			<td class="value" width="25%">
				<input name="subcontractDdsqbgList[0].ddsqbgh" maxlength="200" type="text" class="inputxt"  style="width:150px;"  ignore="ignore" />
				<span class="Validform_checktip"></span>
				<label class="Validform_label" style="display: none;">单独水汽报告号</label>
			</td>
			<td align="right" width="25%">
				<label class="Validform_label">水汽附件:</label>
			</td>
			<td class="value" width="25%">
				<input type="hidden" id="subcontractDdsqbgList[0].fileattach" name="subcontractDdsqbgList[0].fileattach" />
			    <input class="ui-button" type="button" value="上传附件"  name="subcontractDdsqbgList[0].imgBtn" onclick="commonUpload(commonUploadDefaultCallBack,'subcontractDdsqbgList\\[0\\]\\.fileattach')"/> 
				<a  target="_blank" id="subcontractDdsqbgList[0].fileattach_href">未上传</a>
			  	<label class="Validform_label" style="display: none;">文件上传</label>
			</td>
		</tr>
		<tr>
			<td align="right" width="25%">
				<label class="Validform_label">水汽检测开始时间:</label>
			</td>
			<td class="value" width="25%">
				<input id="subcontractDdsqbgList0sqjcstarttime" name="subcontractDdsqbgList[0].sqjcstarttime" type="text" errormsg="该字段不为空"/>
				<img onclick="WdatePicker({el:'subcontractDdsqbgList0sqjcstarttime'})" src="plug-in/easyui/themes/black/images/datebox_arrow.png" style="opacity: 0.6;height:17px;width:17px;" align="absmiddle">
				<span class="Validform_checktip"></span>
			</td>
			<td align="right" width="25%">
				<label class="Validform_label">水汽检测结束时间:</label>
			</td>
			<td class="value" width="25%">
				<input id="subcontractDdsqbgList0sqjcendtime" name="subcontractDdsqbgList[0].sqjcendtime" type="text" errormsg="该字段不为空"/>
				<img onclick="WdatePicker({el:'subcontractDdsqbgList0sqjcendtime'})" src="plug-in/easyui/themes/black/images/datebox_arrow.png" style="opacity: 0.6;height:17px;width:17px;" align="absmiddle">
				<span class="Validform_checktip"></span>
			</td>
		</tr>
		<tr>
			<td align="right" width="25%">
				<label class="Validform_label">水汽检测机构:</label>
			</td>
			<td class="value" width="25%">
				<t:dictSelect  field="subcontractDdsqbgList[0].sqjcjg" type="select"  hasLabel="false"  extendJson="{class:'form-control input-sm ',style='width:150px'}" dictTable="file_sqjcjg" dictField="companyname" dictText="companyname" ></t:dictSelect>
				<span class="Validform_checktip"></span>
				<label class="Validform_label" style="display: none;">水汽检测机构</label>
			</td>
			<td align="right" width="25%">
			</td>
			<td class="value" width="25%">
			</td>
		</tr>
	</c:if>
	<c:if test="${fn:length(subcontractDdsqbgList)  > 0 }">
		<c:forEach items="${subcontractDdsqbgList}" var="poVal" varStatus="stuts">
		<tr>
			<input name="subcontractDdsqbgList[${stuts.index }].id" type="hidden" value="${poVal.id }"/>
			<input name="subcontractDdsqbgList[${stuts.index }].createName" type="hidden" value="${poVal.createName }"/>
			<input name="subcontractDdsqbgList[${stuts.index }].createBy" type="hidden" value="${poVal.createBy }"/>
			<input name="subcontractDdsqbgList[${stuts.index }].createDate" type="hidden" value="${poVal.createDate }"/>
			<input name="subcontractDdsqbgList[${stuts.index }].updateName" type="hidden" value="${poVal.updateName }"/>
			<input name="subcontractDdsqbgList[${stuts.index }].updateBy" type="hidden" value="${poVal.updateBy }"/>
			<input name="subcontractDdsqbgList[${stuts.index }].updateDate" type="hidden" value="${poVal.updateDate }"/>
			<input name="subcontractDdsqbgList[${stuts.index }].sysOrgCode" type="hidden" value="${poVal.sysOrgCode }"/>
			<input name="subcontractDdsqbgList[${stuts.index }].sysCompanyCode" type="hidden" value="${poVal.sysCompanyCode }"/>
			<input name="subcontractDdsqbgList[${stuts.index }].bpmStatus" type="hidden" value="${poVal.bpmStatus }"/>
			<input name="subcontractDdsqbgList[${stuts.index }].fileid" type="hidden" value="${poVal.fileid }"/>
			<td align="right" width="25%">
				<input style="width:20px;"  type="checkbox" name="ck"/>
				<label class="Validform_label">单独水汽报告号:</label>
			</td>
			<td class="value" width="25%">
				<input name="subcontractDdsqbgList[${stuts.index }].ddsqbgh" maxlength="32" type="text" class="inputxt"  style="width:150px;"  ignore="ignore"  value="${poVal.ddsqbgh }"/>
				<span class="Validform_checktip"></span>
				<label class="Validform_label" style="display: none;">单独水汽报告号</label>
			</td>
			<td align="right" width="25%">
				<label class="Validform_label">水汽附件:</label>
			</td>
			<td class="value" width="25%">
				        <input type="hidden" id="subcontractDdsqbgList[${stuts.index }].fileattach" name="subcontractDdsqbgList[${stuts.index }].fileattach"  value="${poVal.fileattach }"/>
									   <input class="ui-button" type="button" value="上传附件" name="subcontractDdsqbgList[${stuts.index }].imgBtn"
													onclick="commonUpload(commonUploadDefaultCallBack,'subcontractDdsqbgList\\[${stuts.index }\\]\\.fileattach')"/>
					  	 		<c:if test="${empty poVal.fileattach}">
											<a  target="_blank" id="subcontractDdsqbgList[${stuts.index }].fileattach_href"></a>
										</c:if>
										<c:if test="${!empty poVal.fileattach}">
											<a  href="img/server/${poVal.fileattach}"  target="_blank" id="subcontractDdsqbgList[${stuts.index }].fileattach_href">下载</a>
										</c:if>
					  <label class="Validform_label" style="display: none;">文件上传</label>
			</td>
		</tr>
			<tr>
			<td align="right" width="25%">
				<label class="Validform_label">水汽检测开始时间:</label>
			</td>
			<td class="value" width="25%">
				<input id="subcontractDdsqbgList${stuts.index }sqjcstarttime" name="subcontractDdsqbgList[${stuts.index }].sqjcstarttime" type="text" errormsg="该字段不为空" value="${poVal.sqjcstarttime }" />
				<img onclick="WdatePicker({el:'subcontractDdsqbgList${stuts.index }sqjcstarttime'})" src="plug-in/easyui/themes/black/images/datebox_arrow.png" style="opacity: 0.6;height:17px;width:17px;" align="absmiddle">
				<span class="Validform_checktip"></span>
			</td>
			<td align="right" width="25%">
				<label class="Validform_label">水汽检测结束时间:</label>
			</td>
			<td class="value" width="25%">
				<input id="subcontractDdsqbgList${stuts.index }sqjcendtime" name="subcontractDdsqbgList[${stuts.index }].sqjcendtime" type="text" errormsg="该字段不为空" value="${poVal.sqjcendtime }" />
				<img onclick="WdatePicker({el:'subcontractDdsqbgList${stuts.index }sqjcendtime'})" src="plug-in/easyui/themes/black/images/datebox_arrow.png" style="opacity: 0.6;height:17px;width:17px;" align="absmiddle">
				<span class="Validform_checktip"></span>
			</td>
		</tr>
		<tr>
			<td align="right" width="25%">
				<label class="Validform_label">水汽检测机构:</label>
			</td>
			<td class="value" width="25%">
				<t:dictSelect  field="subcontractDdsqbgList[${stuts.index }].sqjcjg" type="select"  hasLabel="false" defaultVal="${poVal.sqjcjg }" extendJson="{class:'form-control input-sm ',style='width:150px'}" dictTable="file_sqjcjg" dictField="companyname" dictText="companyname" ></t:dictSelect>
				<span class="Validform_checktip"></span>
				<label class="Validform_label" style="display: none;">水汽检测机构</label>
			</td>
			<td align="right" width="25%">
			</td>
			<td class="value" width="25%">
			</td>
		</tr>
		</c:forEach>
	</c:if>	
	</tbody>
</table>
