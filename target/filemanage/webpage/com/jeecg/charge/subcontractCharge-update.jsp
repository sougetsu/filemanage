<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>挂账记录表</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<t:base type="bootstrap,bootstrap-table,layer,validform,bootstrap-form"></t:base>
</head>
 <body style="overflow:hidden;overflow-y:auto;">
 <div class="container" style="width:100%;">
	<div class="panel-heading"></div>
	<div class="panel-body">
	<form class="form-horizontal" role="form" id="formobj" action="subcontractChargeController.do?doUpdate" method="POST">
		<input type="hidden" id="btn_sub" class="btn_sub"/>
		<input type="hidden" id="id" name="id" value="${subcontractCharge.id}"/>
	<div class="form-group">
		<label for="payCompany" class="col-sm-3 control-label">付款单位：</label>
		<div class="col-sm-7">
			<div class="input-group" style="width:100%">
				<input id="payCompany" name="payCompany" value='${subcontractCharge.payCompany}' type="text" maxlength="100" class="form-control input-sm" placeholder="请输入付款单位"  ignore="ignore" />
			</div>
		</div>
	</div>
	<div class="form-group">
		<label for="collectionCompany" class="col-sm-3 control-label">收款单位：</label>
		<div class="col-sm-7">
			<div class="input-group" style="width:100%">
				<input id="collectionCompany" name="collectionCompany" value='${subcontractCharge.collectionCompany}' type="text" maxlength="32" class="form-control input-sm" placeholder="请输入收款单位"  ignore="ignore" />
			</div>
		</div>
	</div>
	<div class="form-group">
		<label for="payReason" class="col-sm-3 control-label">付款事项：</label>
		<div class="col-sm-7">
			<div class="input-group" style="width:100%">
				<input id="payReason" name="payReason" value='${subcontractCharge.payReason}' type="text" maxlength="32" class="form-control input-sm" placeholder="请输入付款事项"  ignore="ignore" />
			</div>
		</div>
	</div>
	<div class="form-group">
		<label for="payCount" class="col-sm-3 control-label">付款金额：</label>
		<div class="col-sm-7">
			<div class="input-group" style="width:100%">
				<input id="payCount" name="payCount" value='${subcontractCharge.payCount}' type="text" maxlength="32" class="form-control input-sm" placeholder="请输入付款金额"  datatype="/^(-?\d+)(\.\d+)?$/"  ignore="ignore" />
			</div>
		</div>
	</div>
	<div class="form-group">
		<label for="payDate" class="col-sm-3 control-label">付款日期：</label>
		<div class="col-sm-7">
			<div class="input-group" style="width:100%">
      		    <input id="payDate" name="payDate" type="text" class="form-control input-sm laydate-date" placeholder="请输入付款日期"  ignore="ignore"  value="<fmt:formatDate pattern='yyyy-MM-dd' type='date' value='${subcontractCharge.payDate}'/>" />
                <span class="input-group-addon" ><span class="glyphicon glyphicon-calendar"></span></span>
			</div>
		</div>
	</div>
	<div class="form-group">
		<label for="kth" class="col-sm-3 control-label">课题号：</label>
		<div class="col-sm-7">
			<div class="input-group" style="width:100%">
				<input id="kth" name="kth" value='${subcontractCharge.kth}' type="text" maxlength="32" class="form-control input-sm" placeholder="请输入课题号"  ignore="ignore" />
			</div>
		</div>
	</div>
	<div class="form-group">
		<label for="payType" class="col-sm-3 control-label">支付方式：</label>
		<div class="col-sm-7">
			<div class="input-group" style="width:100%">
				<input id="payType" name="payType" value='${subcontractCharge.payType}' type="text" maxlength="32" class="form-control input-sm" placeholder="请输入支付方式"  ignore="ignore" />
			</div>
		</div>
	</div>
	<div class="form-group">
		<label for="remark" class="col-sm-3 control-label">备注：</label>
		<div class="col-sm-7">
			<div class="input-group" style="width:100%">
				<input id="remark" name="remark" value='${subcontractCharge.remark}' type="text" maxlength="500" class="form-control input-sm" placeholder="请输入备注"  ignore="ignore" />
			</div>
		</div>
	</div>
	</form>
	</div>
 </div>
<script type="text/javascript">
var subDlgIndex = '';
$(document).ready(function() {
	$(".laydate-datetime").each(function(){
		var _this = this;
		laydate.render({
		  elem: _this,
		  format: 'yyyy-MM-dd HH:mm:ss',
		  type: 'datetime',
		  ready: function(date){
		  	 $(_this).val(DateJsonFormat(date,this.format));
		  }
		});
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
});
</script>
</body>
</html>