<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>员工离职单</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<t:base type="bootstrap,bootstrap-table,layer,validform,bootstrap-form"></t:base>
</head>
 <body style="overflow:hidden;overflow-y:auto;">
 <div class="container" style="width:100%;">
	<div class="panel-heading"></div>
	<div class="panel-body">
	<form class="form-horizontal" role="form" id="formobj" action="jformEmployeeResignationController.do?doUpdate" method="POST">
		<input type="hidden" id="btn_sub" class="btn_sub"/>
		<input type="hidden" id="id" name="id" value="${jformEmployeeResignation.id}"/>
		<div class="row">
		<div class="bt-item col-md-6 col-sm-6">
			<div class="row">
				<div class="col-md-3 col-sm-3 col-xs-3 bt-label">
					姓名：
				</div>
				<div class="col-md-9 col-sm-9 col-xs-9 bt-content">
					<input name="name" type="text" class="form-control" maxlength="32" value = "${jformEmployeeResignation.name}"  ignore="ignore"  />
				</div>
			</div>
		</div>
		<div class="bt-item col-md-6 col-sm-6">
			<div class="row">
				<div class="col-md-3 col-sm-3 col-xs-3 bt-label">
					员工编号：
				</div>
				<div class="col-md-9 col-sm-9 col-xs-9 bt-content">
					<input name="code" type="text" class="form-control" maxlength="32" value = "${jformEmployeeResignation.code}"  ignore="ignore"  />
				</div>
			</div>
		</div>
		<div class="bt-item col-md-6 col-sm-6">
			<div class="row">
				<div class="col-md-3 col-sm-3 col-xs-3 bt-label">
					职务：
				</div>
				<div class="col-md-9 col-sm-9 col-xs-9 bt-content">
					<input name="job" type="text" class="form-control" maxlength="32" value = "${jformEmployeeResignation.job}"  ignore="ignore"  />
				</div>
			</div>
		</div>
		<div class="bt-item col-md-6 col-sm-6">
			<div class="row">
				<div class="col-md-3 col-sm-3 col-xs-3 bt-label">
					入职时间：
				</div>
				<div class="col-md-9 col-sm-9 col-xs-9 bt-content">
					<input name="joinTime" type="text" class="form-control input-sm laydate-datetime" value="<fmt:formatDate pattern='yyyy-MM-dd HH:mm:ss' type='both' value='${jformEmployeeResignation.joinTime}'/>"  ignore="ignore"  />
				</div>
			</div>
		</div>
		<div class="bt-item col-md-6 col-sm-6">
			<div class="row">
				<div class="col-md-3 col-sm-3 col-xs-3 bt-label">
					离职方式：
				</div>
				<div class="col-md-9 col-sm-9 col-xs-9 bt-content">
	            	<div style="padding-top:5px">
	            	<t:dictSelect field="outType" defaultVal = "${jformEmployeeResignation.outType}" extendJson="{class:'i-checks'}" type="radio" hasLabel="false"  title="离职方式"  typeGroupCode="outType" ></t:dictSelect>
	            	</div>
				</div>
			</div>
		</div>
		<div class="bt-item col-md-6 col-sm-6">
			<div class="row">
				<div class="col-md-3 col-sm-3 col-xs-3 bt-label">
					申请离职日期：
				</div>
				<div class="col-md-9 col-sm-9 col-xs-9 bt-content">
					<input name="applyOutTime" type="text" class="form-control input-sm laydate-datetime" value="<fmt:formatDate pattern='yyyy-MM-dd HH:mm:ss' type='both' value='${jformEmployeeResignation.applyOutTime}'/>"  ignore="ignore"  />
				</div>
			</div>
		</div>
		<div class="bt-item col-md-6 col-sm-6">
			<div class="row">
				<div class="col-md-3 col-sm-3 col-xs-3 bt-label">
					正式离职日期：
				</div>
				<div class="col-md-9 col-sm-9 col-xs-9 bt-content">
					<input name="outTime" type="text" class="form-control input-sm laydate-datetime" value="<fmt:formatDate pattern='yyyy-MM-dd HH:mm:ss' type='both' value='${jformEmployeeResignation.outTime}'/>"  ignore="ignore"  />
				</div>
			</div>
		</div>
		<div class="bt-item col-md-6 col-sm-6">
			<div class="row">
				<div class="col-md-3 col-sm-3 col-xs-3 bt-label">
					身份证编号：
				</div>
				<div class="col-md-9 col-sm-9 col-xs-9 bt-content">
					<input name="idCard" type="text" class="form-control" maxlength="32" value = "${jformEmployeeResignation.idCard}"  ignore="ignore"  />
				</div>
			</div>
		</div>
		<div class="bt-item col-md-6 col-sm-6">
			<div class="row">
				<div class="col-md-3 col-sm-3 col-xs-3 bt-label">
					应发薪资：
				</div>
				<div class="col-md-9 col-sm-9 col-xs-9 bt-content">
					<input name="shouldSendSalary" type="text" class="form-control" maxlength="32" value = "${jformEmployeeResignation.shouldSendSalary}"  datatype="/^(-?\d+)(\.\d+)?$/"  ignore="ignore"  />
				</div>
			</div>
		</div>
		<div class="bt-item col-md-6 col-sm-6">
			<div class="row">
				<div class="col-md-3 col-sm-3 col-xs-3 bt-label">
					应扣薪资：
				</div>
				<div class="col-md-9 col-sm-9 col-xs-9 bt-content">
					<input name="shouldDeductPay" type="text" class="form-control" maxlength="32" value = "${jformEmployeeResignation.shouldDeductPay}"  datatype="/^(-?\d+)(\.\d+)?$/"  ignore="ignore"  />
				</div>
			</div>
		</div>
		<div class="bt-item col-md-6 col-sm-6">
			<div class="row">
				<div class="col-md-3 col-sm-3 col-xs-3 bt-label">
					实发薪资：
				</div>
				<div class="col-md-9 col-sm-9 col-xs-9 bt-content">
					<input name="pay" type="text" class="form-control" maxlength="32" value = "${jformEmployeeResignation.pay}"  datatype="/^(-?\d+)(\.\d+)?$/"  ignore="ignore"  />
				</div>
			</div>
		</div>
		<div class="bt-item col-md-6 col-sm-6">
			<div class="row">
				<div class="col-md-3 col-sm-3 col-xs-3 bt-label">
					领取日期：
				</div>
				<div class="col-md-9 col-sm-9 col-xs-9 bt-content">
					<input name="getTime" type="text" class="form-control input-sm laydate-datetime" value="<fmt:formatDate pattern='yyyy-MM-dd HH:mm:ss' type='both' value='${jformEmployeeResignation.getTime}'/>"  ignore="ignore"  />
				</div>
			</div>
		</div>
					<div class="bt-item col-md-6 col-sm-6">
			        <div class="row">
						<div class="col-md-3 col-sm-3 col-xs-3 bt-label">
							离职须知：
						</div>
				     <div class="col-md-9 col-sm-9 col-xs-9 bt-content">
						  	 	<textarea name="outContent" class="form-control input-sm" rows="6"  ignore="ignore" >${jformEmployeeResignation.outContent}</textarea>
						<span class="Validform_checktip" style="float:left;height:0px;"></span>
						<label class="Validform_label" style="display: none">离职须知</label>
			          </div>
						</div>
					<div class="bt-item col-md-6 col-sm-6">
			        <div class="row">
						<div class="col-md-3 col-sm-3 col-xs-3 bt-label">
							离职原因：
						</div>
				     <div class="col-md-9 col-sm-9 col-xs-9 bt-content">
						  	 	<textarea name="outReason" class="form-control input-sm" rows="6"  ignore="ignore" >${jformEmployeeResignation.outReason}</textarea>
						<span class="Validform_checktip" style="float:left;height:0px;"></span>
						<label class="Validform_label" style="display: none">离职原因</label>
			          </div>
						</div>
					<div class="bt-item col-md-6 col-sm-6">
			        <div class="row">
						<div class="col-md-3 col-sm-3 col-xs-3 bt-label">
							面谈记录：
						</div>
				     <div class="col-md-9 col-sm-9 col-xs-9 bt-content">
						  	 	<textarea name="interviewRecord" class="form-control input-sm" rows="6"  ignore="ignore" >${jformEmployeeResignation.interviewRecord}</textarea>
						<span class="Validform_checktip" style="float:left;height:0px;"></span>
						<label class="Validform_label" style="display: none">面谈记录</label>
			          </div>
						</div>
					<div class="bt-item col-md-6 col-sm-6">
			        <div class="row">
						<div class="col-md-3 col-sm-3 col-xs-3 bt-label">
							办公物品移交：
						</div>
				     <div class="col-md-9 col-sm-9 col-xs-9 bt-content">
						  	 	<textarea name="officeChange" class="form-control input-sm" rows="6"  ignore="ignore" >${jformEmployeeResignation.officeChange}</textarea>
						<span class="Validform_checktip" style="float:left;height:0px;"></span>
						<label class="Validform_label" style="display: none">办公物品移交</label>
			          </div>
						</div>
					<div class="bt-item col-md-6 col-sm-6">
			        <div class="row">
						<div class="col-md-3 col-sm-3 col-xs-3 bt-label">
							人力资源部审核：
						</div>
				     <div class="col-md-9 col-sm-9 col-xs-9 bt-content">
						  	 	<textarea name="hrCheck" class="form-control input-sm" rows="6"  ignore="ignore" >${jformEmployeeResignation.hrCheck}</textarea>
						<span class="Validform_checktip" style="float:left;height:0px;"></span>
						<label class="Validform_label" style="display: none">人力资源部审核</label>
			          </div>
						</div>
					<div class="bt-item col-md-6 col-sm-6">
			        <div class="row">
						<div class="col-md-3 col-sm-3 col-xs-3 bt-label">
							总经理审批：
						</div>
				     <div class="col-md-9 col-sm-9 col-xs-9 bt-content">
						  	 	<textarea name="bossCheck" class="form-control input-sm" rows="6"  ignore="ignore" >${jformEmployeeResignation.bossCheck}</textarea>
						<span class="Validform_checktip" style="float:left;height:0px;"></span>
						<label class="Validform_label" style="display: none">总经理审批</label>
			          </div>
						</div>
					<div class="bt-item col-md-6 col-sm-6">
			        <div class="row">
						<div class="col-md-3 col-sm-3 col-xs-3 bt-label">
							说明：
						</div>
				     <div class="col-md-9 col-sm-9 col-xs-9 bt-content">
						  	 	<textarea name="description" class="form-control input-sm" rows="6"  ignore="ignore" >${jformEmployeeResignation.description}</textarea>
						<span class="Validform_checktip" style="float:left;height:0px;"></span>
						<label class="Validform_label" style="display: none">说明</label>
			          </div>
						</div>
		</div>
	</form>
	</div>
 </div>
<script type="text/javascript">
var subDlgIndex = '';
$(document).ready(function() {
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
});
</script>
</body>
</html>