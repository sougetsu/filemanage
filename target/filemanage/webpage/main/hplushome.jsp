<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>外协可视化分析</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css" href="plug-in/echart/yc/resources/css/global.css">
<link rel="stylesheet" type="text/css" href="plug-in/echart/yc/resources/css/style.css">
<script type="text/javascript" src="plug-in/echart/yc/resources/js/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="plug-in/echart/yc/resources/js/json2.js"></script>
<script type="text/javascript" src="plug-in/echart/yc/resources/js/common.js"></script>
<style type="text/css">
</style>
<script type="text/javascript">
</script>
<link rel="stylesheet" href="plug-in/echart/echarts.min.js">
<link rel="stylesheet" href="plug-in/satisfi/jjyx.js">
</head>
<body>
	<!--  头部  -->
	<div class="nh-nav">
		<span id="navMenu6" url="loginController.do?hplushome" class="nh-nav-span-selected">外协加工</span>
		<span id="navMenu2" url="loginController.do?modulewaixie">模块外协</span>
		<span id="navMenu1" url="loginController.do?jianyanwaixie">检验外协</span>
		<span id="navMenu8" url="">加急分析</span>
		<span id="navMenu9" url="">复投分析</span>
		<span id="navMenu10"url="">用户分析</span>
		<span id="navMenu2" url="">计划分析</span>
	</div>
	<div class="nh-content" style="height: 130px;">
		<script language="javascript">
			$(function(){
				$(".nh-nav > span").click(function () {
					var herfUrl=$(this).attr("url");
					window.location=herfUrl;
				});
				var navFlag=$(".nh-nav-flag").val();
				if(!isNullOrEmpty(navFlag)){
					var navItem=$("#"+navFlag);
					navItem.addClass("nh-nav-span-selected");
				}

				resizeContent();
				$(window).resize(function() {
					resizeContent();AAS
				});
			});

			function resizeContent(){
				var docHeight=$(document.body).height();
				if(isNullOrEmpty(docHeight)||docHeight<90){
					return;
				}
				var contentHeight=docHeight-90;
				$(".nh-content").css("height",contentHeight+"px");
			}
		</script>
    <input class="nh-nav-flag" type="hidden" value="navMenu6" />
	<div style="width: 52%;height: 99%; float:left">
		<div id="jjzbwcqk" style="width:98%;height:49%;float:left;  "></div>
		<div id="xdnyfzqk"  style="width:98%;height:49%;float:left; "></div>
		
		<!-- <div id="jjztqk" style="width:55%;height:49%;float:left;"></div>
		<div id="jjyxqs"  style="width:43%;height:49%;float:left; "></div> -->
	</div>
	<div style="width: 47%;height: 99%; float:left ;">
		<div id="jjztqk" style="width:55%;height:98%;float:left;"></div>
		<div id="jjyxqs"  style="width:43%;height:98%;float:left; "></div>
		<!-- <div id="xzkzpsr" style="width:98%;height:49%;float:left;"></div> -->
	</div>
<script type="text/javascript" src="${pageContext.request.contextPath}/plug-in/echart/echarts.min.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath}/plug-in/satisfi/jjyx.js"></script>  
</body></html>