$(document).ready(function(){
	modulefeeCountByYear();
	modulefeeCountByMonth();
	modulesupplyTop10();
	modulezhtj();
});
var lableColor = '#fff';
var colorTemp=[
	'#FE8463','#9BCA63','#FAD860','#60C0DD','#0084C6',
    '#D7504B','#C6E579','#26C0C0','#F0805A','#F4E001',
	'#B5C334'
];
function modulefeeCountByYear()
{
	var module_departfee = echarts.init(document.getElementById('module_departfee'),'macarons'); 
	
	$.ajax({
		type : "POST",
		url : "statisticsController.do?listFeeCountByYear&reportType=column&applyType=3&year=2019",
		success : function(jsondata) {
			jsondata=JSON.parse(jsondata);
			var departdata=jsondata[0].data;
			var data=jsondata[1].data;
			var xAxisData=[];
			var seriesData=[];
			var option = {
			    color:colorTemp,
				title : {
			     	        text: '2019年模块外协各部门加工费用统计',
			     	        x:'center',
			     	       textStyle:
				        	{
				        		color:lableColor
				        	}
			     	    },
			    tooltip : {
			        trigger: 'axis',
			        formatter: '{a0}: {c0}%<br />{a1}: {c1}元<br />{a2}: {c2}元',
			        axisPointer : {            // 坐标轴指示器，坐标轴 有效
			            type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
			        }
			    },
			    legend: {
			    	textStyle:{
		        		color:lableColor
		        	  },
		        	  x:'center',
		        	  y:'30px',
			        data:['费用比例','预估金额','实际金额']
			    },
			    grid: {
			        left: '3%',
			        right: '4%',
			        bottom: '12%',
			        containLabel: true
			    },
			    xAxis : [
			        {
			            type : 'category',
			            axisLine:
			            	{
			            	lineStyle:
			            		{
			            		color:lableColor
			            		}
			            	},
			            splitLine:
			            	{
			            		show:false
			            	},
			            	axisLabel:
		            		{
			            		interval:0,
				            	rotate:-30,
		            		    textStyle:
		            			{
		            			color:lableColor
		            			}
		            		},
			            data : departdata[0].departname
			        }
			    ],
			    yAxis : [
			        {
			            type : 'value',
			            name : '金额/元',
			            axisLine:
		            	{
		            	lineStyle:
		            		{
		            		color:lableColor
		            		}
		            	},
			            splitLine:
		            	{
			            	lineStyle:{
			            		type:'dashed',
			            		color: '#666'
			            	}
		            	},
		            	axisLabel:
		            		{
		            		textStyle:
		            			{
		            			color:lableColor
		            			}
		            		}
			        },
			        {
			            type : 'value',
			            name : '实际费用比例/%',
			            max: 100,
			            axisLine:
		            	{
		            	lineStyle:
		            		{
		            		color:lableColor
		            		}
		            	},
			            splitLine:
		            	{
			            	lineStyle:{
			            		type:'dashed',
			            		color: '#666'
			            	}
		            	},
		            	axisLabel:
		            		{
		            		textStyle:
		            			{
		            			color:lableColor
		            			}
		            		}
			        }
			    ],
			    series : [
			        {
			            name:'费用比例',
			            barWidth:'20',
			            type:'line',
			            yAxisIndex: 1,
			            data:data[0].ratio
			        },
			        {
			            name:'预估金额',
			            barWidth:'20',
			            type:'bar',
			            data:data[0].plancost
			        },
			        {
			            name:'实际金额',
			            barWidth:'20',
			            type:'bar',
			            data:data[0].cost
			        }
			    ]
			};

			module_departfee.setOption(option, true);
		}})
}

