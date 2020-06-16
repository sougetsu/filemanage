<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- context path -->
<t:base type="jquery,easyui"></t:base>
<script type="text/javascript" src="plug-in/Highcharts-2.2.5/js/highcharts.src.js"></script>
<script type="text/javascript" src="plug-in/Highcharts-2.2.5/js/modules/exporting.src.js"></script>
<script type="text/javascript" src="plug-in/echart/echarts.min.js"></script>
<c:set var="ctxPath" value="${pageContext.request.contextPath}" />
<!-- <script type="text/javascript" src="plug-in/satisfi/fee.js"></script> -->
</head>
<body>
	<div id="main"></div>
	<script type="text/javascript">
		var echartsWarp = document.getElementById('main');
		var resizeWorldMapContainer = function() {//用于使chart自适应高度和宽度,通过窗体高宽计算容器高宽  
			echartsWarp.style.width = window.innerWidth - 20 + 'px';
			echartsWarp.style.height = window.innerHeight - 20 + 'px';
		};
		resizeWorldMapContainer();//设置容器高宽  
		var myChart = echarts.init(echartsWarp);
		
		$.ajax({
			type : "POST",
			url : "statisticsController.do?listFeeCountByMonth&reportType=column&applyType=2",
			success : function(jsondata) {
				jsondata=JSON.parse(jsondata);
				var departdata=jsondata[0].data;
				var data=jsondata[1].data;
				var xAxisData=[];
				var seriesData=[];
				var option ={
						timeline : {
							data:[
					            '2019-01','2019-02','2019-03','2019-04','2019-05',
					            '2019-06','2019-07','2019-08','2019-09','2019-10','2019-11','2019-12'
					        ],
							autoPlay : true,
							playInterval : 1000,
			              	axisType: 'category'
						},
						options : [
								{
									title : {
										'text' : '2019-01检验加工部门费用统计',
										'subtext' : '数据来自外协外包管理系统'
									},
									tooltip : {
										'trigger' : 'axis'
									},
									legend : {
										x : 'right',
										'data' : [ '外协实际费用', '预估费用'],
										'selected' : {
											'外协实际费用' : true,
											'预算费用' : true
										}
									},
									toolbox : {
										'show' : true,
										orient : 'vertical',
										x : 'right',
										y : 'center',
										'feature' : {
											'mark' : {
												'show' : true
											},
											'dataView' : {
												'show' : true,
												'readOnly' : false
											},
											'magicType' : {
												'show' : true,
												'type' : [ 'line', 'bar', 'stack', 'tiled' ]
											},
											'restore' : {
												'show' : true
											},
											'saveAsImage' : {
												'show' : true
											}
										}
									},
									calculable : true,
									grid : {
										'y' : 80,
										'y2' : 100
									},
									xAxis : [ {
										'type' : 'category',
										'axisLabel' : {
											'interval' : 0
										},
										'data' : departdata[0].departname
									} ],
									yAxis : [ {
										'type' : 'value',
										'name' : '实际费用（元）',
										'max' : 1000000
									}, {
										'type' : 'value',
										'name' : '预估费用（元）',
										'max' : 1000000
									} ],
									series : [
											{
												'name' : '外协实际费用',
												'type' : 'bar',
												'markLine' : {
													symbol : [ 'arrow', 'none' ],
													symbolSize : [ 4, 2 ],
													itemStyle : {
														normal : {
															lineStyle : {
																color : 'orange'
															},
															barBorderColor : 'orange',
															label : {
																position : 'left',
																formatter : function(params) {
																	return Math
																			.round(params.value);
																},
																textStyle : {
																	color : 'orange'
																}
															}
														}
													},
													'data' : [ {
														'type' : 'average',
														'name' : '平均值'
													} ]
												},
												'data' : data[0].month_201901,
												itemStyle: {
													normal: {
														label: {
															show: true, //开启显示
															position: 'top', //在上方显示
															textStyle: { //数值样式
																color: 'black',
																fontSize: 16
															}
														}
													}
												}
											}, {
												'name' : '预算费用',
												'yAxisIndex' : 1,
												'type' : 'bar',
												'data' : data[0].planmonth_201901,
												itemStyle: {
													normal: {
														label: {
															show: true, //开启显示
															position: 'top', //在上方显示
															textStyle: { //数值样式
																color: 'black',
																fontSize: 16
															}
														}
													}
												}
											} ]
								}, {
									title : {
										'text' : '2019-02检验加工部门费用统计'
									},
									series : [ {
										'data' : data[0].month_201902
									}, {
										'data' : data[0].planmonth_201902
									} ]
								}, {
									title : {
										'text' : '2019-03检验加工部门费用统计'
									},
									series : [ {
										'data' : data[0].month_201903
									}, {
										'data' : data[0].planmonth_201903
									}]
								}, {
									title : {
										'text' : '2019-04检验加工部门费用统计'
									},
									series : [ {
										'data' : data[0].month_201904
									}, {
										'data' : data[0].planmonth_201904
									} ]
								}, {
									title : {
										'text' : '2019-05检验加工部门费用统计'
									},
									series : [ {
										'data' : data[0].month_201905
									}, {
										'data' : data[0].planmonth_201905
									} ]
								}, {
									title : {
										'text' : '2019-06检验加工部门费用统计'
									},
									series : [ {
										'data' : data[0].month_201906
									}, {
										'data' : data[0].planmonth_201906
									}]
								}, {
									title : {
										'text' : '2019-07检验加工部门费用统计'
									},
									series : [ {
										'data' : data[0].month_201907
									}, {
										'data' : data[0].planmonth_201908
									} ]
								}, {
									title : {
										'text' : '2019-08检验加工部门费用统计'
									},
									series : [ {
										'data' : data[0].month_201908
									}, {
										'data' : data[0].planmonth_201908
									} ]
								}, {
									title : {
										'text' : '2019-09检验加工部门费用统计'
									},
									series : [ {
										'data' : data[0].month_201909
									}, {
										'data' : data[0].planmonth_201909
									} ]
								}, {
									title : {
										'text' : '2019-10检验加工部门费用统计'
									},
									series : [ {
										'data' : data[0].month_201910
									}, {
										'data' : data[0].planmonth_201910
									} ]
								}, {
									title : {
										'text' : '2019-11检验加工部门费用统计'
									},
									series : [ {
										'data' : data[0].month_201911
									}, {
										'data' : data[0].planmonth_201911
									} ]
								}, {
									title : {
										'text' : '2019-12检验加工部门费用统计'
									},
									series : [ {
										'data' : data[0].month_201912
									}, {
										'data' : data[0].planmonth_201912
									} ]
								} ]
					};
				myChart.setOption(option);
			}
		});
	</script>
</body>
</html>