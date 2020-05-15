<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>检验外协加工申请</title>
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
	<form class="form-horizontal" role="form" id="formobj" action="subcontractInspectionController.do?doConfirm" method="POST">
		<input type="hidden" id="btn_sub" class="btn_sub"/>
		<input type="hidden" id="id" name="id" value="${subcontractApply.id}"/>
		<input type="hidden" id="confrimStatus" name="confrimStatus"/>
		<div class="row">
		<div class="bt-item col-md-12 col-sm-12">
			<div class="row">
	         	<a href="${pageContext.request.contextPath}/subcontractInspectionController/exportWord.do?id=${subcontractApply.id}" class="btn btn-info btn-sm">
	         	<span class="glyphicon glyphicon-cloud-upload" aria-hidden="true">
	         	</span>导出Word</a> 
			</div>
		</div>
		<div class="bt-item col-md-6 col-sm-6">
			<div class="row">
				<div class="col-md-4 col-sm-4 col-xs-4 bt-label">
					项目名称：
				</div>
				<div class="col-md-8 col-sm-8 col-xs-8 bt-content">
					<input name="xmmc" type="text" class="form-control input-sm" maxlength="32" value = "${subcontractApply.xmmc}" datatype="*" ignore="check"  />
				</div>
			</div>
		</div>
		<div class="bt-item col-md-6 col-sm-6">
			<div class="row">
				<div class="col-md-4 col-sm-4 col-xs-4 bt-label">
					申请部门：
				</div>
				<div class="col-md-8 col-sm-8 col-xs-8 bt-content">
	            	<t:dictSelect field="sqbm" type="select" hasLabel="false" title="申请部门" extendJson="{class:'form-control input-sm'}"   dictTable="t_s_depart" defaultVal = "${subcontractApply.sqbm}" dictField="id" dictText="departname" ></t:dictSelect>
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
		                <input type="text" name="planno" class="form-control" id="planno" value="${subcontractApply.planno}">
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
					所内型号：
				</div>
				<div class="col-md-8 col-sm-8 col-xs-8 bt-content">
					<input name="snxh" type="text" class="form-control input-sm" maxlength="32" value = "${subcontractApply.snxh}" ignore="ignore"  />
				</div>
			</div>
		</div>
		<div class="bt-item col-md-6 col-sm-6">
			<div class="row">
				<div class="col-md-4 col-sm-4 col-xs-4 bt-label">
					课题号：
				</div>
				<div class="col-md-8 col-sm-8 col-xs-8 bt-content">
					<input name="kth" type="text" class="form-control input-sm" maxlength="32" value = "${subcontractApply.kth}" ignore="ignore"  />
				</div>
			</div>
		</div>
		<div class="bt-item col-md-6 col-sm-6">
			<div class="row">
				<div class="col-md-4 col-sm-4 col-xs-4 bt-label">
					项目负责人：
				</div>
				<div class="col-md-8 col-sm-8 col-xs-8 bt-content">
					<input name="xmfzr" type="text" class="form-control input-sm" maxlength="32" value = "${subcontractApply.xmfzr}" ignore="ignore"  />
				</div>
			</div>
		</div>
		<div class="bt-item col-md-6 col-sm-6">
			<div class="row">
				<div class="col-md-4 col-sm-4 col-xs-4 bt-label">
					外协加工类型：
				</div>
				<div class="col-md-8 col-sm-8 col-xs-8 bt-content">
	            	<t:dictSelect id="planadd_jglx" field="wxjglx" type="select" defaultVal = "${subcontractApply.wxjglx}" hasLabel="false" title="外协加工类型" extendJson="{class:'form-control input-sm'}"  typeGroupCode="jglx" ></t:dictSelect>
				</div>
			</div>
		</div>
		<div class="bt-item col-md-6 col-sm-6">
			<div class="row">
				<div class="col-md-4 col-sm-4 col-xs-4 bt-label">
					外协加工单位：
				</div>
				<div class="col-md-8 col-sm-8 col-xs-8 bt-content">
	            	<t:dictSelect id="plan_wxjgdw" field="wxjgdw" type="select" defaultVal = "${subcontractApply.wxjgdw}" hasLabel="false" title="外协加工单位" extendJson="{class:'form-control input-sm select2',style='width:100%'}"   dictTable="subcontract_supplier_inspection" dictField="dwmc" dictText="dwmc" ></t:dictSelect>
				</div>
			</div>
		</div>
		<div class="bt-item col-md-6 col-sm-6">
			<div class="row">
				<div class="col-md-4 col-sm-4 col-xs-4 bt-label">
					地址：
				</div>
				<div class="col-md-8 col-sm-8 col-xs-8 bt-content">
					<input name="dz" type="text" class="form-control input-sm" maxlength="32" value = "${subcontractApply.dz}"  ignore="ignore"  />
				</div>
			</div>
		</div>
		<div class="bt-item col-md-6 col-sm-6">
			<div class="row">
				<div class="col-md-4 col-sm-4 col-xs-4 bt-label">
					联系人：
				</div>
				<div class="col-md-8 col-sm-8 col-xs-8 bt-content">
					<input name="lxr" type="text" class="form-control input-sm" maxlength="32" value = "${subcontractApply.lxr}"  ignore="ignore"  />
				</div>
			</div>
		</div>
		<div class="bt-item col-md-6 col-sm-6">
			<div class="row">
				<div class="col-md-4 col-sm-4 col-xs-4 bt-label">
					电话：
				</div>
				<div class="col-md-8 col-sm-8 col-xs-8 bt-content">
					<input name="dh" type="text" class="form-control input-sm" maxlength="32" value = "${subcontractApply.dh}" ignore="ignore"  />
				</div>
			</div>
		</div>
		<div class="bt-item col-md-6 col-sm-6">
			<div class="row">
				<div class="col-md-4 col-sm-4 col-xs-4 bt-label">
					数量：
				</div>
				<div class="col-md-8 col-sm-8 col-xs-8 bt-content">
					<input name="sl" type="text" class="form-control input-sm" maxlength="32" value = "${subcontractApply.sl}" ignore="ignore"  />
				</div>
			</div>
		</div>
		<div class="bt-item col-md-6 col-sm-6">
			<div class="row">
				<div class="col-md-4 col-sm-4 col-xs-4 bt-label">
					编号：
				</div>
				<div class="col-md-8 col-sm-8 col-xs-8 bt-content">
					<input name="bh" type="text" class="form-control input-sm" maxlength="32" value = "${subcontractApply.bh}" ignore="ignore"  />
				</div>
			</div>
		</div>
		<div class="bt-item col-md-6 col-sm-6">
			<div class="row">
				<div class="col-md-4 col-sm-4 col-xs-4 bt-label">
					说明：
				</div>
				<div class="col-md-8 col-sm-8 col-xs-8 bt-content">
					<input name="sm" type="text" class="form-control input-sm" maxlength="32" value = "${subcontractApply.sm}"  ignore="ignore"  />
				</div>
			</div>
		</div>
		<div class="bt-item col-md-6 col-sm-6">
			<div class="row">
				<div class="col-md-4 col-sm-4 col-xs-4 bt-label">
					申请日期：
				</div>
				<div class="col-md-8 col-sm-8 col-xs-8 bt-content">
					<input name="applydate" type="text" class="form-control input-sm laydate-date"  value = "<fmt:formatDate value='${subcontractApply.applydate}' pattern='yyyy-MM-dd'/>" ignore="ignore" />
				</div>
			</div>
		</div>
		<div class="bt-item col-md-6 col-sm-6">
			<div class="row">
				<div class="col-md-4 col-sm-4 col-xs-4 bt-label">
					要求完成日期：
				</div>
				<div class="col-md-8 col-sm-8 col-xs-8 bt-content">
					<input name="completedate" type="text" class="form-control input-sm laydate-date" value = "<fmt:formatDate value='${subcontractApply.completedate}' pattern='yyyy-MM-dd' />" ignore="ignore"  />
				</div>
			</div>
		</div>
		<div class="bt-item col-md-6 col-sm-6">
			<div class="row">
				<div class="col-md-4 col-sm-4 col-xs-4 bt-label">
					加急完成时间：
				</div>
				<div class="col-md-8 col-sm-8 col-xs-8 bt-content">
					<input name="urgentdate" type="text" class="form-control input-sm laydate-date" value = "<fmt:formatDate value='${subcontractApply.urgentdate}' pattern='yyyy-MM-dd' />" ignore="ignore"  />
				</div>
			</div>
		</div>
		<div class="bt-item col-md-12 col-sm-12">
			<div class="col-md-2 col-sm-2 col-xs-2 bt-label">
				附件：
			</div>
			<div class="col-md-10 col-sm-10 col-xs-10 bt-content">
			<span style="color:#F00">注：当预估金额大于50万元时，请务必上传附件<a href="export/template/附件10商务谈判记录（公开）.docx">商务谈判记录（模板）</a>、<a href="export/template/附件12单一来源采购申请表（公开）.docx">单一来源采购申请表（模板）</a></span>
			<t:webUploader name="attach" outJs="true" auto="true" showImgDiv="filediv_attach" pathValues="${subcontractApply.attach}"></t:webUploader>
			<div class="form" id="filediv_attach"></div>
			</div>
		</div>
		<div class="bt-item col-md-12 col-sm-12">
			<div class="row">
				<div class="col-md-2 col-sm-2 col-xs-2 bt-label">
					委托内容：
				</div>
				<div class="col-md-10 col-sm-10 col-xs-10 bt-content">
						<input type="checkbox" id="checkbox1" style="vertical-align:middle;width:30px" name="wtlr" value="可靠性检验" ${fn:contains(subcontractApply.wtlr, '可靠性检验')? 'checked' : ''} ><label style="vertical-align:middle;display:inline-block;font-size:12px;" for="checkbox1">可靠性检验</label>
						<input type="checkbox" id="checkbox2" style="vertical-align:middle;width:30px" name="wtlr" value="老化试验" ${fn:contains(subcontractApply.wtlr, '老化试验')? 'checked' : ''} ><label style="vertical-align:middle;display:inline-block;font-size:12px;" for="checkbox2">老化试验</label>
						<input type="checkbox" id="checkbox3" style="vertical-align:middle;width:30px" name="wtlr" value="目检" ${fn:contains(subcontractApply.wtlr, '目检')? 'checked' : ''} ><label style="vertical-align:middle;display:inline-block;font-size:12px;" for="checkbox3">目检</label>
						<input type="checkbox" id="checkbox4" style="vertical-align:middle;width:30px" name="wtlr" value="图片 PCM" ${fn:contains(subcontractApply.wtlr, '图片 PCM')? 'checked' : ''} ><label style="vertical-align:middle;display:inline-block;font-size:12px;" for="checkbox4">图片 PCM</label>
						<input type="checkbox" id="checkbox5" style="vertical-align:middle;width:30px" name="wtlr" value="中测" ${fn:contains(subcontractApply.wtlr, '中测')? 'checked' : ''} ><label style="vertical-align:middle;display:inline-block;font-size:12px;" for="checkbox5">中测</label>
						<input type="checkbox" id="checkbox6" style="vertical-align:middle;width:30px" name="wtlr" value="版图设计" ${fn:contains(subcontractApply.wtlr, '版图设计')? 'checked' : ''} ><label style="vertical-align:middle;display:inline-block;font-size:12px;" for="checkbox6">版图设计</label>
						<input type="checkbox" id="checkbox7" style="vertical-align:middle;width:30px" name="wtlr" value="PCB 制板" ${fn:contains(subcontractApply.wtlr, 'PCB 制板')? 'checked' : ''} ><label style="vertical-align:middle;display:inline-block;font-size:12px;" for="checkbox7">PCB 制板</label>
						<input type="checkbox" id="checkbox8" style="vertical-align:middle;width:30px" name="wtlr" value="PCB 组装" ${fn:contains(subcontractApply.wtlr, 'PCB 组装')? 'checked' : ''} ><label style="vertical-align:middle;display:inline-block;font-size:12px;" for="checkbox8">PCB 组装</label>
						<input type="checkbox" id="checkbox9" style="vertical-align:middle;width:30px" name="wtlr" value="ESD" ${fn:contains(subcontractApply.wtlr, 'ESD')? 'checked' : ''} ><label style="vertical-align:middle;display:inline-block;font-size:12px;" for="checkbox9">ESD</label>
						<input type="checkbox" id="checkbox10" style="vertical-align:middle;width:30px" name="wtlr" value="辐照" ${fn:contains(subcontractApply.wtlr, '辐照')? 'checked' : ''} ><label style="vertical-align:middle;display:inline-block;font-size:12px;" for="checkbox10">辐照</label>
						<input type="checkbox" id="checkbox11" style="vertical-align:middle;width:30px" name="wtlr" value="DPA" ${fn:contains(subcontractApply.wtlr, 'DPA')? 'checked' : ''} ><label style="vertical-align:middle;display:inline-block;font-size:12px;" for="checkbox11">DPA</label>
						<input type="checkbox" id="checkbox12" style="vertical-align:middle;width:30px" name="wtlr" value="封装" ${fn:contains(subcontractApply.wtlr, '封装')? 'checked' : ''} ><label style="vertical-align:middle;display:inline-block;font-size:12px;" for="checkbox12">封装</label>
						<input type="checkbox" id="checkbox13" style="vertical-align:middle;width:30px" name="wtlr" value="网表提取" ${fn:contains(subcontractApply.wtlr, '网表提取')? 'checked' : ''} ><label style="vertical-align:middle;display:inline-block;font-size:12px;" for="checkbox13">网表提取</label>
						<input type="checkbox" id="checkbox14" style="vertical-align:middle;width:30px" name="wtlr" value="去封装" ${fn:contains(subcontractApply.wtlr, '去封装')? 'checked' : ''}  ><label style="vertical-align:middle;display:inline-block;font-size:12px;" for="checkbox14">去封装</label>
						<input type="checkbox" id="checkbox15" style="vertical-align:middle;width:30px" name="wtlr" value="照相" ${fn:contains(subcontractApply.wtlr, '照相')? 'checked' : ''} ><label style="vertical-align:middle;display:inline-block;font-size:12px;" for="checkbox15">照相</label>
						<input type="checkbox" id="checkbox16" style="vertical-align:middle;width:30px" name="wtlr" value="电路分析" ${fn:contains(subcontractApply.wtlr, '电路分析')? 'checked' : ''} ><label style="vertical-align:middle;display:inline-block;font-size:12px;" for="checkbox16">电路分析</label>
						<input type="checkbox" id="checkbox17" style="vertical-align:middle;width:30px" name="wtlr" value="电路修补试验" ${fn:contains(subcontractApply.wtlr, '电路修补试验')? 'checked' : ''} ><label style="vertical-align:middle;display:inline-block;font-size:12px;" for="checkbox17">电路修补试验</label>
						<input type="checkbox" id="checkbox18" style="vertical-align:middle;width:30px" name="wtlr" value="其它" ${fn:contains(subcontractApply.wtlr, '其它')? 'checked' : ''} ><label style="vertical-align:middle;display:inline-block;font-size:12px;" for="checkbox18">其它</label>
				</div>
			</div>
		</div>
		<div class="bt-item col-md-12 col-sm-12">
			<div class="row">
				<div class="col-md-2 col-sm-2 col-xs-2 bt-label">
					具体要求：
				</div>
				<div class="col-md-10 col-sm-10 col-xs-10 bt-content">
					<textarea name="jtyq" class="form-control input-sm" rows="3">${subcontractApply.jtyq}</textarea>
				</div>
			</div>
		</div>
		<div class="bt-item col-md-12 col-sm-12">
			<div class="row">
				<div class="col-md-2 col-sm-2 col-xs-2 bt-label">
					备注：
				</div>
				<div class="col-md-10 col-sm-10 col-xs-10 bt-content">
					<textarea name="bz"  class="form-control input-sm" rows="3" >${subcontractApply.bz}</textarea>
				</div>
			</div>
		</div>
		<div class="bt-item col-md-12 col-sm-12">
			<div class="row">
				<div class="col-md-2 col-sm-2 col-xs-2 bt-label">
					部门负责人意见：
				</div>
				<div class="col-md-10 col-sm-10 col-xs-10 bt-content">
					<input name="bmyj" type="text" class="form-control input-sm" maxlength="32" value = "${subcontractApply.bmyj}"  ignore="ignore"  />
				</div>
			</div>
		</div>
		<div class="bt-item col-md-12 col-sm-12">
			<div class="row">
				<div class="col-md-2 col-sm-2 col-xs-2 bt-label">
					部门主管领导审批意见：
				</div>
				<div class="col-md-10 col-sm-10 col-xs-10 bt-content">
					<input name="bmldyj" type="text" class="form-control input-sm" maxlength="32"  value = "${subcontractApply.bmldyj}" ignore="ignore"  />
				</div>
			</div>
		</div>
		<div class="bt-item col-md-12 col-sm-12">
			<div class="row">
				<div class="col-md-2 col-sm-2 col-xs-2 bt-label">
					公司领导审批意见：
				</div>
				<div class="col-md-10 col-sm-10 col-xs-10 bt-content">
					<input name="gsldyj" type="text" class="form-control input-sm" maxlength="32" value = "${subcontractApply.gsldyj}" ignore="ignore"  />
				</div>
			</div>
		</div>
	
		<div ${feeFlag==1? '':'style="display:none"'}   class="bt-item col-md-6 col-sm-6">
			<div class="row">
				<div class="col-md-4 col-sm-4 col-xs-4 bt-label">
					预估费用：
				</div>
				<div class="col-md-8 col-sm-8 col-xs-8 bt-content">
					<input name="plancost" type="text" class="form-control input-sm" maxlength="32"  datatype="/^(-?\d+)(\.\d+)?$/" value = "${subcontractApply.plancost}" ignore="ignore"  />
				</div>
			</div>
		</div>
		<div  ${feeFlag==1? '':'style="display:none"'}  class="bt-item col-md-6 col-sm-6">
			<div class="row">
				<div class="col-md-4 col-sm-4 col-xs-4 bt-label">
					实际费用：
				</div>
				<div class="col-md-8 col-sm-8 col-xs-8 bt-content">
					<input name="cost" type="text" class="form-control input-sm" maxlength="32"  datatype="/^(-?\d+)(\.\d+)?$/" value = "${subcontractApply.cost}" ignore="ignore"  />
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
	$("#planadd_jglx").change(function(){
		var jglx = $("#planadd_jglx").val();
		$("#plan_wxjgdw").html('');
		var option;
		$.ajax({
            type: "POST",
            url:'subcontractSupplierInspectionController.do?getSupplyInfo',
            data: {supplyType:jglx},
            dataType : 'json',
			success : function(data) {
				if (data.success) {
					 option +=  "<option value=''></option>";
					 $.each(data.obj, function(objIndex, obj){
						 option +=  "<option value='" +obj.dwmc+ "'>"+obj.dwmc+"</option>";
					 });
					 $("#plan_wxjgdw").html(option);//将循环拼接的字符串插入第二个下拉列表
				}
			}
        });
		$("#plan_wxjgdw").show();
	});
	$("#plan_wxjgdw").change(function(){
		var wxjgdw = $("#plan_wxjgdw").val();
		if(wxjgdw==''){
			alert("请选择供应商");
		}
		$.ajax({
            type: "POST",
            url:'subcontractSupplierInspectionController.do?getSupplyInfoByName',
            data: {supplyName:wxjgdw},
            dataType : 'json',
			success : function(data) {
				if (data.success) {
					$.each(data.obj, function(objIndex, obj){
						alert(obj.dz);
						//地址
						$('input[name="dz"]').val(obj.dz);
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