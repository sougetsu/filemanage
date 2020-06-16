<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>模块产品外包</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<t:base type="bootstrap,bootstrap-table,layer,validform,webuploader,bootstrap-form"></t:base>
<link href="plug-in/select2/css/select2.css" rel="stylesheet">
<script type="text/javascript" src="plug-in/select2/js/select2.js"></script>
<script src="plug-in/hplus/plugins/suggest/bootstrap-suggest.min.js"></script>
</head>
 <body style="overflow:hidden;overflow-y:auto;">
 <div class="container" style="width:100%;">
	<div class="panel-heading"></div>
	<div class="panel-body">
	<form class="form-horizontal" role="form" id="formobj" action="modulesubcontractApplyController.do?doConfirm" method="POST">
		<input type="hidden" id="btn_sub" class="btn_sub"/>
		<input type="hidden" id="id" name="id" value="${modulesubcontractApply.id}"/>
		<input type="hidden" id="confrimStatus" name="confrimStatus"/>
		<div class="row">
		<div class="bt-item col-md-12 col-sm-12">
			<div class="row">
	         	<a href="${pageContext.request.contextPath}/modulesubcontractApplyController/exportWord.do?id=${modulesubcontractApply.id}" class="btn btn-info btn-sm">
	         	<span class="glyphicon glyphicon-cloud-upload" aria-hidden="true">
	         	</span>导出Word</a> 
			</div>
		</div>
		<div class="bt-item col-md-12 col-sm-12">
			<div class="row" style="text-align:center">
				<h3>
					<span >模块产品外包项目申请单</span>
				</h3>
			</div>
		</div>
		<div class="bt-item col-md-6 col-sm-6">
			<div class="row">
				<div class="col-md-4 col-sm-4 col-xs-4 bt-label">
					产品名称：
				</div>
				<div class="col-md-8 col-sm-8 col-xs-8 bt-content">
					<input name="cpmc" type="text" class="form-control input-sm" maxlength="32" value = "${modulesubcontractApply.cpmc}" datatype="*" ignore="check"  />
				</div>
			</div>
		</div>
		<div class="bt-item col-md-6 col-sm-6">
			<div class="row">
				<div class="col-md-4 col-sm-4 col-xs-4 bt-label">
					申请部门：
				</div>
				<div class="col-md-8 col-sm-8 col-xs-8 bt-content">
	            	<t:dictSelect field="sqbm" type="select" hasLabel="false" title="申请部门" defaultVal = "${modulesubcontractApply.sqbm}" extendJson="{class:'form-control input-sm'}"   dictTable="t_s_depart" dictField="id" dictText="departname" ></t:dictSelect>
				</div>
			</div>
		</div>
		<div class="bt-item col-md-12 col-sm-12">
        	<div class="row">
        		<div class="col-md-2 col-sm-2 col-xs-2 bt-label">
					计划申请单：
				</div>
				<div class="col-md-6 col-sm-6 col-xs-6 bt-content">
		            <div class="input-group">
		                <input type="text" name="planno" class="form-control" id="planno" value="${modulesubcontractApply.planno}">
		                <div class="input-group-btn">
		                    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
		                        <span class="caret"></span>
		                    </button>
		                    <ul class="dropdown-menu dropdown-menu-right" role="menu">
		                    </ul>
		                </div>
		            </div>
	            </div>
	            <div class="col-md-4 col-sm-4 col-xs-4" style="vertical-align: middle;padding:6px" id="ordertips">
	            </div>
            </div>
        </div>
		<div class="bt-item col-md-6 col-sm-6">
			<div class="row">
				<div class="col-md-4 col-sm-4 col-xs-4 bt-label">
					产品代号：
				</div>
				<div class="col-md-8 col-sm-8 col-xs-8 bt-content">
					<input name="cpdh" type="text" class="form-control input-sm" maxlength="32"  value = "${modulesubcontractApply.cpdh}" ignore="ignore"  />
				</div>
			</div>
		</div>
		<div class="bt-item col-md-6 col-sm-6">
			<div class="row">
				<div class="col-md-4 col-sm-4 col-xs-4 bt-label">
					课题号：
				</div>
				<div class="col-md-8 col-sm-8 col-xs-8 bt-content">
					<input name="kth" type="text" class="form-control input-sm" maxlength="32" value = "${modulesubcontractApply.kth}" ignore="ignore"  />
				</div>
			</div>
		</div>
		<div class="bt-item col-md-6 col-sm-6">
			<div class="row">
				<div class="col-md-4 col-sm-4 col-xs-4 bt-label">
					申请人：
				</div>
				<div class="col-md-8 col-sm-8 col-xs-8 bt-content">
					<input name="sqr" type="text" class="form-control input-sm" maxlength="32" value = "${modulesubcontractApply.sqr}" ignore="ignore"  />
				</div>
			</div>
		</div>
		<div class="bt-item col-md-6 col-sm-6">
			<div class="row">
				<div class="col-md-4 col-sm-4 col-xs-4 bt-label">
					要求完成时间：
				</div>
				<div class="col-md-8 col-sm-8 col-xs-8 bt-content">
					<input name="yqwcsj" type="text" class="form-control input-sm laydate-date" value = "<fmt:formatDate value='${modulesubcontractApply.yqwcsj}' pattern='yyyy-MM-dd'/>" ignore="ignore"  />
				</div>
			</div>
		</div>
		
		<div class="bt-item col-md-12 col-sm-12">
			<div class="row">
				<div class="col-md-2 col-sm-2 col-xs-2 bt-label">
					外包项目：
				</div>
				<div class="col-md-10 col-sm-10 col-xs-10 bt-content">
					<input type="checkbox" id="checkbox1" style="vertical-align:middle;width:30px" name="wbxm" value="设计服务" ${fn:contains(modulesubcontractApply.wbxm, '设计服务')? 'checked' : ''} ><label style="vertical-align:middle;display:inline-block;font-size:12px;" for="checkbox1">设计服务</label>
					<input type="checkbox" id="checkbox2" style="vertical-align:middle;width:30px" name="wbxm" value="印制板加工" ${fn:contains(modulesubcontractApply.wbxm, '印制板加工')? 'checked' : ''} ><label style="vertical-align:middle;display:inline-block;font-size:12px;" for="checkbox2">印制板加工</label>
					<input type="checkbox" id="checkbox3" style="vertical-align:middle;width:30px" name="wbxm" value="零件加工" ${fn:contains(modulesubcontractApply.wbxm, '零件加工')? 'checked' : ''} ><label style="vertical-align:middle;display:inline-block;font-size:12px;" for="checkbox3">零件加工</label>
					<input type="checkbox" id="checkbox4" style="vertical-align:middle;width:30px" name="wbxm" value="电子装联" ${fn:contains(modulesubcontractApply.wbxm, '电子装联')? 'checked' : ''} ><label style="vertical-align:middle;display:inline-block;font-size:12px;" for="checkbox4">电子装联</label>
					<input type="checkbox" id="checkbox5" style="vertical-align:middle;width:30px" name="wbxm" value="试验 " ${fn:contains(modulesubcontractApply.wbxm, '试验')? 'checked' : ''}><label style="vertical-align:middle;display:inline-block;font-size:12px;" for="checkbox5">试验 </label>
					<input type="checkbox" id="checkbox6" style="vertical-align:middle;width:30px" name="wbxm" value="软件测评" ${fn:contains(modulesubcontractApply.wbxm, '软件测评')? 'checked' : ''}><label style="vertical-align:middle;display:inline-block;font-size:12px;" for="checkbox6">软件测评</label>
					<input type="checkbox" id="checkbox7" style="vertical-align:middle;width:30px" name="wbxm" value="其他" ${fn:contains(modulesubcontractApply.wbxm, '其他')? 'checked' : ''} onclick="setQtDetailRow(this.checked)"><label style="vertical-align:middle;display:inline-block;font-size:12px;" for="checkbox7">其他</label>
					<input  ${fn:contains(modulesubcontractApply.wbxm, '其他')? '' : 'style="display:none"'} id="wbxmqt_update" name="wbxmqt" type="text" class="input-sm" maxlength="32" value = "${modulesubcontractApply.wbxmqt}" ignore="ignore"  />
				</div>
			</div>
		</div>
		<div class="bt-item col-md-6 col-sm-6">
			<div class="row">
				<div class="col-md-4 col-sm-4 col-xs-4 bt-label">
					数量：
				</div>
				<div class="col-md-8 col-sm-8 col-xs-8 bt-content">
					<input name="sl" type="text" class="form-control input-sm" maxlength="32" value = "${modulesubcontractApply.sl}" ignore="ignore"  />
				</div>
			</div>
		</div>
		<div class="bt-item col-md-6 col-sm-6">
			<div class="row">
				<div class="col-md-4 col-sm-4 col-xs-4 bt-label">
					外包加工类型：
				</div>
				<div class="col-md-8 col-sm-8 col-xs-8 bt-content">
	            	<t:dictSelect id="moduleadd_jglx" field="wxjglx" type="select" hasLabel="false" title="外协加工类型" extendJson="{class:'form-control input-sm'}" defaultVal = "${modulesubcontractApply.wxjglx}" typeGroupCode="jglx" ></t:dictSelect>
				</div>
			</div>
		</div>
		<div class="bt-item col-md-6 col-sm-6">
			<div class="row">
				<div class="col-md-4 col-sm-4 col-xs-4 bt-label">
					外包供应商：
				</div>
				<div class="col-md-8 col-sm-8 col-xs-8 bt-content">
	            	<t:dictSelect id="moduleadd_wbgys" field="wbgys" type="select" hasLabel="false" title="外包供应商" defaultVal = "${modulesubcontractApply.wbgys}"   extendJson="{class:'form-control input-sm select2',style='width:100%'}"  dictTable="subcontract_supplier_module" dictField="dwmc" dictText="dwmc" ></t:dictSelect>
				</div>
			</div>
		</div>
		<div class="bt-item col-md-6 col-sm-6">
			<div class="row">
				<div class="col-md-4 col-sm-4 col-xs-4 bt-label">
					联系人：
				</div>
				<div class="col-md-8 col-sm-8 col-xs-8 bt-content">
					<input name="lxr" type="text" class="form-control input-sm" maxlength="32" value = "${modulesubcontractApply.lxr}" ignore="ignore"  />
				</div>
			</div>
		</div>
		<div class="bt-item col-md-6 col-sm-6">
			<div class="row">
				<div class="col-md-4 col-sm-4 col-xs-4 bt-label">
					电话：
				</div>
				<div class="col-md-8 col-sm-8 col-xs-8 bt-content">
					<input name="dh" type="text" class="form-control input-sm" maxlength="32" value = "${modulesubcontractApply.dh}" ignore="ignore"  />
				</div>
			</div>
		</div>
		<div class="bt-item col-md-6 col-sm-6">
			<div class="row">
				<div class="col-md-4 col-sm-4 col-xs-4 bt-label">
					预计金额：
				</div>
				<div class="col-md-8 col-sm-8 col-xs-8 bt-content">
					<input name="yjje" type="text" class="form-control input-sm" maxlength="32" value = "${modulesubcontractApply.yjje}" ignore="ignore"  />
				</div>
			</div>
		</div>
		<div class="bt-item col-md-6 col-sm-6">
			<div class="row">
				<div class="col-md-4 col-sm-4 col-xs-4 bt-label">
					是否含有特殊过程：
				</div>
				<div class="col-md-8 col-sm-8 col-xs-8 bt-content">
					<input type="radio" id="checkboxSpeY" style="vertical-align:middle;width:30px" name="specialflag" value="1" ${modulesubcontractApply.specialflag == 1 ? 'checked' : ''} ><label style="vertical-align:middle;display:inline-block;font-size:12px;" for="checkboxSpeY">是</label>
					<input type="radio" id="checkboxSpeN" style="vertical-align:middle;width:30px" name="specialflag" value="0" ${modulesubcontractApply.specialflag == 0 ? 'checked' : ''} ><label style="vertical-align:middle;display:inline-block;font-size:12px;" for="checkboxSpeN">否</label>
				</div>
			</div>
		</div>
		<div class="bt-item col-md-6 col-sm-6">
			<div class="row">
				<div class="col-md-4 col-sm-4 col-xs-4 bt-label">
					是否含有关键（重）件：
				</div>
				<div class="col-md-8 col-sm-8 col-xs-8 bt-content">
					<input type="radio" id="checkboxImpY" style="vertical-align:middle;width:30px" name="importantflag" value="1" ${modulesubcontractApply.importantflag == 1 ? 'checked' : ''}><label style="vertical-align:middle;display:inline-block;font-size:12px;" for="checkboxImpY">是，附清单</label>
					<input type="radio" id="checkboxImpN" style="vertical-align:middle;width:30px" name="importantflag" value="0" ${modulesubcontractApply.importantflag == 0 ? 'checked' : ''}><label style="vertical-align:middle;display:inline-block;font-size:12px;" for="checkboxImpN">否</label>
				</div>
			</div>
		</div>
		<div class="bt-item col-md-12 col-sm-12">
			<div class="col-md-2 col-sm-2 col-xs-2 bt-label">
				附件：
			</div>
			<div class="col-md-10 col-sm-10 col-xs-10 bt-content">
			<span style="color:#F00">注：当预估金额大于10万元时，请务必上传附件<a href="export/template/附件10商务谈判记录（公开）.docx">商务谈判记录（模板）</a>、<a href="export/template/附件12单一来源采购申请表（公开）.docx">单一来源采购申请表（模板）</a></span>
			<t:webUploader name="attach" outJs="true" auto="true" showImgDiv="filediv_attach" pathValues="${modulesubcontractApply.attach}"></t:webUploader>
			<div class="form" id="filediv_attach"></div>
			</div>
		</div>
		<div class="bt-item col-md-12 col-sm-12">
			<div class="row">
				<div class="col-md-2 col-sm-2 col-xs-2 bt-label">
					提供的技术文件列表：
				</div>
				<div class="col-md-10 col-sm-10 col-xs-10 bt-content">
					<input type="checkbox" id="checkbox8" style="vertical-align:middle;width:30px" name="jswjlb" value="任务书"  ${fn:contains(modulesubcontractApply.jswjlb, '任务书')? 'checked' : ''}  > <label style="vertical-align:middle;display:inline-block;font-size:12px;" for="checkbox8">任务书</label>
					<input type="checkbox" id="checkbox9" style="vertical-align:middle;width:30px" name="jswjlb" value="设计图纸" ${fn:contains(modulesubcontractApply.jswjlb, '设计图纸')? 'checked' : ''} ><label style="vertical-align:middle;display:inline-block;font-size:12px;" for="checkbox9">设计图纸</label>
					<input type="checkbox" id="checkbox10" style="vertical-align:middle;width:30px" name="jswjlb" value="设计报告" ${fn:contains(modulesubcontractApply.jswjlb, '设计报告')? 'checked' : ''} ><label style="vertical-align:middle;display:inline-block;font-size:12px;" for="checkbox10">设计报告</label>
					<input type="checkbox" id="checkbox11" style="vertical-align:middle;width:30px" name="jswjlb" value="技术协议" ${fn:contains(modulesubcontractApply.jswjlb, '技术协议')? 'checked' : ''} ><label style="vertical-align:middle;display:inline-block;font-size:12px;" for="checkbox11">技术协议</label>
					<input type="checkbox" id="checkbox12" style="vertical-align:middle;width:30px" name="jswjlb" value="PCB文件 " ${fn:contains(modulesubcontractApply.jswjlb, 'PCB文件')? 'checked' : ''} ><label style="vertical-align:middle;display:inline-block;font-size:12px;" for="checkbox12">PCB文件 </label>
					<input type="checkbox" id="checkbox13" style="vertical-align:middle;width:30px" name="jswjlb" value="试验大纲" ${fn:contains(modulesubcontractApply.jswjlb, '试验大纲')? 'checked' : ''} ><label style="vertical-align:middle;display:inline-block;font-size:12px;" for="checkbox13">试验大纲</label>
					<input type="checkbox" id="checkbox14" style="vertical-align:middle;width:30px" name="jswjlb" value="验收大纲" ${fn:contains(modulesubcontractApply.jswjlb, '验收大纲')? 'checked' : ''} ><label style="vertical-align:middle;display:inline-block;font-size:12px;" for="checkbox14">验收大纲</label>
					<input type="checkbox" id="checkbox15" style="vertical-align:middle;width:30px" name="jswjlb" value="其他" ${fn:contains(modulesubcontractApply.jswjlb, '其他')? 'checked' : ''} onclick="setlbQtDetailRow(this.checked)" ><label style="vertical-align:middle;display:inline-block;font-size:12px;" for="checkbox15">其他</label>
					<input ${fn:contains(modulesubcontractApply.jswjlb, '其他')? '' : 'style="display:none"'} id="jswjlbqt_update" name="jswjlbqt" type="text" class="input-sm" maxlength="32" value = "${modulesubcontractApply.jswjlbqt}" ignore="ignore"  />
				</div>
			</div>
		</div>
		
		<div class="bt-item col-md-12 col-sm-12">
			<div class="row">
				<div class="col-md-2 col-sm-2 col-xs-2 bt-label">
					具体外包要求：
				</div>
				<div class="col-md-10 col-sm-10 col-xs-10 bt-content">
					<textarea name="jtwbyq"  class="form-control input-sm" rows="3">${modulesubcontractApply.jtwbyq}</textarea>
				</div>
			</div>
		</div>
		<div class="bt-item col-md-12 col-sm-12">
			<div class="row">
				<div class="col-md-2 col-sm-2 col-xs-2 bt-label">
					部门负责人意见：
				</div>
				<div class="col-md-10 col-sm-10 col-xs-10 bt-content">
					<input name="bmfzryj" type="text" class="form-control input-sm" maxlength="32" value = "${modulesubcontractApply.bmfzryj}" ignore="ignore"  />
				</div>
			</div>
		</div>
		<div ${feeFlag==1? '':'style="display:none"'}  class="bt-item col-md-6 col-sm-6">
			<div class="row">
				<div class="col-md-4 col-sm-4 col-xs-4 bt-label">
					部门负责人审批时间：
				</div>
				<div class="col-md-8 col-sm-8 col-xs-8 bt-content">
					<input name="bmshsj" type="text" class="form-control input-sm laydate-date" value = "<fmt:formatDate value='${modulesubcontractApply.bmshsj}' pattern='yyyy-MM-dd' />" ignore="ignore"  />
				</div>
			</div>
		</div>
		<div class="bt-item col-md-12 col-sm-12">
			<div class="row">
				<div class="col-md-2 col-sm-2 col-xs-2 bt-label">
					部门主管领导意见：
				</div>
				<div class="col-md-10 col-sm-10 col-xs-10 bt-content">
					<input name="bmzgldyj" type="text" class="form-control input-sm" maxlength="32" value = "${modulesubcontractApply.bmzgldyj}" ignore="ignore"  />
				</div>
			</div>
		</div>
		<div ${feeFlag==1? '':'style="display:none"'}  class="bt-item col-md-6 col-sm-6">
			<div class="row">
				<div class="col-md-4 col-sm-4 col-xs-4 bt-label">
					部门主管领导审批时间：
				</div>
				<div class="col-md-8 col-sm-8 col-xs-8 bt-content">
					<input name="bmzgshsj" type="text" class="form-control input-sm laydate-date" value = "<fmt:formatDate value='${modulesubcontractApply.bmzgshsj}' pattern='yyyy-MM-dd' />" ignore="ignore"  />
				</div>
			</div>
		</div>
		<div class="bt-item col-md-12 col-sm-12">
			<div class="row">
				<div class="col-md-2 col-sm-2 col-xs-2 bt-label">
					公司领导审批意见：
				</div>
				<div class="col-md-10 col-sm-10 col-xs-10 bt-content">
					<input name="gsldspyj" type="text" class="form-control input-sm" maxlength="32" value = "${modulesubcontractApply.gsldspyj}" ignore="ignore"  />
				</div>
			</div>
		</div>
		<div ${feeFlag==1? '':'style="display:none"'}  class="bt-item col-md-6 col-sm-6">
			<div class="row">
				<div class="col-md-4 col-sm-4 col-xs-4 bt-label">
					公司领导审批时间：
				</div>
				<div class="col-md-8 col-sm-8 col-xs-8 bt-content">
					<input name="gsldshsj" type="text" class="form-control input-sm laydate-date" value = "<fmt:formatDate value='${modulesubcontractApply.gsldshsj}' pattern='yyyy-MM-dd' />" ignore="ignore"  />
				</div>
			</div>
		</div>
		<div ${feeFlag==1? '':'style="display:none"'}  class="bt-item col-md-6 col-sm-6">
			<div class="row">
				<div class="col-md-4 col-sm-4 col-xs-4 bt-label">
					实际金额：
				</div>
				<div class="col-md-8 col-sm-8 col-xs-8 bt-content">
					<input name="cost" type="text" class="form-control input-sm" maxlength="32" value = "${modulesubcontractApply.cost}" ignore="ignore"  />
				</div>
			</div>
		</div>
		</div>
	</form>
	</div>
 </div>
