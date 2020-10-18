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
	 	resetTrNumByRow('add_subcontractBcsxxx_table',4);
	 	 return false;
    });  
	$('#delSubcontractBcsxxxBtn').bind('click', function(){
		$("#add_subcontractBcsxxx_table").find("input[name$='ck']:checked").parent().parent().next().remove();  
		$("#add_subcontractBcsxxx_table").find("input[name$='ck']:checked").parent().parent().next().remove();  
		$("#add_subcontractBcsxxx_table").find("input[name$='ck']:checked").parent().parent().next().remove();  
		$("#add_subcontractBcsxxx_table").find("input[name$='ck']:checked").parent().parent().remove();  
		resetTrNumByRow('add_subcontractBcsxxx_table',4); 
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
	<a id="addSubcontractBcsxxxBtn" href="#">添加</a> <a id="delSubcontractBcsxxxBtn" href="#">删除</a> 
</div>
<table border="0" cellpadding="2" cellspacing="0" id="subcontractBcsxxx_table" class="formtable">
	<tbody id="add_subcontractBcsxxx_table">
	<c:if test="${fn:length(subcontractBcsxxxList)  <= 0 }">
		<tr>
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
			<td align="right" width="25%">
				<input style="width:20px;"  type="checkbox" name="ck"/>
				<label class="Validform_label">补充筛选报告号:</label>
			</td>
			<td class="value" width="25%">
				<input name="subcontractBcsxxxList[0].bcsxbgh" maxlength="200" type="text" class="inputxt"  style="width:150px;"  ignore="ignore" />
				<span class="Validform_checktip"></span>
				<label class="Validform_label" style="display: none;">补充筛选报告号</label>
			</td>
			<td align="right" width="25%">
				<label class="Validform_label">补充筛选附件:</label>
			</td>
			<td class="value" width="25%">
		     	<input type="hidden" id="subcontractBcsxxxList[0].bcsxfileattach" name="subcontractBcsxxxList[0].bcsxfileattach" />
									    <input class="ui-button" type="button" value="上传附件"  name="subcontractBcsxxxList[0].imgBtn" onclick="commonUpload(commonUploadDefaultCallBack,'subcontractBcsxxxList\\[0\\]\\.bcsxfileattach')"/> 
										<a  target="_blank" id="subcontractBcsxxxList[0].bcsxfileattach_href">未上传</a>
					  <label class="Validform_label" style="display: none;">补充筛选附件</label>
			</td>
		</tr>
		<tr>
			<td align="right" width="25%">
				<label class="Validform_label">补充筛选开始时间:</label>
			</td>
			<td class="value" width="25%">
				<input id="subcontractBcsxxxList0bcsxstarttime" name="subcontractBcsxxxList[0].bcsxstarttime" type="text" errormsg="该字段不为空"/>
				<img onclick="WdatePicker({el:'subcontractBcsxxxList0bcsxstarttime'})" src="plug-in/easyui/themes/black/images/datebox_arrow.png" style="opacity: 0.6;height:17px;width:17px;" align="absmiddle">
				<span class="Validform_checktip"></span>
			</td>
			<td align="right" width="25%">
				<label class="Validform_label">补充筛选结束时间:</label>
			</td>
			<td class="value" width="25%">
				<input id="subcontractBcsxxxList0bcsxendtime" name="subcontractBcsxxxList[0].bcsxendtime" type="text" errormsg="该字段不为空"/>
				<img onclick="WdatePicker({el:'subcontractBcsxxxList0bcsxendtime'})" src="plug-in/easyui/themes/black/images/datebox_arrow.png" style="opacity: 0.6;height:17px;width:17px;" align="absmiddle">
				<span class="Validform_checktip"></span>
			</td>
		</tr>
		<tr>
			<td align="right" width="25%">
				<label class="Validform_label">补充筛选委托单位:</label>
			</td>
			<td class="value" width="25%">
				<t:dictSelect  field="subcontractBcsxxxList[0].bcsxwtdw" type="select"  hasLabel="false" extendJson="{class:'form-control input-sm ',style='width:150px'}" dictTable="file_bcsxwtdw" dictField="companyname" dictText="companyname" ></t:dictSelect>
				<span class="Validform_checktip"></span>
				<label class="Validform_label" style="display: none;">补充筛选委托单位</label>
			</td>
			<td align="right" width="25%">
				<label class="Validform_label">补充筛选投入数量:</label>
			</td>
			<td class="value" width="25%">
		     	<input name="subcontractBcsxxxList[0].bcsxtrsl" maxlength="200" type="text" class="inputxt"  style="width:150px;"  ignore="ignore" />
				<span class="Validform_checktip"></span>
				<label class="Validform_label" style="display: none;">补充筛选投入数量</label>
			</td>
		</tr>
		<tr>
			<td align="right" width="25%">
				<label class="Validform_label">补充筛选合格数量:</label>
			</td>
			<td class="value" width="25%">
		     	<input name="subcontractBcsxxxList[0].bcsxhgzl" maxlength="200" type="text" class="inputxt"  style="width:150px;"  ignore="ignore" />
				<span class="Validform_checktip"></span>
				<label class="Validform_label" style="display: none;">补充筛选合格数量</label>
			</td>
			<td align="right" width="25%">
			</td>
			<td class="value" width="25%">
			</td>
		</tr>
	</c:if>
	<c:if test="${fn:length(subcontractBcsxxxList)  > 0 }">
		<c:forEach items="${subcontractBcsxxxList}" var="poVal" varStatus="stuts">
			<tr>
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
			<td align="right" width="25%">
				<input style="width:20px;"  type="checkbox" name="ck"/>
				<label class="Validform_label">补充筛选报告号:</label>
			</td>
			<td class="value" width="25%">
				<input name="subcontractBcsxxxList[${stuts.index }].bcsxbgh" maxlength="32" type="text" class="inputxt"  style="width:150px;"  ignore="ignore"  value="${poVal.bcsxbgh }"/>
				<span class="Validform_checktip"></span>
				<label class="Validform_label" style="display: none;">补充筛选报告号</label>
			</td>
			<td align="right" width="25%">
				<label class="Validform_label">补充筛选附件:</label>
			</td>
			<td class="value" width="25%">
		     	<input type="hidden" id="subcontractBcsxxxList[${stuts.index }].bcsxfileattach" name="subcontractBcsxxxList[${stuts.index }].bcsxfileattach"  value="${poVal.bcsxfileattach }"/>
									   <input class="ui-button" type="button" value="上传附件" name="subcontractBcsxxxList[${stuts.index }].imgBtn"
													onclick="commonUpload(commonUploadDefaultCallBack,'subcontractBcsxxxList\\[${stuts.index }\\]\\.bcsxfileattach')"/>
					  	 		<c:if test="${empty poVal.bcsxfileattach}">
											<a  target="_blank" id="subcontractBcsxxxList[${stuts.index }].bcsxfileattach_href"></a>
										</c:if>
										<c:if test="${!empty poVal.bcsxfileattach}">
											<a  href="img/server/${poVal.bcsxfileattach}"  target="_blank" id="subcontractBcsxxxList[${stuts.index }].bcsxfileattach_href">下载</a>
										</c:if>
					  <label class="Validform_label" style="display: none;">补充筛选附件</label>
			</td>
		</tr>
		<tr>
			<td align="right" width="25%">
				<label class="Validform_label">补充筛选开始时间:</label>
			</td>
			<td class="value" width="25%">
				<input id="subcontractBcsxxxList${stuts.index }bcsxstarttime" name="subcontractBcsxxxList[${stuts.index }].bcsxstarttime" type="text" errormsg="该字段不为空"  value="${poVal.bcsxstarttime }"/>
				<img onclick="WdatePicker({el:'subcontractBcsxxxList${stuts.index }bcsxstarttime'})" src="plug-in/easyui/themes/black/images/datebox_arrow.png" style="opacity: 0.6;height:17px;width:17px;" align="absmiddle">
				<span class="Validform_checktip"></span>
			</td>
			<td align="right" width="25%">
				<label class="Validform_label">补充筛选结束时间:</label>
			</td>
			<td class="value" width="25%">
				<input id="subcontractBcsxxxList${stuts.index }bcsxendtime" name="subcontractBcsxxxList[${stuts.index }].bcsxendtime" type="text" errormsg="该字段不为空"  value="${poVal.bcsxendtime }"/>
				<img onclick="WdatePicker({el:'subcontractBcsxxxList${stuts.index }bcsxendtime'})" src="plug-in/easyui/themes/black/images/datebox_arrow.png" style="opacity: 0.6;height:17px;width:17px;" align="absmiddle">
				<span class="Validform_checktip"></span>
			</td>
		</tr>
		<tr>
			<td align="right" width="25%">
				<label class="Validform_label">补充筛选委托单位:</label>
			</td>
			<td class="value" width="25%">
				<t:dictSelect  field="subcontractBcsxxxList[${stuts.index }].bcsxwtdw" type="select"  hasLabel="false" defaultVal="${poVal.bcsxwtdw }" extendJson="{class:'form-control input-sm ',style='width:150px'}" dictTable="file_bcsxwtdw" dictField="companyname" dictText="companyname" ></t:dictSelect>
				<span class="Validform_checktip"></span>
				<label class="Validform_label" style="display: none;">补充筛选委托单位</label>
			</td>
			<td align="right" width="25%">
				<label class="Validform_label">补充筛选投入数量:</label>
			</td>
			<td class="value" width="25%">
		     	<input name="subcontractBcsxxxList[${stuts.index }].bcsxtrsl" maxlength="32" type="text" class="inputxt"  style="width:150px;"  ignore="ignore"  value="${poVal.bcsxtrsl }"/>
				<span class="Validform_checktip"></span>
				<label class="Validform_label" style="display: none;">补充筛选投入数量</label>
			</td>
			
		</tr>
		<tr>
			<td align="right" width="25%">
				<label class="Validform_label">补充筛选合格数量:</label>
			</td>
			<td class="value" width="25%">
		     	<input name="subcontractBcsxxxList[${stuts.index }].bcsxhgzl" maxlength="32" type="text" class="inputxt"  style="width:150px;"  ignore="ignore"  value="${poVal.bcsxhgzl }"/>
				<span class="Validform_checktip"></span>
				<label class="Validform_label" style="display: none;">补充筛选合格数量</label>
			</td>
			<td align="right" width="25%">
			</td>
			<td class="value" width="25%">
			</td>
		</tr>
		</c:forEach>
	</c:if>	
	</tbody>
</table>
