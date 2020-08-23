<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<script type="text/javascript">
	$('#addSubcontractJianzhiBtn').linkbutton({   
	    iconCls: 'icon-add'  
	});  
	$('#delSubcontractJianzhiBtn').linkbutton({   
	    iconCls: 'icon-remove'  
	}); 
	$('#addSubcontractJianzhiBtn').bind('click', function(){   
 		 var tr =  $("#add_subcontractJianzhi_table_template tr").clone();
	 	 $("#add_subcontractJianzhi_table").append(tr);
	 	 resetTrNum('add_subcontractJianzhi_table');
	 	 return false;
    });  
	$('#delSubcontractJianzhiBtn').bind('click', function(){   
		$("#add_subcontractJianzhi_table").find("input[name$='ck']:checked").parent().parent().remove();  
        resetTrNum('add_subcontractJianzhi_table'); 
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
	<a id="addSubcontractJianzhiBtn" href="#">添加</a> <a id="delSubcontractJianzhiBtn" href="#">删除</a> 
</div>
<table border="0" cellpadding="2" cellspacing="0" id="subcontractJianzhi_table">
	<tr bgcolor="#E6E6E6">
		<td align="center" bgcolor="#EEEEEE" style="width: 25px;">序号</td>
		<td align="center" bgcolor="#EEEEEE" style="width: 25px;">操作</td>
				  <td align="left" bgcolor="#EEEEEE" style="width: 126px;">
						监制报告号
				  </td>
				  <td align="left" bgcolor="#EEEEEE" style="width: 126px;">
						监制单位
				  </td>
				  <td align="left" bgcolor="#EEEEEE" style="width: 126px;">
						监制数量
				  </td>
				  <td align="left" bgcolor="#EEEEEE" style="width: 126px;">
						监制时间
				  </td>
				  <td align="left" bgcolor="#EEEEEE" style="width: 126px;">
						文件
				  </td>
	</tr>
	<tbody id="add_subcontractJianzhi_table">
	<c:if test="${fn:length(subcontractJianzhiList)  <= 0 }">
			<tr>
				<td align="center"><div style="width: 25px;" name="xh">1</div></td>
				<td align="center"><input style="width:20px;"  type="checkbox" name="ck"/></td>
					<input name="subcontractJianzhiList[0].id" type="hidden"/>
					<input name="subcontractJianzhiList[0].createName" type="hidden"/>
					<input name="subcontractJianzhiList[0].createBy" type="hidden"/>
					<input name="subcontractJianzhiList[0].createDate" type="hidden"/>
					<input name="subcontractJianzhiList[0].updateName" type="hidden"/>
					<input name="subcontractJianzhiList[0].updateBy" type="hidden"/>
					<input name="subcontractJianzhiList[0].updateDate" type="hidden"/>
					<input name="subcontractJianzhiList[0].sysOrgCode" type="hidden"/>
					<input name="subcontractJianzhiList[0].sysCompanyCode" type="hidden"/>
					<input name="subcontractJianzhiList[0].bpmStatus" type="hidden"/>
					<input name="subcontractJianzhiList[0].fileid" type="hidden"/>
				  <td align="left">
					  	<input name="subcontractJianzhiList[0].jzbgh" maxlength="32" type="text" class="inputxt"  style="width:120px;"  ignore="ignore" >
					  <label class="Validform_label" style="display: none;">监制报告号</label>
					</td>
				  <td align="left">
					  	<input name="subcontractJianzhiList[0].jzdw" maxlength="200" type="text" class="inputxt"  style="width:120px;"  ignore="ignore" >
					  <label class="Validform_label" style="display: none;">监制单位</label>
					</td>
				  <td align="left">
					  	<input name="subcontractJianzhiList[0].jzsl" maxlength="32" type="text" class="inputxt"  style="width:120px;"  ignore="ignore" >
					  <label class="Validform_label" style="display: none;">监制数量</label>
					</td>
				  <td align="left">
					  	<input name="subcontractJianzhiList[0].jzsj" maxlength="32" type="text" class="inputxt"  style="width:120px;"  ignore="ignore" >
					  <label class="Validform_label" style="display: none;">监制时间</label>
					</td>
				  <td align="left">
							<input type="hidden" id="subcontractJianzhiList[0].jzfileattach" name="subcontractJianzhiList[0].jzfileattach" />
									    <input class="ui-button" type="button" value="上传附件"  name="subcontractJianzhiList[0].imgBtn" onclick="commonUpload(commonUploadDefaultCallBack,'subcontractJianzhiList\\[0\\]\\.jzfileattach')"/> 
										<a  target="_blank" id="subcontractJianzhiList[0].jzfileattach_href">未上传</a>
					  <label class="Validform_label" style="display: none;">文件</label>
					</td>
   			</tr>
	</c:if>
	<c:if test="${fn:length(subcontractJianzhiList)  > 0 }">
		<c:forEach items="${subcontractJianzhiList}" var="poVal" varStatus="stuts">
			<tr>
				<td align="center"><div style="width: 25px;" name="xh">${stuts.index+1 }</div></td>
				<td align="center"><input style="width:20px;"  type="checkbox" name="ck" /></td>
						<input name="subcontractJianzhiList[${stuts.index }].id" type="hidden" value="${poVal.id }"/>
						<input name="subcontractJianzhiList[${stuts.index }].createName" type="hidden" value="${poVal.createName }"/>
						<input name="subcontractJianzhiList[${stuts.index }].createBy" type="hidden" value="${poVal.createBy }"/>
						<input name="subcontractJianzhiList[${stuts.index }].createDate" type="hidden" value="${poVal.createDate }"/>
						<input name="subcontractJianzhiList[${stuts.index }].updateName" type="hidden" value="${poVal.updateName }"/>
						<input name="subcontractJianzhiList[${stuts.index }].updateBy" type="hidden" value="${poVal.updateBy }"/>
						<input name="subcontractJianzhiList[${stuts.index }].updateDate" type="hidden" value="${poVal.updateDate }"/>
						<input name="subcontractJianzhiList[${stuts.index }].sysOrgCode" type="hidden" value="${poVal.sysOrgCode }"/>
						<input name="subcontractJianzhiList[${stuts.index }].sysCompanyCode" type="hidden" value="${poVal.sysCompanyCode }"/>
						<input name="subcontractJianzhiList[${stuts.index }].bpmStatus" type="hidden" value="${poVal.bpmStatus }"/>
						<input name="subcontractJianzhiList[${stuts.index }].fileid" type="hidden" value="${poVal.fileid }"/>
				   <td align="left">
					  	<input name="subcontractJianzhiList[${stuts.index }].jzbgh" maxlength="32" type="text" class="inputxt"  style="width:120px;"  ignore="ignore"  value="${poVal.jzbgh }"/>
					  <label class="Validform_label" style="display: none;">监制报告号</label>
				   </td>
				   <td align="left">
					  	<input name="subcontractJianzhiList[${stuts.index }].jzdw" maxlength="200" type="text" class="inputxt"  style="width:120px;"  ignore="ignore"  value="${poVal.jzdw }"/>
					  <label class="Validform_label" style="display: none;">监制单位</label>
				   </td>
				   <td align="left">
					  	<input name="subcontractJianzhiList[${stuts.index }].jzsl" maxlength="32" type="text" class="inputxt"  style="width:120px;"  ignore="ignore"  value="${poVal.jzsl }"/>
					  <label class="Validform_label" style="display: none;">监制数量</label>
				   </td>
				   <td align="left">
					  	<input name="subcontractJianzhiList[${stuts.index }].jzsj" maxlength="32" type="text" class="inputxt"  style="width:120px;"  ignore="ignore"  value="${poVal.jzsj }"/>
					  <label class="Validform_label" style="display: none;">监制时间</label>
				   </td>
				   <td align="left">
					        <input type="hidden" id="subcontractJianzhiList[${stuts.index }].jzfileattach" name="subcontractJianzhiList[${stuts.index }].jzfileattach"  value="${poVal.jzfileattach }"/>
									   <input class="ui-button" type="button" value="上传附件" name="subcontractJianzhiList[${stuts.index }].imgBtn"
													onclick="commonUpload(commonUploadDefaultCallBack,'subcontractJianzhiList\\[${stuts.index }\\]\\.jzfileattach')"/>
					  	 		<c:if test="${empty poVal.jzfileattach}">
											<a  target="_blank" id="subcontractJianzhiList[${stuts.index }].jzfileattach_href"></a>
										</c:if>
										<c:if test="${!empty poVal.jzfileattach}">
											<a  href="${poVal.jzfileattach}"  target="_blank" id="subcontractJianzhiList[${stuts.index }].jzfileattach_href">下载</a>
										</c:if>
					  <label class="Validform_label" style="display: none;">文件</label>
				   </td>
   			</tr>
		</c:forEach>
	</c:if>	
	</tbody>
</table>
