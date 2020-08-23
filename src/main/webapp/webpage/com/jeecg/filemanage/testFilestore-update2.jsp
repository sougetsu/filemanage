<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<!DOCTYPE html>
<html>
 <head>
  <title>文件管理</title>
    <style>
  .ui-button {
  	  display: inline-block;
	  padding: 2px 2px;
	  margin-bottom: 0;
	  font-size: 8px;
	  font-weight: normal;
	  line-height: 1.42857143;
	  text-align: center;
	  white-space: nowrap;
	  vertical-align: middle;
	  -ms-touch-action: manipulation;
      touch-action: manipulation;
	  cursor: pointer;
	  -webkit-user-select: none;
      -moz-user-select: none;
      -ms-user-select: none;
      user-select: none;
	  background-image: none;
	  border: 1px solid transparent;
	  border-radius: 4px;
  }
  </style>
  <t:base type="jquery,easyui,tools,DatePicker"></t:base>
  <t:base type="uploadify"></t:base>
  <script type="text/javascript">
  $(document).ready(function(){
	$('#tt').tabs({
	   onSelect:function(title){
	       $('#tt .panel-body').css('width','auto');
		}
	});
	$(".tabs-wrap").css('width','100%');
  });
 </script>
 </head>
 <body style="overflow-x: hidden;">
  <t:formvalid formid="formobj" dialog="true" usePlugin="password" layout="table" tiptype="1" action="testFilestoreController.do?doUpdate" callback="jeecgFormFileCallBack@Override">
					<input id="id" name="id" type="hidden" value="${testFilestorePage.id }"/>
	<table cellpadding="0" cellspacing="1" class="formtable">
		<tr>
			<td align="right">
				<label class="Validform_label">阶段标识:</label>
			</td>
			<td class="value">
					<t:dictSelect field="bpmStatus" type="list"   typeGroupCode="filestatus"  defaultVal="${testFilestorePage.bpmStatus}" hasLabel="false"  title="阶段标识"></t:dictSelect>     
				<span class="Validform_checktip"></span>
				<label class="Validform_label" style="display: none;">阶段标识</label>
			</td>
			<td align="right">
				<label class="Validform_label">型号:</label>
			</td>
			<td class="value">
		     	 <input id="xh" name="xh" type="text" maxlength="32" style="width: 150px" class="inputxt"  ignore="checked"  value='${testFilestorePage.xh}'/>
				<span class="Validform_checktip"></span>
				<label class="Validform_label" style="display: none;">型号</label>
			</td>
		</tr>
		<tr>
			<td align="right">
				<label class="Validform_label">电路名称:</label>
			</td>
			<td class="value">
		     	 <input id="dlmc" name="dlmc" type="text" maxlength="100" style="width: 150px" class="inputxt"  ignore="checked"  value='${testFilestorePage.dlmc}'/>
				<span class="Validform_checktip"></span>
				<label class="Validform_label" style="display: none;">电路名称</label>
			</td>
			<td align="right">
				<label class="Validform_label">批次:</label>
			</td>
			<td class="value">
		     	 <input id="pc" name="pc" type="text" maxlength="32" style="width: 150px" class="inputxt"  ignore="checked"  value='${testFilestorePage.pc}'/>
				<span class="Validform_checktip"></span>
				<label class="Validform_label" style="display: none;">批次</label>
			</td>
		</tr>
		<tr>
			<td align="right">
				<label class="Validform_label">任务通知单号:</label>
			</td>
			<td class="value">
		     	 <input id="rwtzdh" name="rwtzdh" type="text" maxlength="50" style="width: 150px" class="inputxt"  ignore="checked"  value='${testFilestorePage.rwtzdh}'/>
				<span class="Validform_checktip"></span>
				<label class="Validform_label" style="display: none;">任务通知单号</label>
			</td>
			<td align="right">
				<label class="Validform_label">任务数量:</label>
			</td>
			<td class="value">
		     	 <input id="rwsl" name="rwsl" type="text" maxlength="32" style="width: 150px" class="inputxt"  ignore="checked"  value='${testFilestorePage.rwsl}'/>
				<span class="Validform_checktip"></span>
				<label class="Validform_label" style="display: none;">任务数量</label>
			</td>
		</tr>
		<tr>
			<td align="right">
				<label class="Validform_label">执行规范号:</label>
			</td>
			<td class="value">
		     	 <input id="zxgfh" name="zxgfh" type="text" maxlength="32" style="width: 150px" class="inputxt"  ignore="checked"  value='${testFilestorePage.zxgfh}'/>
				<span class="Validform_checktip"></span>
				<label class="Validform_label" style="display: none;">执行规范号</label>
			</td>
			<td align="right">
				<label class="Validform_label">质量等级:</label>
			</td>
			<td class="value">
		     	 <input id="zldj" name="zldj" type="text" maxlength="32" style="width: 150px" class="inputxt"  ignore="checked"  value='${testFilestorePage.zldj}'/>
				<span class="Validform_checktip"></span>
				<label class="Validform_label" style="display: none;">质量等级</label>
			</td>
		</tr>
		<tr>
			<td align="right">
				<label class="Validform_label">封装形式:</label>
			</td>
			<td class="value">
		     	 <input id="fzxs" name="fzxs" type="text" maxlength="50" style="width: 150px" class="inputxt"  ignore="checked"  value='${testFilestorePage.fzxs}'/>
				<span class="Validform_checktip"></span>
				<label class="Validform_label" style="display: none;">封装形式</label>
			</td>
			<td align="right">
				<label class="Validform_label">芯片标识:</label>
			</td>
			<td class="value">
		     	 <input id="xpbs" name="xpbs" type="text" maxlength="50" style="width: 150px" class="inputxt"  ignore="ignore"  value='${testFilestorePage.xpbs}'/>
				<span class="Validform_checktip"></span>
				<label class="Validform_label" style="display: none;">芯片标识</label>
			</td>
		</tr>
		<tr>
			<td align="right">
				<label class="Validform_label">圆片批次:</label>
			</td>
			<td class="value">
		     	 <input id="yppc" name="yppc" type="text" maxlength="32" style="width: 150px" class="inputxt"  ignore="ignore"  value='${testFilestorePage.yppc}'/>
				<span class="Validform_checktip"></span>
				<label class="Validform_label" style="display: none;">圆片批次</label>
			</td>
			<td align="right">
				<label class="Validform_label">圆片号:</label>
			</td>
			<td class="value">
		     	 <input id="yph" name="yph" type="text" maxlength="32" style="width: 150px" class="inputxt"  ignore="ignore"  value='${testFilestorePage.yph}'/>
				<span class="Validform_checktip"></span>
				<label class="Validform_label" style="display: none;">圆片号</label>
			</td>
		</tr>
		<tr>
			<td align="right">
				<label class="Validform_label">监制报告号:</label>
			</td>
			<td class="value">
		<table id="jzbgh_fileTable"></table>
		<div class="form jeecgDetail">
			<t:upload name="jzbgh" id="jzbgh" queueID="filediv_jzbgh" outhtml="false" uploader="cgUploadController.do?saveFiles"  extend="office" buttonText='添加文件'  onUploadStart="jzbghOnUploadStart"> </t:upload>
			<div class="form" id="filediv_jzbgh"></div>
			<script type="text/javascript">
				function jzbghOnUploadStart(file){
					var cgFormId=$("input[name='id']").val();
					$('#jzbgh').uploadify("settings", "formData", {
						'cgFormId':cgFormId,
						'cgFormName':'test_filestore',
						'cgFormField':'JZBGH'
					});
				}
			</script>
		</div>
				<span class="Validform_checktip"></span>
				<label class="Validform_label" style="display: none;">监制报告号</label>
			</td>
			<td align="right">
				<label class="Validform_label">监制单位:</label>
			</td>
			<td class="value">
		     	 <input id="jzdw" name="jzdw" type="text" maxlength="100" style="width: 150px" class="inputxt"  ignore="ignore"  value='${testFilestorePage.jzdw}'/>
				<span class="Validform_checktip"></span>
				<label class="Validform_label" style="display: none;">监制单位</label>
			</td>
		</tr>
		<tr>
			<td align="right">
				<label class="Validform_label">监制数量:</label>
			</td>
			<td class="value">
		     	 <input id="jzsl" name="jzsl" type="text" maxlength="32" style="width: 150px" class="inputxt"  ignore="ignore"  value='${testFilestorePage.jzsl}'/>
				<span class="Validform_checktip"></span>
				<label class="Validform_label" style="display: none;">监制数量</label>
			</td>
			<td align="right">
				<label class="Validform_label">监制时间:</label>
			</td>
			<td class="value">
		     	 <input id="jzsj" name="jzsj" type="text" maxlength="32" style="width: 150px" class="inputxt"  ignore="ignore"  value='${testFilestorePage.jzsj}'/>
				<span class="Validform_checktip"></span>
				<label class="Validform_label" style="display: none;">监制时间</label>
			</td>
		</tr>
		<tr>
			<td align="right">
				<label class="Validform_label">外壳型号:</label>
			</td>
			<td class="value">
		     	 <input id="wjxh" name="wjxh" type="text" maxlength="32" style="width: 150px" class="inputxt"  ignore="ignore"  value='${testFilestorePage.wjxh}'/>
				<span class="Validform_checktip"></span>
				<label class="Validform_label" style="display: none;">外壳型号</label>
			</td>
			<td align="right">
				<label class="Validform_label">外壳检验批次:</label>
			</td>
			<td class="value">
		     	 <input id="wkjypc" name="wkjypc" type="text" maxlength="32" style="width: 150px" class="inputxt"  ignore="ignore"  value='${testFilestorePage.wkjypc}'/>
				<span class="Validform_checktip"></span>
				<label class="Validform_label" style="display: none;">外壳检验批次</label>
			</td>
		</tr>
		<tr>
			<td align="right">
				<label class="Validform_label">盖板型号:</label>
			</td>
			<td class="value">
		     	 <input id="gbxh" name="gbxh" type="text" maxlength="32" style="width: 150px" class="inputxt"  ignore="ignore"  value='${testFilestorePage.gbxh}'/>
				<span class="Validform_checktip"></span>
				<label class="Validform_label" style="display: none;">盖板型号</label>
			</td>
			<td align="right">
				<label class="Validform_label">盖板检验批次:</label>
			</td>
			<td class="value">
		     	 <input id="gbjypc" name="gbjypc" type="text" maxlength="32" style="width: 150px" class="inputxt"  ignore="ignore"  value='${testFilestorePage.gbjypc}'/>
				<span class="Validform_checktip"></span>
				<label class="Validform_label" style="display: none;">盖板检验批次</label>
			</td>
		</tr>
		<tr>
			<td align="right">
				<label class="Validform_label">键合丝型号:</label>
			</td>
			<td class="value">
		     	 <input id="jhsxh" name="jhsxh" type="text" maxlength="32" style="width: 150px" class="inputxt"  ignore="ignore"  value='${testFilestorePage.jhsxh}'/>
				<span class="Validform_checktip"></span>
				<label class="Validform_label" style="display: none;">键合丝型号</label>
			</td>
			<td align="right">
				<label class="Validform_label">键合丝检验批次:</label>
			</td>
			<td class="value">
		     	 <input id="jhsjypc" name="jhsjypc" type="text" maxlength="32" style="width: 150px" class="inputxt"  ignore="ignore"  value='${testFilestorePage.jhsjypc}'/>
				<span class="Validform_checktip"></span>
				<label class="Validform_label" style="display: none;">键合丝检验批次</label>
			</td>
		</tr>
		<tr>
			<td align="right">
				<label class="Validform_label">粘片胶型号:</label>
			</td>
			<td class="value">
		     	 <input id="zpjxh" name="zpjxh" type="text" maxlength="32" style="width: 150px" class="inputxt"  ignore="ignore"  value='${testFilestorePage.zpjxh}'/>
				<span class="Validform_checktip"></span>
				<label class="Validform_label" style="display: none;">粘片胶型号</label>
			</td>
			<td align="right">
				<label class="Validform_label">粘片胶检验批次:</label>
			</td>
			<td class="value">
		     	 <input id="zpjyjpc" name="zpjyjpc" type="text" maxlength="32" style="width: 150px" class="inputxt"  ignore="ignore"  value='${testFilestorePage.zpjyjpc}'/>
				<span class="Validform_checktip"></span>
				<label class="Validform_label" style="display: none;">粘片胶检验批次</label>
			</td>
		</tr>
		<tr>
			<td align="right">
				<label class="Validform_label">打标墨型号:</label>
			</td>
			<td class="value">
		     	 <input id="dbmxh" name="dbmxh" type="text" maxlength="32" style="width: 150px" class="inputxt"  ignore="ignore"  value='${testFilestorePage.dbmxh}'/>
				<span class="Validform_checktip"></span>
				<label class="Validform_label" style="display: none;">打标墨型号</label>
			</td>
			<td align="right">
				<label class="Validform_label">打标墨检验批次:</label>
			</td>
			<td class="value">
		     	 <input id="dbmjypc" name="dbmjypc" type="text" maxlength="32" style="width: 150px" class="inputxt"  ignore="ignore"  value='${testFilestorePage.dbmjypc}'/>
				<span class="Validform_checktip"></span>
				<label class="Validform_label" style="display: none;">打标墨检验批次</label>
			</td>
		</tr>
		<tr>
			<td align="right">
				<label class="Validform_label">腔体体积:</label>
			</td>
			<td class="value">
		     	 <input id="qttj" name="qttj" type="text" maxlength="32" style="width: 150px" class="inputxt"  ignore="ignore"  value='${testFilestorePage.qttj}'/>
				<span class="Validform_checktip"></span>
				<label class="Validform_label" style="display: none;">腔体体积</label>
			</td>
			<td align="right">
				<label class="Validform_label">腔体高度:</label>
			</td>
			<td class="value">
		     	 <input id="qtgd" name="qtgd" type="text" maxlength="32" style="width: 150px" class="inputxt"  ignore="ignore"  value='${testFilestorePage.qtgd}'/>
				<span class="Validform_checktip"></span>
				<label class="Validform_label" style="display: none;">腔体高度</label>
			</td>
		</tr>
		<tr>
			<td align="right">
				<label class="Validform_label">投入封装数量:</label>
			</td>
			<td class="value">
		     	 <input id="trfzsl" name="trfzsl" type="text" maxlength="32" style="width: 150px" class="inputxt"  ignore="ignore"  value='${testFilestorePage.trfzsl}'/>
				<span class="Validform_checktip"></span>
				<label class="Validform_label" style="display: none;">投入封装数量</label>
			</td>
			<td align="right">
				<label class="Validform_label">封装合格数量:</label>
			</td>
			<td class="value">
		     	 <input id="fzhgsl" name="fzhgsl" type="text" maxlength="32" style="width: 150px" class="inputxt"  ignore="ignore"  value='${testFilestorePage.fzhgsl}'/>
				<span class="Validform_checktip"></span>
				<label class="Validform_label" style="display: none;">封装合格数量</label>
			</td>
		</tr>
		<tr>
			<td align="right">
				<label class="Validform_label">监制电路起止序号:</label>
			</td>
			<td class="value">
		     	 <input id="jzdlqzxh" name="jzdlqzxh" type="text" maxlength="32" style="width: 150px" class="inputxt"  ignore="ignore"  value='${testFilestorePage.jzdlqzxh}'/>
				<span class="Validform_checktip"></span>
				<label class="Validform_label" style="display: none;">监制电路起止序号</label>
			</td>
			<td align="right">
				<label class="Validform_label">封装不合格情况:</label>
			</td>
			<td class="value">
		<table id="fzbhgqk_fileTable"></table>
		<div class="form jeecgDetail">
			<t:upload name="fzbhgqk" id="fzbhgqk" queueID="filediv_fzbhgqk" outhtml="false" uploader="cgUploadController.do?saveFiles"  extend="office" buttonText='添加文件'  onUploadStart="fzbhgqkOnUploadStart"> </t:upload>
			<div class="form" id="filediv_fzbhgqk"></div>
			<script type="text/javascript">
				function fzbhgqkOnUploadStart(file){
					var cgFormId=$("input[name='id']").val();
					$('#fzbhgqk').uploadify("settings", "formData", {
						'cgFormId':cgFormId,
						'cgFormName':'test_filestore',
						'cgFormField':'FZBHGQK'
					});
				}
			</script>
		</div>
				<span class="Validform_checktip"></span>
				<label class="Validform_label" style="display: none;">封装不合格情况</label>
			</td>
		</tr>
		<tr>
			<td align="right">
				<label class="Validform_label">筛选报告附件:</label>
			</td>
			<td class="value">
		<table id="sxbghfile_fileTable"></table>
		<div class="form jeecgDetail">
			<t:upload name="sxbghfile" id="sxbghfile" queueID="filediv_sxbghfile" outhtml="false" uploader="cgUploadController.do?saveFiles"  extend="office" buttonText='添加文件'  onUploadStart="sxbghfileOnUploadStart"> </t:upload>
			<div class="form" id="filediv_sxbghfile"></div>
			<script type="text/javascript">
				function sxbghfileOnUploadStart(file){
					var cgFormId=$("input[name='id']").val();
					$('#sxbghfile').uploadify("settings", "formData", {
						'cgFormId':cgFormId,
						'cgFormName':'test_filestore',
						'cgFormField':'SXBGHFILE'
					});
				}
			</script>
		</div>
				<span class="Validform_checktip"></span>
				<label class="Validform_label" style="display: none;">筛选报告附件</label>
			</td>
			<td align="right">
				<label class="Validform_label">筛选起止时间:</label>
			</td>
			<td class="value">
		<table id="sxqzsj_fileTable"></table>
		<div class="form jeecgDetail">
			<t:upload name="sxqzsj" id="sxqzsj" queueID="filediv_sxqzsj" outhtml="false" uploader="cgUploadController.do?saveFiles"  extend="office" buttonText='添加文件'  onUploadStart="sxqzsjOnUploadStart"> </t:upload>
			<div class="form" id="filediv_sxqzsj"></div>
			<script type="text/javascript">
				function sxqzsjOnUploadStart(file){
					var cgFormId=$("input[name='id']").val();
					$('#sxqzsj').uploadify("settings", "formData", {
						'cgFormId':cgFormId,
						'cgFormName':'test_filestore',
						'cgFormField':'SXQZSJ'
					});
				}
			</script>
		</div>
				<span class="Validform_checktip"></span>
				<label class="Validform_label" style="display: none;">筛选起止时间</label>
			</td>
		</tr>
		<tr>
			<td align="right">
				<label class="Validform_label">筛选过程PIND次数:</label>
			</td>
			<td class="value">
		     	 <input id="sxgcpindcs" name="sxgcpindcs" type="text" maxlength="32" style="width: 150px" class="inputxt"  ignore="ignore"  value='${testFilestorePage.sxgcpindcs}'/>
				<span class="Validform_checktip"></span>
				<label class="Validform_label" style="display: none;">筛选过程PIND次数</label>
			</td>
			<td align="right">
				<label class="Validform_label">投入筛选数量:</label>
			</td>
			<td class="value">
		     	 <input id="trsxsl" name="trsxsl" type="text" maxlength="32" style="width: 150px" class="inputxt"  ignore="ignore"  value='${testFilestorePage.trsxsl}'/>
				<span class="Validform_checktip"></span>
				<label class="Validform_label" style="display: none;">投入筛选数量</label>
			</td>
		</tr>
		<tr>
			<td align="right">
				<label class="Validform_label">筛选合格数量:</label>
			</td>
			<td class="value">
		     	 <input id="sxhgsl" name="sxhgsl" type="text" maxlength="32" style="width: 150px" class="inputxt"  ignore="ignore"  value='${testFilestorePage.sxhgsl}'/>
				<span class="Validform_checktip"></span>
				<label class="Validform_label" style="display: none;">筛选合格数量</label>
			</td>
			<td align="right">
				<label class="Validform_label">筛选不合格情况:</label>
			</td>
			<td class="value">
		<table id="sxbhgqk_fileTable"></table>
		<div class="form jeecgDetail">
			<t:upload name="sxbhgqk" id="sxbhgqk" queueID="filediv_sxbhgqk" outhtml="false" uploader="cgUploadController.do?saveFiles"  extend="office" buttonText='添加文件'  onUploadStart="sxbhgqkOnUploadStart"> </t:upload>
			<div class="form" id="filediv_sxbhgqk"></div>
			<script type="text/javascript">
				function sxbhgqkOnUploadStart(file){
					var cgFormId=$("input[name='id']").val();
					$('#sxbhgqk').uploadify("settings", "formData", {
						'cgFormId':cgFormId,
						'cgFormName':'test_filestore',
						'cgFormField':'SXBHGQK'
					});
				}
			</script>
		</div>
				<span class="Validform_checktip"></span>
				<label class="Validform_label" style="display: none;">筛选不合格情况</label>
			</td>
		</tr>
		<tr>
			<td align="right">
				<label class="Validform_label">PDA:</label>
			</td>
			<td class="value">
		     	 <input id="pda" name="pda" type="text" maxlength="32" style="width: 150px" class="inputxt"  ignore="ignore"  value='${testFilestorePage.pda}'/>
				<span class="Validform_checktip"></span>
				<label class="Validform_label" style="display: none;">PDA</label>
			</td>
			<td align="right">
				<label class="Validform_label">成品率:</label>
			</td>
			<td class="value">
					<t:dictSelect field="cpl" type="radio"   typeGroupCode=""  defaultVal="${testFilestorePage.cpl}" hasLabel="false"  title="成品率"></t:dictSelect>     
				<span class="Validform_checktip"></span>
				<label class="Validform_label" style="display: none;">成品率</label>
			</td>
		</tr>
		<tr>
			<td align="right">
				<label class="Validform_label">X光盘:</label>
			</td>
			<td class="value">
		     	 <input id="xgp" name="xgp" type="text" maxlength="32" style="width: 150px" class="inputxt"  ignore="ignore"  value='${testFilestorePage.xgp}'/>
				<span class="Validform_checktip"></span>
				<label class="Validform_label" style="display: none;">X光盘</label>
			</td>
			<td align="right">
				<label class="Validform_label">测试光盘:</label>
			</td>
			<td class="value">
		     	 <input id="csgp" name="csgp" type="text" maxlength="32" style="width: 150px" class="inputxt"  ignore="ignore"  value='${testFilestorePage.csgp}'/>
				<span class="Validform_checktip"></span>
				<label class="Validform_label" style="display: none;">测试光盘</label>
			</td>
		</tr>
		<tr>
			<td align="right">
				<label class="Validform_label">报告:</label>
			</td>
			<td class="value">
		<table id="threebg_fileTable"></table>
		<div class="form jeecgDetail">
			<t:upload name="threebg" id="threebg" queueID="filediv_threebg" outhtml="false" uploader="cgUploadController.do?saveFiles"  extend="office" buttonText='添加文件'  onUploadStart="threebgOnUploadStart"> </t:upload>
			<div class="form" id="filediv_threebg"></div>
			<script type="text/javascript">
				function threebgOnUploadStart(file){
					var cgFormId=$("input[name='id']").val();
					$('#threebg').uploadify("settings", "formData", {
						'cgFormId':cgFormId,
						'cgFormName':'test_filestore',
						'cgFormField':'THREEBG'
					});
				}
			</script>
		</div>
				<span class="Validform_checktip"></span>
				<label class="Validform_label" style="display: none;">报告</label>
			</td>
			<td align="right">
				<label class="Validform_label">低成品率质量分析报告:</label>
			</td>
			<td class="value">
		<table id="dcplzlfxbg_fileTable"></table>
		<div class="form jeecgDetail">
			<t:upload name="dcplzlfxbg" id="dcplzlfxbg" queueID="filediv_dcplzlfxbg" outhtml="false" uploader="cgUploadController.do?saveFiles"  extend="office" buttonText='添加文件'  onUploadStart="dcplzlfxbgOnUploadStart"> </t:upload>
			<div class="form" id="filediv_dcplzlfxbg"></div>
			<script type="text/javascript">
				function dcplzlfxbgOnUploadStart(file){
					var cgFormId=$("input[name='id']").val();
					$('#dcplzlfxbg').uploadify("settings", "formData", {
						'cgFormId':cgFormId,
						'cgFormName':'test_filestore',
						'cgFormField':'DCPLZLFXBG'
					});
				}
			</script>
		</div>
				<span class="Validform_checktip"></span>
				<label class="Validform_label" style="display: none;">低成品率质量分析报告</label>
			</td>
		</tr>
		<tr>
			<td align="right">
				<label class="Validform_label">鉴定一致性检验方式:</label>
			</td>
			<td class="value">
		     	 <input id="jdfs" name="jdfs" type="text" maxlength="32" style="width: 150px" class="inputxt"  ignore="ignore"  value='${testFilestorePage.jdfs}'/>
				<span class="Validform_checktip"></span>
				<label class="Validform_label" style="display: none;">鉴定一致性检验方式</label>
			</td>
			<td align="right">
				<label class="Validform_label">鉴定一致性检验报告附件:</label>
			</td>
			<td class="value">
		<table id="jdbgbhfile_fileTable"></table>
		<div class="form jeecgDetail">
			<t:upload name="jdbgbhfile" id="jdbgbhfile" queueID="filediv_jdbgbhfile" outhtml="false" uploader="cgUploadController.do?saveFiles"  extend="office" buttonText='添加文件'  onUploadStart="jdbgbhfileOnUploadStart"> </t:upload>
			<div class="form" id="filediv_jdbgbhfile"></div>
			<script type="text/javascript">
				function jdbgbhfileOnUploadStart(file){
					var cgFormId=$("input[name='id']").val();
					$('#jdbgbhfile').uploadify("settings", "formData", {
						'cgFormId':cgFormId,
						'cgFormName':'test_filestore',
						'cgFormField':'JDBGBHFILE'
					});
				}
			</script>
		</div>
				<span class="Validform_checktip"></span>
				<label class="Validform_label" style="display: none;">鉴定一致性检验报告附件</label>
			</td>
		</tr>
		<tr>
			<td align="right">
				<label class="Validform_label">鉴定一致性检验起止时间:</label>
			</td>
			<td class="value">
		     	 <input id="jdqzsj" name="jdqzsj" type="text" maxlength="32" style="width: 150px" class="inputxt"  ignore="ignore"  value='${testFilestorePage.jdqzsj}'/>
				<span class="Validform_checktip"></span>
				<label class="Validform_label" style="display: none;">鉴定一致性检验起止时间</label>
			</td>
			<td align="right">
				<label class="Validform_label">首件鉴定报告:</label>
			</td>
			<td class="value">
		<table id="sjjdbg_fileTable"></table>
		<div class="form jeecgDetail">
			<t:upload name="sjjdbg" id="sjjdbg" queueID="filediv_sjjdbg" outhtml="false" uploader="cgUploadController.do?saveFiles"  extend="office" buttonText='添加文件'  onUploadStart="sjjdbgOnUploadStart"> </t:upload>
			<div class="form" id="filediv_sjjdbg"></div>
			<script type="text/javascript">
				function sjjdbgOnUploadStart(file){
					var cgFormId=$("input[name='id']").val();
					$('#sjjdbg').uploadify("settings", "formData", {
						'cgFormId':cgFormId,
						'cgFormName':'test_filestore',
						'cgFormField':'SJJDBG'
					});
				}
			</script>
		</div>
				<span class="Validform_checktip"></span>
				<label class="Validform_label" style="display: none;">首件鉴定报告</label>
			</td>
		</tr>
		<tr>
			<td align="right">
				<label class="Validform_label">首件鉴定目录:</label>
			</td>
			<td class="value">
		<table id="sjjdml_fileTable"></table>
		<div class="form jeecgDetail">
			<t:upload name="sjjdml" id="sjjdml" queueID="filediv_sjjdml" outhtml="false" uploader="cgUploadController.do?saveFiles"  extend="office" buttonText='添加文件'  onUploadStart="sjjdmlOnUploadStart"> </t:upload>
			<div class="form" id="filediv_sjjdml"></div>
			<script type="text/javascript">
				function sjjdmlOnUploadStart(file){
					var cgFormId=$("input[name='id']").val();
					$('#sjjdml').uploadify("settings", "formData", {
						'cgFormId':cgFormId,
						'cgFormName':'test_filestore',
						'cgFormField':'SJJDML'
					});
				}
			</script>
		</div>
				<span class="Validform_checktip"></span>
				<label class="Validform_label" style="display: none;">首件鉴定目录</label>
			</td>
			<td align="right">
				<label class="Validform_label">用户评审意见:</label>
			</td>
			<td class="value">
		<table id="yhpsyj_fileTable"></table>
		<div class="form jeecgDetail">
			<t:upload name="yhpsyj" id="yhpsyj" queueID="filediv_yhpsyj" outhtml="false" uploader="cgUploadController.do?saveFiles"  extend="office" buttonText='添加文件'  onUploadStart="yhpsyjOnUploadStart"> </t:upload>
			<div class="form" id="filediv_yhpsyj"></div>
			<script type="text/javascript">
				function yhpsyjOnUploadStart(file){
					var cgFormId=$("input[name='id']").val();
					$('#yhpsyj').uploadify("settings", "formData", {
						'cgFormId':cgFormId,
						'cgFormName':'test_filestore',
						'cgFormField':'YHPSYJ'
					});
				}
			</script>
		</div>
				<span class="Validform_checktip"></span>
				<label class="Validform_label" style="display: none;">用户评审意见</label>
			</td>
		</tr>
		<tr>
			<td align="right">
				<label class="Validform_label">质量评审:</label>
			</td>
			<td class="value">
		<table id="zlps_fileTable"></table>
		<div class="form jeecgDetail">
			<t:upload name="zlps" id="zlps" queueID="filediv_zlps" outhtml="false" uploader="cgUploadController.do?saveFiles"  extend="office" buttonText='添加文件'  onUploadStart="zlpsOnUploadStart"> </t:upload>
			<div class="form" id="filediv_zlps"></div>
			<script type="text/javascript">
				function zlpsOnUploadStart(file){
					var cgFormId=$("input[name='id']").val();
					$('#zlps').uploadify("settings", "formData", {
						'cgFormId':cgFormId,
						'cgFormName':'test_filestore',
						'cgFormField':'ZLPS'
					});
				}
			</script>
		</div>
				<span class="Validform_checktip"></span>
				<label class="Validform_label" style="display: none;">质量评审</label>
			</td>
			<td align="right">
				<label class="Validform_label">ESD报告记录:</label>
			</td>
			<td class="value">
		<table id="esd_fileTable"></table>
		<div class="form jeecgDetail">
			<t:upload name="esd" id="esd" queueID="filediv_esd" outhtml="false" uploader="cgUploadController.do?saveFiles"  extend="office" buttonText='添加文件'  onUploadStart="esdOnUploadStart"> </t:upload>
			<div class="form" id="filediv_esd"></div>
			<script type="text/javascript">
				function esdOnUploadStart(file){
					var cgFormId=$("input[name='id']").val();
					$('#esd').uploadify("settings", "formData", {
						'cgFormId':cgFormId,
						'cgFormName':'test_filestore',
						'cgFormField':'ESD'
					});
				}
			</script>
		</div>
				<span class="Validform_checktip"></span>
				<label class="Validform_label" style="display: none;">ESD报告记录</label>
			</td>
		</tr>
		<tr>
			<td align="right">
				<label class="Validform_label">抗闩锁报告记录:</label>
			</td>
			<td class="value">
		<table id="kss_fileTable"></table>
		<div class="form jeecgDetail">
			<t:upload name="kss" id="kss" queueID="filediv_kss" outhtml="false" uploader="cgUploadController.do?saveFiles"  extend="office" buttonText='添加文件'  onUploadStart="kssOnUploadStart"> </t:upload>
			<div class="form" id="filediv_kss"></div>
			<script type="text/javascript">
				function kssOnUploadStart(file){
					var cgFormId=$("input[name='id']").val();
					$('#kss').uploadify("settings", "formData", {
						'cgFormId':cgFormId,
						'cgFormName':'test_filestore',
						'cgFormField':'KSS'
					});
				}
			</script>
		</div>
				<span class="Validform_checktip"></span>
				<label class="Validform_label" style="display: none;">抗闩锁报告记录</label>
			</td>
			<td align="right">
				<label class="Validform_label">总剂量报告:</label>
			</td>
			<td class="value">
		<table id="zjl_fileTable"></table>
		<div class="form jeecgDetail">
			<t:upload name="zjl" id="zjl" queueID="filediv_zjl" outhtml="false" uploader="cgUploadController.do?saveFiles"  extend="office" buttonText='添加文件'  onUploadStart="zjlOnUploadStart"> </t:upload>
			<div class="form" id="filediv_zjl"></div>
			<script type="text/javascript">
				function zjlOnUploadStart(file){
					var cgFormId=$("input[name='id']").val();
					$('#zjl').uploadify("settings", "formData", {
						'cgFormId':cgFormId,
						'cgFormName':'test_filestore',
						'cgFormField':'ZJL'
					});
				}
			</script>
		</div>
				<span class="Validform_checktip"></span>
				<label class="Validform_label" style="display: none;">总剂量报告</label>
			</td>
		</tr>
		<tr>
			<td align="right">
				<label class="Validform_label">单粒子报告:</label>
			</td>
			<td class="value">
		<table id="dlz_fileTable"></table>
		<div class="form jeecgDetail">
			<t:upload name="dlz" id="dlz" queueID="filediv_dlz" outhtml="false" uploader="cgUploadController.do?saveFiles"  extend="office" buttonText='添加文件'  onUploadStart="dlzOnUploadStart"> </t:upload>
			<div class="form" id="filediv_dlz"></div>
			<script type="text/javascript">
				function dlzOnUploadStart(file){
					var cgFormId=$("input[name='id']").val();
					$('#dlz').uploadify("settings", "formData", {
						'cgFormId':cgFormId,
						'cgFormName':'test_filestore',
						'cgFormField':'DLZ'
					});
				}
			</script>
		</div>
				<span class="Validform_checktip"></span>
				<label class="Validform_label" style="display: none;">单粒子报告</label>
			</td>
			<td align="right">
				<label class="Validform_label">寿命后水汽报告记录:</label>
			</td>
			<td class="value">
		<table id="smhsq_fileTable"></table>
		<div class="form jeecgDetail">
			<t:upload name="smhsq" id="smhsq" queueID="filediv_smhsq" outhtml="false" uploader="cgUploadController.do?saveFiles"  extend="office" buttonText='添加文件'  onUploadStart="smhsqOnUploadStart"> </t:upload>
			<div class="form" id="filediv_smhsq"></div>
			<script type="text/javascript">
				function smhsqOnUploadStart(file){
					var cgFormId=$("input[name='id']").val();
					$('#smhsq').uploadify("settings", "formData", {
						'cgFormId':cgFormId,
						'cgFormName':'test_filestore',
						'cgFormField':'SMHSQ'
					});
				}
			</script>
		</div>
				<span class="Validform_checktip"></span>
				<label class="Validform_label" style="display: none;">寿命后水汽报告记录</label>
			</td>
		</tr>
		<tr>
			<td align="right">
				<label class="Validform_label">筛合水汽报告记录:</label>
			</td>
			<td class="value">
		<table id="shsq_fileTable"></table>
		<div class="form jeecgDetail">
			<t:upload name="shsq" id="shsq" queueID="filediv_shsq" outhtml="false" uploader="cgUploadController.do?saveFiles"  extend="office" buttonText='添加文件'  onUploadStart="shsqOnUploadStart"> </t:upload>
			<div class="form" id="filediv_shsq"></div>
			<script type="text/javascript">
				function shsqOnUploadStart(file){
					var cgFormId=$("input[name='id']").val();
					$('#shsq').uploadify("settings", "formData", {
						'cgFormId':cgFormId,
						'cgFormName':'test_filestore',
						'cgFormField':'SHSQ'
					});
				}
			</script>
		</div>
				<span class="Validform_checktip"></span>
				<label class="Validform_label" style="display: none;">筛合水汽报告记录</label>
			</td>
			<td align="right">
				<label class="Validform_label">补充检验报告:</label>
			</td>
			<td class="value">
		     	 <input id="bcjybg" name="bcjybg" type="text" maxlength="200" style="width: 150px" class="inputxt"  ignore="ignore"  value='${testFilestorePage.bcjybg}'/>
				<span class="Validform_checktip"></span>
				<label class="Validform_label" style="display: none;">补充检验报告</label>
			</td>
		</tr>
		<tr>
			<td align="right">
				<label class="Validform_label">单批质保报告:</label>
			</td>
			<td class="value">
		     	 <input id="dpzbbg" name="dpzbbg" type="text" maxlength="200" style="width: 150px" class="inputxt"  ignore="ignore"  value='${testFilestorePage.dpzbbg}'/>
				<span class="Validform_checktip"></span>
				<label class="Validform_label" style="display: none;">单批质保报告</label>
			</td>
			<td align="right">
				<label class="Validform_label">归档卷宗号:</label>
			</td>
			<td class="value">
		     	 <input id="gdjzh" name="gdjzh" type="text" maxlength="32" style="width: 150px" class="inputxt"  ignore="ignore"  value='${testFilestorePage.gdjzh}'/>
				<span class="Validform_checktip"></span>
				<label class="Validform_label" style="display: none;">归档卷宗号</label>
			</td>
		</tr>
		<tr>
			<td align="right">
				<label class="Validform_label">其他信息附件:</label>
			</td>
			<td class="value">
		<table id="otherfileattach_fileTable"></table>
		<div class="form jeecgDetail">
			<t:upload name="otherfileattach" id="otherfileattach" queueID="filediv_otherfileattach" outhtml="false" uploader="cgUploadController.do?saveFiles"  extend="office" buttonText='添加文件'  onUploadStart="otherfileattachOnUploadStart"> </t:upload>
			<div class="form" id="filediv_otherfileattach"></div>
			<script type="text/javascript">
				function otherfileattachOnUploadStart(file){
					var cgFormId=$("input[name='id']").val();
					$('#otherfileattach').uploadify("settings", "formData", {
						'cgFormId':cgFormId,
						'cgFormName':'test_filestore',
						'cgFormField':'OTHERFILEATTACH'
					});
				}
			</script>
		</div>
				<span class="Validform_checktip"></span>
				<label class="Validform_label" style="display: none;">其他信息附件</label>
			</td>
			<td align="right">
				<label class="Validform_label">抗闩锁方案:</label>
			</td>
			<td class="value">
		<table id="kssfa_fileTable"></table>
		<div class="form jeecgDetail">
			<t:upload name="kssfa" id="kssfa" queueID="filediv_kssfa" outhtml="false" uploader="cgUploadController.do?saveFiles"  extend="office" buttonText='添加文件'  onUploadStart="kssfaOnUploadStart"> </t:upload>
			<div class="form" id="filediv_kssfa"></div>
			<script type="text/javascript">
				function kssfaOnUploadStart(file){
					var cgFormId=$("input[name='id']").val();
					$('#kssfa').uploadify("settings", "formData", {
						'cgFormId':cgFormId,
						'cgFormName':'test_filestore',
						'cgFormField':'KSSFA'
					});
				}
			</script>
		</div>
				<span class="Validform_checktip"></span>
				<label class="Validform_label" style="display: none;">抗闩锁方案</label>
			</td>
		</tr>
		<tr>
			<td align="right">
				<label class="Validform_label">总剂量方案:</label>
			</td>
			<td class="value">
		<table id="zjlfa_fileTable"></table>
		<div class="form jeecgDetail">
			<t:upload name="zjlfa" id="zjlfa" queueID="filediv_zjlfa" outhtml="false" uploader="cgUploadController.do?saveFiles"  extend="office" buttonText='添加文件'  onUploadStart="zjlfaOnUploadStart"> </t:upload>
			<div class="form" id="filediv_zjlfa"></div>
			<script type="text/javascript">
				function zjlfaOnUploadStart(file){
					var cgFormId=$("input[name='id']").val();
					$('#zjlfa').uploadify("settings", "formData", {
						'cgFormId':cgFormId,
						'cgFormName':'test_filestore',
						'cgFormField':'ZJLFA'
					});
				}
			</script>
		</div>
				<span class="Validform_checktip"></span>
				<label class="Validform_label" style="display: none;">总剂量方案</label>
			</td>
			<td align="right">
				<label class="Validform_label">单粒子方案:</label>
			</td>
			<td class="value">
		<table id="dlzfa_fileTable"></table>
		<div class="form jeecgDetail">
			<t:upload name="dlzfa" id="dlzfa" queueID="filediv_dlzfa" outhtml="false" uploader="cgUploadController.do?saveFiles"  extend="office" buttonText='添加文件'  onUploadStart="dlzfaOnUploadStart"> </t:upload>
			<div class="form" id="filediv_dlzfa"></div>
			<script type="text/javascript">
				function dlzfaOnUploadStart(file){
					var cgFormId=$("input[name='id']").val();
					$('#dlzfa').uploadify("settings", "formData", {
						'cgFormId':cgFormId,
						'cgFormName':'test_filestore',
						'cgFormField':'DLZFA'
					});
				}
			</script>
		</div>
				<span class="Validform_checktip"></span>
				<label class="Validform_label" style="display: none;">单粒子方案</label>
			</td>
		</tr>
		<tr>
			<td align="right">
				<label class="Validform_label">鉴定一致性自定义上传:</label>
			</td>
			<td class="value">
		<table id="jdyzzdy_fileTable"></table>
		<div class="form jeecgDetail">
			<t:upload name="jdyzzdy" id="jdyzzdy" queueID="filediv_jdyzzdy" outhtml="false" uploader="cgUploadController.do?saveFiles"  extend="office" buttonText='添加文件'  onUploadStart="jdyzzdyOnUploadStart"> </t:upload>
			<div class="form" id="filediv_jdyzzdy"></div>
			<script type="text/javascript">
				function jdyzzdyOnUploadStart(file){
					var cgFormId=$("input[name='id']").val();
					$('#jdyzzdy').uploadify("settings", "formData", {
						'cgFormId':cgFormId,
						'cgFormName':'test_filestore',
						'cgFormField':'JDYZZDY'
					});
				}
			</script>
		</div>
				<span class="Validform_checktip"></span>
				<label class="Validform_label" style="display: none;">鉴定一致性自定义上传</label>
			</td>
			<td align="right">
				<label class="Validform_label">PIND不合格数:</label>
			</td>
			<td class="value">
		     	 <input id="pindbhgs" name="pindbhgs" type="text" maxlength="32" style="width: 150px" class="inputxt"  ignore="ignore"  value='${testFilestorePage.pindbhgs}'/>
				<span class="Validform_checktip"></span>
				<label class="Validform_label" style="display: none;">PIND不合格数</label>
			</td>
		</tr>
		<tr>
			<td align="right">
				<label class="Validform_label">PIND分析报告:</label>
			</td>
			<td class="value">
		<table id="pindfxbg_fileTable"></table>
		<div class="form jeecgDetail">
			<t:upload name="pindfxbg" id="pindfxbg" queueID="filediv_pindfxbg" outhtml="false" uploader="cgUploadController.do?saveFiles"  extend="office" buttonText='添加文件'  onUploadStart="pindfxbgOnUploadStart"> </t:upload>
			<div class="form" id="filediv_pindfxbg"></div>
			<script type="text/javascript">
				function pindfxbgOnUploadStart(file){
					var cgFormId=$("input[name='id']").val();
					$('#pindfxbg').uploadify("settings", "formData", {
						'cgFormId':cgFormId,
						'cgFormName':'test_filestore',
						'cgFormField':'PINDFXBG'
					});
				}
			</script>
		</div>
				<span class="Validform_checktip"></span>
				<label class="Validform_label" style="display: none;">PIND分析报告</label>
			</td>
			<td align="right">
				<label class="Validform_label">投入测试数量:</label>
			</td>
			<td class="value">
		     	 <input id="fzhtrcssl" name="fzhtrcssl" type="text" maxlength="32" style="width: 150px" class="inputxt"  ignore="ignore"  value='${testFilestorePage.fzhtrcssl}'/>
				<span class="Validform_checktip"></span>
				<label class="Validform_label" style="display: none;">投入测试数量</label>
			</td>
		</tr>
		<tr>
			<td align="right">
				<label class="Validform_label">测试合格数量:</label>
			</td>
			<td class="value">
		     	 <input id="fzhcshgsl" name="fzhcshgsl" type="text" maxlength="32" style="width: 150px" class="inputxt"  ignore="ignore"  value='${testFilestorePage.fzhcshgsl}'/>
				<span class="Validform_checktip"></span>
				<label class="Validform_label" style="display: none;">测试合格数量</label>
			</td>
			<td align="right">
				<label class="Validform_label">封装后测试成品率:</label>
			</td>
			<td class="value">
		     	 <input id="fzhcscpl" name="fzhcscpl" type="text" maxlength="32" style="width: 150px" class="inputxt"  ignore="ignore"  value='${testFilestorePage.fzhcscpl}'/>
				<span class="Validform_checktip"></span>
				<label class="Validform_label" style="display: none;">封装后测试成品率</label>
			</td>
		</tr>
		<tr>
			<td align="right">
				<label class="Validform_label">封装成品率:</label>
			</td>
			<td class="value">
		     	 <input id="fzcpl" name="fzcpl" type="text" maxlength="32" style="width: 150px" class="inputxt"  ignore="ignore"  value='${testFilestorePage.fzcpl}'/>
				<span class="Validform_checktip"></span>
				<label class="Validform_label" style="display: none;">封装成品率</label>
			</td>
			<td align="right">
				<label class="Validform_label">筛选报告号:</label>
			</td>
			<td class="value">
		     	 <input id="sxbgh" name="sxbgh" type="text" maxlength="32" style="width: 150px" class="inputxt"  ignore="ignore"  value='${testFilestorePage.sxbgh}'/>
				<span class="Validform_checktip"></span>
				<label class="Validform_label" style="display: none;">筛选报告号</label>
			</td>
		</tr>
		<tr>
			<td align="right">
				<label class="Validform_label">鉴定一致性检验报告编号:</label>
			</td>
			<td class="value">
		     	 <input id="jdyzxjybgh" name="jdyzxjybgh" type="text" maxlength="32" style="width: 150px" class="inputxt"  ignore="ignore"  value='${testFilestorePage.jdyzxjybgh}'/>
				<span class="Validform_checktip"></span>
				<label class="Validform_label" style="display: none;">鉴定一致性检验报告编号</label>
			</td>
		</tr>
	
			</table>
			<div style="width: auto;height: 200px;">
				<%-- 增加一个div，用于调节页面大小，否则默认太小 --%>
				<div style="width:800px;height:1px;"></div>
				<t:tabs id="tt" iframe="false" tabPosition="top" fit="false">
				 <t:tab href="testFilestoreController.do?subcontractYsxxList&id=${testFilestorePage.id}" icon="icon-search" title="验收信息" id="subcontractYsxx"></t:tab>
				 <t:tab href="testFilestoreController.do?subcontractCqfxxxList&id=${testFilestorePage.id}" icon="icon-search" title="超期复验信息" id="subcontractCqfxxx"></t:tab>
				 <t:tab href="testFilestoreController.do?subcontractBcsxxxList&id=${testFilestorePage.id}" icon="icon-search" title="补充筛选信息" id="subcontractBcsxxx"></t:tab>
				 <t:tab href="testFilestoreController.do?subcontractDdsqbgList&id=${testFilestorePage.id}" icon="icon-search" title="单独水汽报告" id="subcontractDdsqbg"></t:tab>
				 <t:tab href="testFilestoreController.do?subcontractDpaList&id=${testFilestorePage.id}" icon="icon-search" title="dpa" id="subcontractDpa"></t:tab>
				 <t:tab href="testFilestoreController.do?subcontractJianzhiList&id=${testFilestorePage.id}" icon="icon-search" title="监制" id="subcontractJianzhi"></t:tab>
				 <t:tab href="testFilestoreController.do?subcontractCsbhgqkList&id=${testFilestorePage.id}" icon="icon-search" title="测试不合格情况" id="subcontractCsbhgqk"></t:tab>
				 <t:tab href="testFilestoreController.do?subcontractFzbhgqkList&id=${testFilestorePage.id}" icon="icon-search" title="封装不合格情况" id="subcontractFzbhgqk"></t:tab>
				 <t:tab href="testFilestoreController.do?subcontractSxbhgqkList&id=${testFilestorePage.id}" icon="icon-search" title="筛选不合格情况" id="subcontractSxbhgqk"></t:tab>
				</t:tabs>
			</div>
			</t:formvalid>
			<!-- 添加 附表明细 模版 -->
		<table style="display:none">
		<tbody id="add_subcontractYsxx_table_template">
			<tr>
			 <td align="center"><div style="width: 25px;" name="xh"></div></td>
			 <td align="center"><input style="width:20px;" type="checkbox" name="ck"/></td>
				  <td align="left">
					  		<input name="subcontractYsxxList[#index#].ysbgh" maxlength="32" type="text" class="inputxt"  style="width:120px;"  ignore="ignore" />
					  <label class="Validform_label" style="display: none;">验收报告号</label>
				  </td>
				  <td align="left">
										<input type="hidden" id="subcontractYsxxList[#index#].ysfileattach" name="subcontractYsxxList[#index#].ysfileattach" />
									    <input class="ui-button" type="button" value="上传附件" name="subcontractYsxxList[#index#].imgBtn"
													onclick="commonUpload(commonUploadDefaultCallBack,'subcontractYsxxList\\[#index#\\]\\.ysfileattach')"/>
										<a  target="_blank" id="subcontractYsxxList[#index#].ysfileattach_href"></a>
					  <label class="Validform_label" style="display: none;">验收附件</label>
				  </td>
			</tr>
		 </tbody>
		<tbody id="add_subcontractCqfxxx_table_template">
			<tr>
			 <td align="center"><div style="width: 25px;" name="xh"></div></td>
			 <td align="center"><input style="width:20px;" type="checkbox" name="ck"/></td>
				  <td align="left">
					  		<input name="subcontractCqfxxxList[#index#].cqfybgh" maxlength="32" type="text" class="inputxt"  style="width:120px;"  ignore="ignore" />
					  <label class="Validform_label" style="display: none;">超期复验报告号</label>
				  </td>
				  <td align="left">
					  		<input name="subcontractCqfxxxList[#index#].cqfystarttime" maxlength="32" type="text" class="inputxt"  style="width:120px;"  ignore="ignore" />
					  <label class="Validform_label" style="display: none;">超期复验开始时间</label>
				  </td>
				  <td align="left">
					  		<input name="subcontractCqfxxxList[#index#].cqfyendtime" maxlength="32" type="text" class="inputxt"  style="width:120px;"  ignore="ignore" />
					  <label class="Validform_label" style="display: none;">超期复验结束时间</label>
				  </td>
				  <td align="left">
					  		<input name="subcontractCqfxxxList[#index#].cqfylb" maxlength="32" type="text" class="inputxt"  style="width:120px;"  ignore="ignore" />
					  <label class="Validform_label" style="display: none;">超期复验类别</label>
				  </td>
				  <td align="left">
					  		<input name="subcontractCqfxxxList[#index#].cqfyhgzl" maxlength="32" type="text" class="inputxt"  style="width:120px;"  ignore="ignore" />
					  <label class="Validform_label" style="display: none;">超期复验合格数量</label>
				  </td>
				  <td align="left">
										<input type="hidden" id="subcontractCqfxxxList[#index#].cqfyfileattach" name="subcontractCqfxxxList[#index#].cqfyfileattach" />
									    <input class="ui-button" type="button" value="上传附件" name="subcontractCqfxxxList[#index#].imgBtn"
													onclick="commonUpload(commonUploadDefaultCallBack,'subcontractCqfxxxList\\[#index#\\]\\.cqfyfileattach')"/>
										<a  target="_blank" id="subcontractCqfxxxList[#index#].cqfyfileattach_href"></a>
					  <label class="Validform_label" style="display: none;">超期复验附件</label>
				  </td>
			</tr>
		 </tbody>
		<tbody id="add_subcontractBcsxxx_table_template">
			<tr>
			 <td align="center"><div style="width: 25px;" name="xh"></div></td>
			 <td align="center"><input style="width:20px;" type="checkbox" name="ck"/></td>
				  <td align="left">
					  		<input name="subcontractBcsxxxList[#index#].bcsxbgh" maxlength="32" type="text" class="inputxt"  style="width:120px;"  ignore="ignore" />
					  <label class="Validform_label" style="display: none;">补充筛选报告号</label>
				  </td>
				  <td align="left">
					  		<input name="subcontractBcsxxxList[#index#].bcsxstarttime" maxlength="32" type="text" class="inputxt"  style="width:120px;"  ignore="ignore" />
					  <label class="Validform_label" style="display: none;">补充筛选开始时间</label>
				  </td>
				  <td align="left">
					  		<input name="subcontractBcsxxxList[#index#].bcsxendtime" maxlength="32" type="text" class="inputxt"  style="width:120px;"  ignore="ignore" />
					  <label class="Validform_label" style="display: none;">补充筛选结束时间</label>
				  </td>
				  <td align="left">
					  		<input name="subcontractBcsxxxList[#index#].bcsxwtdw" maxlength="100" type="text" class="inputxt"  style="width:120px;"  ignore="ignore" />
					  <label class="Validform_label" style="display: none;">补充筛选委托单位</label>
				  </td>
				  <td align="left">
					  		<input name="subcontractBcsxxxList[#index#].bcsxtrsl" maxlength="32" type="text" class="inputxt"  style="width:120px;"  ignore="ignore" />
					  <label class="Validform_label" style="display: none;">补充筛选投入数量</label>
				  </td>
				  <td align="left">
					  		<input name="subcontractBcsxxxList[#index#].bcsxhgzl" maxlength="32" type="text" class="inputxt"  style="width:120px;"  ignore="ignore" />
					  <label class="Validform_label" style="display: none;">补充筛选合格数量</label>
				  </td>
				  <td align="left">
					  		<input name="subcontractBcsxxxList[#index#].bcsxbhgqk" maxlength="200" type="text" class="inputxt"  style="width:120px;"  ignore="ignore" />
					  <label class="Validform_label" style="display: none;">补充筛选不合格情况</label>
				  </td>
				  <td align="left">
										<input type="hidden" id="subcontractBcsxxxList[#index#].bcsxfileattach" name="subcontractBcsxxxList[#index#].bcsxfileattach" />
									    <input class="ui-button" type="button" value="上传附件" name="subcontractBcsxxxList[#index#].imgBtn"
													onclick="commonUpload(commonUploadDefaultCallBack,'subcontractBcsxxxList\\[#index#\\]\\.bcsxfileattach')"/>
										<a  target="_blank" id="subcontractBcsxxxList[#index#].bcsxfileattach_href"></a>
					  <label class="Validform_label" style="display: none;">补充筛选附件</label>
				  </td>
			</tr>
		 </tbody>
		<tbody id="add_subcontractDdsqbg_table_template">
			<tr>
			 <td align="center"><div style="width: 25px;" name="xh"></div></td>
			 <td align="center"><input style="width:20px;" type="checkbox" name="ck"/></td>
				  <td align="left">
					  		<input name="subcontractDdsqbgList[#index#].ddsqbgh" maxlength="32" type="text" class="inputxt"  style="width:120px;"  ignore="ignore" />
					  <label class="Validform_label" style="display: none;">单独水汽报告号</label>
				  </td>
				  <td align="left">
					  		<input name="subcontractDdsqbgList[#index#].sqjcjg" maxlength="200" type="text" class="inputxt"  style="width:120px;"  ignore="ignore" />
					  <label class="Validform_label" style="display: none;">水汽检测机构</label>
				  </td>
				  <td align="left">
					  		<input name="subcontractDdsqbgList[#index#].sqjcstarttime" maxlength="32" type="text" class="inputxt"  style="width:120px;"  ignore="ignore" />
					  <label class="Validform_label" style="display: none;">水汽检测开始时间</label>
				  </td>
				  <td align="left">
					  		<input name="subcontractDdsqbgList[#index#].sqjcendtime" maxlength="32" type="text" class="inputxt"  style="width:120px;"  ignore="ignore" />
					  <label class="Validform_label" style="display: none;">水汽检测结束时间</label>
				  </td>
				  <td align="left">
										<input type="hidden" id="subcontractDdsqbgList[#index#].fileattach" name="subcontractDdsqbgList[#index#].fileattach" />
									    <input class="ui-button" type="button" value="上传附件" name="subcontractDdsqbgList[#index#].imgBtn"
													onclick="commonUpload(commonUploadDefaultCallBack,'subcontractDdsqbgList\\[#index#\\]\\.fileattach')"/>
										<a  target="_blank" id="subcontractDdsqbgList[#index#].fileattach_href"></a>
					  <label class="Validform_label" style="display: none;">文件上传</label>
				  </td>
			</tr>
		 </tbody>
		<tbody id="add_subcontractDpa_table_template">
			<tr>
			 <td align="center"><div style="width: 25px;" name="xh"></div></td>
			 <td align="center"><input style="width:20px;" type="checkbox" name="ck"/></td>
				  <td align="left">
					  		<input name="subcontractDpaList[#index#].dpabgh" maxlength="32" type="text" class="inputxt"  style="width:120px;"  ignore="ignore" />
					  <label class="Validform_label" style="display: none;">DPA报告号</label>
				  </td>
				  <td align="left">
					  		<input name="subcontractDpaList[#index#].dpajcjg" maxlength="200" type="text" class="inputxt"  style="width:120px;"  ignore="ignore" />
					  <label class="Validform_label" style="display: none;">DPA检测机构</label>
				  </td>
				  <td align="left">
					  		<input name="subcontractDpaList[#index#].dpaypsl" maxlength="32" type="text" class="inputxt"  style="width:120px;"  ignore="ignore" />
					  <label class="Validform_label" style="display: none;">DPA样品数量</label>
				  </td>
				  <td align="left">
					  		<input name="subcontractDpaList[#index#].dpastarttime" maxlength="32" type="text" class="inputxt"  style="width:120px;"  ignore="ignore" />
					  <label class="Validform_label" style="display: none;">DPA试验开始时间</label>
				  </td>
				  <td align="left">
					  		<input name="subcontractDpaList[#index#].dpaendtime" maxlength="32" type="text" class="inputxt"  style="width:120px;"  ignore="ignore" />
					  <label class="Validform_label" style="display: none;">DPA试验结束时间</label>
				  </td>
				  <td align="left">
										<input type="hidden" id="subcontractDpaList[#index#].dpafileattach" name="subcontractDpaList[#index#].dpafileattach" />
									    <input class="ui-button" type="button" value="上传附件" name="subcontractDpaList[#index#].imgBtn"
													onclick="commonUpload(commonUploadDefaultCallBack,'subcontractDpaList\\[#index#\\]\\.dpafileattach')"/>
										<a  target="_blank" id="subcontractDpaList[#index#].dpafileattach_href"></a>
					  <label class="Validform_label" style="display: none;">文件上传</label>
				  </td>
			</tr>
		 </tbody>
		<tbody id="add_subcontractJianzhi_table_template">
			<tr>
			 <td align="center"><div style="width: 25px;" name="xh"></div></td>
			 <td align="center"><input style="width:20px;" type="checkbox" name="ck"/></td>
				  <td align="left">
					  		<input name="subcontractJianzhiList[#index#].jzbgh" maxlength="32" type="text" class="inputxt"  style="width:120px;"  ignore="ignore" />
					  <label class="Validform_label" style="display: none;">监制报告号</label>
				  </td>
				  <td align="left">
					  		<input name="subcontractJianzhiList[#index#].jzdw" maxlength="200" type="text" class="inputxt"  style="width:120px;"  ignore="ignore" />
					  <label class="Validform_label" style="display: none;">监制单位</label>
				  </td>
				  <td align="left">
					  		<input name="subcontractJianzhiList[#index#].jzsl" maxlength="32" type="text" class="inputxt"  style="width:120px;"  ignore="ignore" />
					  <label class="Validform_label" style="display: none;">监制数量</label>
				  </td>
				  <td align="left">
					  		<input name="subcontractJianzhiList[#index#].jzsj" maxlength="32" type="text" class="inputxt"  style="width:120px;"  ignore="ignore" />
					  <label class="Validform_label" style="display: none;">监制时间</label>
				  </td>
				  <td align="left">
										<input type="hidden" id="subcontractJianzhiList[#index#].jzfileattach" name="subcontractJianzhiList[#index#].jzfileattach" />
									    <input class="ui-button" type="button" value="上传附件" name="subcontractJianzhiList[#index#].imgBtn"
													onclick="commonUpload(commonUploadDefaultCallBack,'subcontractJianzhiList\\[#index#\\]\\.jzfileattach')"/>
										<a  target="_blank" id="subcontractJianzhiList[#index#].jzfileattach_href"></a>
					  <label class="Validform_label" style="display: none;">文件</label>
				  </td>
			</tr>
		 </tbody>
		<tbody id="add_subcontractCsbhgqk_table_template">
			<tr>
			 <td align="center"><div style="width: 25px;" name="xh"></div></td>
			 <td align="center"><input style="width:20px;" type="checkbox" name="ck"/></td>
				  <td align="left">
					  		<input name="subcontractCsbhgqkList[#index#].normal" maxlength="32" type="text" class="inputxt"  style="width:120px;"  ignore="ignore" />
					  <label class="Validform_label" style="display: none;">常温</label>
				  </td>
				  <td align="left">
					  		<input name="subcontractCsbhgqkList[#index#].high" maxlength="32" type="text" class="inputxt"  style="width:120px;"  ignore="ignore" />
					  <label class="Validform_label" style="display: none;">高温</label>
				  </td>
				  <td align="left">
					  		<input name="subcontractCsbhgqkList[#index#].low" maxlength="32" type="text" class="inputxt"  style="width:120px;"  ignore="ignore" />
					  <label class="Validform_label" style="display: none;">低温</label>
				  </td>
				  <td align="left">
					  		<input name="subcontractCsbhgqkList[#index#].fileid" maxlength="32" type="text" class="inputxt"  style="width:120px;"  ignore="ignore" />
					  <label class="Validform_label" style="display: none;">文件id</label>
				  </td>
			</tr>
		 </tbody>
		<tbody id="add_subcontractFzbhgqk_table_template">
			<tr>
			 <td align="center"><div style="width: 25px;" name="xh"></div></td>
			 <td align="center"><input style="width:20px;" type="checkbox" name="ck"/></td>
				  <td align="left">
					  		<input name="subcontractFzbhgqkList[#index#].jhqjy" maxlength="32" type="text" class="inputxt"  style="width:120px;"  ignore="ignore" />
					  <label class="Validform_label" style="display: none;">键合前检验</label>
				  </td>
				  <td align="left">
					  		<input name="subcontractFzbhgqkList[#index#].jhjy" maxlength="32" type="text" class="inputxt"  style="width:120px;"  ignore="ignore" />
					  <label class="Validform_label" style="display: none;">键合检验</label>
				  </td>
				  <td align="left">
					  		<input name="subcontractFzbhgqkList[#index#].fmqjj" maxlength="32" type="text" class="inputxt"  style="width:120px;"  ignore="ignore" />
					  <label class="Validform_label" style="display: none;">封帽前镜检</label>
				  </td>
				  <td align="left">
					  		<input name="subcontractFzbhgqkList[#index#].fmjj" maxlength="32" type="text" class="inputxt"  style="width:120px;"  ignore="ignore" />
					  <label class="Validform_label" style="display: none;">封帽镜检</label>
				  </td>
				  <td align="left">
					  		<input name="subcontractFzbhgqkList[#index#].fzpind" maxlength="32" type="text" class="inputxt"  style="width:120px;"  ignore="ignore" />
					  <label class="Validform_label" style="display: none;">PIND</label>
				  </td>
				  <td align="left">
					  		<input name="subcontractFzbhgqkList[#index#].xjl" maxlength="32" type="text" class="inputxt"  style="width:120px;"  ignore="ignore" />
					  <label class="Validform_label" style="display: none;">细检漏</label>
				  </td>
				  <td align="left">
					  		<input name="subcontractFzbhgqkList[#index#].cjl" maxlength="32" type="text" class="inputxt"  style="width:120px;"  ignore="ignore" />
					  <label class="Validform_label" style="display: none;">粗检漏</label>
				  </td>
				  <td align="left">
					  		<input name="subcontractFzbhgqkList[#index#].qjcx" maxlength="32" type="text" class="inputxt"  style="width:120px;"  ignore="ignore" />
					  <label class="Validform_label" style="display: none;">切筋成形</label>
				  </td>
				  <td align="left">
					  		<input name="subcontractFzbhgqkList[#index#].wbmj" maxlength="32" type="text" class="inputxt"  style="width:120px;"  ignore="ignore" />
					  <label class="Validform_label" style="display: none;">外部目检</label>
				  </td>
				  <td align="left">
					  		<input name="subcontractFzbhgqkList[#index#].fileid" maxlength="32" type="text" class="inputxt"  style="width:120px;"  ignore="ignore" />
					  <label class="Validform_label" style="display: none;">文件id</label>
				  </td>
			</tr>
		 </tbody>
		<tbody id="add_subcontractSxbhgqk_table_template">
			<tr>
			 <td align="center"><div style="width: 25px;" name="xh"></div></td>
			 <td align="center"><input style="width:20px;" type="checkbox" name="ck"/></td>
				  <td align="left">
					  		<input name="subcontractSxbhgqkList[#index#].sxbhgpind" maxlength="32" type="text" class="inputxt"  style="width:120px;"  ignore="ignore" />
					  <label class="Validform_label" style="display: none;">PIND</label>
				  </td>
				  <td align="left">
					  		<input name="subcontractSxbhgqkList[#index#].sxllqdcs" maxlength="32" type="text" class="inputxt"  style="width:120px;"  ignore="ignore" />
					  <label class="Validform_label" style="display: none;">老炼前电测试</label>
				  </td>
				  <td align="left">
					  		<input name="subcontractSxbhgqkList[#index#].sxdtllhdcs" maxlength="32" type="text" class="inputxt"  style="width:120px;"  ignore="ignore" />
					  <label class="Validform_label" style="display: none;">动态老炼后电测试</label>
				  </td>
				  <td align="left">
					  		<input name="subcontractSxbhgqkList[#index#].sxjtllhdcs" maxlength="32" type="text" class="inputxt"  style="width:120px;"  ignore="ignore" />
					  <label class="Validform_label" style="display: none;">静态老炼后电测试</label>
				  </td>
				  <td align="left">
					  		<input name="subcontractSxbhgqkList[#index#].sxzzdcs" maxlength="32" type="text" class="inputxt"  style="width:120px;"  ignore="ignore" />
					  <label class="Validform_label" style="display: none;">最终电测试</label>
				  </td>
				  <td align="left">
					  		<input name="subcontractSxbhgqkList[#index#].sxxjl" maxlength="32" type="text" class="inputxt"  style="width:120px;"  ignore="ignore" />
					  <label class="Validform_label" style="display: none;">细检漏</label>
				  </td>
				  <td align="left">
					  		<input name="subcontractSxbhgqkList[#index#].sxcjl" maxlength="32" type="text" class="inputxt"  style="width:120px;"  ignore="ignore" />
					  <label class="Validform_label" style="display: none;">粗检漏</label>
				  </td>
				  <td align="left">
					  		<input name="subcontractSxbhgqkList[#index#].sxxsx" maxlength="32" type="text" class="inputxt"  style="width:120px;"  ignore="ignore" />
					  <label class="Validform_label" style="display: none;">X射线</label>
				  </td>
				  <td align="left">
					  		<input name="subcontractSxbhgqkList[#index#].sxwbmj" maxlength="32" type="text" class="inputxt"  style="width:120px;"  ignore="ignore" />
					  <label class="Validform_label" style="display: none;">外部目检</label>
				  </td>
				  <td align="left">
					  		<input name="subcontractSxbhgqkList[#index#].fileid" maxlength="32" type="text" class="inputxt"  style="width:120px;"  ignore="ignore" />
					  <label class="Validform_label" style="display: none;">文件id</label>
				  </td>
			</tr>
		 </tbody>
		</table>
 </body>
 <script src = "webpage/com/jeecg/filemanage/testFilestore.js"></script>	
  	<script type="text/javascript">
	  	//加载 已存在的 文件
	  	$(function(){
	  		var cgFormId=$("input[name='id']").val();
	  		$.ajax({
	  		   type: "post",
	  		   url: "testFilestoreController.do?getFiles&id=" +  cgFormId,
	  		   success: function(data){
	  			 var arrayFileObj = jQuery.parseJSON(data).obj;
	  			 
	  			$.each(arrayFileObj,function(n,file){
	  				var fieldName = file.field.toLowerCase();
	  				var table = $("#"+fieldName+"_fileTable");
	  				var tr = $("<tr style=\"height:34px;\"></tr>");
	  				var title = file.title;
	  				if(title.length > 15){
	  					title = title.substring(0,12) + "...";
	  				}
	  				var td_title = $("<td>" + title + "</td>");
	  		  		var td_download = $("<td><a style=\"margin-left:10px;\" href=\"commonController.do?viewFile&fileid=" + file.fileKey + "&subclassname=org.jeecgframework.web.cgform.entity.upload.CgUploadEntity\" title=\"下载\">下载</a></td>")
	  		  		var td_view = $("<td><a style=\"margin-left:10px;\" href=\"javascript:void(0);\" onclick=\"openwindow('预览','commonController.do?openViewFile&fileid=" + file.fileKey + "&subclassname=org.jeecgframework.web.cgform.entity.upload.CgUploadEntity','fList',700,500)\">预览</a></td>");
	  		  		tr.appendTo(table);
	  		  		td_title.appendTo(tr);
	  		  		td_download.appendTo(tr);
	  		  		td_view.appendTo(tr);
		  		  		if(location.href.indexOf("load=detail")==-1){
			  		  		var td_del = $("<td><a style=\"margin-left:10px;\" href=\"javascript:void(0)\" class=\"jeecgDetail\" onclick=\"del('cgUploadController.do?delFile&id=" + file.fileKey + "',this)\">删除</a></td>");
			  		  		td_del.appendTo(tr);
		  		  		}
	  		  		
	  			 });
	  		   }
	  		});
	  	})
	  	
		  	/**
		 	 * 删除图片数据资源
		 	 */
		  	function del(url,obj){
		  		var content = "请问是否要删除该资源";
		  		var navigatorName = "Microsoft Internet Explorer"; 
		  		if( navigator.appName == navigatorName ){ 
		  			$.dialog.confirm(content, function(){
		  				submit(url,obj);
		  			}, function(){
		  			});
		  		}else{
		  			layer.open({
						title:"提示",
						content:content,
						icon:7,
						yes:function(index){
							submit(url,obj);
						},
						btn:['确定','取消'],
						btn2:function(index){
							layer.close(index);
						}
					});
		  		}
		  	}
		  	
		  	function submit(url,obj){
		  		$.ajax({
		  			async : false,
		  			cache : false,
		  			type : 'POST',
		  			url : url,// 请求的action路径
		  			error : function() {// 请求失败处理函数
		  			},
		  			success : function(data) {
		  				var d = $.parseJSON(data);
		  				if (d.success) {
		  					var msg = d.msg;
		  					tip(msg);
		  					obj.parentNode.parentNode.parentNode.deleteRow(obj.parentNode.parentNode);
		  				} else {
		  					tip(d.msg);
		  				}
		  			}
		  		});
		  	}
	  	
  		function jeecgFormFileCallBack(data){
  			if (data.success == true) {
				uploadFile(data);
			} else {
				if (data.responseText == '' || data.responseText == undefined) {
					$.messager.alert('错误', data.msg);
					$.Hidemsg();
				} else {
					try {
						var emsg = data.responseText.substring(data.responseText.indexOf('错误描述'), data.responseText.indexOf('错误信息'));
						$.messager.alert('错误', emsg);
						$.Hidemsg();
					} catch(ex) {
						$.messager.alert('错误', data.responseText + '');
					}
				}
				return false;
			}
			if (!neibuClickFlag) {
				var win = frameElement.api.opener;
				win.reloadTable();
			}
  		}
  		function upload() {
					$('#jzbgh').uploadify('upload', '*');
					$('#fzbhgqk').uploadify('upload', '*');
					$('#sxbghfile').uploadify('upload', '*');
					$('#sxqzsj').uploadify('upload', '*');
					$('#sxbhgqk').uploadify('upload', '*');
					$('#threebg').uploadify('upload', '*');
					$('#dcplzlfxbg').uploadify('upload', '*');
					$('#jdbgbhfile').uploadify('upload', '*');
					$('#sjjdbg').uploadify('upload', '*');
					$('#sjjdml').uploadify('upload', '*');
					$('#yhpsyj').uploadify('upload', '*');
					$('#zlps').uploadify('upload', '*');
					$('#esd').uploadify('upload', '*');
					$('#kss').uploadify('upload', '*');
					$('#zjl').uploadify('upload', '*');
					$('#dlz').uploadify('upload', '*');
					$('#smhsq').uploadify('upload', '*');
					$('#shsq').uploadify('upload', '*');
					$('#otherfileattach').uploadify('upload', '*');
					$('#kssfa').uploadify('upload', '*');
					$('#zjlfa').uploadify('upload', '*');
					$('#dlzfa').uploadify('upload', '*');
					$('#jdyzzdy').uploadify('upload', '*');
					$('#pindfxbg').uploadify('upload', '*');
		}
		
		var neibuClickFlag = false;
		function neibuClick() {
			neibuClickFlag = true; 
			$('#btn_sub').trigger('click');
		}
		function cancel() {
					$('#jzbgh').uploadify('cancel', '*');
					$('#fzbhgqk').uploadify('cancel', '*');
					$('#sxbghfile').uploadify('cancel', '*');
					$('#sxqzsj').uploadify('cancel', '*');
					$('#sxbhgqk').uploadify('cancel', '*');
					$('#threebg').uploadify('cancel', '*');
					$('#dcplzlfxbg').uploadify('cancel', '*');
					$('#jdbgbhfile').uploadify('cancel', '*');
					$('#sjjdbg').uploadify('cancel', '*');
					$('#sjjdml').uploadify('cancel', '*');
					$('#yhpsyj').uploadify('cancel', '*');
					$('#zlps').uploadify('cancel', '*');
					$('#esd').uploadify('cancel', '*');
					$('#kss').uploadify('cancel', '*');
					$('#zjl').uploadify('cancel', '*');
					$('#dlz').uploadify('cancel', '*');
					$('#smhsq').uploadify('cancel', '*');
					$('#shsq').uploadify('cancel', '*');
					$('#otherfileattach').uploadify('cancel', '*');
					$('#kssfa').uploadify('cancel', '*');
					$('#zjlfa').uploadify('cancel', '*');
					$('#dlzfa').uploadify('cancel', '*');
					$('#jdyzzdy').uploadify('cancel', '*');
					$('#pindfxbg').uploadify('cancel', '*');
		}
		function uploadFile(data){
			if(!$("input[name='id']").val()){
				if(data.obj!=null && data.obj!='undefined'){
					$("input[name='id']").val(data.obj.id);
				}
			}
			if($(".uploadify-queue-item").length>0){
				upload();
			}else{
				if (neibuClickFlag){
					alert(data.msg);
					neibuClickFlag = false;
				}else {
					var win = frameElement.api.opener;
					win.reloadTable();
					win.tip(data.msg);
					frameElement.api.close();
				}
			}
		}
  	</script>
