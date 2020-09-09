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
    	$(".datagrid-toolbar").parent().css("overflow","hidden");
    	if(location.href.indexOf("load=detail")!=-1){
			$(":input").attr("disabled","true");
			$(".datagrid-toolbar").hide();
		}
    });
</script>
<div style="padding: 3px; height: 25px;width:auto;" class="datagrid-toolbar">
	<a id="addSubcontractSxbhgqkBtn" href="#">添加</a> <a id="delSubcontractSxbhgqkBtn" href="#">删除</a> 
</div>
<table border="0" cellpadding="2" cellspacing="0" id="subcontractSxbhgqk_table"  class="formtable">
	<tbody id="add_subcontractSxbhgqk_table">
	<c:if test="${fn:length(subcontractSxbhgqkList)  <= 0 }">
			<tr>
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
				<td align="right" width="25%">
					<input style="width:20px;"  type="checkbox" name="ck"/>
					<label class="Validform_label">不合格项目:</label>
				</td>
				<td class="value" width="25%">
					<t:dictSelect field="subcontractSxbhgqkList[0].bhgxm" type="list"   typeGroupCode="sxbhgqk"  extendJson="{class:'form-control input-sm'}" hasLabel="false"  title="筛选不合格情况" ></t:dictSelect>
					<span class="Validform_checktip"></span>
					<label class="Validform_label" style="display: none;">不合格项目</label>
				</td>
				<td align="right" width="25%">
					<label class="Validform_label">不合格数量:</label>
				</td>
				<td class="value" width="25%">
					<input name="subcontractSxbhgqkList[0].bhgsl" maxlength="32" type="text" class="inputxt"  style="width:150px;"  ignore="ignore"/>
					<span class="Validform_checktip"></span>
					<label class="Validform_label" style="display: none;">不合格数量</label>
				</td>
			</tr>
	</c:if>
	<c:if test="${fn:length(subcontractSxbhgqkList)  > 0 }">
		<c:forEach items="${subcontractSxbhgqkList}" var="poVal" varStatus="stuts">
			<tr>
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
				<td align="right" width="25%">
					<input style="width:20px;"  type="checkbox" name="ck"/>
					<label class="Validform_label">不合格项目:</label>
				</td>
				<td class="value" width="25%">
					<t:dictSelect field="subcontractSxbhgqkList[${stuts.index }].bhgxm" type="list"   typeGroupCode="sxbhgqk" defaultVal="${poVal.bhgxm }" extendJson="{class:'form-control input-sm'}" hasLabel="false"  title="筛选不合格情况" ></t:dictSelect>
					<span class="Validform_checktip"></span>
					<label class="Validform_label" style="display: none;">不合格项目</label>
				</td>
				<td align="right" width="25%">
					<label class="Validform_label">不合格数量:</label>
				</td>
				<td class="value" width="25%">
					<input name="subcontractSxbhgqkList[${stuts.index }].bhgsl" maxlength="32" type="text" class="inputxt"  style="width:150px;"  ignore="ignore"  value="${poVal.bhgsl }"/>
					<span class="Validform_checktip"></span>
					<label class="Validform_label" style="display: none;">不合格数量</label>
				</td>
			</tr>
		</c:forEach>
	</c:if>	
	</tbody>
</table>
