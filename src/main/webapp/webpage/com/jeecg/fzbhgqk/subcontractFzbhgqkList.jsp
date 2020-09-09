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
    	$(".datagrid-toolbar").parent().css("overflow","hidden");
    	if(location.href.indexOf("load=detail")!=-1){
			$(":input").attr("disabled","true");
			$(".datagrid-toolbar").hide();
		}
    });
</script>
<div style="padding: 3px; height: 25px;width:auto;" class="datagrid-toolbar">
	<a id="addSubcontractFzbhgqkBtn" href="#">添加</a> <a id="delSubcontractFzbhgqkBtn" href="#">删除</a> 
</div>
<table border="0" cellpadding="2" cellspacing="0" id="subcontractFzbhgqk_table"  class="formtable">
	<tbody id="add_subcontractFzbhgqk_table">
	<c:if test="${fn:length(subcontractFzbhgqkList)  <= 0 }">
			<tr>
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
				<td align="right" width="25%">
					<input style="width:20px;"  type="checkbox" name="ck"/>
					<label class="Validform_label">不合格项目:</label>
				</td>
				<td class="value" width="25%">
					<t:dictSelect field="subcontractFzbhgqkList[0].bhgxm" type="list"   typeGroupCode="fzbhgqk"  extendJson="{class:'form-control input-sm'}" hasLabel="false"  title="封装不合格情况" ></t:dictSelect>
					<span class="Validform_checktip"></span>
					<label class="Validform_label" style="display: none;">不合格项目</label>
				</td>
				<td align="right" width="25%">
					<label class="Validform_label">不合格数量:</label>
				</td>
				<td class="value" width="25%">
					<input name="subcontractFzbhgqkList[0].bhgsl" maxlength="32" type="text" class="inputxt"  style="width:150px;"  ignore="ignore" />
					<span class="Validform_checktip"></span>
					<label class="Validform_label" style="display: none;">不合格数量</label>
				</td>
			</tr>
	</c:if>
	<c:if test="${fn:length(subcontractFzbhgqkList)  > 0 }">
		<c:forEach items="${subcontractFzbhgqkList}" var="poVal" varStatus="stuts">
			<tr>
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
				<td align="right" width="25%">
					<input style="width:20px;"  type="checkbox" name="ck"/>
					<label class="Validform_label">不合格项目:</label>
				</td>
				<td class="value" width="25%">
					<t:dictSelect field="subcontractFzbhgqkList[${stuts.index }].bhgxm" type="list"   typeGroupCode="fzbhgqk" defaultVal="${poVal.bhgxm }"  extendJson="{class:'form-control input-sm'}" hasLabel="false"  title="封装不合格情况" ></t:dictSelect>
					<span class="Validform_checktip"></span>
					<label class="Validform_label" style="display: none;">不合格项目</label>
				</td>
				<td align="right" width="25%">
					<label class="Validform_label">不合格数量:</label>
				</td>
				<td class="value" width="25%">
					<input name="subcontractFzbhgqkList[${stuts.index }].bhgsl" maxlength="32" type="text" class="inputxt"  style="width:150px;"  ignore="ignore"  value="${poVal.bhgsl }"/>
					<span class="Validform_checktip"></span>
					<label class="Validform_label" style="display: none;">不合格数量</label>
				</td>
			</tr>
		</c:forEach>
	</c:if>	
	</tbody>
</table>
