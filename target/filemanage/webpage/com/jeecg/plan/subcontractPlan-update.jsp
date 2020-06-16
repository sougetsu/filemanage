<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>外协计划表</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<t:base type="bootstrap,bootstrap-table,layer,validform,bootstrap-form"></t:base>
<link href="plug-in/select2/css/select2.css" rel="stylesheet">
<script type="text/javascript" src="plug-in/select2/js/select2.js"></script>
</head>
 <body style="overflow:hidden;overflow-y:auto;">
 <div class="container" style="width:100%;">
	<div class="panel-heading"></div>
	<div class="panel-body">
	<form class="form-horizontal" role="form" id="formobj" action="subcontractPlanController.do?doUpdate" method="POST">
		<input type="hidden" id="btn_sub" class="btn_sub"/>
		<input type="hidden" id="id" name="id" value="${subcontractPlan.id}"/>
	<div class="form-group">
		<label for="sysOrgCode" class="col-sm-3 control-label">所属部门：</label>
		<div class="col-sm-7">
			<div class="input-group" style="width:100%">
               <t:dictSelect field="sysOrgCode" type="list" extendJson="{class:'form-control input-sm select2',style='width:100%'}"   dictTable="t_s_depart" dictField="id" dictText="departname"  hasLabel="false"  title="所属部门" defaultVal="${subcontractPlan.sysOrgCode}"></t:dictSelect>
			</div>
		</div>
	</div>
	<div class="form-group">
		<label for="planDate" class="col-sm-3 control-label">计划投板时间：</label>
		<div class="col-sm-7">
			<div class="input-group" style="width:100%">
      		    <input id="planDate" name="planDate" type="text" class="form-control input-sm laydate-date" placeholder="请输入计划投板时间"  ignore="ignore"  value="<fmt:formatDate pattern='yyyy-MM-dd' type='date' value='${subcontractPlan.planDate}'/>" />
                <span class="input-group-addon" ><span class="glyphicon glyphicon-calendar"></span></span>
			</div>
		</div>
	</div>
	<div class="form-group">
		<label for="dlxh" class="col-sm-3 control-label">电路型号：</label>
		<div class="col-sm-7">
			<div class="input-group" style="width:100%">
				<input id="dlxh" name="dlxh" value='${subcontractPlan.dlxh}' type="text" maxlength="32" class="form-control input-sm" placeholder="请输入电路型号"  ignore="ignore" />
			</div>
		</div>
	</div>
	<div class="form-group">
		<label for="planNum" class="col-sm-3 control-label">计划投板数量：</label>
		<div class="col-sm-7">
			<div class="input-group" style="width:100%">
				<input id="planNum" name="planNum" value='${subcontractPlan.planNum}' type="text" maxlength="32" class="form-control input-sm" placeholder="请输入计划投板数量"  datatype="n"  ignore="ignore" />
			</div>
		</div>
	</div>
	<div class="form-group">
		<label for="pliesNum" class="col-sm-3 control-label">层数：</label>
		<div class="col-sm-7">
			<div class="input-group" style="width:100%">
				<input id="pliesNum" name="pliesNum" value='${subcontractPlan.pliesNum}' type="text" maxlength="32" class="form-control input-sm" placeholder="请输入层数"  ignore="ignore" />
			</div>
		</div>
	</div>
	<div class="form-group">
		<label for="size" class="col-sm-3 control-label">尺寸：</label>
		<div class="col-sm-7">
			<div class="input-group" style="width:100%">
				<input id="size" name="size" value='${subcontractPlan.size}' type="text" maxlength="32" class="form-control input-sm" placeholder="请输入尺寸"  ignore="ignore" />
			</div>
		</div>
	</div>
	<div class="form-group">
		<label for="supplier" class="col-sm-3 control-label">加工厂商：</label>
		<div class="col-sm-7">
			<div class="input-group" style="width:100%">
               <t:dictSelect field="supplier" type="list" extendJson="{class:'form-control input-sm select2',style='width:100%'}"   dictTable="subcontract_supplier" dictField="dwmc" dictText="dwmc"  hasLabel="false"  title="加工厂商" defaultVal="${subcontractPlan.supplier}"></t:dictSelect>
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