<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<!DOCTYPE html>
<html>
 <head>
  <title>文件管理-文件下载</title>
   <t:base type="jquery,easyui,tools,DatePicker"></t:base>
  <script src="plug-in/easyui/extEasyUI.js"></script>
  <script type="text/javascript">
  </script>
  <script src="plug-in/easyui/extEasyUI.js"></script>
  <style>
  	.title_label {
  		height:28px;
		font-size: 16px;
		font-weight: bold;
		color: rgb(51, 51, 51);
		padding: 5px 20px;
		white-space:nowrap;
		vertical-align:middle;
		line-height:16px;
		text-align:right; 
	}
  </style>
 </head>
 <body>
  <t:formvalid formid="formobj" dialog="true" usePlugin="password" layout="table" action="">
		<input id="id" name="id" type="hidden" value="${testFilestorePage.id }"/>
		<table style="width: 100%;" cellpadding="0" cellspacing="1" class="formtable">
				
					<tr>
						<td align="right">
							<label class="Validform_label">
								监制报告号:
							</label>
						</td>
						<td class="value">
							<t:webUploader readOnly="true" auto="true" udfpath="${testFilestorePage.xh }/${testFilestorePage.pc}" pathValues="${testFilestorePage.jzbgh}" name="jzbgh" duplicate="true" fileNumLimit="5" datatype="*"></t:webUploader>
						</td>
						
					<t:hasPermission code="fzbhg">
						<td align="right">
							<label class="Validform_label">
								封装不合格情况:
							</label>
						</td>
						<td class="value">
							<t:webUploader readOnly="true" auto="true" udfpath="${testFilestorePage.xh }/${testFilestorePage.pc}"  pathValues="${testFilestorePage.fzbhgqk}" name="fzbhgqk" fileNumLimit="3"></t:webUploader>
							<span class="Validform_checktip Validform_right" style="display: none;">文件已上传</span>	
						</td>
					</t:hasPermission>
					</tr>
					<tr>
						<td align="right" height="38px">
							<label class="Validform_label">
								筛选报告号:
							</label>
						</td>
						<td class="value">
							<t:webUploader readOnly="true" auto="true" udfpath="${testFilestorePage.xh }/${testFilestorePage.pc}"  name="sxbgh"  pathValues="${testFilestorePage.sxbgh}" fileNumLimit="3"></t:webUploader>
							<span class="Validform_checktip Validform_right" style="display: none;">文件已上传</span>
						</td>
						
						<td align="right">
							<label class="Validform_label">
								筛选不合格情况:
							</label>
						</td>
						<td class="value">
							<t:webUploader readOnly="true" auto="true" udfpath="${testFilestorePage.xh }/${testFilestorePage.pc}"  name="sxbhgqk"  pathValues="${testFilestorePage.sxbhgqk}" fileNumLimit="3"></t:webUploader>
							<span class="Validform_checktip Validform_right" style="display: none;">文件已上传</span>
						</td>
					</tr>
					
					
				<tr>
					<td align="right" height="38px">
						<label class="Validform_label">
							3σ报告:
						</label>
					</td>
					<td class="value">
						<t:webUploader readOnly="true" auto="true" udfpath="${testFilestorePage.xh }/${testFilestorePage.pc}"  pathValues="${testFilestorePage.threebg}" name="threebg" fileNumLimit="3"></t:webUploader>
						<span class="Validform_checktip Validform_right" style="display: none;">文件已上传</span>
					</td>
					<t:hasPermission code="dcplzl">
						<td align="right">
							<label class="Validform_label">
								低成品率质量分析报告:
							</label>
						</td>
						<td class="value">
							<t:webUploader readOnly="true" auto="true" udfpath="${testFilestorePage.xh }/${testFilestorePage.pc}"  pathValues="${testFilestorePage.dcplzlfxbg}" name="dcplzlfxbg" fileNumLimit="3"></t:webUploader>
							<span class="Validform_checktip Validform_right" style="display: none;">文件已上传</span>
						</td>
					</t:hasPermission>
				</tr>
				
				<tr>
					
						<td align="right" height="38px">
							<label class="Validform_label">
								鉴定一致性检验报告编号:
							</label>
						</td>
						<td class="value">
						<t:webUploader readOnly="true" auto="true" udfpath="${testFilestorePage.xh }/${testFilestorePage.pc}"  pathValues="${testFilestorePage.jdbgbh}" name="jdbgbh" fileNumLimit="3"></t:webUploader>
						<span class="Validform_checktip Validform_right" style="display: none;">文件已上传</span>
						</td>
					
					<td align="right">
						<label class="Validform_label">
							首件鉴定报告:
						</label>
					</td>
					<td class="value">
						<t:webUploader readOnly="true" auto="true" udfpath="${testFilestorePage.xh }/${testFilestorePage.pc}"  pathValues="${testFilestorePage.sjjdbg}" name="sjjdbg" fileNumLimit="3"></t:webUploader>
						<span class="Validform_checktip Validform_right" style="display: none;">文件已上传</span>
					</td>
				</tr>
				<tr>
					<td align="right" height="38px">
						<label class="Validform_label">
							首件鉴定目录:
						</label>
					</td>
					<td class="value">
						<t:webUploader readOnly="true" auto="true" udfpath="${testFilestorePage.xh }/${testFilestorePage.pc}"  pathValues="${testFilestorePage.sjjdml}" name="sjjdml" fileNumLimit="3"></t:webUploader>
						<span class="Validform_checktip Validform_right" style="display: none;">文件已上传</span>
					</td>
					<td align="right">
						<label class="Validform_label">
							用户评审意见:
						</label>
					</td>
					<td class="value">
						<t:webUploader readOnly="true" auto="true" udfpath="${testFilestorePage.xh }/${testFilestorePage.pc}"  pathValues="${testFilestorePage.yhpsyj}" name="yhpsyj" fileNumLimit="3"></t:webUploader>
						<span class="Validform_checktip Validform_right" style="display: none;">文件已上传</span>
					</td>
				</tr>
				<tr>
					<td align="right" height="38px">
						<label class="Validform_label">
							质量评审:
						</label>
					</td>
					<td class="value">
						<t:webUploader readOnly="true" auto="true" udfpath="${testFilestorePage.xh }/${testFilestorePage.pc}"  pathValues="${testFilestorePage.zlps}" name="zlps" fileNumLimit="3"></t:webUploader>
						<span class="Validform_checktip Validform_right" style="display: none;">文件已上传</span>
					</td>
					<td align="right">
						<label class="Validform_label">
							ESD:
						</label>
					</td>
					<td class="value">
						<t:webUploader readOnly="true" auto="true" udfpath="${testFilestorePage.xh }/${testFilestorePage.pc}"  pathValues="${testFilestorePage.esd}" name="esd" fileNumLimit="3"></t:webUploader>
						<span class="Validform_checktip Validform_right" style="display: none;">文件已上传</span>
					</td>
				</tr>
				<tr>
					<td align="right" height="38px">
						<label class="Validform_label">
							抗闩锁:
						</label>
					</td>
					<td class="value">
						<t:webUploader readOnly="true" auto="true" udfpath="${testFilestorePage.xh }/${testFilestorePage.pc}"  pathValues="${testFilestorePage.kss}" name="kss" fileNumLimit="3"></t:webUploader>
						<span class="Validform_checktip Validform_right" style="display: none;">文件已上传</span>
					</td>
					<td align="right">
						<label class="Validform_label">
							总剂量:
						</label>
					</td>
					<td class="value">
						<t:webUploader readOnly="true" auto="true" udfpath="${testFilestorePage.xh }/${testFilestorePage.pc}"  pathValues="${testFilestorePage.zjl}" name="zjl" fileNumLimit="3"></t:webUploader>
						<span class="Validform_checktip Validform_right" style="display: none;">文件已上传</span>
					</td>
					</tr>
				<tr>
					<td align="right" height="38px">
						<label class="Validform_label">
							单粒子:
						</label>
					</td>
					<td class="value">
						<t:webUploader readOnly="true" auto="true" udfpath="${testFilestorePage.xh }/${testFilestorePage.pc}"  pathValues="${testFilestorePage.dlz}" name="dlz" fileNumLimit="3"></t:webUploader>
						<span class="Validform_checktip Validform_right" style="display: none;">文件已上传</span>
					</td>
					<td align="right">
						<label class="Validform_label">
							寿命后水汽:
						</label>
					</td>
					<td class="value">
						<t:webUploader readOnly="true" auto="true" udfpath="${testFilestorePage.xh }/${testFilestorePage.pc}"  pathValues="${testFilestorePage.smhsq}" name="smhsq" fileNumLimit="3"></t:webUploader>
						<span class="Validform_checktip Validform_right" style="display: none;">文件已上传</span>
					</td>
				</tr>
				<tr>
					<td align="right" height="38px">
						<label class="Validform_label">
							筛合水汽:
						</label>
					</td>
					<td colspan="3" class="value">
						<t:webUploader readOnly="true" auto="true" udfpath="${testFilestorePage.xh }/${testFilestorePage.pc}"  pathValues="${testFilestorePage.shsq}" name="shsq" fileNumLimit="3"></t:webUploader>
						<span class="Validform_checktip Validform_right" style="display: none;">文件已上传</span>
					</td>
				</tr>
				
				<tr>
					<td align="right" readOnly="true" height="38px">
						<label class="Validform_label">
							DPA报告号:
						</label>
					</td>
					<td colspan="3" class="value">
						<t:webUploader readOnly="true" auto="true" udfpath="${testFilestorePage.xh }/${testFilestorePage.pc}"  pathValues="${testFilestorePage.dpabgh}" name="dpabgh" fileNumLimit="3"></t:webUploader>
						<span class="Validform_checktip Validform_right" style="display: none;">文件已上传</span>
					</td>
					</tr>
					
				
					
				
					
					
					
				
				
					
				
				
				
				
			</table>
		</t:formvalid>
 </body>
 <t:authFilter />
