<#--update-start--Author:luobaoli  Date:20150614 for：表单（主表/单表）属性中增加了扩展参数 ${po.extend_json?if_exists}-->
<input type="hidden" name="tableName" value="${tableName?if_exists?html}" >
<input type="hidden" name="id" value="${id?if_exists?html}" >
<#list columnhidden as po>
  	<input type="hidden" id="${po.field_name}" name="${po.field_name}" value="${data['${tableName}']['${po.field_name}']?if_exists?html}" >
</#list>
<table cellpadding="0" cellspacing="1" class="formtable">
    <tbody>
		<!-- line.1 -->	
		<tr style="width:98%;height:30px;">
			<td colspan='6' style="width:98%;height:20px;font-size:20px;font-weight:bold;text-align:center" >外协加工申请单</td>
		</tr>
		<tr style="width:98%;height:30px;">
			<td colspan='6' style="width:98%;height:20px;font-size:20px;font-weight:bold;text-align:center" >
				<table width="100%"> 
					<tr>
						<th width="10%">
							<span class="filedzt">项目名称</span>
						</th>
						<td width="40%" >
							<input name="xmmc" class="inputdatext" value="${data['${tableName}']['xmmc']?if_exists?html}"/>
						</td>
						<th width="10%">
							<span class="filedzt">申请部门</span>
						</th>
						<td width="40%" >
							<input name="sqbm" class="inputdatext" value="${data['${tableName}']['sqbm']?if_exists?html}"/>
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td colspan='6' style="width:98%;height:20px;font-size:20px;font-weight:bold;text-align:center" >
				<table width="100%"> 
					<tr>
						<th width="10%">
							<span class="filedzt">外协加工单位</span>
						</th>
						<td width="40%" >
							<input name="wxjgdw" class="inputdatext" value="${data['${tableName}']['wxjgdw']?if_exists?html}"  />
						</td>
						<th width="10%">
							<span class="filedzt">地址</span>
						</th>
						<td width="40%" >
							<input name="dz" class="inputdatext" value="${data['${tableName}']['dz']?if_exists?html}"  />
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td colspan='6'> 
			<table width="100%">
				<tr>
					<th width="10%"><span class="filedzt">所内型号</span></th>
					<td width="23%">
						<input name="snxh" class="inputxt" value="${data['${tableName}']['snxh']?if_exists?html}"  />
					</td>
					<th width="10%"><span class="filedzt">课题号</span></th>
					<td width="23%">
						<input name="kth" class="inputxt" value="${data['${tableName}']['kth']?if_exists?html}"  />
					</td>
					<th width="10%"><span class="filedzt">项目负责人</span></th>
					<td width="23%"><input name="xmfzr" class="inputxt" value="${data['${tableName}']['xmfzr']?if_exists?html}"  /></td>
				</tr>
				
				<tr>
					<th width="10%"><span class="filedzt">联系人</span></th>
					<td width="20%">
						<input name="lxr" class="inputxt" value="${data['${tableName}']['lxr']?if_exists?html}"  />
					</td>
					<th width="10%"><span class="filedzt">电话</span></th>
					<td width="20%">
						<input name="dh" class="inputxt" value="${data['${tableName}']['dh']?if_exists?html}"  />
					</td>
					<th width="10%"><span class="filedzt">传真</span></th>
					<td width="20%">
						<input name="cz" class="inputxt" value="${data['${tableName}']['cz']?if_exists?html}"  />
					</td>
				</tr>
				<tr>
					<th width="10%"><span class="filedzt">数量</span></th>
					<td width="20%">
						<input name="sl" class="inputxt" value="${data['${tableName}']['sl']?if_exists?html}"  />
					</td>
					<th width="10%"><span class="filedzt">编号</span></th>
					<td width="20%">
						<input name="bh" class="inputxt" value="${data['${tableName}']['bh']?if_exists?html}"  />
					</td>
					<th width="10%"><span class="filedzt">说明</span></th>
					<td width="20%">
						<input name="sm" class="inputxt" value="${data['${tableName}']['sm']?if_exists?html}"  />
					</td>
				</tr>
				<tr>
					<th width="10%"><span class="filedzt">申请日期</span></th>
					<td width="10%" >
						<input id="applydate"  name="applydate" type="text"  style="width: 150px"    class="Wdate" onClick="WdatePicker()"  value="${data['${tableName}']['applydate']?if_exists?html}"  /></td>
					</td>
					<th width="10%"><span class="filedzt">要求完成时间</span></th>
					<td >
						<input name="completedate" name="completedate" type="text"  style="width: 150px" class="Wdate" onClick="WdatePicker()"  value="${data['${tableName}']['completedate']?if_exists?html}"    />
					</td>
					<th width="10%"><span class="filedzt">加急完成时间</span></th>
					<td >
						<input name="agentdate" name="agentdate" type="text"  style="width: 150px" class="Wdate" onClick="WdatePicker()"  value="${data['${tableName}']['agentdate']?if_exists?html}"    />
					</td>
				</tr>
				<tr>
					<#list columns as po>
						<#if po.show_type=='file' && po.field_name=='attach'>
						<th width="10%">
							<span class="filedzt">
									<@mutiLang langKey="${po.content?if_exists?html}"/>:
							</span>
						</th>
						<td>
							<table>
							 	<#list filesList as fileB>
									<#-- update--begin--author:zhangjiaqiang date:20170608 for:修订字段为小写 -->
									<#if fileB['field']?lower_case == po.field_name>
									<#-- update--end--author:zhangjiaqiang date:20170608 for:修订字段为小写 -->
									<tr style="height:34px;">
									<td>${fileB['title']}</td>
									<td><a href="${basePath}/commonController.do?viewFile&fileid=${fileB['fileKey']}&subclassname=org.jeecgframework.web.cgform.entity.upload.CgUploadEntity" title="下载">下载</a></td>
									<td><a href="javascript:void(0);" onclick="openwindow('预览','${basePath}/commonController.do?openViewFile&fileid=${fileB['fileKey']}&subclassname=org.jeecgframework.web.cgform.entity.upload.CgUploadEntity','fList',700,500)">预览</a></td>
									<td><a href="javascript:void(0)" class="jeecgDetail" onclick="del('${basePath}/cgUploadController.do?delFile&id=${fileB['fileKey']}',this)">删除</a></td>
									</tr>
									</#if>
								</#list>
							</table>
							<#if !(po.operationCodesReadOnly ??)>
							    <div class="form jeecgDetail">
									<script type="text/javascript">
									var serverMsg="";
									var m = new Map();
									$(function(){$('#${po.field_name}').uploadify(
										{buttonText:'添加文件',
										auto:false,
										progressData:'speed',
										multi:true,
										height:25,
										overrideEvents:['onDialogClose'],
										fileTypeDesc:'文件格式:',
										queueID:'filediv_${po.field_name}',
										<#-- fileTypeExts:'*.rar;*.zip;*.doc;*.docx;*.txt;*.ppt;*.xls;*.xlsx;*.html;*.htm;*.pdf;*.jpg;*.gif;*.png',   页面弹出很慢解决 20170317 scott -->
										fileSizeLimit:'15MB',swf:'${basePath}/plug-in/uploadify/uploadify.swf',	
										uploader:'${basePath}/cgUploadController.do?saveFiles&jsessionid='+$("#sessionUID").val()+'',
										onUploadStart : function(file) { 
											var cgFormId=$("input[name='id']").val();
											$('#${po.field_name}').uploadify("settings", "formData", {'cgFormId':cgFormId,'cgFormName':'${tableName?if_exists?html}','cgFormField':'${po.field_name}'});} ,
										onQueueComplete : function(queueData) {
											 var win = frameElement.api.opener;
											 win.reloadTable();
											 win.tip(serverMsg);
											 frameElement.api.close();},
										onUploadSuccess : function(file, data, response) {var d=$.parseJSON(data);if(d.success){var win = frameElement.api.opener;serverMsg = d.msg;}},onFallback : function(){tip("您未安装FLASH控件，无法上传图片！请安装FLASH控件后再试")},onSelectError : function(file, errorCode, errorMsg){switch(errorCode) {case -100:tip("上传的文件数量已经超出系统限制的"+$('#${po.field_name}').uploadify('settings','queueSizeLimit')+"个文件！");break;case -110:tip("文件 ["+file.name+"] 大小超出系统限制的"+$('#${po.field_name}').uploadify('settings','fileSizeLimit')+"大小！");break;case -120:tip("文件 ["+file.name+"] 大小异常！");break;case -130:tip("文件 ["+file.name+"] 类型不正确！");break;}},
										onUploadProgress : function(file, bytesUploaded, bytesTotal, totalBytesUploaded, totalBytesTotal) { }});});
									
										</script><span id="file_uploadspan"><input type="file" name="${po.field_name}" id="${po.field_name}" /></span>
								</div>
								<div class="form" id="filediv_${po.field_name}"> </div>
							</#if>
						</td>
						</#if>
					</#list>
				</tr>
				<tr>
					<th width="10%"><span class="filedzt">委托内容</span></th>
                    <td colspan="5" style="text-align:left">
                        <input type="hidden" id="wtnr" name="wtnr"  value="${data['${tableName}']['wtnr']?if_exists?html}"  />
						<input type="checkbox" name="wtnr_c" value="a" <#if (data['${tableName}']['wtnr']?if_exists?index_of('a') gt 0)>checked</#if>  onclick="getChecked(this.name,'wtnr')" >可靠性检验</input>
                        <input type="checkbox" name="wtnr_c" value="b"   <#if (data['${tableName}']['wtnr']?if_exists?index_of('b') gt 0)>checked</#if>      onclick="getChecked(this.name,'wtnr')" >老化试验</input>
                        <input type="checkbox" name="wtnr_c" value="c"   <#if (data['${tableName}']['wtnr']?if_exists?index_of('c') gt 0)>checked</#if>      onclick="getChecked(this.name,'wtnr')" >目检</input>
                        <input type="checkbox" name="wtnr_c" value="d"   <#if (data['${tableName}']['wtnr']?if_exists?index_of('d') gt 0)>checked</#if>      onclick="getChecked(this.name,'wtnr')" >图片 PCM</input>
                        <input type="checkbox" name="wtnr_c" value="e"   <#if (data['${tableName}']['wtnr']?if_exists?index_of('e') gt 0)>checked</#if>     onclick="getChecked(this.name,'wtnr')" >中测</input>
                        <input type="checkbox" name="wtnr_c" value="f"   <#if (data['${tableName}']['wtnr']?if_exists?index_of('f') gt 0)>checked</#if>     onclick="getChecked(this.name,'wtnr')" >版图设计</input>
                        <input type="checkbox" name="wtnr_c" value="g"   <#if (data['${tableName}']['wtnr']?if_exists?index_of('g') gt 0)>checked</#if>     onclick="getChecked(this.name,'wtnr')" >PCB 制版</input>
                        <input type="checkbox" name="wtnr_c" value="h"    <#if (data['${tableName}']['wtnr']?if_exists?index_of('h') gt 0)>checked</#if>     onclick="getChecked(this.name,'wtnr')" >PCB 组装</input>
                        <input type="checkbox" name="wtnr_c" value="i"    <#if (data['${tableName}']['wtnr']?if_exists?index_of('i') gt 0)>checked</#if>     onclick="getChecked(this.name,'wtnr')" >ESD</input>
                        <input type="checkbox" name="wtnr_c" value="j"    <#if (data['${tableName}']['wtnr']?if_exists?index_of('j') gt 0)>checked</#if>     onclick="getChecked(this.name,'wtnr')" >辐照</input>
                        <input type="checkbox" name="wtnr_c" value="k"    <#if (data['${tableName}']['wtnr']?if_exists?index_of('k') gt 0)>checked</#if>     onclick="getChecked(this.name,'wtnr')" >DPA</input>
                        <input type="checkbox" name="wtnr_c" value="l"    <#if (data['${tableName}']['wtnr']?if_exists?index_of('l') gt 0)>checked</#if>     onclick="getChecked(this.name,'wtnr')" >封装</input>
                        <input type="checkbox" name="wtnr_c" value="m"    <#if (data['${tableName}']['wtnr']?if_exists?index_of('m') gt 0)>checked</#if>     onclick="getChecked(this.name,'wtnr')" >网表提取</input>
                        <input type="checkbox" name="wtnr_c" value="n"    <#if (data['${tableName}']['wtnr']?if_exists?index_of('n') gt 0)>checked</#if>     onclick="getChecked(this.name,'wtnr')" >去封装</input>
                        <input type="checkbox" name="wtnr_c" value="o"    <#if (data['${tableName}']['wtnr']?if_exists?index_of('o') gt 0)>checked</#if>     onclick="getChecked(this.name,'wtnr')" >照相</input>
                        <input type="checkbox" name="wtnr_c" value="p"    <#if (data['${tableName}']['wtnr']?if_exists?index_of('p') gt 0)>checked</#if>     onclick="getChecked(this.name,'wtnr')" >电路分析</input>
                        <input type="checkbox" name="wtnr_c" value="q"    <#if (data['${tableName}']['wtnr']?if_exists?index_of('q') gt 0)>checked</#if>     onclick="getChecked(this.name,'wtnr')" >电路修补试验</input>
                        <input type="checkbox" name="wtnr_c" value="r"    <#if (data['${tableName}']['wtnr']?if_exists?index_of('r') gt 0)>checked</#if>     onclick="getChecked(this.name,'wtnr')" >其它</input>
					</td>
				</tr>
				<tr>
					<th width="10%"><span class="filedzt">具体要求</span></th>
                    <td colspan="5" style="text-align:left">
                    	<textarea id="jtyq" name="jtyq" style="width:800px; margin: 0px; height: 79px;" class="inputxt" rows="6">${data['${tableName}']['jtyq']?if_exists?html}</textarea>
                 	</td>
                 </tr>
                 <tr>
					<th width="10%"><span class="filedzt">备注</span></th>
                    <td colspan="5" style="text-align:left">
                    	<textarea id="bz" name="bz" style=" width:800px; margin: 0px; height: 79px;" class="inputxt" rows="6">${data['${tableName}']['bz']?if_exists?html}</textarea>
                 	</td>
                 </tr>
                 <tr>
					<th width="10%"><span class="filedzt">部门负责人意见</span></th>
                    <td colspan="5" style="text-align:left">
                    	<textarea id="bmyj" name="bmyj" style="width:800px; margin: 0px; height: 79px;" class="inputxt" rows="6">${data['${tableName}']['bmyj']?if_exists?html}</textarea>
                 	</td>
                 </tr>
                 <tr>
					<th width="10%"><span class="filedzt">部门主管领导审批意见</span></th>
                    <td colspan="5" style="text-align:left">
                    	<textarea id="bmldyj" name="bmldyj" style="width:800px; margin: 0px; height: 79px;" class="inputxt" rows="6">${data['${tableName}']['bmldyj']?if_exists?html}</textarea>
                 	</td>
                 </tr>
                 <tr>
					<th width="10%"><span class="filedzt">公司领导审批意见</span></th>
                    <td colspan="5" style="text-align:left">
                    <textarea id="gsldyj" name="gsldyj" style="width:800px; margin: 0px; height: 79px;" class="inputxt" rows="6">${data['${tableName}']['gsldyj']?if_exists?html}</textarea>
                 	</td>
                 </tr>
			</table>
			</td>
		</tr>	
    </tbody>
</table>
	<#--update-end--Author:luobaoli  Date:20150614 for：表单（主表/单表）属性中增加了扩展参数 ${po.extend_json?if_exists}-->