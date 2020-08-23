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
  <t:formvalid formid="formobj" dialog="true" usePlugin="password" layout="table" action="testFilestoreController.do?doUpdate">
					<input id="id" name="id" type="hidden" value="${testFilestorePage.id }"/>
		<table style="width: 100%;" cellpadding="0" cellspacing="1" class="formtable">
				<tr>
					<td class="title_label" colspan="1"> 
							基础信息
					</td>
					<td colspan="3"> 
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							阶段标识:
						</label>
					</td>
					<td class="value">
							<t:dictSelect field="bpmStatus" type="list"  typeGroupCode="filestatus"  defaultVal="${testFilestorePage.bpmStatus}" hasLabel="false"  title="阶段标识" ></t:dictSelect>     
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">阶段标识</label>
						</td>
					<td align="right">
						<label class="Validform_label">
							型号:
						</label>
					</td>
					<td class="value">
					     	 <input id="xh" name="xh" type="text" maxlength="32" style="width: 150px" class="inputxt" datatype="*" ignore="checked" value='${testFilestorePage.xh}' />
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
					     	 <input id="dlmc" name="dlmc" type="text" maxlength="100" style="width: 150px" class="inputxt" datatype="*" ignore="checked" value='${testFilestorePage.dlmc}'/>
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">电路名称</label>
						</td>
					<td align="right">
						<label class="Validform_label">
							批次:
						</label>
					</td>
					<td class="value">
					     	<input id="pc" name="pc" type="text" maxlength="32" style="width: 150px" class="inputxt" datatype="*" ignore="checked" value='${testFilestorePage.pc}'/>
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
					     	<input id="rwtzdh" name="rwtzdh" type="text" maxlength="50" style="width: 150px" class="inputxt" datatype="*" ignore="checked" value='${testFilestorePage.rwtzdh}'/>
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">任务通知单号</label>
						</td>
					<td align="right">
						<label class="Validform_label">
							任务数量:
						</label>
					</td>
					<td class="value">
					     	 <input id="rwsl" name="rwsl" type="text" maxlength="32" style="width: 150px" class="inputxt" datatype="*" ignore="checked"  value='${testFilestorePage.rwsl}'/>
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
					     	 <input id="zxgfh" name="zxgfh" type="text" maxlength="32" style="width: 150px" class="inputxt" datatype="*" ignore="checked" value='${testFilestorePage.zxgfh}'/>
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">执行规范号</label>
						</td>
					<td align="right">
						<label class="Validform_label">
							质量等级:
						</label>
					</td>
					<td class="value">
					     	 <input id="zldj" name="zldj" type="text" maxlength="32" style="width: 150px" class="inputxt" datatype="*" ignore="checked" value='${testFilestorePage.zldj}'/>
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
					     	 <input id="fzxs" name="fzxs" type="text" maxlength="50" style="width: 150px" class="inputxt" datatype="*" ignore="checked" value='${testFilestorePage.fzxs}'/>
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">封装形式</label>
						</td>
					<td align="right">
						<label class="Validform_label">
							芯片标识:
						</label>
					</td>
					<td class="value">
					     	 <input id="xpbs" name="xpbs" type="text" maxlength="50" style="width: 150px" class="inputxt"  ignore="ignore" value='${testFilestorePage.xpbs}'/>
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">芯片标识</label>
						</td>
					</tr>
				<tr>
					<td class="title_label" colspan="1"> 
							原材料信息
					</td>
					<td colspan="3"> 
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							圆片批次:
						</label>
					</td>
					<td class="value">
					     	 <input id="yppc" name="yppc" type="text" maxlength="32" style="width: 150px" class="inputxt"  ignore="ignore" value='${testFilestorePage.yppc}'/>
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">圆片批次</label>
						</td>
					<td align="right">
						<label class="Validform_label">
							圆片号:
						</label>
					</td>
					<td class="value">
					     	 <input id="yph" name="yph" type="text" maxlength="32" style="width: 150px" class="inputxt"  ignore="ignore" value='${testFilestorePage.yph}'/>
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
					<td class="title_label" colspan="1"> 
							封装信息
					</td>
					<td colspan="3"> 
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
							<t:webUploader auto="true" pathValues="${testFilestorePage.sjjdml}" name="sjjdml" fileNumLimit="3"></t:webUploader>
							<span class="Validform_checktip Validform_right" style="display: none;">文件已上传</span>	
						</td>
					</tr>
					<tr>
						<td class="title_label" colspan="1"> 
								筛选信息
						</td>
						<td colspan="3"> 
						</td>
					</tr>
					<tr>
						<td align="right">
							<label class="Validform_label">
								筛选报告号:
							</label>
						</td>
						<td class="value">
						</td>
						<td align="right">
							<label class="Validform_label">
								筛选起止时间:
							</label>
						</td>
						<td class="value">
							<t:webUploader auto="true" name="sxqzsj" fileNumLimit="3"></t:webUploader>
							<span class="Validform_checktip Validform_right" style="display: none;">文件已上传</span>
	
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
							<t:webUploader auto="true" name="sxbhgqk" fileNumLimit="3"></t:webUploader>
							<span class="Validform_checktip Validform_right" style="display: none;">文件已上传</span>
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
							  <t:dictSelect field="cpl" type="radio"  typeGroupCode=""  defaultVal="${testFilestorePage.cpl}" hasLabel="false"  title="成品率" ></t:dictSelect>     
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
							3σ报告:
						</label>
					</td>
					<td class="value">
						<t:webUploader auto="true" pathValues="${testFilestorePage.threebg}" name="threebg" fileNumLimit="3"></t:webUploader>
						<span class="Validform_checktip Validform_right" style="display: none;">文件已上传</span>
					</td>
					<td align="right">
						<label class="Validform_label">
							低成品率质量分析报告:
						</label>
					</td>
					<td class="value">
						<t:webUploader auto="true" pathValues="${testFilestorePage.dcplzlfxbg}" name="dcplzlfxbg" fileNumLimit="3"></t:webUploader>
						<span class="Validform_checktip Validform_right" style="display: none;">文件已上传</span>
					</td>
				</tr>
				<tr>
					<td class="title_label" colspan="1"> 
							鉴定/一致性信息
					</td>
					<td colspan="3"> 
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							鉴定一致性检验方式:
						</label>
					</td>
					<td class="value">
							<t:dictSelect field="jdfs" type="list"  typeGroupCode="jdfs"  defaultVal="${testFilestorePage.jdfs}" hasLabel="false"  title="鉴定一致性检验方式" ></t:dictSelect>     
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">鉴定一致性检验方式</label>
						</td>
						<td align="right">
							<label class="Validform_label">
								鉴定一致性检验报告编号:
							</label>
						</td>
						<td class="value">
						<t:webUploader auto="true" pathValues="${testFilestorePage.jdbgbh}" name="jdbgbh" fileNumLimit="3"></t:webUploader>
						<span class="Validform_checktip Validform_right" style="display: none;">文件已上传</span>
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
						<t:webUploader auto="true" pathValues="${testFilestorePage.sjjdbg}" name="sjjdbg" fileNumLimit="3"></t:webUploader>
						<span class="Validform_checktip Validform_right" style="display: none;">文件已上传</span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							首件鉴定目录:
						</label>
					</td>
					<td class="value">
						<t:webUploader auto="true" pathValues="${testFilestorePage.sjjdml}" name="sjjdml" fileNumLimit="3"></t:webUploader>
						<span class="Validform_checktip Validform_right" style="display: none;">文件已上传</span>
					</td>
					<td align="right">
						<label class="Validform_label">
							用户评审意见:
						</label>
					</td>
					<td class="value">
						<t:webUploader auto="true" pathValues="${testFilestorePage.yhpsyj}" name="yhpsyj" fileNumLimit="3"></t:webUploader>
						<span class="Validform_checktip Validform_right" style="display: none;">文件已上传</span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							质量评审:
						</label>
					</td>
					<td class="value">
						<t:webUploader auto="true" pathValues="${testFilestorePage.zlps}" name="zlps" fileNumLimit="3"></t:webUploader>
						<span class="Validform_checktip Validform_right" style="display: none;">文件已上传</span>
					</td>
					<td align="right">
						<label class="Validform_label">
							ESD:
						</label>
					</td>
					<td class="value">
						<t:webUploader auto="true" pathValues="${testFilestorePage.esd}" name="esd" fileNumLimit="3"></t:webUploader>
						<span class="Validform_checktip Validform_right" style="display: none;">文件已上传</span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							抗闩锁:
						</label>
					</td>
					<td class="value">
						<t:webUploader auto="true" pathValues="${testFilestorePage.kss}" name="kss" fileNumLimit="3"></t:webUploader>
						<span class="Validform_checktip Validform_right" style="display: none;">文件已上传</span>
					</td>
					<td align="right">
						<label class="Validform_label">
							总剂量:
						</label>
					</td>
					<td class="value">
						<t:webUploader auto="true" pathValues="${testFilestorePage.zjl}" name="zjl" fileNumLimit="3"></t:webUploader>
						<span class="Validform_checktip Validform_right" style="display: none;">文件已上传</span>
					</td>
					</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							单粒子:
						</label>
					</td>
					<td class="value">
						<t:webUploader auto="true" pathValues="${testFilestorePage.dlz}" name="dlz" fileNumLimit="3"></t:webUploader>
						<span class="Validform_checktip Validform_right" style="display: none;">文件已上传</span>
					</td>
					<td align="right">
						<label class="Validform_label">
							寿命后水汽:
						</label>
					</td>
					<td class="value">
						<t:webUploader auto="true" pathValues="${testFilestorePage.smhsq}" name="smhsq" fileNumLimit="3"></t:webUploader>
						<span class="Validform_checktip Validform_right" style="display: none;">文件已上传</span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							筛合水汽:
						</label>
					</td>
					<td colspan="3" class="value">
						<t:webUploader auto="true" pathValues="${testFilestorePage.shsq}" name="shsq" fileNumLimit="3"></t:webUploader>
						<span class="Validform_checktip Validform_right" style="display: none;">文件已上传</span>
					</td>
				</tr>
				<tr>
					<td class="title_label" colspan="1"> 
							DPA信息
					</td>
					<td colspan="3"> 
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							DPA报告号:
						</label>
					</td>
					<td colspan="3" class="value">
						<t:webUploader auto="true" pathValues="${testFilestorePage.dpabgh}" name="dpabgh" fileNumLimit="3"></t:webUploader>
						<span class="Validform_checktip Validform_right" style="display: none;">文件已上传</span>
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
					<td class="title_label" colspan="1"> 
							单独水汽信息
					</td>
					<td colspan="3"> 
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
					<td class="title_label" colspan="1"> 
							补充筛选信息
					</td>
					<td colspan="3"> 
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
						</label>
					</td>
					<td class="value">
						</td>
					</tr>
				<tr>
					<td class="title_label" colspan="1"> 
							超期复验信息
					</td>
					<td colspan="3"> 
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
								超期复验报告号:
							</label>
						</td>
					<td colspan="3" class="value">
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
					<td class="title_label" colspan="1"> 
							其他信息
					</td>
					<td colspan="3"> 
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

</script>