<script type="text/javascript">
$(document).ready(function() {
	$("#fileupdate_jdfs").change(function(){
		var jdfs = $("#fileupdate_jdfs").val();
		if(jdfs=="SXHGPRK"){
			alert("true");
			$('input[name="jdbgbh"]').attr("datatype","*");
			$('input[name="jdqzsj"]').attr("datatype","*");
			$('input[name="sjjdbg"]').attr("datatype","*");
			$('input[name="sjjdml"]').attr("datatype","*");
		}else{
			alert("false");
			$('input[name="jdbgbh"]').removeAttr("datatype");
			$('input[name="jdqzsj"]').removeAttr("datatype");
			$('input[name="sjjdbg"]').removeAttr("datatype");
			$('input[name="sjjdml"]').removeAttr("datatype");
		}
	});
	$("#fileupdate_yph").combotree({
    	onSelect:function(node){
    		var cpxh = node.text; 
    		$.ajax({
                type: "POST",
                url:'fileRawMaterialController.do?getPcListByxh',
                data: {xh:cpxh,type:"wafer"},
                dataType : 'json',
    			success : function(data) {
    				if (data.success) {
    					$("#fileupdate_yppc").combotree({
                            data: data.obj,
                            valueField: 'id',
                            textField: 'text',
                        });
    				}
    			}
            });
    	}    
    });
	$("#fileupdate_wjxh").combotree({
    	onSelect:function(node){
    		var cpxh = node.text; 
    		$.ajax({
                type: "POST",
                url:'fileRawMaterialController.do?getPcListByxh',
                data: {xh:cpxh,type:"shell"},
                dataType : 'json',
    			success : function(data) {
    				if (data.success) {
    					$("#fileupdate_wkjypc").combotree({
                            data: data.obj,
                            valueField: 'id',
                            textField: 'text',
                        });
    				}
    			}
            });
    	}    
    });
});
</script>
