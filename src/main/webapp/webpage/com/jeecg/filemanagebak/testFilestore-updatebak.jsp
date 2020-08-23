<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<!DOCTYPE html>
<html>
 <head>
  <title>文件管理</title>
  <t:base type="jquery,easyui,tools,DatePicker"></t:base>
  <t:base type="uploadify"></t:base>
  <script type="text/javascript">
  //编写自定义JS代码
  </script>
 </head>
 <body>
		<t:formvalid formid="formobj" dialog="true" usePlugin="password" layout="table" action="testFilestoreController.do?doUpdate" callback="jeecgFormFileCallBack@Override">
					<input id="id" name="id" type="hidden" value="${testFilestorePage.id }"/>
		<table style="width: 100%;" cellpadding="0" cellspacing="1" class="formtable">
					<tr>
						<td align="right">
							<label class="Validform_label">
								阶段标识:
							</label>
						</td>
						<td class="value">
									<t:dictSelect field="bpmStatus" type="list"  typeGroupCode="filestatus"   defaultVal="${testFilestorePage.bpmStatus}" hasLabel="false"  title="阶段标识" ></t:dictSelect>     
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">阶段标识</label>
						</td>
						<td align="right">
							<label class="Validform_label">
								型号:
							</label>
						</td>
						<td class="value">
						    <input id="xh" name="xh" type="text" maxlength="32" style="width: 150px" class="inputxt"  ignore="checked"  value='${testFilestorePage.xh}'/>
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">型号</label>
						</td>
					</tr>
					<tr>
						<td align="right">
							<label class="Validform_label">
								电路名称:
							</label>
						</td>
						<td class="value">
						    <input id="dlmc" name="dlmc" type="text" maxlength="100" style="width: 150px" class="inputxt"  ignore="checked"  value='${testFilestorePage.dlmc}'/>
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">电路名称</label>
						</td>
						<td align="right">
							<label class="Validform_label">
								批次:
							</label>
						</td>
						<td class="value">
						    <input id="pc" name="pc" type="text" maxlength="32" style="width: 150px" class="inputxt"  ignore="checked"  value='${testFilestorePage.pc}'/>
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">批次</label>
						</td>
					</tr>
					<tr>
						<td align="right">
							<label class="Validform_label">
								任务通知单号:
							</label>
						</td>
						<td class="value">
						    <input id="rwtzdh" name="rwtzdh" type="text" maxlength="50" style="width: 150px" class="inputxt"  ignore="checked"  value='${testFilestorePage.rwtzdh}'/>
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">任务通知单号</label>
						</td>
						<td align="right">
							<label class="Validform_label">
								任务数量:
							</label>
						</td>
						<td class="value">
						    <input id="rwsl" name="rwsl" type="text" maxlength="32" style="width: 150px" class="inputxt"  ignore="checked"  value='${testFilestorePage.rwsl}'/>
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">任务数量</label>
						</td>
					</tr>
					<tr>
						<td align="right">
							<label class="Validform_label">
								执行规范号:
							</label>
						</td>
						<td class="value">
						    <input id="zxgfh" name="zxgfh" type="text" maxlength="32" style="width: 150px" class="inputxt"  ignore="checked"  value='${testFilestorePage.zxgfh}'/>
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">执行规范号</label>
						</td>
						<td align="right">
							<label class="Validform_label">
								质量等级:
							</label>
						</td>
						<td class="value">
						    <input id="zldj" name="zldj" type="text" maxlength="32" style="width: 150px" class="inputxt"  ignore="checked"  value='${testFilestorePage.zldj}'/>
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">质量等级</label>
						</td>
					</tr>
					<tr>
						<td align="right">
							<label class="Validform_label">
								封装形式:
							</label>
						</td>
						<td class="value">
						    <input id="fzxs" name="fzxs" type="text" maxlength="50" style="width: 150px" class="inputxt"  ignore="checked"  value='${testFilestorePage.fzxs}'/>
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">封装形式</label>
						</td>
						<td align="right">
							<label class="Validform_label">
								芯片标识:
							</label>
						</td>
						<td class="value">
						    <input id="xpbs" name="xpbs" type="text" maxlength="50" style="width: 150px" class="inputxt"  ignore="ignore"  value='${testFilestorePage.xpbs}'/>
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">芯片标识</label>
						</td>
					</tr>
					<tr>
						<td align="right">
							<label class="Validform_label">
								圆片批次:
							</label>
						</td>
						<td class="value">
						    <input id="yppc" name="yppc" type="text" maxlength="32" style="width: 150px" class="inputxt"  ignore="ignore"  value='${testFilestorePage.yppc}'/>
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">圆片批次</label>
						</td>
						<td align="right">
							<label class="Validform_label">
								圆片号:
							</label>
						</td>
						<td class="value">
						    <input id="yph" name="yph" type="text" maxlength="32" style="width: 150px" class="inputxt"  ignore="ignore"  value='${testFilestorePage.yph}'/>
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">圆片号</label>
						</td>
					</tr>
					<tr>
						<td align="right">
							<label class="Validform_label">
								监制报告号:
							</label>
						</td>
						<td class="value">
							<t:webUploader auto="true" pathValues="${testFilestorePage.jzbgh}" name="jzbgh" duplicate="true" fileNumLimit="5" datatype="*"></t:webUploader>
						</td>
						<td align="right">
							<label class="Validform_label">
								监制单位:
							</label>
						</td>
						<td class="value">
						    <input id="jzdw" name="jzdw" type="text" maxlength="100" style="width: 150px" class="inputxt"  ignore="ignore"  value='${testFilestorePage.jzdw}'/>
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">监制单位</label>
						</td>
					</tr>
					<tr>
						<td align="right">
							<label class="Validform_label">
								监制数量:
							</label>
						</td>
						<td class="value">
						    <input id="jzsl" name="jzsl" type="text" maxlength="32" style="width: 150px" class="inputxt"  ignore="ignore"  value='${testFilestorePage.jzsl}'/>
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">监制数量</label>
						</td>
						<td align="right">
							<label class="Validform_label">
								监制时间:
							</label>
						</td>
						<td class="value">
						    <input id="jzsj" name="jzsj" type="text" maxlength="32" style="width: 150px" class="inputxt"  ignore="ignore"  value='${testFilestorePage.jzsj}'/>
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">监制时间</label>
						</td>
					</tr>
					<tr>
						<td align="right">
							<label class="Validform_label">
								外壳型号:
							</label>
						</td>
						<td class="value">
						    <input id="wjxh" name="wjxh" type="text" maxlength="32" style="width: 150px" class="inputxt"  ignore="ignore"  value='${testFilestorePage.wjxh}'/>
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">外壳型号</label>
						</td>
						<td align="right">
							<label class="Validform_label">
								外壳检验批次:
							</label>
						</td>
						<td class="value">
						    <input id="wkjypc" name="wkjypc" type="text" maxlength="32" style="width: 150px" class="inputxt"  ignore="ignore"  value='${testFilestorePage.wkjypc}'/>
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">外壳检验批次</label>
						</td>
					</tr>
					<tr>
						<td align="right">
							<label class="Validform_label">
								盖板型号:
							</label>
						</td>
						<td class="value">
						    <input id="gbxh" name="gbxh" type="text" maxlength="32" style="width: 150px" class="inputxt"  ignore="ignore"  value='${testFilestorePage.gbxh}'/>
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">盖板型号</label>
						</td>
						<td align="right">
							<label class="Validform_label">
								盖板检验批次:
							</label>
						</td>
						<td class="value">
						    <input id="gbjypc" name="gbjypc" type="text" maxlength="32" style="width: 150px" class="inputxt"  ignore="ignore"  value='${testFilestorePage.gbjypc}'/>
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">盖板检验批次</label>
						</td>
					</tr>
					<tr>
						<td align="right">
							<label class="Validform_label">
								键合丝型号:
							</label>
						</td>
						<td class="value">
						    <input id="jhsxh" name="jhsxh" type="text" maxlength="32" style="width: 150px" class="inputxt"  ignore="ignore"  value='${testFilestorePage.jhsxh}'/>
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">键合丝型号</label>
						</td>
						<td align="right">
							<label class="Validform_label">
								键合丝检验批次:
							</label>
						</td>
						<td class="value">
						    <input id="jhsjypc" name="jhsjypc" type="text" maxlength="32" style="width: 150px" class="inputxt"  ignore="ignore"  value='${testFilestorePage.jhsjypc}'/>
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">键合丝检验批次</label>
						</td>
					</tr>
					<tr>
						<td align="right">
							<label class="Validform_label">
								粘片胶型号:
							</label>
						</td>
						<td class="value">
						    <input id="zpjxh" name="zpjxh" type="text" maxlength="32" style="width: 150px" class="inputxt"  ignore="ignore"  value='${testFilestorePage.zpjxh}'/>
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">粘片胶型号</label>
						</td>
						<td align="right">
							<label class="Validform_label">
								粘片胶检验批次:
							</label>
						</td>
						<td class="value">
						    <input id="zpjyjpc" name="zpjyjpc" type="text" maxlength="32" style="width: 150px" class="inputxt"  ignore="ignore"  value='${testFilestorePage.zpjyjpc}'/>
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">粘片胶检验批次</label>
						</td>
					</tr>
					<tr>
						<td align="right">
							<label class="Validform_label">
								打标墨型号:
							</label>
						</td>
						<td class="value">
						    <input id="dbmxh" name="dbmxh" type="text" maxlength="32" style="width: 150px" class="inputxt"  ignore="ignore"  value='${testFilestorePage.dbmxh}'/>
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">打标墨型号</label>
						</td>
						<td align="right">
							<label class="Validform_label">
								打标墨检验批次:
							</label>
						</td>
						<td class="value">
						    <input id="dbmjypc" name="dbmjypc" type="text" maxlength="32" style="width: 150px" class="inputxt"  ignore="ignore"  value='${testFilestorePage.dbmjypc}'/>
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">打标墨检验批次</label>
						</td>
					</tr>
					<tr>
						<td align="right">
							<label class="Validform_label">
								腔体体积:
							</label>
						</td>
						<td class="value">
						    <input id="qttj" name="qttj" type="text" maxlength="32" style="width: 150px" class="inputxt"  ignore="ignore"  value='${testFilestorePage.qttj}'/>
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">腔体体积</label>
						</td>
						<td align="right">
							<label class="Validform_label">
								腔体高度:
							</label>
						</td>
						<td class="value">
						    <input id="qtgd" name="qtgd" type="text" maxlength="32" style="width: 150px" class="inputxt"  ignore="ignore"  value='${testFilestorePage.qtgd}'/>
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">腔体高度</label>
						</td>
					</tr>
					<tr>
						<td align="right">
							<label class="Validform_label">
								投入封装数量:
							</label>
						</td>
						<td class="value">
						    <input id="trfzsl" name="trfzsl" type="text" maxlength="32" style="width: 150px" class="inputxt"  ignore="ignore"  value='${testFilestorePage.trfzsl}'/>
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">投入封装数量</label>
						</td>
						<td align="right">
							<label class="Validform_label">
								封装合格数量:
							</label>
						</td>
						<td class="value">
						    <input id="fzhgsl" name="fzhgsl" type="text" maxlength="32" style="width: 150px" class="inputxt"  ignore="ignore"  value='${testFilestorePage.fzhgsl}'/>
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">封装合格数量</label>
						</td>
					</tr>
					<tr>
						<td align="right">
							<label class="Validform_label">
								监制电路起止序号:
							</label>
						</td>
						<td class="value">
						    <input id="jzdlqzxh" name="jzdlqzxh" type="text" maxlength="32" style="width: 150px" class="inputxt"  ignore="ignore"  value='${testFilestorePage.jzdlqzxh}'/>
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">监制电路起止序号</label>
						</td>
						<td align="right">
							<label class="Validform_label">
								封装不合格情况:
							</label>
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
							<label class="Validform_label">
								筛选报告号:
							</label>
						</td>
						<td class="value">
		<table id="sxbgh_fileTable"></table>
		<div class="form jeecgDetail">
			<t:upload name="sxbgh" id="sxbgh" queueID="filediv_sxbgh" outhtml="false" uploader="cgUploadController.do?saveFiles"  extend="office" buttonText='添加文件'  onUploadStart="sxbghOnUploadStart"> </t:upload>
			<div class="form" id="filediv_sxbgh"></div>
			<script type="text/javascript">
				function sxbghOnUploadStart(file){
					var cgFormId=$("input[name='id']").val();
					$('#sxbgh').uploadify("settings", "formData", {
						'cgFormId':cgFormId,
						'cgFormName':'test_filestore',
						'cgFormField':'SXBGH'
					});
				}
			</script>
		</div>
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">筛选报告号</label>
						</td>
						<td align="right">
							<label class="Validform_label">
								筛选起止时间:
							</label>
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
							<label class="Validform_label">
								筛选过程PIND次数:
							</label>
						</td>
						<td class="value">
						    <input id="sxgcpindcs" name="sxgcpindcs" type="text" maxlength="32" style="width: 150px" class="inputxt"  ignore="ignore"  value='${testFilestorePage.sxgcpindcs}'/>
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">筛选过程PIND次数</label>
						</td>
						<td align="right">
							<label class="Validform_label">
								投入筛选数量:
							</label>
						</td>
						<td class="value">
						    <input id="trsxsl" name="trsxsl" type="text" maxlength="32" style="width: 150px" class="inputxt"  ignore="ignore"  value='${testFilestorePage.trsxsl}'/>
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">投入筛选数量</label>
						</td>
					</tr>
					<tr>
						<td align="right">
							<label class="Validform_label">
								筛选合格数量:
							</label>
						</td>
						<td class="value">
						    <input id="sxhgsl" name="sxhgsl" type="text" maxlength="32" style="width: 150px" class="inputxt"  ignore="ignore"  value='${testFilestorePage.sxhgsl}'/>
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">筛选合格数量</label>
						</td>
						<td align="right">
							<label class="Validform_label">
								筛选不合格情况:
							</label>
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
							<label class="Validform_label">
								PDA:
							</label>
						</td>
						<td class="value">
						    <input id="pda" name="pda" type="text" maxlength="32" style="width: 150px" class="inputxt"  ignore="ignore"  value='${testFilestorePage.pda}'/>
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">PDA</label>
						</td>
						<td align="right">
							<label class="Validform_label">
								成品率:
							</label>
						</td>
						<td class="value">
									<t:dictSelect field="cpl" type="radio"  typeGroupCode=""   defaultVal="${testFilestorePage.cpl}" hasLabel="false"  title="成品率" ></t:dictSelect>     
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">成品率</label>
						</td>
					</tr>
					<tr>
						<td align="right">
							<label class="Validform_label">
								X光盘:
							</label>
						</td>
						<td class="value">
						    <input id="xgp" name="xgp" type="text" maxlength="32" style="width: 150px" class="inputxt"  ignore="ignore"  value='${testFilestorePage.xgp}'/>
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">X光盘</label>
						</td>
						<td align="right">
							<label class="Validform_label">
								测试光盘:
							</label>
						</td>
						<td class="value">
						    <input id="csgp" name="csgp" type="text" maxlength="32" style="width: 150px" class="inputxt"  ignore="ignore"  value='${testFilestorePage.csgp}'/>
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">测试光盘</label>
						</td>
					</tr>
					<tr>
						<td align="right">
							<label class="Validform_label">
								报告:
							</label>
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
							<label class="Validform_label">
								低成品率质量分析报告:
							</label>
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
							<label class="Validform_label">
								鉴定一致性检验方式:
							</label>
						</td>
						<td class="value">
						    <input id="jdfs" name="jdfs" type="text" maxlength="32" style="width: 150px" class="inputxt"  ignore="ignore"  value='${testFilestorePage.jdfs}'/>
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">鉴定一致性检验方式</label>
						</td>
						<td align="right">
							<label class="Validform_label">
								鉴定一致性检验报告编号:
							</label>
						</td>
						<td class="value">
		<table id="jdbgbh_fileTable"></table>
		<div class="form jeecgDetail">
			<t:upload name="jdbgbh" id="jdbgbh" queueID="filediv_jdbgbh" outhtml="false" uploader="cgUploadController.do?saveFiles"  extend="office" buttonText='添加文件'  onUploadStart="jdbgbhOnUploadStart"> </t:upload>
			<div class="form" id="filediv_jdbgbh"></div>
			<script type="text/javascript">
				function jdbgbhOnUploadStart(file){
					var cgFormId=$("input[name='id']").val();
					$('#jdbgbh').uploadify("settings", "formData", {
						'cgFormId':cgFormId,
						'cgFormName':'test_filestore',
						'cgFormField':'JDBGBH'
					});
				}
			</script>
		</div>
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">鉴定一致性检验报告编号</label>
						</td>
					</tr>
					<tr>
						<td align="right">
							<label class="Validform_label">
								鉴定一致性检验起止时间:
							</label>
						</td>
						<td class="value">
						    <input id="jdqzsj" name="jdqzsj" type="text" maxlength="32" style="width: 150px" class="inputxt"  ignore="ignore"  value='${testFilestorePage.jdqzsj}'/>
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">鉴定一致性检验起止时间</label>
						</td>
						<td align="right">
							<label class="Validform_label">
								首件鉴定报告:
							</label>
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
							<label class="Validform_label">
								首件鉴定目录:
							</label>
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
							<label class="Validform_label">
								用户评审意见:
							</label>
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
							<label class="Validform_label">
								质量评审:
							</label>
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
							<label class="Validform_label">
								ESD:
							</label>
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
							<label class="Validform_label" style="display: none;">ESD</label>
						</td>
					</tr>
					<tr>
						<td align="right">
							<label class="Validform_label">
								抗闩锁:
							</label>
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
							<label class="Validform_label" style="display: none;">抗闩锁</label>
						</td>
						<td align="right">
							<label class="Validform_label">
								总剂量:
							</label>
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
							<label class="Validform_label" style="display: none;">总剂量</label>
						</td>
					</tr>
					<tr>
						<td align="right">
							<label class="Validform_label">
								单粒子:
							</label>
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
							<label class="Validform_label" style="display: none;">单粒子</label>
						</td>
						<td align="right">
							<label class="Validform_label">
								寿命后水汽:
							</label>
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
							<label class="Validform_label" style="display: none;">寿命后水汽</label>
						</td>
					</tr>
					<tr>
						<td align="right">
							<label class="Validform_label">
								筛合水汽:
							</label>
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
							<label class="Validform_label" style="display: none;">筛合水汽</label>
						</td>
						<td align="right">
							<label class="Validform_label">
								DPA报告号:
							</label>
						</td>
						<td class="value">
		<table id="dpabgh_fileTable"></table>
		<div class="form jeecgDetail">
			<t:upload name="dpabgh" id="dpabgh" queueID="filediv_dpabgh" outhtml="false" uploader="cgUploadController.do?saveFiles"  extend="office" buttonText='添加文件'  onUploadStart="dpabghOnUploadStart"> </t:upload>
			<div class="form" id="filediv_dpabgh"></div>
			<script type="text/javascript">
				function dpabghOnUploadStart(file){
					var cgFormId=$("input[name='id']").val();
					$('#dpabgh').uploadify("settings", "formData", {
						'cgFormId':cgFormId,
						'cgFormName':'test_filestore',
						'cgFormField':'DPABGH'
					});
				}
			</script>
		</div>
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">DPA报告号</label>
						</td>
					</tr>
					<tr>
						<td align="right">
							<label class="Validform_label">
								DPA检测机构:
							</label>
						</td>
						<td class="value">
						    <input id="dpajcjg" name="dpajcjg" type="text" maxlength="32" style="width: 150px" class="inputxt"  ignore="ignore"  value='${testFilestorePage.dpajcjg}'/>
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">DPA检测机构</label>
						</td>
						<td align="right">
							<label class="Validform_label">
								DPA样品数量:
							</label>
						</td>
						<td class="value">
						    <input id="dpaypsl" name="dpaypsl" type="text" maxlength="32" style="width: 150px" class="inputxt"  ignore="ignore"  value='${testFilestorePage.dpaypsl}'/>
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">DPA样品数量</label>
						</td>
					</tr>
					<tr>
						<td align="right">
							<label class="Validform_label">
								DPA试验开始时间:
							</label>
						</td>
						<td class="value">
						    <input id="dpakssj" name="dpakssj" type="text" maxlength="32" style="width: 150px" class="inputxt"  ignore="ignore"  value='${testFilestorePage.dpakssj}'/>
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">DPA试验开始时间</label>
						</td>
						<td align="right">
							<label class="Validform_label">
								DPA试验结束时间:
							</label>
						</td>
						<td class="value">
						    <input id="dpajssj" name="dpajssj" type="text" maxlength="32" style="width: 150px" class="inputxt"  ignore="ignore"  value='${testFilestorePage.dpajssj}'/>
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">DPA试验结束时间</label>
						</td>
					</tr>
					<tr>
						<td align="right">
							<label class="Validform_label">
								单独水汽报告:
							</label>
						</td>
						<td class="value">
						    <input id="ddsqbg" name="ddsqbg" type="text" maxlength="32" style="width: 150px" class="inputxt"  ignore="ignore"  value='${testFilestorePage.ddsqbg}'/>
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">单独水汽报告</label>
						</td>
						<td align="right">
							<label class="Validform_label">
								水汽检测机构:
							</label>
						</td>
						<td class="value">
						    <input id="sqjcjg" name="sqjcjg" type="text" maxlength="32" style="width: 150px" class="inputxt"  ignore="ignore"  value='${testFilestorePage.sqjcjg}'/>
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">水汽检测机构</label>
						</td>
					</tr>
					<tr>
						<td align="right">
							<label class="Validform_label">
								水汽检测开始时间:
							</label>
						</td>
						<td class="value">
						    <input id="sqjckssj" name="sqjckssj" type="text" maxlength="32" style="width: 150px" class="inputxt"  ignore="ignore"  value='${testFilestorePage.sqjckssj}'/>
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">水汽检测开始时间</label>
						</td>
						<td align="right">
							<label class="Validform_label">
								水汽检测结束时间:
							</label>
						</td>
						<td class="value">
						    <input id="sqjcjssj" name="sqjcjssj" type="text" maxlength="32" style="width: 150px" class="inputxt"  ignore="ignore"  value='${testFilestorePage.sqjcjssj}'/>
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">水汽检测结束时间</label>
						</td>
					</tr>
					<tr>
						<td align="right">
							<label class="Validform_label">
								补充筛选报告号:
							</label>
						</td>
						<td class="value">
						    <input id="bcsxbgh" name="bcsxbgh" type="text" maxlength="32" style="width: 150px" class="inputxt"  ignore="ignore"  value='${testFilestorePage.bcsxbgh}'/>
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">补充筛选报告号</label>
						</td>
						<td align="right">
							<label class="Validform_label">
								补充筛选开始时间:
							</label>
						</td>
						<td class="value">
						    <input id="bcsxkssj" name="bcsxkssj" type="text" maxlength="32" style="width: 150px" class="inputxt"  ignore="ignore"  value='${testFilestorePage.bcsxkssj}'/>
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">补充筛选开始时间</label>
						</td>
					</tr>
					<tr>
						<td align="right">
							<label class="Validform_label">
								补充筛选结束时间:
							</label>
						</td>
						<td class="value">
						    <input id="bcsxjssj" name="bcsxjssj" type="text" maxlength="32" style="width: 150px" class="inputxt"  ignore="ignore"  value='${testFilestorePage.bcsxjssj}'/>
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">补充筛选结束时间</label>
						</td>
						<td align="right">
							<label class="Validform_label">
								补充筛选委托单位:
							</label>
						</td>
						<td class="value">
						    <input id="bcsxwtdw" name="bcsxwtdw" type="text" maxlength="32" style="width: 150px" class="inputxt"  ignore="ignore"  value='${testFilestorePage.bcsxwtdw}'/>
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">补充筛选委托单位</label>
						</td>
					</tr>
					<tr>
						<td align="right">
							<label class="Validform_label">
								补充筛选投入数量:
							</label>
						</td>
						<td class="value">
						    <input id="bcsxtrsl" name="bcsxtrsl" type="text" maxlength="32" style="width: 150px" class="inputxt"  ignore="ignore"  value='${testFilestorePage.bcsxtrsl}'/>
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">补充筛选投入数量</label>
						</td>
						<td align="right">
							<label class="Validform_label">
								补充筛选合格数量:
							</label>
						</td>
						<td class="value">
						    <input id="bcsxhgsl" name="bcsxhgsl" type="text" maxlength="32" style="width: 150px" class="inputxt"  ignore="ignore"  value='${testFilestorePage.bcsxhgsl}'/>
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">补充筛选合格数量</label>
						</td>
					</tr>
					<tr>
						<td align="right">
							<label class="Validform_label">
								补充筛选不合格情况:
							</label>
						</td>
						<td class="value">
						    <input id="bcsxbhgqk" name="bcsxbhgqk" type="text" maxlength="32" style="width: 150px" class="inputxt"  ignore="ignore"  value='${testFilestorePage.bcsxbhgqk}'/>
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">补充筛选不合格情况</label>
						</td>
						<td align="right">
							<label class="Validform_label">
								超期复验报告号:
							</label>
						</td>
						<td class="value">
						    <input id="cqfybgh" name="cqfybgh" type="text" maxlength="32" style="width: 150px" class="inputxt"  ignore="ignore"  value='${testFilestorePage.cqfybgh}'/>
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">超期复验报告号</label>
						</td>
					</tr>
					<tr>
						<td align="right">
							<label class="Validform_label">
								超期复验开始时间:
							</label>
						</td>
						<td class="value">
						    <input id="cqfykssj" name="cqfykssj" type="text" maxlength="32" style="width: 150px" class="inputxt"  ignore="ignore"  value='${testFilestorePage.cqfykssj}'/>
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">超期复验开始时间</label>
						</td>
						<td align="right">
							<label class="Validform_label">
								超期复验结束时间:
							</label>
						</td>
						<td class="value">
						    <input id="cqfyjssj" name="cqfyjssj" type="text" maxlength="32" style="width: 150px" class="inputxt"  ignore="ignore"  value='${testFilestorePage.cqfyjssj}'/>
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">超期复验结束时间</label>
						</td>
					</tr>
					<tr>
						<td align="right">
							<label class="Validform_label">
								超期复验类别:
							</label>
						</td>
						<td class="value">
						    <input id="cqfylb" name="cqfylb" type="text" maxlength="32" style="width: 150px" class="inputxt"  ignore="ignore"  value='${testFilestorePage.cqfylb}'/>
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">超期复验类别</label>
						</td>
						<td align="right">
							<label class="Validform_label">
								超期复验合格数量:
							</label>
						</td>
						<td class="value">
						    <input id="cqfyhgsl" name="cqfyhgsl" type="text" maxlength="32" style="width: 150px" class="inputxt"  ignore="ignore"  value='${testFilestorePage.cqfyhgsl}'/>
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">超期复验合格数量</label>
						</td>
					</tr>
					<tr>
						<td align="right">
							<label class="Validform_label">
								补充检验报告:
							</label>
						</td>
						<td class="value">
						    <input id="bcjybg" name="bcjybg" type="text" maxlength="200" style="width: 150px" class="inputxt"  ignore="ignore"  value='${testFilestorePage.bcjybg}'/>
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">补充检验报告</label>
						</td>
						<td align="right">
							<label class="Validform_label">
								单批质保报告:
							</label>
						</td>
						<td class="value">
						    <input id="dpzbbg" name="dpzbbg" type="text" maxlength="200" style="width: 150px" class="inputxt"  ignore="ignore"  value='${testFilestorePage.dpzbbg}'/>
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">单批质保报告</label>
						</td>
					</tr>
				
			</table>
		</t:formvalid>
 </body>
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
		  	});
		  	
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
					$('#sxbgh').uploadify('upload', '*');	
					$('#sxqzsj').uploadify('upload', '*');	
					$('#sxbhgqk').uploadify('upload', '*');	
					$('#threebg').uploadify('upload', '*');	
					$('#dcplzlfxbg').uploadify('upload', '*');	
					$('#jdbgbh').uploadify('upload', '*');	
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
					$('#dpabgh').uploadify('upload', '*');	
			}
			
			var neibuClickFlag = false;
			function neibuClick() {
				neibuClickFlag = true; 
				$('#btn_sub').trigger('click');
			}
			function cancel() {
					$('#jzbgh').uploadify('cancel', '*');	
					$('#fzbhgqk').uploadify('cancel', '*');	
					$('#sxbgh').uploadify('cancel', '*');	
					$('#sxqzsj').uploadify('cancel', '*');	
					$('#sxbhgqk').uploadify('cancel', '*');	
					$('#threebg').uploadify('cancel', '*');	
					$('#dcplzlfxbg').uploadify('cancel', '*');	
					$('#jdbgbh').uploadify('cancel', '*');	
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
					$('#dpabgh').uploadify('cancel', '*');	
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
