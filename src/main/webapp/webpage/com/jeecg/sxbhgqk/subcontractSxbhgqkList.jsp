<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<script type="text/javascript">
	$('#addSubcontractSxbhgqkBtn').linkbutton({   
	    iconCls: 'icon-add'  
	});  
	$('#delSubcontractSxbhgqkBtn').linkbutton({   
	    iconCls: 'icon-remove'  
	}); 
	$('#addSubcontractSxbhgqkBtn').bind('click', function(){   
 		 var tr =  $("#add_subcontractSxbhgqk_table_template tr").clone();
	 	 $("#add_subcontractSxbhgqk_table").append(tr);
	 	 resetTrNum('add_subcontractSxbhgqk_table');
	 	 return false;
    });  
	$('#delSubcontractSxbhgqkBtn').bind('click', function(){   
		$("#add_subcontractSxbhgqk_table").find("input[name$='ck']:checked").parent().parent().remove();  
        resetTrNum('add_subcontractSxbhgqk_table'); 
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
	<a id="addSubcontractSxbhgqkBtn" href="#">添加</a> <a id="delSubcontractSxbhgqkBtn" href="#">删除</a> 
</div>
<table border="0" cellpadding="2" cellspacing="0" id="subcontractSxbhgqk_table">
	<tr bgcolor="#E6E6E6">
		<td align="center" bgcolor="#EEEEEE" style="width: 25px;">序号</td>
		<td align="center" bgcolor="#EEEEEE" style="width: 25px;">操作</td>
				  <td align="left" bgcolor="#EEEEEE" style="width: 126px;">
						PIND
				  </td>
				  <td align="left" bgcolor="#EEEEEE" style="width: 126px;">
						老炼前电测试
				  </td>
				  <td align="left" bgcolor="#EEEEEE" style="width: 126px;">
						动态老炼后电测试
				  </td>
				  <td align="left" bgcolor="#EEEEEE" style="width: 126px;">
						静态老炼后电测试
				  </td>
				  <td align="left" bgcolor="#EEEEEE" style="width: 126px;">
						最终电测试
				  </td>
				  <td align="left" bgcolor="#EEEEEE" style="width: 126px;">
						细检漏
				  </td>
				  <td align="left" bgcolor="#EEEEEE" style="width: 126px;">
						粗检漏
				  </td>
				  <td align="left" bgcolor="#EEEEEE" style="width: 126px;">
						X射线
				  </td>
				  <td align="left" bgcolor="#EEEEEE" style="width: 126px;">
						外部目检
				  </td>
	</tr>
	<tbody id="add_subcontractSxbhgqk_table">
	<c:if test="${fn:length(subcontractSxbhgqkList)  <= 0 }">
			<tr>
				<td align="center"><div style="width: 25px;" name="xh">1</div></td>
				<td align="center"><input style="width:20px;"  type="checkbox" name="ck"/></td>
					<input name="subcontractSxbhgqkList[0].id" type="hidden"/>
					<input name="subcontractSxbhgqkList[0].createName" type="hidden"/>
					<input name="subcontractSxbhgqkList[0].createBy" type="hidden"/>
					<input name="subcontractSxbhgqkList[0].createDate" type="hidden"/>
					<input name="subcontractSxbhgqkList[0].updateName" type="hidden"/>
					<input name="subcontractSxbhgqkList[0].updateBy" type="hidden"/>
					<input name="subcontractSxbhgqkList[0].updateDate" type="hidden"/>
					<input name="subcontractSxbhgqkList[0].sysOrgCode" type="hidden"/>
					<input name="subcontractSxbhgqkList[0].sysCompanyCode" type="hidden"/>
					<input name="subcontractSxbhgqkList[0].bpmStatus" type="hidden"/>
				  <td align="left">
					  	<input name="subcontractSxbhgqkList[0].sxbhgpind" maxlength="32" type="text" class="inputxt"  style="width:120px;"  ignore="ignore" >
					  <label class="Validform_label" style="display: none;">PIND</label>
					</td>
				  <td align="left">
					  	<input name="subcontractSxbhgqkList[0].sxllqdcs" maxlength="32" type="text" class="inputxt"  style="width:120px;"  ignore="ignore" >
					  <label class="Validform_label" style="display: none;">老炼前电测试</label>
					</td>
				  <td align="left">
					  	<input name="subcontractSxbhgqkList[0].sxdtllhdcs" maxlength="32" type="text" class="inputxt"  style="width:120px;"  ignore="ignore" >
					  <label class="Validform_label" style="display: none;">动态老炼后电测试</label>
					</td>
				  <td align="left">
					  	<input name="subcontractSxbhgqkList[0].sxjtllhdcs" maxlength="32" type="text" class="inputxt"  style="width:120px;"  ignore="ignore" >
					  <label class="Validform_label" style="display: none;">静态老炼后电测试</label>
					</td>
				  <td align="left">
					  	<input name="subcontractSxbhgqkList[0].sxzzdcs" maxlength="32" type="text" class="inputxt"  style="width:120px;"  ignore="ignore" >
					  <label class="Validform_label" style="display: none;">最终电测试</label>
					</td>
				  <td align="left">
					  	<input name="subcontractSxbhgqkList[0].sxxjl" maxlength="32" type="text" class="inputxt"  style="width:120px;"  ignore="ignore" >
					  <label class="Validform_label" style="display: none;">细检漏</label>
					</td>
				  <td align="left">
					  	<input name="subcontractSxbhgqkList[0].sxcjl" maxlength="32" type="text" class="inputxt"  style="width:120px;"  ignore="ignore" >
					  <label class="Validform_label" style="display: none;">粗检漏</label>
					</td>
				  <td align="left">
					  	<input name="subcontractSxbhgqkList[0].sxxsx" maxlength="32" type="text" class="inputxt"  style="width:120px;"  ignore="ignore" >
					  <label class="Validform_label" style="display: none;">X射线</label>
					</td>
				  <td align="left">
					  	<input name="subcontractSxbhgqkList[0].sxwbmj" maxlength="32" type="text" class="inputxt"  style="width:120px;"  ignore="ignore" >
					  <label class="Validform_label" style="display: none;">外部目检</label>
					</td>
   			</tr>
	</c:if>
	<c:if test="${fn:length(subcontractSxbhgqkList)  > 0 }">
		<c:forEach items="${subcontractSxbhgqkList}" var="poVal" varStatus="stuts">
			<tr>
				<td align="center"><div style="width: 25px;" name="xh">${stuts.index+1 }</div></td>
				<td align="center"><input style="width:20px;"  type="checkbox" name="ck" /></td>
						<input name="subcontractSxbhgqkList[${stuts.index }].id" type="hidden" value="${poVal.id }"/>
						<input name="subcontractSxbhgqkList[${stuts.index }].createName" type="hidden" value="${poVal.createName }"/>
						<input name="subcontractSxbhgqkList[${stuts.index }].createBy" type="hidden" value="${poVal.createBy }"/>
						<input name="subcontractSxbhgqkList[${stuts.index }].createDate" type="hidden" value="${poVal.createDate }"/>
						<input name="subcontractSxbhgqkList[${stuts.index }].updateName" type="hidden" value="${poVal.updateName }"/>
						<input name="subcontractSxbhgqkList[${stuts.index }].updateBy" type="hidden" value="${poVal.updateBy }"/>
						<input name="subcontractSxbhgqkList[${stuts.index }].updateDate" type="hidden" value="${poVal.updateDate }"/>
						<input name="subcontractSxbhgqkList[${stuts.index }].sysOrgCode" type="hidden" value="${poVal.sysOrgCode }"/>
						<input name="subcontractSxbhgqkList[${stuts.index }].sysCompanyCode" type="hidden" value="${poVal.sysCompanyCode }"/>
						<input name="subcontractSxbhgqkList[${stuts.index }].bpmStatus" type="hidden" value="${poVal.bpmStatus }"/>
				   <td align="left">
					  	<input name="subcontractSxbhgqkList[${stuts.index }].sxbhgpind" maxlength="32" type="text" class="inputxt"  style="width:120px;"  ignore="ignore"  value="${poVal.sxbhgpind }"/>
					  <label class="Validform_label" style="display: none;">PIND</label>
				   </td>
				   <td align="left">
					  	<input name="subcontractSxbhgqkList[${stuts.index }].sxllqdcs" maxlength="32" type="text" class="inputxt"  style="width:120px;"  ignore="ignore"  value="${poVal.sxllqdcs }"/>
					  <label class="Validform_label" style="display: none;">老炼前电测试</label>
				   </td>
				   <td align="left">
					  	<input name="subcontractSxbhgqkList[${stuts.index }].sxdtllhdcs" maxlength="32" type="text" class="inputxt"  style="width:120px;"  ignore="ignore"  value="${poVal.sxdtllhdcs }"/>
					  <label class="Validform_label" style="display: none;">动态老炼后电测试</label>
				   </td>
				   <td align="left">
					  	<input name="subcontractSxbhgqkList[${stuts.index }].sxjtllhdcs" maxlength="32" type="text" class="inputxt"  style="width:120px;"  ignore="ignore"  value="${poVal.sxjtllhdcs }"/>
					  <label class="Validform_label" style="display: none;">静态老炼后电测试</label>
				   </td>
				   <td align="left">
					  	<input name="subcontractSxbhgqkList[${stuts.index }].sxzzdcs" maxlength="32" type="text" class="inputxt"  style="width:120px;"  ignore="ignore"  value="${poVal.sxzzdcs }"/>
					  <label class="Validform_label" style="display: none;">最终电测试</label>
				   </td>
				   <td align="left">
					  	<input name="subcontractSxbhgqkList[${stuts.index }].sxxjl" maxlength="32" type="text" class="inputxt"  style="width:120px;"  ignore="ignore"  value="${poVal.sxxjl }"/>
					  <label class="Validform_label" style="display: none;">细检漏</label>
				   </td>
				   <td align="left">
					  	<input name="subcontractSxbhgqkList[${stuts.index }].sxcjl" maxlength="32" type="text" class="inputxt"  style="width:120px;"  ignore="ignore"  value="${poVal.sxcjl }"/>
					  <label class="Validform_label" style="display: none;">粗检漏</label>
				   </td>
				   <td align="left">
					  	<input name="subcontractSxbhgqkList[${stuts.index }].sxxsx" maxlength="32" type="text" class="inputxt"  style="width:120px;"  ignore="ignore"  value="${poVal.sxxsx }"/>
					  <label class="Validform_label" style="display: none;">X射线</label>
				   </td>
				   <td align="left">
					  	<input name="subcontractSxbhgqkList[${stuts.index }].sxwbmj" maxlength="32" type="text" class="inputxt"  style="width:120px;"  ignore="ignore"  value="${poVal.sxwbmj }"/>
					  <label class="Validform_label" style="display: none;">外部目检</label>
				   </td>
   			</tr>
		</c:forEach>
	</c:if>	
	</tbody>
</table>
