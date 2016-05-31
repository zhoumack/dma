<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
	<script src="/WeiAnDma/resource/js/echarts/echarts.js"></script>
<script type="text/javascript">
	var myChart;//echars config全局变量
	

	//echars配置参数
	//得到设备deviceRecord集合参数后，调用changeCharts方法配置options	  
 	function echarts(){
        require.config({
            paths: {
                echarts: '/WeiAnDma/resource/js/echarts'
            }
        });
        require(
                [
                    'echarts',
                    'echarts/chart/line',   // 按需加载所需图表，如需动态类型切换功能，别忘了同时加载相应图表
                    'echarts/chart/bar'
                ],
                function (ec) {
                	$("#dataShow").jqLoading({type:1});//等待图示
                     myChart = ec.init(document.getElementById('line_bar_table'));
                	if(varible!=null&&varible!=undefined){
                		changeCharts();
                		return;
                	}
                	
                     var date = new Date();
                     //小于10的月份和天数，前面加0
                     var month=date.getMonth()+1;
                 	if(month<10){month="0"+month;}
                 	var day=date.getDate();
                 	if(day<10){day="0"+day;}
				     date=date.getFullYear()+"-"+month+"-"+day;
                     $.ajax({
     				    type:"post",
     				    url:"/WeiAnDma/getInstrumentData.data",
     				    data:"method=getDeviceRecord&date="+date+"&deviceid="+${result.devList.deviceid},
     				    dataType:"json",
     				    success:function(data){
     				       	 varible=data.return;
     				        if(varible.length<1) 	{
     				       		alert("无仪表数据");
     				       	 }else{
     				       		changeCharts();
     				       	 }
     				     	$('#datetimepicker').val(date);
     				     	$("#dataShow").jqLoading("destroy");
     			        }
     			   });
                    
                }
            );
 	}
 
	function updateDay(date){
		$("#dataShow").jqLoading({type:1});//等待图示
		$.ajax({
			    type:"post",
			    url:"/WeiAnDma/getInstrumentData.data",
			    data:"method=getDeviceRecord&date="+date+"&deviceid="+${result.devList.deviceid},
			    dataType:"json",
			    success:function(data){
			       	 varible=data.return;
			       	 if(varible.length<1) 	{
			       		 $("#dataShow").jqLoading("destroy");alert("无仪表数据");
			       		 myChart=require('echarts').init(document.getElementById('line_bar_table'));
			       	 }else{
			       	  	myChart=require('echarts').init(document.getElementById('line_bar_table'));
				       	changeCharts();
			       	 }
			     //	 require('echarts').init($("#dataShow"));
			       	$("#dataShow").jqLoading("destroy");
		        }
		   });
	}
 	//始终以myChart为初始化对象
	function changeCharts(){
		option2 = {
        	    title : {
        	        text: '流量压力表'
        	    },
        	    dataZoom : {
        	        show : true,
        	        realtime : true,
        	        y:20,
        	        height: 20,
        	        start : 0,
        	        end : 13
        	    },
        	    tooltip : {
        	        trigger: 'axis'
        	    },
        	    legend: {
        	        data:['正向流量m³','负向流量m³','压力 KPA/MPa']
        	    },
        	    toolbox: {
        	        show : true,
        	        feature : {
        	        //    mark : {show: true},
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
        	            boundaryGap : false,
        	            data :(function (){ 
        	            			var res = [];
        	            			var len = varible.length;
        	            			var str;
        	            			for(var i=0;i<=len-1;i++){
        	            				str=varible[i].collecttime.split(" ");
        	            				res.push(str[0].substring(str[0].indexOf("-")+1)+" " +str[1].substring(0,str[1].lastIndexOf(":")))
        	            			
        	            			}
       	            			return res; })(),
       	            	axisLabel:{
       	            		show:true,
       	            		//interval:0
       	            	}
        	        }
        	    ],
        	    yAxis : [
        	        {
        	            type : 'value',
        	            scale:true,
        	            name:'正向流量'
        	        },
        	        {
        	            type : 'value',
        	            scale:true
        	        }
        	    ],
        	    series : [
        	        {
        	            name:'正向流量m³',
        	            type:'line',
        	            data:(function(){
        	            	var res = [];
	            			var len = varible.length;
	            			var str;
	            			for(var i=0;i<=len-1;i++){
	            				 str=varible[i].ftotalflow.indexOf(".");
	            				 if(str==0){
	            					 res.push("0"+varible[i].ftotalflow.substring(0,str+2));
	            				 }else{
	            					 res.push(varible[i].ftotalflow.substring(0,str+2));
	            				 }
	            			}
	            			return res;
        	            })(),
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
        	            name:'压力 KPA/MPa',
        	            type:'line',
        	            yAxisIndex:1,
        	            data:(function(){
        	            	var res = [];
	            			var len = varible.length;
	            			var str;
	            			for(var i=0;i<=len-1;i++){
	            					 res.push(varible[i].pressvalue);
	            			}
	            			return res;
        	            })(),
        	            markPoint : {
        	                data : [
        	                    {type : 'max', name: '最大值'},
        	                    {type : 'min', name: '最小值'}
        	                ]
        	            },
        	           
        	        },
        	        {
        	            name:'负向流量m³',
        	            type:'line',
        	            yAxisIndex:1,
        	            data:(function(){
        	            	var res = [];
	            			var len = varible.length;
	            			var str;
	            			for(var i=0;i<=len-1;i++){
	            				 str=varible[i].rtotalflow.indexOf(".");
	            				 if(str==0){
	            					 res.push("0"+varible[i].rtotalflow.substring(0,str+2));
	            				 }else{
	            					 res.push(varible[i].rtotalflow.substring(0,str+2));
	            				 }
	            			}
	            			return res;
        	            })(),//[-0.9,-0.5, -0.25,-1.12,-0.36, -0.22, -0.7],
        	            markPoint : {
        	                data : [{name : '周最低', value : -2, xAxis: 1, yAxis: -1.5}]
        	            },
        	            markLine : { data : [ {type : 'average', name : '平均值'}]}
        	        }
        	    ]
        	}
		myChart.setOption(option2); 
	}
    </script>
