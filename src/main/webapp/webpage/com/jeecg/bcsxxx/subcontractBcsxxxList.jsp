<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<script type="text/javascript">
	$('#addSubcontractBcsxxxBtn').linkbutton({   
	    iconCls: 'icon-add'  
	});  
	$('#delSubcontractBcsxxxBtn').linkbutton({   
	    iconCls: 'icon-remove'  
	}); 
	$('#addSubcontractBcsxxxBtn').bind('click', function(){   
 		 var tr =  $("#add_subcontractBcsxxx_table_template tr").clone();
	 	 $("#add_subcontractBcsxxx_table").append(tr);
	 	 resetTrNum('add_subcontractBcsxxx_table');
	 	 return false;
    });  
	$('#delSubcontractBcsxxxBtn').bind('click', function(){   
		$("#add_subcontractBcsxxx_table").find("input[name$='ck']:checked").parent().parent().remove();  
        resetTrNum('add_subcontractBcsxxx_table'); 
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
	<a id="addSubcontractBcsxxxBtn" href="#">添加</a> <a id="delSubcontractBcsxxxBtn" href="#">删除</a> 
</div>
<table border="0" cellpadding="2" cellspacing="0" id="subcontractBcsxxx_table">
	<tr bgcolor="#E6E6E6">
		<td align="center" bgcolor="#EEEEEE" style="width: 25px;">序号</td>
		<td align="center" bgcolor="#EEEEEE" style="width: 25px;">操作</td>
				  <td align="left" bgcolor="#EEEEEE" style="width: 126px;">
						补充筛选报告号
				  </td>
				  <td align="left" bgcolor="#EEEEEE" style="width: 126px;">
						补充筛选开始时间
				  </td>
				  <td align="left" bgcolor="#EEEEEE" style="width: 126px;">
						补充筛选结束时间
				  </td>
				  <td align="left" bgcolor="#EEEEEE" style="width: 126px;">
						补充筛选委托单位
				  </td>
				  <td align="left" bgcolor="#EEEEEE" style="width: 126px;">
						补充筛选投入数量
				  </td>
				  <td align="left" bgcolor="#EEEEEE" style="width: 126px;">
						补充筛选合格数量
				  </td>
				  <td align="left" bgcolor="#EEEEEE" style="width: 126px;">
						补充筛选不合格情况
				  </td>
				  <td align="left" bgcolor="#EEEEEE" style="width: 126px;">
						补充筛选附件
				  </td>
	</tr>
	<tbody id="add_subcontractBcsxxx_table">
	<c:if test="${fn:length(subcontractBcsxxxList)  <= 0 }">
			<tr>
				<td align="center"><div style="width: 25px;" name="xh">1</div></td>
				<td align="center"><input style="width:20px;"  type="checkbox" name="ck"/></td>
					<input name="subcontractBcsxxxList[0].id" type="hidden"/>
					<input name="subcontractBcsxxxList[0].createName" type="hidden"/>
					<input name="subcontractBcsxxxList[0].createBy" type="hidden"/>
					<input name="subcontractBcsxxxList[0].createDate" type="hidden"/>
					<input name="subcontractBcsxxxList[0].updateName" type="hidden"/>
					<input name="subcontractBcsxxxList[0].updateBy" type="hidden"/>
					<input name="subcontractBcsxxxList[0].updateDate" type="hidden"/>
					<input name="subcontractBcsxxxList[0].sysOrgCode" type="hidden"/>
					<input name="subcontractBcsxxxList[0].sysCompanyCode" type="hidden"/>
					<input name="subcontractBcsxxxList[0].bpmStatus" type="hidden"/>
					<input name="subcontractBcsxxxList[0].fileid" type="hidden"/>
				  <td align="left">
					  	<input name="subcontractBcsxxxList[0].bcsxbgh" maxlength="32" type="text" class="inputxt"  style="width:120px;"  ignore="ignore" >
					  <label class="Validform_label" style="display: none;">补充筛选报告号</label>
					</td>
				  <td align="left">
					  	<input name="subcontractBcsxxxList[0].bcsxstarttime" maxlength="32" type="text" class="inputxt"  style="width:120px;"  ignore="ignore" >
					  <label class="Validform_label" style="display: none;">补充筛选开始时间</label>
					</td>
				  <td align="left">
					  	<input name="subcontractBcsxxxList[0].bcsxendtime" maxlength="32" type="text" class="inputxt"  style="width:120px;"  ignore="ignore" >
					  <label class="Validform_label" style="display: none;">补充筛选结束时间</label>
					</td>
				  <td align="left">
					  	<input name="subcontractBcsxxxList[0].bcsxwtdw" maxlength="100" type="text" class="inputxt"  style="width:120px;"  ignore="ignore" >
					  <label class="Validform_label" style="display: none;">补充筛选委托单位</label>
					</td>
				  <td align="left">
					  	<input name="subcontractBcsxxxList[0].bcsxtrsl" maxlength="32" type="text" class="inputxt"  style="width:120px;"  ignore="ignore" >
					  <label class="Validform_label" style="display: none;">补充筛选投入数量</label>
					</td>
				  <td align="left">
					  	<input name="subcontractBcsxxxList[0].bcsxhgzl" maxlength="32" type="text" class="inputxt"  style="width:120px;"  ignore="ignore" >
					  <label class="Validform_label" style="display: none;">补充筛选合格数量</label>
					</td>
				  <td align="left">
					  	<input name="subcontractBcsxxxList[0].bcsxbhgqk" maxlength="200" type="text" class="inputxt"  style="width:120px;"  ignore="ignore" >
					  <label class="Validform_label" style="display: none;">补充筛选不合格情况</label>
					</td>
				  <td align="left">
							<input type="hidden" id="subcontractBcsxxxList[0].bcsxfileattach" name="subcontractBcsxxxList[0].bcsxfileattach" />
									    <input class="ui-button" type="button" value="上传附件"  name="subcontractBcsxxxList[0].imgBtn" onclick="commonUpload(commonUploadDefaultCallBack,'subcontractBcsxxxList\\[0\\]\\.bcsxfileattach')"/> 
										<a  target="_blank" id="subcontractBcsxxxList[0].bcsxfileattach_href">未上传</a>
					  <label class="Validform_label" style="display: none;">补充筛选附件</label>
					</td>
   			</tr>
	</c:if>
	<c:if test="${fn:length(subcontractBcsxxxList)  > 0 }">
		<c:forEach items="${subcontractBcsxxxList}" var="poVal" varStatus="stuts">
			<tr>
				<td align="center"><div style="width: 25px;" name="xh">${stuts.index+1 }</div></td>
				<td align="center"><input style="width:20px;"  type="checkbox" name="ck" /></td>
						<input name="subcontractBcsxxxList[${stuts.index }].id" type="hidden" value="${poVal.id }"/>
						<input name="subcontractBcsxxxList[${stuts.index }].createName" type="hidden" value="${poVal.createName }"/>
						<input name="subcontractBcsxxxList[${stuts.index }].createBy" type="hidden" value="${poVal.createBy }"/>
						<input name="subcontractBcsxxxList[${stuts.index }].createDate" type="hidden" value="${poVal.createDate }"/>
						<input name="subcontractBcsxxxList[${stuts.index }].updateName" type="hidden" value="${poVal.updateName }"/>
						<input name="subcontractBcsxxxList[${stuts.index }].updateBy" type="hidden" value="${poVal.updateBy }"/>
						<input name="subcontractBcsxxxList[${stuts.index }].updateDate" type="hidden" value="${poVal.updateDate }"/>
						<input name="subcontractBcsxxxList[${stuts.index }].sysOrgCode" type="hidden" value="${poVal.sysOrgCode }"/>
						<input name="subcontractBcsxxxList[${stuts.index }].sysCompanyCode" type="hidden" value="${poVal.sysCompanyCode }"/>
						<input name="subcontractBcsxxxList[${stuts.index }].bpmStatus" type="hidden" value="${poVal.bpmStatus }"/>
						<input name="subcontractBcsxxxList[${stuts.index }].fileid" type="hidden" value="${poVal.fileid }"/>
				   <td align="left">
					  	<input name="subcontractBcsxxxList[${stuts.index }].bcsxbgh" maxlength="32" type="text" class="inputxt"  style="width:120px;"  ignore="ignore"  value="${poVal.bcsxbgh }"/>
					  <label class="Validform_label" style="display: none;">补充筛选报告号</label>
				   </td>
				   <td align="left">
					  	<input name="subcontractBcsxxxList[${stuts.index }].bcsxstarttime" maxlength="32" type="text" class="inputxt"  style="width:120px;"  ignore="ignore"  value="${poVal.bcsxstarttime }"/>
					  <label class="Validform_label" style="display: none;">补充筛选开始时间</label>
				   </td>
				   <td align="left">
					  	<input name="subcontractBcsxxxList[${stuts.index }].bcsxendtime" maxlength="32" type="text" class="inputxt"  style="width:120px;"  ignore="ignore"  value="${poVal.bcsxendtime }"/>
					  <label class="Validform_label" style="display: none;">补充筛选结束时间</label>
				   </td>
				   <td align="left">
					  	<input name="subcontractBcsxxxList[${stuts.index }].bcsxwtdw" maxlength="100" type="text" class="inputxt"  style="width:120px;"  ignore="ignore"  value="${poVal.bcsxwtdw }"/>
					  <label class="Validform_label" style="display: none;">补充筛选委托单位</label>
				   </td>
				   <td align="left">
					  	<input name="subcontractBcsxxxList[${stuts.index }].bcsxtrsl" maxlength="32" type="text" class="inputxt"  style="width:120px;"  ignore="ignore"  value="${poVal.bcsxtrsl }"/>
					  <label class="Validform_label" style="display: none;">补充筛选投入数量</label>
				   </td>
				   <td align="left">
					  	<input name="subcontractBcsxxxList[${stuts.index }].bcsxhgzl" maxlength="32" type="text" class="inputxt"  style="width:120px;"  ignore="ignore"  value="${poVal.bcsxhgzl }"/>
					  <label class="Validform_label" style="display: none;">补充筛选合格数量</label>
				   </td>
				   <td align="left">
					  	<input name="subcontractBcsxxxList[${stuts.index }].bcsxbhgqk" maxlength="200" type="text" class="inputxt"  style="width:120px;"  ignore="ignore"  value="${poVal.bcsxbhgqk }"/>
					  <label class="Validform_label" style="display: none;">补充筛选不合格情况</label>
				   </td>
				   <td align="left">
					        <input type="hidden" id="subcontractBcsxxxList[${stuts.index }].bcsxfileattach" name="subcontractBcsxxxList[${stuts.index }].bcsxfileattach"  value="${poVal.bcsxfileattach }"/>
									   <input class="ui-button" type="button" value="上传附件" name="subcontractBcsxxxList[${stuts.index }].imgBtn"
													onclick="commonUpload(commonUploadDefaultCallBack,'subcontractBcsxxxList\\[${stuts.index }\\]\\.bcsxfileattach')"/>
					  	 		<c:if test="${empty poVal.bcsxfileattach}">
											<a  target="_blank" id="subcontractBcsxxxList[${stuts.index }].bcsxfileattach_href"></a>
										</c:if>
										<c:if test="${!empty poVal.bcsxfileattach}">
											<a  href="${poVal.bcsxfileattach}"  target="_blank" id="subcontractBcsxxxList[${stuts.index }].bcsxfileattach_href">下载</a>
										</c:if>
					  <label class="Validform_label" style="display: none;">补充筛选附件</label>
				   </td>
   			</tr>
		</c:forEach>
	</c:if>	
	</tbody>
</table>
