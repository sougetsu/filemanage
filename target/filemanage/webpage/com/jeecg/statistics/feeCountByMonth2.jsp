<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="plug-in/echart/echarts.js"></script>
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

		/*  option = {
			    title : {
			        text: '外协加工各部门费用月度统计',
			        subtext: '费用合计'
			    },
			    tooltip : {
			        trigger: 'axis'
			    },
			    legend: {
			        data:['设计一部','设计二部','设计三部','设计四部','FPGA部','AD/DA部','SOC部','导航芯片部',
			        	'抗辐射加固中心','特种器件部','封测中心','应用开发一部','检验处']
			    },
			    toolbox: {
			        show : true,
			        feature : {
			            dataView : {show: true, readOnly: false},
			            magicType : {show: true, type: ['line', 'bar']},
			            restore : {show: true},
			            saveAsImage : {show: true}
			        }
			    },
			    calculable : true,
			    xAxis : [
			        {
			            type : 'category',
			            data : ['1月','2月','3月','4月','5月','6月','7月','8月','9月','10月','11月','12月']
			        }
			    ],
			    yAxis : [
			        {
			            type : 'value'
			        }
			    ],
			    series : [
			        {
			            name:'设计一部',
			            type:'bar',
			            data:[2.0, 4.9, 7.0, 23.2, 25.6, 76.7, 135.6, 162.2, 32.6, 20.0, 6.4, 3.3],
			            markPoint : {
			                data : [
			                    {type : 'max', name: '最大值'},
			                    {type : 'min', name: '最小值'}
			                ]
			            },
			            markLine : {
			                data : [
			                    {type : 'average', name: '平均值'}
			                ]
			            }
			        },
			        {
			            name:'设计二部',
			            type:'bar',
			            data:[2.0, 4.9, 7.0, 23.2, 25.6, 76.7, 135.6, 162.2, 32.6, 20.0, 6.4, 3.3],
			            markPoint : {
			                data : [
			                    {type : 'max', name: '最大值'},
			                    {type : 'min', name: '最小值'}
			                ]
			            },
			            markLine : {
			                data : [
			                    {type : 'average', name: '平均值'}
			                ]
			            }
			        },
			        {
			            name:'设计三部',
			            type:'bar',
			            data:[2.0, 4.9, 7.0, 23.2, 25.6, 76.7, 135.6, 162.2, 32.6, 20.0, 6.4, 3.3],
			            markPoint : {
			                data : [
			                    {type : 'max', name: '最大值'},
			                    {type : 'min', name: '最小值'}
			                ]
			            },
			            markLine : {
			                data : [
			                    {type : 'average', name: '平均值'}
			                ]
			            }
			        },
			        {
			            name:'设计四部',
			            type:'bar',
			            data:[2.0, 4.9, 7.0, 23.2, 25.6, 76.7, 135.6, 162.2, 32.6, 20.0, 6.4, 3.3],
			            markPoint : {
			                data : [
			                    {type : 'max', name: '最大值'},
			                    {type : 'min', name: '最小值'}
			                ]
			            },
			            markLine : {
			                data : [
			                    {type : 'average', name: '平均值'}
			                ]
			            }
			        },
			        {
			            name:'FPGA部',
			            type:'bar',
			            data:[2.0, 4.9, 7.0, 23.2, 25.6, 76.7, 135.6, 162.2, 32.6, 20.0, 6.4, 3.3],
			            markPoint : {
			                data : [
			                    {type : 'max', name: '最大值'},
			                    {type : 'min', name: '最小值'}
			                ]
			            },
			            markLine : {
			                data : [
			                    {type : 'average', name: '平均值'}
			                ]
			            }
			        },
			        {
			            name:'AD/DA部',
			            type:'bar',
			            data:[2.0, 4.9, 7.0, 23.2, 25.6, 76.7, 135.6, 162.2, 32.6, 20.0, 6.4, 3.3],
			            markPoint : {
			                data : [
			                    {type : 'max', name: '最大值'},
			                    {type : 'min', name: '最小值'}
			                ]
			            },
			            markLine : {
			                data : [
			                    {type : 'average', name: '平均值'}
			                ]
			            }
			        },
			        {
			            name:'SOC部',
			            type:'bar',
			            data:[2.0, 4.9, 7.0, 23.2, 25.6, 76.7, 135.6, 162.2, 32.6, 20.0, 6.4, 3.3],
			            markPoint : {
			                data : [
			                    {type : 'max', name: '最大值'},
			                    {type : 'min', name: '最小值'}
			                ]
			            },
			            markLine : {
			                data : [
			                    {type : 'average', name: '平均值'}
			                ]
			            }
			        },
			        {
			            name:'导航芯片部',
			            type:'bar',
			            data:[2.0, 4.9, 7.0, 23.2, 25.6, 76.7, 135.6, 162.2, 32.6, 20.0, 6.4, 3.3],
			            markPoint : {
			                data : [
			                    {type : 'max', name: '最大值'},
			                    {type : 'min', name: '最小值'}
			                ]
			            },
			            markLine : {
			                data : [
			                    {type : 'average', name: '平均值'}
			                ]
			            }
			        },
			        {
			            name:'抗辐射加固中心',
			            type:'bar',
			            data:[2.0, 4.9, 7.0, 23.2, 25.6, 76.7, 135.6, 162.2, 32.6, 20.0, 6.4, 3.3],
			            markPoint : {
			                data : [
			                    {type : 'max', name: '最大值'},
			                    {type : 'min', name: '最小值'}
			                ]
			            },
			            markLine : {
			                data : [
			                    {type : 'average', name: '平均值'}
			                ]
			            }
			        },
			        {
			            name:'特种器件部',
			            type:'bar',
			            data:[2.0, 4.9, 7.0, 23.2, 25.6, 76.7, 135.6, 162.2, 32.6, 20.0, 6.4, 3.3],
			            markPoint : {
			                data : [
			                    {type : 'max', name: '最大值'},
			                    {type : 'min', name: '最小值'}
			                ]
			            },
			            markLine : {
			                data : [
			                    {type : 'average', name: '平均值'}
			                ]
			            }
			        },
			        {
			            name:'封测中心',
			            type:'bar',
			            data:[2.0, 4.9, 7.0, 23.2, 25.6, 76.7, 135.6, 162.2, 32.6, 20.0, 6.4, 3.3],
			            markPoint : {
			                data : [
			                    {type : 'max', name: '最大值'},
			                    {type : 'min', name: '最小值'}
			                ]
			            },
			            markLine : {
			                data : [
			                    {type : 'average', name: '平均值'}
			                ]
			            }
			        },
			        {
			            name:'应用开发一部',
			            type:'bar',
			            data:[2.0, 4.9, 7.0, 23.2, 25.6, 76.7, 135.6, 162.2, 32.6, 20.0, 6.4, 3.3],
			            markPoint : {
			                data : [
			                    {type : 'max', name: '最大值'},
			                    {type : 'min', name: '最小值'}
			                ]
			            },
			            markLine : {
			                data : [
			                    {type : 'average', name: '平均值'}
			                ]
			            }
			        }
			        
			    ]
			};  */
		option = {
			timeline : {
				data : [ '2002-01-01', '2003-01-01', '2004-01-01',
						'2005-01-01', '2006-01-01', '2007-01-01', '2008-01-01',
						'2009-01-01', '2010-01-01', '2011-01-01' ],
				label : {
					formatter : function(s) {
						return s.slice(0, 4);
					}
				},
				autoPlay : true,
				playInterval : 1000
			},
			options : [
					{
						title : {
							'text' : '2002全国宏观经济指标',
							'subtext' : '数据来自国家统计局'
						},
						tooltip : {
							'trigger' : 'axis'
						},
						legend : {
							x : 'right',
							'data' : [ 'GDP', '金融', '房地产', '第一产业', '第二产业',
									'第三产业' ],
							'selected' : {
								'GDP' : true,
								'金融' : false,
								'房地产' : true,
								'第一产业' : false,
								'第二产业' : false,
								'第三产业' : false
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
							'data' : [ '北京', '\n天津', '河北', '\n山西', '内蒙古',
									'\n辽宁', '吉林', '\n黑龙江', '上海', '\n江苏', '浙江',
									'\n安徽', '福建', '\n江西', '山东', '\n河南', '湖北',
									'\n湖南', '广东', '\n广西', '海南', '\n重庆', '四川',
									'\n贵州', '云南', '\n西藏', '陕西', '\n甘肃', '青海',
									'\n宁夏', '新疆' ]
						} ],
						yAxis : [ {
							'type' : 'value',
							'name' : 'GDP（亿元）',
							'max' : 53500
						}, {
							'type' : 'value',
							'name' : '其他（亿元）'
						} ],
						series : [
								{
									'name' : 'GDP',
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
									'data' : dataMap.dataGDP['2002']
								}, {
									'name' : '金融',
									'yAxisIndex' : 1,
									'type' : 'bar',
									'data' : dataMap.dataFinancial['2002']
								}, {
									'name' : '房地产',
									'yAxisIndex' : 1,
									'type' : 'bar',
									'data' : dataMap.dataEstate['2002']
								}, {
									'name' : '第一产业',
									'yAxisIndex' : 1,
									'type' : 'bar',
									'data' : dataMap.dataPI['2002']
								}, {
									'name' : '第二产业',
									'yAxisIndex' : 1,
									'type' : 'bar',
									'data' : dataMap.dataSI['2002']
								}, {
									'name' : '第三产业',
									'yAxisIndex' : 1,
									'type' : 'bar',
									'data' : dataMap.dataTI['2002']
								} ]
					}, {
						title : {
							'text' : '2003全国宏观经济指标'
						},
						series : [ {
							'data' : dataMap.dataGDP['2003']
						}, {
							'data' : dataMap.dataFinancial['2003']
						}, {
							'data' : dataMap.dataEstate['2003']
						}, {
							'data' : dataMap.dataPI['2003']
						}, {
							'data' : dataMap.dataSI['2003']
						}, {
							'data' : dataMap.dataTI['2003']
						} ]
					}, {
						title : {
							'text' : '2004全国宏观经济指标'
						},
						series : [ {
							'data' : dataMap.dataGDP['2004']
						}, {
							'data' : dataMap.dataFinancial['2004']
						}, {
							'data' : dataMap.dataEstate['2004']
						}, {
							'data' : dataMap.dataPI['2004']
						}, {
							'data' : dataMap.dataSI['2004']
						}, {
							'data' : dataMap.dataTI['2004']
						} ]
					}, {
						title : {
							'text' : '2005全国宏观经济指标'
						},
						series : [ {
							'data' : dataMap.dataGDP['2005']
						}, {
							'data' : dataMap.dataFinancial['2005']
						}, {
							'data' : dataMap.dataEstate['2005']
						}, {
							'data' : dataMap.dataPI['2005']
						}, {
							'data' : dataMap.dataSI['2005']
						}, {
							'data' : dataMap.dataTI['2005']
						} ]
					}, {
						title : {
							'text' : '2006全国宏观经济指标'
						},
						series : [ {
							'data' : dataMap.dataGDP['2006']
						}, {
							'data' : dataMap.dataFinancial['2006']
						}, {
							'data' : dataMap.dataEstate['2006']
						}, {
							'data' : dataMap.dataPI['2006']
						}, {
							'data' : dataMap.dataSI['2006']
						}, {
							'data' : dataMap.dataTI['2006']
						} ]
					}, {
						title : {
							'text' : '2007全国宏观经济指标'
						},
						series : [ {
							'data' : dataMap.dataGDP['2007']
						}, {
							'data' : dataMap.dataFinancial['2007']
						}, {
							'data' : dataMap.dataEstate['2007']
						}, {
							'data' : dataMap.dataPI['2007']
						}, {
							'data' : dataMap.dataSI['2007']
						}, {
							'data' : dataMap.dataTI['2007']
						} ]
					}, {
						title : {
							'text' : '2008全国宏观经济指标'
						},
						series : [ {
							'data' : dataMap.dataGDP['2008']
						}, {
							'data' : dataMap.dataFinancial['2008']
						}, {
							'data' : dataMap.dataEstate['2008']
						}, {
							'data' : dataMap.dataPI['2008']
						}, {
							'data' : dataMap.dataSI['2008']
						}, {
							'data' : dataMap.dataTI['2008']
						} ]
					}, {
						title : {
							'text' : '2009全国宏观经济指标'
						},
						series : [ {
							'data' : dataMap.dataGDP['2009']
						}, {
							'data' : dataMap.dataFinancial['2009']
						}, {
							'data' : dataMap.dataEstate['2009']
						}, {
							'data' : dataMap.dataPI['2009']
						}, {
							'data' : dataMap.dataSI['2009']
						}, {
							'data' : dataMap.dataTI['2009']
						} ]
					}, {
						title : {
							'text' : '2010全国宏观经济指标'
						},
						series : [ {
							'data' : dataMap.dataGDP['2010']
						}, {
							'data' : dataMap.dataFinancial['2010']
						}, {
							'data' : dataMap.dataEstate['2010']
						}, {
							'data' : dataMap.dataPI['2010']
						}, {
							'data' : dataMap.dataSI['2010']
						}, {
							'data' : dataMap.dataTI['2010']
						} ]
					}, {
						title : {
							'text' : '2011全国宏观经济指标'
						},
						series : [ {
							'data' : dataMap.dataGDP['2011']
						}, {
							'data' : dataMap.dataFinancial['2011']
						}, {
							'data' : dataMap.dataEstate['2011']
						}, {
							'data' : dataMap.dataPI['2011']
						}, {
							'data' : dataMap.dataSI['2011']
						}, {
							'data' : dataMap.dataTI['2011']
						} ]
					} ]
		};
		myChart.setOption(option);
	</script>
</body>
</html>