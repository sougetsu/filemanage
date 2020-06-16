<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>

<script type="text/javascript" src="plug-in/jquery/jquery-1.8.3.js"></script>
<script type="text/javascript" src="plug-in/tools/dataformat.js"></script>
<link id="easyuiTheme" rel="stylesheet"
	href="plug-in/easyui/themes/metrole/easyui.css" type="text/css"></link>
<link id="easyuiTheme" rel="stylesheet"
	href="plug-in/easyui/themes/metrole/main.css" type="text/css"></link>
<link id="easyuiTheme" rel="stylesheet"
	href="plug-in/easyui/themes/metrole/icon.css" type="text/css"></link>
<link rel="stylesheet" type="text/css"
	href="plug-in/accordion/css/accordion.css">
<link rel="stylesheet" type="text/css"
	href="plug-in/accordion/css/icons.css">
<script src="plug-in/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript"
	src="plug-in/easyui/jquery.easyui.min.1.3.2.js"></script>
<script type="text/javascript" src="plug-in/easyui/locale/zh-cn.js"></script>
<script type="text/javascript" src="plug-in/tools/syUtil.js"></script>
<link rel="stylesheet" href="plug-in/tools/css/metrole/common.css"
	type="text/css"></link>
<link rel="stylesheet" href="plug-in/ace/css/font-awesome.css"
	type="text/css"></link>
<script type="text/javascript"
	src="plug-in/lhgDialog/lhgdialog.min.js?skin=metrole"></script>
<script type="text/javascript" src="plug-in/ace/js/bootstrap-tab.js"></script>
<link rel="stylesheet" href="plug-in/Validform/css/metrole/style.css"
	type="text/css" />
<link rel="stylesheet"
	href="plug-in/Validform/css/metrole/tablefrom.css" type="text/css" />