<script type="text/javascript">
var subDlgIndex = '';
$(document).ready(function() {
	$(".select2").select2();
	var testBsSuggest = $("#planno").bsSuggest({
        url: "subcontractPlanController/loadPlanData.do?keyword=",
        idField: "plan_no",
        keyField: "plan_no"
   }).on('onDataRequestSuccess', function (e, result) {
       console.log('onDataRequestSuccess: ', result);
   }).on('onSetSelectValue', function (e, keyword) {
   	var _this = this;		
		var planbh = $("#planno").val();
		$("#ordertips").html('');
		var option;
		$.ajax({
           type: "POST",
           url:'subcontractApplyController.do?getReOrderNum',
           data: {planno:planbh},
           dataType : 'json',
			success : function(data) {
				if (data.success) {
					var tipoption;
					if(data.obj>0){
						tipoption = "<span style='color:red'>该计划已提交加工申请"+data.obj+" 次,请在备注中说明复投原因</span>";
					}else{
						tipoption = "<span style='color:green'>该计划尚未提交加工申请</span>";
					}
					$("#ordertips").html(tipoption);
				}
			}
       });
   }).on('onUnsetSelectValue', function (e) {
       console.log("onUnsetSelectValue");
   });
	
	$(".laydate-date").each(function(){
		var _this = this;
		laydate.render({
		  elem: _this,
		  format: 'yyyy-MM-dd',
		  ready: function(date){
		  	 $(_this).val(DateJsonFormat(date,this.format));
		  }
		});
	});
	//单选框/多选框初始化
	$('.i-checks').iCheck({
		labelHover : false,
		cursor : true,
		checkboxClass : 'icheckbox_square-green',
		radioClass : 'iradio_square-green',
		increaseArea : '20%'
	});
	
	//表单提交
	$("#formobj").Validform({
		tiptype:function(msg,o,cssctl){
			if(o.type==3){
				validationMessage(o.obj,msg);
			}else{
				removeMessage(o.obj);
			}
		},
		btnSubmit : "#btn_sub",
		btnReset : "#btn_reset",
		ajaxPost : true,
		beforeSubmit : function(curform) {
		},
		usePlugin : {
			passwordstrength : {
				minLen : 6,
				maxLen : 18,
				trigger : function(obj, error) {
					if (error) {
						obj.parent().next().find(".Validform_checktip").show();
						obj.find(".passwordStrength").hide();
					} else {
						$(".passwordStrength").show();
						obj.parent().next().find(".Validform_checktip").hide();
					}
				}
			}
		},
		callback : function(data) {
			var win = frameElement.api.opener;
			if (data.success == true) {
				frameElement.api.close();
			    win.reloadTable();
			    win.tip(data.msg);
			} else {
			    if (data.responseText == '' || data.responseText == undefined) {
			        $.messager.alert('错误', data.msg);
			        $.Hidemsg();
			    } else {
			        try {
			            var emsg = data.responseText.substring(data.responseText.indexOf('错误描述'), data.responseText.indexOf('错误信息'));
			            $.messager.alert('错误', emsg);
			            $.Hidemsg();
			        } catch (ex) {
			            $.messager.alert('错误', data.responseText + "");
			            $.Hidemsg();
			        }
			    }
			    return false;
			}
		}
	});
	$("#moduleadd_jglx").change(function(){
		var jglx = $("#moduleadd_jglx").val();
		$("#moduleadd_wbgys").html('');
		var option;
		$.ajax({
            type: "POST",
            url:'subcontractSupplierModuleController.do?getSupplyInfo',
            data: {supplyType:jglx},
            dataType : 'json',
			success : function(data) {
				if (data.success) {
					 option +=  "<option value=''></option>";
					 $.each(data.obj, function(objIndex, obj){
						 option +=  "<option value='" +obj.dwmc+ "'>"+obj.dwmc+"</option>";
					 });
					 $("#moduleadd_wbgys").html(option);//将循环拼接的字符串插入第二个下拉列表
				}
			}
        });
		$("#moduleadd_wbgys").show();
	});	
	$("#moduleadd_wbgys").change(function(){
		var wxjgdw = $("#moduleadd_wbgys").val();
		if(wxjgdw==''){
			alert("请选择供应商");
			return;
		}
		$.ajax({
            type: "POST",
            url:'subcontractSupplierModuleController.do?getSupplyInfoByName',
            data: {supplyName:wxjgdw},
            dataType : 'json',
			success : function(data) {
				if (data.success) {
					$.each(data.obj, function(objIndex, obj){
						//联系人
						$('input[name="lxr"]').val(obj.lxr);
						//电话
						$('input[name="dh"]').val(obj.lxfs);
					 });
				}
			}
        });
		$("#plan_wxjgdw").show();
	});
});
function setQtDetailRow(checktype){
	var wbxmqtadd = document.getElementById("wbxmqt_update");
	wbxmqtadd.style.display = "none";
	if(checktype){
		wbxmqtadd.style.display = (document.all ? "block" : "table-row");
	}
}
function setlbQtDetailRow(checktype){
	var jswjlbqtadd = document.getElementById("jswjlbqt_update");
	jswjlbqtadd.style.display = "none";
	if(checktype){
		jswjlbqtadd.style.display = (document.all ? "block" : "table-row");
	}
}
</script>
</body>
</html>