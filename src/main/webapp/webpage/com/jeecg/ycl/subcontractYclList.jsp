<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<script type="text/javascript">
	$('#addSubcontractYclBtn').linkbutton({   
	    iconCls: 'icon-add'  
	});  
	$('#delSubcontractYclBtn').linkbutton({   
	    iconCls: 'icon-remove'  
	}); 
	$('#addSubcontractYclBtn').bind('click', function(){   
 		 var tr =  $("#add_subcontractYcl_table_template tr").clone();
	 	 $("#add_subcontractYcl_table").append(tr);
	 	 resetyclTrNumByRow('add_subcontractYcl_table',2);
	 	$("select[name$='materialType']").change(function(){  
	 		alert( this.value );
		});
	 	 return false;
    });
	$("select[name$='materialType']").change(function(){  
		alert( this.value );
	});
	
	$('#delSubcontractYclBtn').bind('click', function(){   
		$("#add_subcontractYcl_table").find("input[name$='ck']:checked").parent().parent().next().remove();  
		$("#add_subcontractYcl_table").find("input[name$='ck']:checked").parent().parent().remove();  
		resetTrNumByRow('add_subcontractYcl_table',2); 
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
    
    function resetyclTrNumByRow(tableId,rownum) {
    	$tbody = $("#"+tableId+"");
    	$tbody.find('>tr').each(function(i){
    		$(':input, select,button,a', this).each(function(){
    			var $this = $(this),validtype_str = $this.attr('validType'), name = $this.attr('name'),id=$this.attr('id'),onclick_str=$this.attr('onclick'), comboname = $this.attr('comboname'),val = $this.val();
    			if(name!=null){
    				if (name.indexOf("#index#") >= 0){
    					$this.attr("name",name.replace('#index#',parseInt(i/rownum)));
    				}else{
    					var s = name.indexOf("[");
    					var e = name.indexOf("]");
    					var new_name = name.substring(s+1,e);
    					$this.attr("name",name.replace("["+new_name+"]","["+parseInt(i/rownum)+"]"));
    				}
    			}
    			if(comboname!=null){
    				if (comboname.indexOf("#index#") >= 0){
    					$this.attr("comboname",comboname.replace('#index#',parseInt(i/rownum)));
    				}else{
    					var s = comboname.indexOf("[");
    					var e = comboname.indexOf("]");
    					var new_name = comboname.substring(s+1,e);
    					$this.attr("comboname",comboname.replace("["+new_name+"]","["+parseInt(i/rownum)+"]"));
    				}
    			}
    			if(id!=null){
    				if (id.indexOf("#index#") >= 0){
    					$this.attr("id",id.replace('#index#',parseInt(i/rownum)));
    				}else{
    					var s = id.indexOf("[");
    					var e = id.indexOf("]");
    					var new_id = id.substring(s+1,e);
    					$this.attr("id",id.replace("["+new_id+"]","["+parseInt(i/rownum)+"]"));
    				}
    			}
    			if(onclick_str!=null){
    				if (onclick_str.indexOf("#index#") >= 0){
    					$this.attr("onclick",onclick_str.replace(/#index#/g,parseInt(i/rownum)));
    				}else{
    					if(name!=null && name.indexOf("imgBtn")>=0){
    						var s = onclick_str.indexOf("[");
    						var e = onclick_str.indexOf("]");
    						var new_onclick_str = onclick_str.substring(s+1,e);
    						$this.attr("onclick",onclick_str.replace(new_onclick_str,parseInt(i/rownum)+"\\"+"\\"));
    					}
    				}
    			}
    			if(validtype_str!=null){
    				if(validtype_str.indexOf("#index#") >= 0){
    					$this.attr("validType",validtype_str.replace('#index#',parseInt(i/rownum)));
    				}
    			}
    		});
    	});
    }
</script>
<div style="padding: 3px; height: 25px;width:auto;" class="datagrid-toolbar">
	<a id="addSubcontractYclBtn" href="#">添加</a> <a id="delSubcontractYclBtn" href="#">删除</a> 
</div>
<table border="0" cellpadding="2" cellspacing="0" id="subcontractYcl_table" class="formtable">
	<tbody id="add_subcontractYcl_table">
	<c:if test="${fn:length(subcontractYclList)  <= 0 }">
		<tr>
			<input name="subcontractYclList[0].id" type="hidden"/>
			<input name="subcontractYclList[0].createName" type="hidden"/>
			<input name="subcontractYclList[0].createBy" type="hidden"/>
			<input name="subcontractYclList[0].createDate" type="hidden"/>
			<input name="subcontractYclList[0].updateName" type="hidden"/>
			<input name="subcontractYclList[0].updateBy" type="hidden"/>
			<input name="subcontractYclList[0].updateDate" type="hidden"/>
			<input name="subcontractYclList[0].sysOrgCode" type="hidden"/>
			<input name="subcontractYclList[0].sysCompanyCode" type="hidden"/>
			<input name="subcontractYclList[0].bpmStatus" type="hidden"/>
			<input name="subcontractYclList[0].materialId" type="hidden"/>
			<input name="subcontractYclList[0].fileid" type="hidden"/>
			<td align="right" width="25%">
				<input style="width:20px;"  type="checkbox" name="ck"/>
				<label class="Validform_label">原材料类型:</label>
			</td>
			<td class="value" width="25%">
				<t:dictSelect field="subcontractYclList[0].materialType" type="list"   typeGroupCode="ycllx"   hasLabel="false"  title="阶段标识" ></t:dictSelect>
				<span class="Validform_checktip"></span>
				<label class="Validform_label" style="display: none;">原材料类型</label>
			</td>
			<td align="right" width="25%">
				<label class="Validform_label">产品型号:</label>
			</td>
			<td class="value" width="25%">
				<input name="subcontractYclList[0].cpxh" class="easyui-combotree" style="width: 150px" class="inputxt"  
					lines="true" cascadeCheck="false" />
				<span class="Validform_checktip"></span>
				<label class="Validform_label" style="display: none;">监制单位</label>
			</td>
		</tr>
		<tr>
			<td align="right" width="25%">
				<label class="Validform_label">产品批次:</label>
			</td>
			<td class="value" width="25%">
				<input name="subcontractYclList[0].cppc" class="easyui-combotree" style="width: 150px" class="inputxt"  
					lines="true" cascadeCheck="false" />
				<span class="Validform_checktip"></span>
				<label class="Validform_label" style="display: none;">产品批次</label>
			</td>
			<td align="right" width="25%">
				<label class="Validform_label">文件附件:</label>
			</td>
			<td class="value" width="25%">
		     	<input type="hidden" id="subcontractYclList[0].fileattach" name="subcontractYclList[0].fileattach" />
							   <input class="ui-button" type="button" value="上传附件" name="subcontractYclList[0].imgBtn"
											onclick="commonUpload(commonUploadDefaultCallBack,'subcontractYclList\\[0\\]\\.fileattach')"/>
								<a  target="_blank" id="subcontractYclList[0].fileattach_href"></a>
			  	<label class="Validform_label" style="display: none;">文件附件</label>
			</td>
		</tr>
	</c:if>
	<c:if test="${fn:length(subcontractYclList)  > 0 }">
		<c:forEach items="${subcontractYclList}" var="poVal" varStatus="stuts">
			<tr>
				<input name="subcontractYclList[${stuts.index }].id" type="hidden" value="${poVal.id }"/>
				<input name="subcontractYclList[${stuts.index }].createName" type="hidden" value="${poVal.createName }"/>
				<input name="subcontractYclList[${stuts.index }].createBy" type="hidden" value="${poVal.createBy }"/>
				<input name="subcontractYclList[${stuts.index }].createDate" type="hidden" value="${poVal.createDate }"/>
				<input name="subcontractYclList[${stuts.index }].updateName" type="hidden" value="${poVal.updateName }"/>
				<input name="subcontractYclList[${stuts.index }].updateBy" type="hidden" value="${poVal.updateBy }"/>
				<input name="subcontractYclList[${stuts.index }].updateDate" type="hidden" value="${poVal.updateDate }"/>
				<input name="subcontractYclList[${stuts.index }].sysOrgCode" type="hidden" value="${poVal.sysOrgCode }"/>
				<input name="subcontractYclList[${stuts.index }].sysCompanyCode" type="hidden" value="${poVal.sysCompanyCode }"/>
				<input name="subcontractYclList[${stuts.index }].bpmStatus" type="hidden" value="${poVal.bpmStatus }"/>
				<input name="subcontractYclList[${stuts.index }].materialId" type="hidden" value="${poVal.materialId }"/>
				<input name="subcontractYclList[${stuts.index }].fileid" type="hidden" value="${poVal.fileid }"/>
				<td align="right" width="25%">
					<input style="width:20px;"  type="checkbox" name="ck"/>
					<label class="Validform_label">原材料类型:</label>
				</td>
				<td class="value" width="25%">
					<t:dictSelect field="subcontractYclList[${stuts.index }].materialType" type="list"   typeGroupCode="ycllx"  defaultVal="${poVal.materialType }" hasLabel="false"  title="原材料类型"></t:dictSelect>
					<span class="Validform_checktip"></span>
					<label class="Validform_label" style="display: none;">原材料类型</label>
				</td>
				<td align="right" width="25%">
					<label class="Validform_label">产品型号:</label>
				</td>
				<td class="value" width="25%">
			     	<t:dictSelect field="subcontractYclList[${stuts.index }].cpxh" type="list"   typeGroupCode=""  defaultVal="${poVal.cpxh }" hasLabel="false"  title="产品型号"></t:dictSelect>
					<span class="Validform_checktip"></span>
					<label class="Validform_label" style="display: none;">监制单位</label>
				</td>
			</tr>
			<tr>
				<td align="right" width="25%">
					<input style="width:20px;"  type="checkbox" name="ck"/>
					<label class="Validform_label">产品批次:</label>
				</td>
				<td class="value" width="25%">
					<t:dictSelect field="subcontractYclList[${stuts.index }].cppc" type="list"   typeGroupCode=""  defaultVal="${poVal.cppc }" hasLabel="false"  title="产品批次"></t:dictSelect>
					<span class="Validform_checktip"></span>
					<label class="Validform_label" style="display: none;">产品批次</label>
				</td>
				<td align="right" width="25%">
					<label class="Validform_label">文件附件:</label>
				</td>
				<td class="value" width="25%">
			     	<input type="hidden" id="subcontractYclList[${stuts.index }].fileattach" name="subcontractYclList[${stuts.index }].fileattach"  value="${poVal.fileattach }"/>
									   <input class="ui-button" type="button" value="上传附件" name="subcontractYclList[${stuts.index }].imgBtn"
													onclick="commonUpload(commonUploadDefaultCallBack,'subcontractYclList\\[${stuts.index }\\]\\.fileattach')"/>
					  	 		<c:if test="${empty poVal.fileattach}">
											<a  target="_blank" id="subcontractYclList[${stuts.index }].fileattach_href"></a>
										</c:if>
										<c:if test="${!empty poVal.fileattach}">
											<a  href="${poVal.fileattach}"  target="_blank" id="subcontractYclList[${stuts.index }].fileattach_href">下载</a>
										</c:if>
					  <label class="Validform_label" style="display: none;">文件附件</label>
				</td>
			</tr>
		</c:forEach>
	</c:if>	
	</tbody>
</table>