<script type="text/javascript" src="plug-in/layer/layer.js"></script>
<script type="text/javascript" src="plug-in/tools/curdtools_zh-cn.js"></script>
<script type="text/javascript" src="plug-in/tools/easyuiextend.js"></script>
<script type="text/javascript">
	$(function() {
		$('#radiationtestSingleList').datagrid('getPager').pagination({
			beforePageText : '',
			afterPageText : '/{pages}',
			displayMsg : '{from}-{to}共{total}条',
			showPageList : true,
			showRefresh : true
		});
		$('#radiationtestSingleList').datagrid('getPager').pagination({
			onBeforeRefresh : function(pageNumber, pageSize) {
				$(this).pagination('loading');
				$(this).pagination('loaded');
			}
		});
	});
	function reloadTable() {
		try {
			$('#' + gridname).datagrid('reload');
			$('#' + gridname).treegrid('reload');
		} catch (ex) {
			//donothing
		}
	}
	//格式化日期
	function myformatter(date) {
	    //获取年份
	    var y = date.getFullYear();
	    //获取月份
	    var m = date.getMonth() + 1;
	    return y + '-' + m;
	}
	function reloadradiationtestSingleList() {
		$('#radiationtestSingleList').datagrid('reload');
	}
	function getradiationtestSingleListSelected(field) {
		return getSelected(field);
	}
	function getSelected(field) {
		var row = $('#' + gridname).datagrid('getSelected');
		if (row != null) {
			value = row[field];
		} else {
			value = '';
		}
		return value;
	}
	function getradiationtestSingleListSelections(field) {
		var ids = [];
		var rows = $('#radiationtestSingleList').datagrid('getSelections');
		for (var i = 0; i < rows.length; i++) {
			ids.push(rows[i][field]);
		}
		ids.join(',');
		return ids
	};
	function comparetime(beginTime,endTime) {
	    var beginTimes = beginTime.substring(0, 10).split('-');
	    var endTimes = endTime.substring(0, 10).split('-');

	    beginTime = beginTimes[1] + '/' + '01' + '/' + beginTimes[0] + ' ' + beginTime.substring(10, 19);
	    endTime = endTimes[1] + '/' + '01' + '/' + endTimes[0] + ' ' + endTime.substring(10, 19);
	    
	    var a = (Date.parse(endTime) - Date.parse(beginTime));
	    if (a < 0) {
	    	return false;
	    }
	    return true;
	};
	function radiationtestSingleListsearch() {
		var startTime = $('#taskList_searchForm').find(":input[name='startDate']").val();
		var endTime = $('#taskList_searchForm').find(":input[name='endDate']").val();
		if(startTime=="" || endTime=="" ){
			tip("请填写统计日期");
			return;
		}
		if(comparetime(startTime,endTime)){
			initTable();
		}else{
			tip("统计开始时间大于结束时间");
		}
		
	}
	function initTable(){
		var columns = new Array();  
        var cols = new Array();  
        var colData = new Object();  
        var searchForm = $('#taskList_searchForm');
		$.ajax({
            type: "POST",
            url:'${pageContext.request.contextPath}/subContractController.do?singleFeeCol',
            data:searchForm.serialize(),
            dataType : 'json',
			success : function(result) {
	            //动态生成表头开始  
	            if(result.obj != null){  
	            	$.each(result.obj,function(){ 
	            		colData = new Object();  
	                    colData.field = this.field;  
	                    colData.title = this.title; 
	                    colData.formatter =  function(value,row,index){  
	                        //这两句是嵌套对象属性绑定，insideObject 为嵌套的对象，field 为对象的属性  
	                        //datagrid 的field不能重复，注意在绑定field 时不能全部用 insideObject，需要使用  insideObject 的属性绑定  
	                        if(value != null){
	                        	return value;
	                        	
	                        }else{
	                        	 var field = this.field;
		 	                     return row.dynamicList[field]; 
	                        }
	                       
	                    };
	                    cols.push(colData);  
	            	});
	            };
            	columns.push(cols);  
            	//动态生成表头结束  
	            var gridCfg = {  
	                fit         : true,  
	                loadMsg     : '数据加载中......',  
	                url         : '${pageContext.request.contextPath}/subContractController.do?singleFeeColGrid',
	                nowrap      : true,  
	                border      : false,    
	                striped     : true,  
	                pagination  : true,  
	                pageSize    : 10,  
	                rownumbers  : true,  
	                singleSelect: false,  
	                columns     : columns,
	                fitColumns : false,  
	                queryParams : {startDate: $('#taskList_searchForm').find(":input[name='startDate']").val(),
	                	endDate:$('#taskList_searchForm').find(":input[name='endDate']").val(),
	                	testPlace:$('#taskList_searchForm').find(":input[name='testPlace']").val()
	                },
	                onLoadSuccess:function(data){
	                }  
	            };  
           		$('#radiationtestSingleList').datagrid(gridCfg); 
			}
        });
	}
	
	function radiationtestSingleListsearchbox(value, name) {
		var queryParams = $('#radiationtestSingleList').datagrid('options').queryParams;
		queryParams[name] = value;
		queryParams.searchfield = name;
		$('#radiationtestSingleList').datagrid('reload');
	}
	$('#radiationtestSingleListsearchbox').searchbox({
		searcher : function(value, name) {
			radiationtestSingleListsearchbox(value, name);
		},
		menu : '#radiationtestSingleListmm',
		prompt : '请输入查询关键字'
	});
	function searchReset_radiationtest(name) {
		$("#" + name + "tb").find(":input").val("");
		radiationtestSingleListsearch();
	}
	//导出
	function exportXls() {
		var startTime = $('#taskList_searchForm').find(":input[name='startDate']").val();
		var endTime = $('#taskList_searchForm').find(":input[name='endDate']").val();
		if(startTime=="" || endTime=="" ){
			tip("请填写统计日期");
			return;
		}
		if(comparetime(startTime,endTime)){
			var submitUrl = '${pageContext.request.contextPath}/subContractController.do?downloadExcel';
			var queryParams = "";
			queryParams += "&startDate=" + $('#taskList_searchForm').find(":input[name='startDate']").val();
			queryParams += "&endDate=" + $('#taskList_searchForm').find(":input[name='endDate']").val();
			queryParams += "&testPlace=" + $('#taskList_searchForm').find(":input[name='testPlace']").val();
			submitUrl += queryParams;
			submitUrl = encodeURI(submitUrl);
			window.location.href = submitUrl;
		}
		else{
			tip("统计开始时间大于结束时间");
		}
		
	}

	//将字段href中的变量替换掉
	function applyHref(tabname, href, value, rec, index) {
		//addOneTab(tabname,href);
		var hrefnew = href;
		var re = "";
		var p1 = /\#\{(\w+)\}/g;
		try {
			var vars = hrefnew.match(p1);
			for (var i = 0; i < vars.length; i++) {
				var keyt = vars[i];
				var p2 = /\#\{(\w+)\}/g;
				var key = p2.exec(keyt);
				hrefnew = hrefnew.replace(keyt, rec[key[1]]);
			}
		} catch (ex) {
		}
		re += "<a href = '#' onclick=\"addOneTab('" + tabname + "','" + hrefnew
				+ "')\" ><u>" + value + "</u></a>";
		return re;
	}
