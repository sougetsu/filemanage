$(document).ready(function(){
	jjztqk();
	xdnyfzqk();
	jjyxqs();
	zhexian();
	jjzbwcqk();

});
var lableColor = '#fff';
var colorTemp=[
	'#FE8463','#9BCA63','#FAD860','#60C0DD','#0084C6',
    '#D7504B','#C6E579','#26C0C0','#F0805A','#F4E001',
	'#B5C334'
];
function jjztqk()
{
	var jjztqk_ = echarts.init(document.getElementById('jjztqk'),'macarons'); 
	var option = {
	    color:colorTemp,
		title : {
	     	        text: '2018年上半年各部门外协加工情况',
	     	        x:'center',
	     	       textStyle:
		        	{
		        		color:lableColor
		        	}
	     	    },
	    tooltip : {
	        trigger: 'axis',
	        formatter: '{a0}: {c0}%<br />{a1}: {c1}万元',
	        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
	            type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
	        }
	    },
	    legend: {
	    	textStyle:{
        		color:lableColor
        	  },
        	  x:'center',
        	  y:'30px',
	        data:['同比','金额']
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
	            data : ['设计一部','设计二部','设计三部','设计四部','导航芯片 部','AD/DA部','FPGA部']
	        }
	    ],
	    yAxis : [
	        {
	            type : 'value',
	            name : '金额/万元',
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
	            name : '同比增长率/%',
	            max: 50,
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
	            name:'同比',
	            barWidth:'20',
	            type:'line',
	            yAxisIndex: 1,
	            data:[9.5,-33.3,5.9,4.7,4.2,14.3,4]
	        },
	        {
	            name:'金额',
	            barWidth:'20',
	            type:'bar',
	            data:[298.7,16.77,410.4,401,228,58.9,2.04]
	        }
	    ]
	};

	jjztqk_.setOption(option, true);
}
function xdnyfzqk()
{
	var xdnyfzqk =echarts.init(document.getElementById('xdnyfzqk'),'macarons'); 
	var option = {
		color:colorTemp,
	    title : {
	        text: '2018年时代民芯上半年加工汇总',
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
	        data:['','辐射外协','生产外协','PCB 制板','测试服务','版图设计','照相','ESD\FIB','DPA','电路分析','去封装'],
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
	            data : ['1月','2月','3月','4月','5月','6月','7月'],
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
	    series : [
	        {
	            name:'辐射外协',
	            type:'line',
	            barWidth:10,
	            stack: '完成情况',
	            data:[660500,559300,726900,671900,664800,726800,635500]
	        },
	        {
	            name:'生产外协',
	            type:'line',
	            stack: '完成情况',
	            barWidth:10,
	            data:[210954,210954,759724,879528,918981,1126452,576800]
	        },
	        {
	            name:'PCB 制板',
	            type:'line',
	            barWidth:10,
	            stack: '完成情况',
	            data:[14166,11834,30494,25307,34778,51102,10861]
	        },
	        {
	            name:'测试服务',
	            type:'line',
	            barWidth:10,
	            stack: '完成情况',
	            data:[1100,1000,1400,500,3500,0,0]
	        },
	        {
	            name:'版图设计',
	            type:'line',
	            barWidth:10,
	            stack: '完成情况',
	            data:[4398,1976,2550,3900,2940,3287,3006]
	        },
	        {
	            name:'照相',
	            type:'line',
	            barWidth:10,
	            stack: '完成情况',
	            data:[151100,149500,166700,151000,153900,221200,160400]
	        },
	        {
	            name:'ESD\FIB',
	            type:'line',
	            barWidth:10,
	            stack: '完成情况',
	            data:[314534,314535,183919,331952,379371,756281,401594 ]
	        },
	        {
	            name:'DPA',
	            type:'line',
	            barWidth:10,
	            stack: '完成情况',
	            data:[128813,128814,233586 ,206238 ,324013 ,513047 ,255347 ]
	        },
	        {
	            name:'电路分析',
	            type:'line',
	            barWidth:10,
	            stack: '完成情况',
	            data:[753512,75351,103336 ,89328 ,111472 ,134361 ,111250 ]
	        }
	        ,
	        {
	        	name:'去封装',
	        	type:'line',
	        	barWidth:10,
	        	stack: '完成情况',
	        	data:[20890,20889,42231 ,29694 ,52369 ,58490 ,32427 ]
	        }
	    ]
	};
	xdnyfzqk.setOption(option,true);
}
function jjyxqs(){
	var jjyxqs =echarts.init(document.getElementById('jjyxqs'),'macarons');
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
	                    data : ['2015','2016','2017','2018']
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
	    		    	name : '数量/亿元'
	    		    },
			    	series:[
			    	        {
			    	        	name:'外协总支出',
			    	            data:[760.98,858,953.18,1000]
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
			    	            data:[738,580,332,224]
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
			    	            data:[782,365,265,133]
			    	        }
			    	]	
			    }
                
			]
	};
	
	jjyxqs.setOption(option,true);
}
function jjzbwcqk()
{
	var jjzbwcqk = echarts.init(document.getElementById('jjzbwcqk'),'macarons'); 
	


	var option = {
	    color:colorTemp,
		title : {
	     	        text: '2018年各部门加工指标完成情况',
	     	        x:'center',
	     	       textStyle:
		        	{
		        		color:lableColor
		        	}
	     	    },
	    tooltip : {
	        trigger: 'axis',
	        formatter: '{a0}: {c0}%<br />{a1}: {c1}亿元<br />{a2}: {c2}亿元',
	        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
	            type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
	        }
	    },
	    legend: {
	    	textStyle:{
        		color:lableColor
        	  },
        	  x:'center',
        	  y:'30px',
	        data:['完成进度','全年任务','1-7月完成']
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
	            data : ['设计一部','设计二部','设计三部','设计四部','导航芯片 部','AD/DA部','FPGA部']
	        }
	    ],
	    yAxis : [
	        {
	            type : 'value',
	            name : '金额/万元',
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
	            name : '完成进度/%',
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
	            name:'完成进度',
	            barWidth:'20',
	            type:'line',
	            yAxisIndex: 1,
	            data:[58.07,57.11,38.28,50.00,50.81,64.46,52.53]
	        },
	        {
	            name:'全年任务',
	            barWidth:'20',
	            type:'bar',
	            data:[800,820,46.64,9,26.06,179,510.6]
	        },
	        {
	            name:'1-7月完成',
	            barWidth:'20',
	            type:'bar',
	            data:[464.57,468.34,17.85,4.50,13.24,115.38,268.22]
	        }
	    ]
	};

	jjzbwcqk.setOption(option, true);
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