function modulefeeCountByMonth()
{
	var module_typefee =echarts.init(document.getElementById('module_typefee'),'macarons'); 
	$.ajax({
		type : "POST",
		url : "statisticsController.do?listTypeCountByMonth&reportType=line&applyType=3",
		success : function(jsondata) {
			jsondata=JSON.parse(jsondata);
			var typedata=jsondata[0].data;
			var data=jsondata[1].data;
			var option = {
				color:colorTemp,
			    title : {
			        text: '2019年模块外协月度加工类型费用统计',
			        x:'center',
			        textStyle:{
			        	color:lableColor
			        }
			    },
			    tooltip : {
			        trigger: 'axis',
			        axisPointer : {     
			            type : 'shadow' 
			        }
			    },
			    legend: {
			        data: typedata[0].typename,
			        textStyle:{
			        	color:lableColor
			        },
			        orient:'vertical',
			        right:10,
			        top:'12%'
			    },
			    grid: {
			        left: 0,
			        right: '20%',
			        bottom: '3%',
			        containLabel: true
			    },
			    xAxis : [
			        {
			            type : 'category',
			            data : ['1月','2月','3月','4月','5月','6月','7月','8月','9月','10月','11月','12月'],
			            axisLine:{
			            	lineStyle:{
			            		color:lableColor
			            	}
			            },
			            splitLine: {
			            	show:false
			            },
			            axisLabel:{
			            	textStyle:{
			            		color:lableColor
			            	}
			            },
			        }
			    ],
			    yAxis : [
			        {
			            type : 'value',
			            name:'数量/万元',
			            axisLine:{
			            	lineStyle:{
			            		color:lableColor
			            	}
			            },
			            splitLine: {
			            	lineStyle:{
			            		type:'dashed',
			            		color: '#666'
			            	}
			            },
			            axisLabel:{
			            	textStyle:{
			            		color:lableColor
			            	}
			            }
			        }
			    ],
			    series : data
			};
			module_typefee.setOption(option,true);
		}
	});
}

function modulesupplyTop10()
{
	var module_supply = echarts.init(document.getElementById('module_supplytop10'),'macarons'); 
	$.ajax({
		type : "POST",
		url : "statisticsController.do?listTop10SupplyByYear&reportType=line&applyType=3&year=2019",
		success : function(jsondata) {
			jsondata=JSON.parse(jsondata);
			var supplydata=jsondata[0].data;
			var supplycountdata=jsondata[1].data;
			var option = {
					color:colorTemp,
					title: {
		                text: '2019年模块外包供应商排名Top10',
				        x:'center',
				        textStyle:{
				        	color:lableColor
				        }
		            },
		            legend: {
		    	    	textStyle:{
		            		color:lableColor
		            	  },
		            	  x:'center',
		            	  y:'30px',
		    	        data:['外包加工次数']
		    	    },
		            tooltip : {
				        trigger: 'item',
				        // axisPointer : {            // 坐标轴指示器，坐标轴触发有效
				        //     type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
				        // },
				        formatter:function(params){
				        	return params.seriesName+"<br />"+params.name+"："+Math.abs(params.value);
				        }
				    },
				    grid: {
				        left: '2',
				        right: '20%',
				        //bottom: '5',
				        containLabel: true
		
				    },
		            xAxis: [{
		                type: 'value',
		                name:'数量/次',
		                axisLine:{
		                	lineStyle:{
		                		color:lableColor
		                	}
		                },
		                splitLine: {
			            	lineStyle:{
			            		type:'dashed',
			            		color: '#666'
			            	}
			            },
		                axisTick:{
		                	lineStyle:{
		                		color:'#fff'
		                	}
		                },
		                axisLabel:{
			            	rotate:60,
			            	textStyle:{
			            		color:lableColor
			            	},
			            	formatter:function(value){
			            		return Math.abs(value);
			            	}
			            }
		            }],
		            yAxis: [{
		                type: 'category',
		                inverse: true, 
		                axisLine:{
		                	lineStyle:{
		                		color:lableColor
		                	}
		                },
		                splitLine: {
			            	show:false
			            },
			            axisTick:{
			            	show:false
			            },
		                axisLabel:{
			            	interval:0,
			            	//rotate:60,
			            	textStyle:{
			            		color:lableColor
			            	}
			            },
			            data: supplydata
		            }],
		            series: [
		                {
		                	name: '外包加工次数',
		                    type: 'bar',
		                    yAxisIndex:0,
		                    barWidth:12,
		                    data: supplycountdata
		                }
		            ]
				};
			
			module_supply.setOption(option, true);
		}
	});
}

