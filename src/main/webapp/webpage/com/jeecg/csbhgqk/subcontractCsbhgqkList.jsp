<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<script type="text/javascript">
    $(document).ready(function(){
    	$("#subcontractCsbhgqk_table").parent().css("width","auto");
    	$("#subcontractCsbhgqk_table").parent().css("overflow","hidden");
    	if(location.href.indexOf("load=detail")!=-1){
			$(":input").attr("disabled","true");
			$(".datagrid-toolbar").hide();
		}
    });
</script>
<table border="0" cellpadding="2" cellspacing="0" id="subcontractCsbhgqk_table" class="formtable">
	<tbody id="add_subcontractCsbhgqk_table">
	<c:if test="${fn:length(subcontractCsbhgqkList)  <= 0 }">
			<tr>
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
				<td align="right" width="25%">
					<label class="Validform_label">常温:</label>
				</td>
				<td class="value" width="25%">
					<input name="subcontractCsbhgqkList[0].normal" maxlength="32" type="text" class="inputxt"  style="width:150px;"  ignore="ignore" >
					<span class="Validform_checktip"></span>
					<label class="Validform_label" style="display: none;">常温</label>
				</td>
				<td align="right" width="25%">
					<label class="Validform_label">高温:</label>
				</td>
				<td class="value" width="25%">
			     	<input name="subcontractCsbhgqkList[0].high" maxlength="32" type="text" class="inputxt"  style="width:150px;"  ignore="ignore" >
					<span class="Validform_checktip"></span>
					<label class="Validform_label" style="display: none;">高温</label>
				</td>
			</tr>
			<tr>
				<td align="right" width="25%">
					<label class="Validform_label">低温:</label>
				</td>
				<td class="value" width="25%">
					<input name="subcontractCsbhgqkList[0].low" maxlength="32" type="text" class="inputxt"  style="width:150px;"  ignore="ignore" >
					<span class="Validform_checktip"></span>
					<label class="Validform_label" style="display: none;">低温</label>
				</td>
				<td align="right" width="25%">
					<label class="Validform_label"></label>
				</td>
				<td class="value" width="25%">
				</td>
			</tr>
	</c:if>
	<c:if test="${fn:length(subcontractCsbhgqkList)  > 0 }">
		<c:forEach items="${subcontractCsbhgqkList}" var="poVal" varStatus="stuts">
			<tr>
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
				<td align="right" width="25%">
					<label class="Validform_label">常温:</label>
				</td>
				<td class="value" width="25%">
					<input name="subcontractCsbhgqkList[${stuts.index }].normal" maxlength="32" type="text" class="inputxt"  style="width:150px;" value="${poVal.normal }" ignore="ignore" >
					<span class="Validform_checktip"></span>
					<label class="Validform_label" style="display: none;">常温</label>
				</td>
				<td align="right" width="25%">
					<label class="Validform_label">高温:</label>
				</td>
				<td class="value" width="25%">
			     	<input name="subcontractCsbhgqkList[${stuts.index }].high" maxlength="32" type="text" class="inputxt"  style="width:150px;"  value="${poVal.high }" ignore="ignore" >
					<span class="Validform_checktip"></span>
					<label class="Validform_label" style="display: none;">高温</label>
				</td>
			</tr>
			<tr>
				<td align="right" width="25%">
					<label class="Validform_label">低温:</label>
				</td>
				<td class="value" width="25%">
					<input name="subcontractCsbhgqkList[${stuts.index }].low" maxlength="32" type="text" class="inputxt"  style="width:150px;"   value="${poVal.low }" ignore="ignore" >
					<span class="Validform_checktip"></span>
					<label class="Validform_label" style="display: none;">低温</label>
				</td>
				<td align="right" width="25%">
					<label class="Validform_label"></label>
				</td>
				<td class="value" width="25%">
				</td>
			</tr>
		</c:forEach>
	</c:if>	
	</tbody>
</table>
