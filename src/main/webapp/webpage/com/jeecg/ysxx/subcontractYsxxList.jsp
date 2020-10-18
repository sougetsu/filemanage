<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<script type="text/javascript">
	$('#addSubcontractYsxxBtn').linkbutton({   
	    iconCls: 'icon-add'  
	});  
	$('#delSubcontractYsxxBtn').linkbutton({   
	    iconCls: 'icon-remove'  
	}); 
	$('#addSubcontractYsxxBtn').bind('click', function(){   
 		 var tr =  $("#add_subcontractYsxx_table_template tr").clone();
	 	 $("#add_subcontractYsxx_table").append(tr);
	 	resetTrNumByRow('add_subcontractYsxx_table',1);
	 	 return false;
    });  
	$('#delSubcontractYsxxBtn').bind('click', function(){   
		$("#add_subcontractYsxx_table").find("input[name$='ck']:checked").parent().parent().remove();  
		resetTrNumByRow('add_subcontractYsxx_table',1); 
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
	<a id="addSubcontractYsxxBtn" href="#">添加</a> <a id="delSubcontractYsxxBtn" href="#">删除</a> 
</div>
<table border="0" cellpadding="2" cellspacing="0" id="subcontractYsxx_table" class="formtable">
	<tbody id="add_subcontractYsxx_table">
	<c:if test="${fn:length(subcontractYsxxList)  <= 0 }">
		<tr>
			<input name="subcontractYsxxList[0].id" type="hidden"/>
			<input name="subcontractYsxxList[0].createName" type="hidden"/>
			<input name="subcontractYsxxList[0].createBy" type="hidden"/>
			<input name="subcontractYsxxList[0].createDate" type="hidden"/>
			<input name="subcontractYsxxList[0].updateName" type="hidden"/>
			<input name="subcontractYsxxList[0].updateBy" type="hidden"/>
			<input name="subcontractYsxxList[0].updateDate" type="hidden"/>
			<input name="subcontractYsxxList[0].sysOrgCode" type="hidden"/>
			<input name="subcontractYsxxList[0].sysCompanyCode" type="hidden"/>
			<input name="subcontractYsxxList[0].bpmStatus" type="hidden"/>
			<input name="subcontractYsxxList[0].fileid" type="hidden"/>
			<td align="right" width="25%">
				<input style="width:20px;"  type="checkbox" name="ck"/>
				<label class="Validform_label">验收报告号:</label>
			</td>
			<td class="value" width="25%">
				<input name="subcontractYsxxList[0].ysbgh" maxlength="32" type="text" class="inputxt"  style="width:150px;"  ignore="ignore" >
				<span class="Validform_checktip"></span>
				<label class="Validform_label" style="display: none;">验收报告号</label>
			</td>
			<td align="right" width="25%">
				<label class="Validform_label">验收附件:</label>
			</td>
			<td class="value" width="25%">
		     	<input type="hidden" id="subcontractYsxxList[0].ysfileattach" name="subcontractYsxxList[0].ysfileattach" />
			    <input class="ui-button" type="button" value="上传附件"  name="subcontractYsxxList[0].imgBtn" onclick="commonUpload(commonUploadDefaultCallBack,'subcontractYsxxList\\[0\\]\\.ysfileattach')"/> 
				<a  target="_blank" id="subcontractYsxxList[0].ysfileattach_href">未上传</a>
			  <label class="Validform_label" style="display: none;">验收附件</label>
			</td>
		</tr>
	</c:if>
	<c:if test="${fn:length(subcontractYsxxList)  > 0 }">
		<c:forEach items="${subcontractYsxxList}" var="poVal" varStatus="stuts">
			<tr>
				<input name="subcontractYsxxList[${stuts.index }].id" type="hidden" value="${poVal.id }"/>
				<input name="subcontractYsxxList[${stuts.index }].createName" type="hidden" value="${poVal.createName }"/>
				<input name="subcontractYsxxList[${stuts.index }].createBy" type="hidden" value="${poVal.createBy }"/>
				<input name="subcontractYsxxList[${stuts.index }].createDate" type="hidden" value="${poVal.createDate }"/>
				<input name="subcontractYsxxList[${stuts.index }].updateName" type="hidden" value="${poVal.updateName }"/>
				<input name="subcontractYsxxList[${stuts.index }].updateBy" type="hidden" value="${poVal.updateBy }"/>
				<input name="subcontractYsxxList[${stuts.index }].updateDate" type="hidden" value="${poVal.updateDate }"/>
				<input name="subcontractYsxxList[${stuts.index }].sysOrgCode" type="hidden" value="${poVal.sysOrgCode }"/>
				<input name="subcontractYsxxList[${stuts.index }].sysCompanyCode" type="hidden" value="${poVal.sysCompanyCode }"/>
				<input name="subcontractYsxxList[${stuts.index }].bpmStatus" type="hidden" value="${poVal.bpmStatus }"/>
				<input name="subcontractYsxxList[${stuts.index }].fileid" type="hidden" value="${poVal.fileid }"/>
				<td align="right" width="25%">
					<input style="width:20px;"  type="checkbox" name="ck"/>
					<label class="Validform_label">验收报告号:</label>
				</td>
				<td class="value" width="25%">
					<input name="subcontractYsxxList[${stuts.index }].ysbgh" maxlength="32" type="text" class="inputxt"  style="width:150px;"  ignore="ignore"  value="${poVal.ysbgh }"/>
					<span class="Validform_checktip"></span>
					<label class="Validform_label" style="display: none;">验收报告号</label>
				</td>
				<td align="right" width="25%">
					<label class="Validform_label">验收附件:</label>
				</td>
				<td class="value" width="25%">
			     	 <input type="hidden" id="subcontractYsxxList[${stuts.index }].ysfileattach" name="subcontractYsxxList[${stuts.index }].ysfileattach"  value="${poVal.ysfileattach }"/>
									   <input class="ui-button" type="button" value="上传附件" name="subcontractYsxxList[${stuts.index }].imgBtn"
													onclick="commonUpload(commonUploadDefaultCallBack,'subcontractYsxxList\\[${stuts.index }\\]\\.ysfileattach')"/>
					  	 		<c:if test="${empty poVal.ysfileattach}">
											<a  target="_blank" id="subcontractYsxxList[${stuts.index }].ysfileattach_href"></a>
										</c:if>
										<c:if test="${!empty poVal.ysfileattach}">
											<a  href="img/server/${poVal.ysfileattach}"  target="_blank" id="subcontractYsxxList[${stuts.index }].ysfileattach_href">下载</a>
										</c:if>
					  <label class="Validform_label" style="display: none;">验收附件</label>
				</td>
			</tr>
		</c:forEach>
	</c:if>	
	</tbody>
</table>