function modulezhtj(){
	var module_zhtj =echarts.init(document.getElementById('module_zhtj'),'macarons');
	$.ajax({
		type : "POST",
		url : "statisticsController.do?listZhtjByYear&reportType=line&applyType=3&year=2019",
		success : function(jsondata) {
			jsondata=JSON.parse(jsondata);
			var feedata=jsondata[0].data;
			var orderdata=jsondata[1].data;
			var ergencydata=jsondata[2].data;
		var option = {
				baseOption: {
					timeline: {
	                    //loop: false,        
	                    axisType: 'category',
	                    show: true,
	                    autoPlay: true,
	                    left:2,
	                    right:2,
	                    playInterval: 2000,
	                    lineStyle:{
	                    	color: lableColor,    
	                    	width: 1,    
	                    	type: 'dashed'
	                    },
	                    label:{
	                    	show: true,
	                        interval: 'auto',
	                        rotate: 0,
	                        textStyle: {
	                            color: lableColor
	                        }
	                    },
	                    controlStyle:{
	                    	normal : {
	                            color : lableColor,
	                            borderColor:lableColor
	                        }
	                    },
	                    symbolRotate:'-30',
	                    data: ['外协总支出','复投次数','加急次数']         
	                },
		            color:colorTemp,
		            calculable : true,
		            tooltip : {
		            	trigger: 'axis',
		            	axisPointer : {
		            		type : 'shadow'       
		            	}
		            },
		            grid: {
	    		        left: '2',
	    		        right: '2',
	    		        bottom: '50',
	    		        containLabel: true
	    		    },
		            xAxis : [
		                {
		                    type : 'category',
		                    axisLine:{
			                    lineStyle:{
			                       color:lableColor
			                    }
			                 },
			                 splitLine: {
			    		         show:false
			    		     },
	                         axisLabel:{
		    		            	interval:0,
		    		            	//rotate:60,
		    		            	textStyle:{
		    		            		color:lableColor
		    		            	}
		                            
		    		            },
		                    data : ['2019','2020','2021','2022']
		                }
		            ],
		            yAxis : [
		                {
		                         type : 'value',
		                         name : '数量',
		                         axisLine:{
			                        lineStyle:{
			                        	color:lableColor
			                        }
			                     },
			                     splitLine: {
			    		            lineStyle:{
			    		            	type:'dashed',
			    		            	color: '#666'
			    		            }
			    		         },
		                         axisLabel:{
			    		            	textStyle:{
			    		            		color:lableColor
			    		            	}
			                            
			    		            },
		                     }
		            ],
	                series : [
	                    {
	                    	
	                        type:'bar',
	                        barWidth:'20',
	                        markLine : {
	                            itemStyle:{
	                                normal:{
	                                    lineStyle:{
	                                        type: 'dashed'
	                                    }
	                                }
	                            },
	                            data : [
	                                [{type : 'min'}, {type : 'max'}]
	                            ]
	                        }
	                    }
	                ]
				},
				options: [
				    {
				    	title: {
		    		        text: '时代民芯外协总支出趋势分析',
		    		        x:'center',
		    		        textStyle:{
		    		        	color:lableColor
		    		        }
		    		    },
		    		    yAxis:{
		    		    	name : '数量/元'
		    		    },
				    	series:[
				    	        {
				    	        	name:'外协总支出',
				    	            data:feedata
				    	        }
				    	]	
				    },
				    {
				    	title: {
		    		        text: '外协加工复投趋势分析',
		    		        x:'center',
		    		        textStyle:{
		    		        	color:lableColor
		    		        }
		    		    },
		    		    yAxis:{
		    		    	name : '次数/年'
		    		    },
				    	series:[
				    	        {
				    	        	name:'复投次数',
				    	            data:orderdata
				    	        }
				    	]	
				    },
				    {
				    	title: {
		    		        text: '外协加工加急趋势分析',
		    		        x:'center',
		    		        textStyle:{
		    		        	color:lableColor
		    		        }
		    		    },
		    		    yAxis:{
		    		    	name : '次数/年'
		    		    },
				    	series:[
				    	        {
				    	        	name:'加急次数',
				    	            data:ergencydata
				    	        }
				    	]	
				    }
	                
				]
		};
		module_zhtj.setOption(option,true);
	}
	});
}

