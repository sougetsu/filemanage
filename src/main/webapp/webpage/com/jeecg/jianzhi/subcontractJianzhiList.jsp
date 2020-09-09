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
	 	resetjianzhiTrNum('add_subcontractJianzhi_table');
	 	 return false;
    });  
	$('#delSubcontractJianzhiBtn').bind('click', function(){   
		$("#add_subcontractJianzhi_table").find("input[name$='ck']:checked").parent().parent().next().remove();  
		$("#add_subcontractJianzhi_table").find("input[name$='ck']:checked").parent().parent().next().remove();  
		$("#add_subcontractJianzhi_table").find("input[name$='ck']:checked").parent().parent().remove();  
		resetjianzhiTrNum('add_subcontractJianzhi_table'); 
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

    function resetjianzhiTrNum(tableId) {
    	$tbody = $("#"+tableId+"");
    	$tbody.find('>tr').each(function(i){
    		$(':input, select,button,a', this).each(function(){
    			var $this = $(this),validtype_str = $this.attr('validType'), name = $this.attr('name'),id=$this.attr('id'),onclick_str=$this.attr('onclick'), val = $this.val();
    			if(name!=null){
    				if (name.indexOf("#index#") >= 0){
    					$this.attr("name",name.replace('#index#',parseInt(i/3)));
    				}else{
    					var s = name.indexOf("[");
    					var e = name.indexOf("]");
    					var new_name = name.substring(s+1,e);
    					$this.attr("name",name.replace("["+new_name+"]","["+parseInt(i/3)+"]"));
    				}
    			}
    			if(id!=null){
    				if (id.indexOf("#index#") >= 0){
    					$this.attr("id",id.replace('#index#',parseInt(i/3)));
    				}else{
    					var s = id.indexOf("[");
    					var e = id.indexOf("]");
    					var new_id = id.substring(s+1,e);
    					$this.attr("id",id.replace("["+new_id+"]","["+parseInt(i/3)+"]"));
    				}
    			}
    			if(onclick_str!=null){
    				if (onclick_str.indexOf("#index#") >= 0){
    					$this.attr("onclick",onclick_str.replace(/#index#/g,parseInt(i/3)));
    				}else{
    					if(name!=null && name.indexOf("imgBtn")>=0){
    						var s = onclick_str.indexOf("[");
    						var e = onclick_str.indexOf("]");
    						var new_onclick_str = onclick_str.substring(s+1,e);
    						$this.attr("onclick",onclick_str.replace(new_onclick_str,parseInt(i/3)+"\\"+"\\"));
    					}
    				}
    			}
    			if(validtype_str!=null){
    				if(validtype_str.indexOf("#index#") >= 0){
    					$this.attr("validType",validtype_str.replace('#index#',parseInt(i/3)));
    				}
    			}
    		});
    	});
    }
</script>
<div style="padding:3px; height: 25px;width:auto;" class="datagrid-toolbar">
	<a id="addSubcontractJianzhiBtn" href="#">添加</a> <a id="delSubcontractJianzhiBtn" href="#">删除</a> 
</div>
<table cellpadding="0" cellspacing="1" id="subcontractJianzhi_table" class="formtable">
	<tbody id="add_subcontractJianzhi_table">
	<c:if test="${fn:length(subcontractJianzhiList)  <= 0 }">
		<tr>
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
			<td align="right" width="25%">
				<input style="width:20px;"  type="checkbox" name="ck"/>
				<label class="Validform_label">监制报告号:</label>
			</td>
			<td class="value" width="25%">
				<input name="subcontractJianzhiList[0].jzbgh" maxlength="100" type="text" class="inputxt"  style="width:150px;"  ignore="ignore" >
				<span class="Validform_checktip"></span>
				<label class="Validform_label" style="display: none;">监制报告号</label>
			</td>
			<td align="right" width="25%">
				<label class="Validform_label">监制单位:</label>
			</td>
			<td class="value" width="25%">
		     	<input name="subcontractJianzhiList[0].jzdw" maxlength="200" type="text" class="inputxt"  style="width:150px;"  ignore="ignore" >
				<span class="Validform_checktip"></span>
				<label class="Validform_label" style="display: none;">监制单位</label>
			</td>
		</tr>
		<tr>
			<td align="right">
				<label class="Validform_label">监制数量:</label>
			</td>
			<td class="value">
				<input name="subcontractJianzhiList[0].jzsl" maxlength="32" type="text" class="inputxt"  style="width:150px;"  ignore="ignore" >
				<span class="Validform_checktip"></span>
				<label class="Validform_label" style="display: none;">监制数量</label>
			</td>
			<td align="right">
				<label class="Validform_label">监制时间:</label>
			</td>
			<td class="value">
		     	<input name="subcontractJianzhiList[0].jzsj" maxlength="32" type="text" class="inputxt"  style="width:150px;"  ignore="ignore" >
				<span class="Validform_checktip"></span>
				<label class="Validform_label" style="display: none;">监制时间</label>
			</td>
		</tr>
		<tr>
			<td align="right">
				<label class="Validform_label">附件:</label>
			</td>
			<td class="value">
					<input type="hidden" id="subcontractJianzhiList[0].jzfileattach" name="subcontractJianzhiList[0].jzfileattach" />
							    <input class="ui-button" type="button" value="上传附件"  name="subcontractJianzhiList[0].imgBtn" onclick="commonUpload(commonUploadDefaultCallBack,'subcontractJianzhiList\\[0\\]\\.jzfileattach')"/> 
								<a  target="_blank" id="subcontractJianzhiList[0].jzfileattach_href">未上传</a>
			  <label class="Validform_label" style="display: none;">文件</label>
			</td>
			<td align="right">
			</td>
			<td class="value">
			</td>
   		</tr>
	</c:if>
	<c:if test="${fn:length(subcontractJianzhiList)  > 0 }">
		<c:forEach items="${subcontractJianzhiList}" var="poVal" varStatus="stuts">
			<tr>
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
				<td align="right" width="25%">
					<input style="width:20px;"  type="checkbox" name="ck"/>
					<label class="Validform_label">监制报告号:</label>
				</td>
				<td class="value" width="25%">
					<input name="subcontractJianzhiList[${stuts.index }].jzbgh" maxlength="32" type="text" class="inputxt"  style="width:150px;"  ignore="ignore"  value="${poVal.jzbgh }"/>
					<span class="Validform_checktip"></span>
					<label class="Validform_label" style="display: none;">监制报告号</label>
				</td>
				<td align="right" width="25%">
					<label class="Validform_label">监制单位:</label>
				</td>
				<td class="value" width="25%">
			     	<input name="subcontractJianzhiList[${stuts.index }].jzdw" maxlength="200" type="text" class="inputxt"  style="width:150px;"  ignore="ignore"  value="${poVal.jzdw }"/>
					<span class="Validform_checktip"></span>
					<label class="Validform_label" style="display: none;">监制单位</label>
				</td>
			</tr>
			<tr>
				<td align="right">
					<label class="Validform_label">监制数量:</label>
				</td>
				<td class="value">
					<input name="subcontractJianzhiList[${stuts.index }].jzsl" maxlength="32" type="text" class="inputxt"  style="width:150px;"  ignore="ignore"  value="${poVal.jzsl }"/>
					<span class="Validform_checktip"></span>
					<label class="Validform_label" style="display: none;">监制数量</label>
				</td>
				<td align="right">
					<label class="Validform_label">监制时间:</label>
				</td>
				<td class="value">
			     	<input name="subcontractJianzhiList[${stuts.index }].jzsj" maxlength="32" type="text" class="inputxt"  style="width:150px;"  ignore="ignore"  value="${poVal.jzsj }"/>
					<span class="Validform_checktip"></span>
					<label class="Validform_label" style="display: none;">监制时间</label>
				</td>
			</tr>
			<tr>
				<td align="right">
					<label class="Validform_label">附件:</label>
				</td>
				<td class="value">
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
				<td align="right">
				</td>
				<td class="value">
				</td>
	   		</tr>
		</c:forEach>
	</c:if>	
	</tbody>
</table>