</script>
<table width="100%" id="radiationtestSingleList"
	toolbar="#radiationtestSingleListtb"></table>
<div id="radiationtestSingleListtb" style="padding: 3px; height: auto">
	<form id="taskList_searchForm" method="post" >
	<div name="searchColums">
		<span style="display: -moz-inline-box; display: inline-block;">
			<span
			style="vertical-align: middle; display: -moz-inline-box; display: inline-block; width: 100px; text-align: right; text-align: right; text-overflow: ellipsis; -o-text-overflow: ellipsis; overflow: hidden; white-space: nowrap;"
			title="统计日期">统计日期：</span>
			<input type="text" id="singleFeeStartDate" name="startDate" style="width: 94px" onFocus="WdatePicker({readOnly:true,dateFmt:'yyyy-MM'})"/>
			<span style="vertical-align:middle;display:-moz-inline-box;display:inline-block;width: 8px;text-align:right;">~</span>
			<input type="text" id="singleFeeEndDate" name="endDate" style="width: 94px" onFocus="WdatePicker({readOnly:true,dateFmt:'yyyy-MM'})"/>
		</span>
		<span style="display: -moz-inline-box; display: inline-block;">
			<span
			style="vertical-align: middle; display: -moz-inline-box; display: inline-block; width: 100px; text-align: right; text-align: right; text-overflow: ellipsis; -o-text-overflow: ellipsis; overflow: hidden; white-space: nowrap;"
			title="外协加工单位">外协加工单位：</span> 
			<input type="text" name="wxjgdw"  style="width: 94px" class="easyui-combobox"  data-options="valueField:'id',textField:'text',url:'${pageContext.request.contextPath}/subContractController.do?wxjgdwList'"/>
		</span> 
		<span style="display: -moz-inline-box; display: inline-block;">
			<span
			style="vertical-align: middle; display: -moz-inline-box; display: inline-block; width: 100px; text-align: right; text-align: right; text-overflow: ellipsis; -o-text-overflow: ellipsis; overflow: hidden; white-space: nowrap;"
			title="申请部门">申请部门：</span> 
			<input type="text" name="sqbm"  style="width: 94px" class="easyui-combobox"  data-options="valueField:'id',textField:'text',url:'${pageContext.request.contextPath}/subContractController.do?deptList'"/>
		</span> 
		<span style="float: right"> <a href="#"
			class="easyui-linkbutton" iconCls="icon-search"
			onclick="radiationtestSingleListsearch()">开始统计</a> 
		</span>
	</div>

	<div class="datagrid-toolbar">
		<span style="float: left;"> <a href="#"
			class="easyui-linkbutton" plain="true" icon="icon-putout"
			onclick="exportXls();">导出excel</a>
		</span>
	</div>
	</form>
</div>