function zhexian(){
    var option = {
		baseOption: {
			timeline: {
              //loop: false,        
              axisType: 'category',
              show: true,
              autoPlay: true,
              playInterval: 1500,
              lineStyle:{
              	color: lableColor,    
              	width: 1,    
              	type: 'dashed'
              },
              label:{
              	show: true,
                  interval: 'auto',
                  rotate: 0,
                  textStyle: {
                      color: lableColor
                  }
              },
              controlStyle:{
              	normal : {
                      color : lableColor,
                      borderColor:lableColor
                  }
              },
              data: ['2015','2016','2017','2018']         
          },
          color:colorTemp,
          tooltip : {
	          trigger: 'axis',
	          axisPointer : {            // 坐标轴指示器，坐标轴触发有效
	            type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
	          }
	        },
        legend: {
        	  textStyle:{
        		color:lableColor
        	  },
        	  x:'right',
        	  y:'20px',
              data:['老年人','适龄儿童','育龄妇女']
          },
        calculable : true,
        grid: {
	        left: '2',
	        right: '2',
	        bottom: '80',
	        containLabel: true
	    },
        xAxis : [
                 {
                     type : 'category',
                     axisLine:{
	                    lineStyle:{
	                       color:lableColor
	                    }
	                 },
	                 splitLine: {
	    		         show:false
	    		     },
                     axisLabel:{
    		            	interval:0,
    		            	rotate:60,
    		            	textStyle:{
    		            		color:lableColor
    		            	}
                            
    		            },
                     data : ['设计一部','设计二部','设计三部','设计四部','导航芯片 部','AD/DA部','FPGA部']
                 }
        ],
        yAxis : [
                 {
                     type : 'value',
                     name : '数量/万元',
                     axisLine:{
                        lineStyle:{
                        	color:lableColor
                        }
                     },
                     splitLine: {
    		            lineStyle:{
    		            	type:'dashed',
    		            	color: '#666'
    		            }
    		         },
                     axisLabel:{
    		            	textStyle:{
    		            		color:lableColor
    		            	}
                            
    		            },
                 }
        ],
        series : [
            {
            	type:'line', 
            	markLine : {
		                data : [
		                    {type : 'average', name : '平均值'}
		                ]
		            },
            	name:'实际支出'
            }
        ]
		},
		options: [
           {
          	title: {
                text: '2015年度各部门实际支出费用',
		        x:'center',
		        textStyle:{
		        	color:lableColor
		        }
            },
          	series : [
  	              {
  	                	data:[1312,1200, 1720, 1010, 1340, 1400, 2300]
  	                }
  	            ]
           },
         {
           	title: {
                 text: '2016年度各部门实际支出费用',
 		        x:'center',
 		        textStyle:{
 		        	color:lableColor
 		        }
             },
           	series : [
   	              {
   	                	data:[2322,1230, 1120, 2210, 1340, 2100, 1330]
   	                }
   	            ]
            },
         {
           	title: {
                 text: '2017年度各部门实际支出费用',
 		        x:'center',
 		        textStyle:{
 		        	color:lableColor
 		        }
             },
           	series : [
   	              {
   	                	data:[1412,1200, 1320, 1010, 1340, 900, 1900]
   	                }
   	            ]
            },
         {
           	title: {
                 text: '2018年度各部门实际支出费用',
 		        x:'center',
 		        textStyle:{
 		        	color:lableColor
 		        }
             },
           	series : [
   	              {
   	                	data:[1512,1200, 1320, 2010, 1340, 1245, 2100]
   	                }
   	            ]
            }
		]
	};
	var myChart = echarts.init(document.getElementById('xzkzpsr'),'macarons');
	myChart.setOption(option);
}
