<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<script type="text/javascript">
	$('#addSubcontractFzbhgqkBtn').linkbutton({   
	    iconCls: 'icon-add'  
	});  
	$('#delSubcontractFzbhgqkBtn').linkbutton({   
	    iconCls: 'icon-remove'  
	}); 
	$('#addSubcontractFzbhgqkBtn').bind('click', function(){   
 		 var tr =  $("#add_subcontractFzbhgqk_table_template tr").clone();
	 	 $("#add_subcontractFzbhgqk_table").append(tr);
	 	 resetTrNum('add_subcontractFzbhgqk_table');
	 	 return false;
    });  
	$('#delSubcontractFzbhgqkBtn').bind('click', function(){   
		$("#add_subcontractFzbhgqk_table").find("input[name$='ck']:checked").parent().parent().remove();  
        resetTrNum('add_subcontractFzbhgqk_table'); 
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
	<a id="addSubcontractFzbhgqkBtn" href="#">添加</a> <a id="delSubcontractFzbhgqkBtn" href="#">删除</a> 
</div>
<table border="0" cellpadding="2" cellspacing="0" id="subcontractFzbhgqk_table">
	<tr bgcolor="#E6E6E6">
		<td align="center" bgcolor="#EEEEEE" style="width: 25px;">序号</td>
		<td align="center" bgcolor="#EEEEEE" style="width: 25px;">操作</td>
				  <td align="left" bgcolor="#EEEEEE" style="width: 126px;">
						键合前检验
				  </td>
				  <td align="left" bgcolor="#EEEEEE" style="width: 126px;">
						键合检验
				  </td>
				  <td align="left" bgcolor="#EEEEEE" style="width: 126px;">
						封帽前镜检
				  </td>
				  <td align="left" bgcolor="#EEEEEE" style="width: 126px;">
						封帽镜检
				  </td>
				  <td align="left" bgcolor="#EEEEEE" style="width: 126px;">
						PIND
				  </td>
				  <td align="left" bgcolor="#EEEEEE" style="width: 126px;">
						细检漏
				  </td>
				  <td align="left" bgcolor="#EEEEEE" style="width: 126px;">
						粗检漏
				  </td>
				  <td align="left" bgcolor="#EEEEEE" style="width: 126px;">
						切筋成形
				  </td>
				  <td align="left" bgcolor="#EEEEEE" style="width: 126px;">
						外部目检
				  </td>
	</tr>
	<tbody id="add_subcontractFzbhgqk_table">
	<c:if test="${fn:length(subcontractFzbhgqkList)  <= 0 }">
			<tr>
				<td align="center"><div style="width: 25px;" name="xh">1</div></td>
				<td align="center"><input style="width:20px;"  type="checkbox" name="ck"/></td>
					<input name="subcontractFzbhgqkList[0].id" type="hidden"/>
					<input name="subcontractFzbhgqkList[0].createName" type="hidden"/>
					<input name="subcontractFzbhgqkList[0].createBy" type="hidden"/>
					<input name="subcontractFzbhgqkList[0].createDate" type="hidden"/>
					<input name="subcontractFzbhgqkList[0].updateName" type="hidden"/>
					<input name="subcontractFzbhgqkList[0].updateBy" type="hidden"/>
					<input name="subcontractFzbhgqkList[0].updateDate" type="hidden"/>
					<input name="subcontractFzbhgqkList[0].sysOrgCode" type="hidden"/>
					<input name="subcontractFzbhgqkList[0].sysCompanyCode" type="hidden"/>
					<input name="subcontractFzbhgqkList[0].bpmStatus" type="hidden"/>
				  <td align="left">
					  	<input name="subcontractFzbhgqkList[0].jhqjy" maxlength="32" type="text" class="inputxt"  style="width:120px;"  ignore="ignore" >
					  <label class="Validform_label" style="display: none;">键合前检验</label>
					</td>
				  <td align="left">
					  	<input name="subcontractFzbhgqkList[0].jhjy" maxlength="32" type="text" class="inputxt"  style="width:120px;"  ignore="ignore" >
					  <label class="Validform_label" style="display: none;">键合检验</label>
					</td>
				  <td align="left">
					  	<input name="subcontractFzbhgqkList[0].fmqjj" maxlength="32" type="text" class="inputxt"  style="width:120px;"  ignore="ignore" >
					  <label class="Validform_label" style="display: none;">封帽前镜检</label>
					</td>
				  <td align="left">
					  	<input name="subcontractFzbhgqkList[0].fmjj" maxlength="32" type="text" class="inputxt"  style="width:120px;"  ignore="ignore" >
					  <label class="Validform_label" style="display: none;">封帽镜检</label>
					</td>
				  <td align="left">
					  	<input name="subcontractFzbhgqkList[0].fzpind" maxlength="32" type="text" class="inputxt"  style="width:120px;"  ignore="ignore" >
					  <label class="Validform_label" style="display: none;">PIND</label>
					</td>
				  <td align="left">
					  	<input name="subcontractFzbhgqkList[0].xjl" maxlength="32" type="text" class="inputxt"  style="width:120px;"  ignore="ignore" >
					  <label class="Validform_label" style="display: none;">细检漏</label>
					</td>
				  <td align="left">
					  	<input name="subcontractFzbhgqkList[0].cjl" maxlength="32" type="text" class="inputxt"  style="width:120px;"  ignore="ignore" >
					  <label class="Validform_label" style="display: none;">粗检漏</label>
					</td>
				  <td align="left">
					  	<input name="subcontractFzbhgqkList[0].qjcx" maxlength="32" type="text" class="inputxt"  style="width:120px;"  ignore="ignore" >
					  <label class="Validform_label" style="display: none;">切筋成形</label>
					</td>
				  <td align="left">
					  	<input name="subcontractFzbhgqkList[0].wbmj" maxlength="32" type="text" class="inputxt"  style="width:120px;"  ignore="ignore" >
					  <label class="Validform_label" style="display: none;">外部目检</label>
					</td>
   			</tr>
	</c:if>
	<c:if test="${fn:length(subcontractFzbhgqkList)  > 0 }">
		<c:forEach items="${subcontractFzbhgqkList}" var="poVal" varStatus="stuts">
			<tr>
				<td align="center"><div style="width: 25px;" name="xh">${stuts.index+1 }</div></td>
				<td align="center"><input style="width:20px;"  type="checkbox" name="ck" /></td>
						<input name="subcontractFzbhgqkList[${stuts.index }].id" type="hidden" value="${poVal.id }"/>
						<input name="subcontractFzbhgqkList[${stuts.index }].createName" type="hidden" value="${poVal.createName }"/>
						<input name="subcontractFzbhgqkList[${stuts.index }].createBy" type="hidden" value="${poVal.createBy }"/>
						<input name="subcontractFzbhgqkList[${stuts.index }].createDate" type="hidden" value="${poVal.createDate }"/>
						<input name="subcontractFzbhgqkList[${stuts.index }].updateName" type="hidden" value="${poVal.updateName }"/>
						<input name="subcontractFzbhgqkList[${stuts.index }].updateBy" type="hidden" value="${poVal.updateBy }"/>
						<input name="subcontractFzbhgqkList[${stuts.index }].updateDate" type="hidden" value="${poVal.updateDate }"/>
						<input name="subcontractFzbhgqkList[${stuts.index }].sysOrgCode" type="hidden" value="${poVal.sysOrgCode }"/>
						<input name="subcontractFzbhgqkList[${stuts.index }].sysCompanyCode" type="hidden" value="${poVal.sysCompanyCode }"/>
						<input name="subcontractFzbhgqkList[${stuts.index }].bpmStatus" type="hidden" value="${poVal.bpmStatus }"/>
				   <td align="left">
					  	<input name="subcontractFzbhgqkList[${stuts.index }].jhqjy" maxlength="32" type="text" class="inputxt"  style="width:120px;"  ignore="ignore"  value="${poVal.jhqjy }"/>
					  <label class="Validform_label" style="display: none;">键合前检验</label>
				   </td>
				   <td align="left">
					  	<input name="subcontractFzbhgqkList[${stuts.index }].jhjy" maxlength="32" type="text" class="inputxt"  style="width:120px;"  ignore="ignore"  value="${poVal.jhjy }"/>
					  <label class="Validform_label" style="display: none;">键合检验</label>
				   </td>
				   <td align="left">
					  	<input name="subcontractFzbhgqkList[${stuts.index }].fmqjj" maxlength="32" type="text" class="inputxt"  style="width:120px;"  ignore="ignore"  value="${poVal.fmqjj }"/>
					  <label class="Validform_label" style="display: none;">封帽前镜检</label>
				   </td>
				   <td align="left">
					  	<input name="subcontractFzbhgqkList[${stuts.index }].fmjj" maxlength="32" type="text" class="inputxt"  style="width:120px;"  ignore="ignore"  value="${poVal.fmjj }"/>
					  <label class="Validform_label" style="display: none;">封帽镜检</label>
				   </td>
				   <td align="left">
					  	<input name="subcontractFzbhgqkList[${stuts.index }].fzpind" maxlength="32" type="text" class="inputxt"  style="width:120px;"  ignore="ignore"  value="${poVal.fzpind }"/>
					  <label class="Validform_label" style="display: none;">PIND</label>
				   </td>
				   <td align="left">
					  	<input name="subcontractFzbhgqkList[${stuts.index }].xjl" maxlength="32" type="text" class="inputxt"  style="width:120px;"  ignore="ignore"  value="${poVal.xjl }"/>
					  <label class="Validform_label" style="display: none;">细检漏</label>
				   </td>
				   <td align="left">
					  	<input name="subcontractFzbhgqkList[${stuts.index }].cjl" maxlength="32" type="text" class="inputxt"  style="width:120px;"  ignore="ignore"  value="${poVal.cjl }"/>
					  <label class="Validform_label" style="display: none;">粗检漏</label>
				   </td>
				   <td align="left">
					  	<input name="subcontractFzbhgqkList[${stuts.index }].qjcx" maxlength="32" type="text" class="inputxt"  style="width:120px;"  ignore="ignore"  value="${poVal.qjcx }"/>
					  <label class="Validform_label" style="display: none;">切筋成形</label>
				   </td>
				   <td align="left">
					  	<input name="subcontractFzbhgqkList[${stuts.index }].wbmj" maxlength="32" type="text" class="inputxt"  style="width:120px;"  ignore="ignore"  value="${poVal.wbmj }"/>
					  <label class="Validform_label" style="display: none;">外部目检</label>
				   </td>
   			</tr>
		</c:forEach>
	</c:if>	
	</tbody>
</table>
