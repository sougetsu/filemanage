<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<script type="text/javascript">
	$('#addSubcontractCsbhgqkBtn').linkbutton({   
	    iconCls: 'icon-add'  
	});  
	$('#delSubcontractCsbhgqkBtn').linkbutton({   
	    iconCls: 'icon-remove'  
	}); 
	$('#addSubcontractCsbhgqkBtn').bind('click', function(){   
 		 var tr =  $("#add_subcontractCsbhgqk_table_template tr").clone();
	 	 $("#add_subcontractCsbhgqk_table").append(tr);
	 	 resetTrNum('add_subcontractCsbhgqk_table');
	 	 return false;
    });  
	$('#delSubcontractCsbhgqkBtn').bind('click', function(){   
		$("#add_subcontractCsbhgqk_table").find("input[name$='ck']:checked").parent().parent().remove();  
        resetTrNum('add_subcontractCsbhgqk_table'); 
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
	<a id="addSubcontractCsbhgqkBtn" href="#">添加</a> <a id="delSubcontractCsbhgqkBtn" href="#">删除</a> 
</div>
<table border="0" cellpadding="2" cellspacing="0" id="subcontractCsbhgqk_table">
	<tr bgcolor="#E6E6E6">
		<td align="center" bgcolor="#EEEEEE" style="width: 25px;">序号</td>
		<td align="center" bgcolor="#EEEEEE" style="width: 25px;">操作</td>
				  <td align="left" bgcolor="#EEEEEE" style="width: 126px;">
						常温
				  </td>
				  <td align="left" bgcolor="#EEEEEE" style="width: 126px;">
						高温
				  </td>
				  <td align="left" bgcolor="#EEEEEE" style="width: 126px;">
						低温
				  </td>
	</tr>
	<tbody id="add_subcontractCsbhgqk_table">
	<c:if test="${fn:length(subcontractCsbhgqkList)  <= 0 }">
			<tr>
				<td align="center"><div style="width: 25px;" name="xh">1</div></td>
				<td align="center"><input style="width:20px;"  type="checkbox" name="ck"/></td>
					<input name="subcontractCsbhgqkList[0].id" type="hidden"/>
					<input name="subcontractCsbhgqkList[0].createName" type="hidden"/>
					<input name="subcontractCsbhgqkList[0].createBy" type="hidden"/>
					<input name="subcontractCsbhgqkList[0].createDate" type="hidden"/>
					<input name="subcontractCsbhgqkList[0].updateName" type="hidden"/>
					<input name="subcontractCsbhgqkList[0].updateBy" type="hidden"/>
					<input name="subcontractCsbhgqkList[0].updateDate" type="hidden"/>
					<input name="subcontractCsbhgqkList[0].sysOrgCode" type="hidden"/>
					<input name="subcontractCsbhgqkList[0].sysCompanyCode" type="hidden"/>
					<input name="subcontractCsbhgqkList[0].bpmStatus" type="hidden"/>
				  <td align="left">
					  	<input name="subcontractCsbhgqkList[0].normal" maxlength="32" type="text" class="inputxt"  style="width:120px;"  ignore="ignore" >
					  <label class="Validform_label" style="display: none;">常温</label>
					</td>
				  <td align="left">
					  	<input name="subcontractCsbhgqkList[0].high" maxlength="32" type="text" class="inputxt"  style="width:120px;"  ignore="ignore" >
					  <label class="Validform_label" style="display: none;">高温</label>
					</td>
				  <td align="left">
					  	<input name="subcontractCsbhgqkList[0].low" maxlength="32" type="text" class="inputxt"  style="width:120px;"  ignore="ignore" >
					  <label class="Validform_label" style="display: none;">低温</label>
					</td>
   			</tr>
	</c:if>
	<c:if test="${fn:length(subcontractCsbhgqkList)  > 0 }">
		<c:forEach items="${subcontractCsbhgqkList}" var="poVal" varStatus="stuts">
			<tr>
				<td align="center"><div style="width: 25px;" name="xh">${stuts.index+1 }</div></td>
				<td align="center"><input style="width:20px;"  type="checkbox" name="ck" /></td>
						<input name="subcontractCsbhgqkList[${stuts.index }].id" type="hidden" value="${poVal.id }"/>
						<input name="subcontractCsbhgqkList[${stuts.index }].createName" type="hidden" value="${poVal.createName }"/>
						<input name="subcontractCsbhgqkList[${stuts.index }].createBy" type="hidden" value="${poVal.createBy }"/>
						<input name="subcontractCsbhgqkList[${stuts.index }].createDate" type="hidden" value="${poVal.createDate }"/>
						<input name="subcontractCsbhgqkList[${stuts.index }].updateName" type="hidden" value="${poVal.updateName }"/>
						<input name="subcontractCsbhgqkList[${stuts.index }].updateBy" type="hidden" value="${poVal.updateBy }"/>
						<input name="subcontractCsbhgqkList[${stuts.index }].updateDate" type="hidden" value="${poVal.updateDate }"/>
						<input name="subcontractCsbhgqkList[${stuts.index }].sysOrgCode" type="hidden" value="${poVal.sysOrgCode }"/>
						<input name="subcontractCsbhgqkList[${stuts.index }].sysCompanyCode" type="hidden" value="${poVal.sysCompanyCode }"/>
						<input name="subcontractCsbhgqkList[${stuts.index }].bpmStatus" type="hidden" value="${poVal.bpmStatus }"/>
				   <td align="left">
					  	<input name="subcontractCsbhgqkList[${stuts.index }].normal" maxlength="32" type="text" class="inputxt"  style="width:120px;"  ignore="ignore"  value="${poVal.normal }"/>
					  <label class="Validform_label" style="display: none;">常温</label>
				   </td>
				   <td align="left">
					  	<input name="subcontractCsbhgqkList[${stuts.index }].high" maxlength="32" type="text" class="inputxt"  style="width:120px;"  ignore="ignore"  value="${poVal.high }"/>
					  <label class="Validform_label" style="display: none;">高温</label>
				   </td>
				   <td align="left">
					  	<input name="subcontractCsbhgqkList[${stuts.index }].low" maxlength="32" type="text" class="inputxt"  style="width:120px;"  ignore="ignore"  value="${poVal.low }"/>
					  <label class="Validform_label" style="display: none;">低温</label>
				   </td>
   			</tr>
		</c:forEach>
	</c:if>	
	</tbody>
</table>
