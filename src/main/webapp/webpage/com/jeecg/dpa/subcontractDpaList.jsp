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
	 	 resetTrNum('add_subcontractDpa_table');
	 	 return false;
    });  
	$('#delSubcontractDpaBtn').bind('click', function(){   
		$("#add_subcontractDpa_table").find("input[name$='ck']:checked").parent().parent().remove();  
        resetTrNum('add_subcontractDpa_table'); 
        return false;
    }); 
    $(document).ready(function(){
    	$(".datagrid-toolbar").parent().css("width","auto");
    	if(location.href.indexOf("load=detail")!=-1){
			$(":input").attr("disabled","true");
			$(".datagrid-toolbar").hide();
		}
    });
</script>
<div style="padding: 3px; height: 25px;width:auto;" class="datagrid-toolbar">
	<a id="addSubcontractDpaBtn" href="#">添加</a> <a id="delSubcontractDpaBtn" href="#">删除</a> 
</div>
<table border="0" cellpadding="2" cellspacing="0" id="subcontractDpa_table">
	<tr bgcolor="#E6E6E6">
		<td align="center" bgcolor="#EEEEEE" style="width: 25px;">序号</td>
		<td align="center" bgcolor="#EEEEEE" style="width: 25px;">操作</td>
				  <td align="left" bgcolor="#EEEEEE" style="width: 126px;">
						DPA报告号
				  </td>
				  <td align="left" bgcolor="#EEEEEE" style="width: 126px;">
						DPA检测机构
				  </td>
				  <td align="left" bgcolor="#EEEEEE" style="width: 126px;">
						DPA样品数量
				  </td>
				  <td align="left" bgcolor="#EEEEEE" style="width: 126px;">
						DPA试验开始时间
				  </td>
				  <td align="left" bgcolor="#EEEEEE" style="width: 126px;">
						DPA试验结束时间
				  </td>
				  <td align="left" bgcolor="#EEEEEE" style="width: 126px;">
						文件上传
				  </td>
	</tr>
	<tbody id="add_subcontractDpa_table">
	<c:if test="${fn:length(subcontractDpaList)  <= 0 }">
			<tr>
				<td align="center"><div style="width: 25px;" name="xh">1</div></td>
				<td align="center"><input style="width:20px;"  type="checkbox" name="ck"/></td>
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
				  <td align="left">
					  	<input name="subcontractDpaList[0].dpabgh" maxlength="32" type="text" class="inputxt"  style="width:120px;"  ignore="ignore" >
					  <label class="Validform_label" style="display: none;">DPA报告号</label>
					</td>
				  <td align="left">
					  	<input name="subcontractDpaList[0].dpajcjg" maxlength="200" type="text" class="inputxt"  style="width:120px;"  ignore="ignore" >
					  <label class="Validform_label" style="display: none;">DPA检测机构</label>
					</td>
				  <td align="left">
					  	<input name="subcontractDpaList[0].dpaypsl" maxlength="32" type="text" class="inputxt"  style="width:120px;"  ignore="ignore" >
					  <label class="Validform_label" style="display: none;">DPA样品数量</label>
					</td>
				  <td align="left">
					  	<input name="subcontractDpaList[0].dpastarttime" maxlength="32" type="text" class="inputxt"  style="width:120px;"  ignore="ignore" >
					  <label class="Validform_label" style="display: none;">DPA试验开始时间</label>
					</td>
				  <td align="left">
					  	<input name="subcontractDpaList[0].dpaendtime" maxlength="32" type="text" class="inputxt"  style="width:120px;"  ignore="ignore" >
					  <label class="Validform_label" style="display: none;">DPA试验结束时间</label>
					</td>
				  <td align="left">
							<input type="hidden" id="subcontractDpaList[0].dpafileattach" name="subcontractDpaList[0].dpafileattach" />
									    <input class="ui-button" type="button" value="上传附件"  name="subcontractDpaList[0].imgBtn" onclick="commonUpload(commonUploadDefaultCallBack,'subcontractDpaList\\[0\\]\\.dpafileattach')"/> 
										<a  target="_blank" id="subcontractDpaList[0].dpafileattach_href">未上传</a>
					  <label class="Validform_label" style="display: none;">文件上传</label>
					</td>
   			</tr>
	</c:if>
	<c:if test="${fn:length(subcontractDpaList)  > 0 }">
		<c:forEach items="${subcontractDpaList}" var="poVal" varStatus="stuts">
			<tr>
				<td align="center"><div style="width: 25px;" name="xh">${stuts.index+1 }</div></td>
				<td align="center"><input style="width:20px;"  type="checkbox" name="ck" /></td>
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
				   <td align="left">
					  	<input name="subcontractDpaList[${stuts.index }].dpabgh" maxlength="32" type="text" class="inputxt"  style="width:120px;"  ignore="ignore"  value="${poVal.dpabgh }"/>
					  <label class="Validform_label" style="display: none;">DPA报告号</label>
				   </td>
				   <td align="left">
					  	<input name="subcontractDpaList[${stuts.index }].dpajcjg" maxlength="200" type="text" class="inputxt"  style="width:120px;"  ignore="ignore"  value="${poVal.dpajcjg }"/>
					  <label class="Validform_label" style="display: none;">DPA检测机构</label>
				   </td>
				   <td align="left">
					  	<input name="subcontractDpaList[${stuts.index }].dpaypsl" maxlength="32" type="text" class="inputxt"  style="width:120px;"  ignore="ignore"  value="${poVal.dpaypsl }"/>
					  <label class="Validform_label" style="display: none;">DPA样品数量</label>
				   </td>
				   <td align="left">
					  	<input name="subcontractDpaList[${stuts.index }].dpastarttime" maxlength="32" type="text" class="inputxt"  style="width:120px;"  ignore="ignore"  value="${poVal.dpastarttime }"/>
					  <label class="Validform_label" style="display: none;">DPA试验开始时间</label>
				   </td>
				   <td align="left">
					  	<input name="subcontractDpaList[${stuts.index }].dpaendtime" maxlength="32" type="text" class="inputxt"  style="width:120px;"  ignore="ignore"  value="${poVal.dpaendtime }"/>
					  <label class="Validform_label" style="display: none;">DPA试验结束时间</label>
				   </td>
				   <td align="left">
					        <input type="hidden" id="subcontractDpaList[${stuts.index }].dpafileattach" name="subcontractDpaList[${stuts.index }].dpafileattach"  value="${poVal.dpafileattach }"/>
									   <input class="ui-button" type="button" value="上传附件" name="subcontractDpaList[${stuts.index }].imgBtn"
													onclick="commonUpload(commonUploadDefaultCallBack,'subcontractDpaList\\[${stuts.index }\\]\\.dpafileattach')"/>
					  	 		<c:if test="${empty poVal.dpafileattach}">
											<a  target="_blank" id="subcontractDpaList[${stuts.index }].dpafileattach_href"></a>
										</c:if>
										<c:if test="${!empty poVal.dpafileattach}">
											<a  href="${poVal.dpafileattach}"  target="_blank" id="subcontractDpaList[${stuts.index }].dpafileattach_href">下载</a>
										</c:if>
					  <label class="Validform_label" style="display: none;">文件上传</label>
				   </td>
   			</tr>
		</c:forEach>
	</c:if>	
	</tbody>
</table>
