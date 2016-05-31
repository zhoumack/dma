<%@ page language="java" import="com.mobile.GlobalFunction,com.mobile.GlobalNames,com.mobile.db.info.DbInfoImp,java.util.LinkedList,java.util.HashMap,java.util.LinkedHashMap"  pageEncoding="UTF-8"%>
<jsp:useBean id="Resource" scope="page"  class="com.mobile.resource.ResourceMamage"/>
<jsp:useBean id="MapData" scope="page"  class="com.dma.dmg.MapData"/>

 <html>
<head>
	<%@include file="JsVariblePath.jsp"%>
	<title><%=PageTitle%></title>
	  <script src="<%=JsPath%>/layer/layer/layer.js"></script>

	    
	  <script type="text/javascript">
		  var mapdata;
		  var varible;//echarts options 全局变量
	  		function returnlast(){
	  			location.href="${ContextPath}/views/geogShow.jsp";
	  		}
	  		//菜单栏 区域图示，仪表数据触发函数
	  		function show(html,fn){
	  			if(mapdata!=null && mapdata!=undefined&&fn=='echarts'){
	  				$("#dataShow").jqLoading({type:1});//等待图示
	  				$("#dataShow").html(mapdata);
	  				eval(fn+"()");
	  				$("#dataShow").jqLoading("destroy");;//销毁等待图示
	  				return;
	  			}else if(fn=='echarts'&&(mapdata==null || mapdata==undefined) ){
	  				alert('无设备信息');
	  				setTimeout("iconClick('mapData')", 100);
	  				return;
	  			}
	  			$("#dataShow").jqLoading({type:1});
	  			$.ajax({
	  			   type: "post",
	  			   url: "${ContextPath}/changJsp"  ,//html载入申请
	  			   data: "url="+html,
	  			   success: function(data){
	  			    $("#dataShow").html(data);
	  			   //  alert(data);
	  			 	if(fn!=null &&fn!=undefined){
		  				eval(fn+"()");
		  			}
	  			 	$(".datetimepicker-dropdown-bottom-right").remove();
	  			 	$("#dataShow").jqLoading("destroy");
	  			   }
	  			});
	  			
	  		}
	  		//图标变换
	  		function iconClick(id){
						$("#"+id).css('background-image','url(${IconPath}/u86.png)');
						$("#menuIcon input").not($("#"+id)).each(function(){
							$(this).css('background-image','url(${IconPath}/u86_selected.png)');
						});
	  		}
	  		//map pluginLoaded()传递html
	  		function loadShow(html,fn){
	  			mapdata=html;
	  			varible=null;
	  			$("#dataShow").html(html);
	  			eval(fn+"()");
  				$("#dataShow").jqLoading("destroy");
  				iconClick('instruData');
	  		}
	  		//menu循环绑定
	  		$(function(){
	  			$("#menuIcon input").each(function(){
	  				$(this).click(function(){
	  					$(this).css('background-image','url(${IconPath}/u86.png)');
	  					$("#menuIcon input").not($(this)).each(function(){
		  					$(this).css('background-image','url(${IconPath}/u86_selected.png)');
		  				});
	  				})
	  			});
				$("#mapData").click();
	  		});
	  </script>
	  <style type="text/css" >
	    #dataShow span{ line-height:25px;height:25px;}
	    #downData div{ height:40px;width:290px;vertical-align: middle;}
	    #downData span{ line-height:40px;vertical-align: middle;}
	  </style>
</head>

  
  
<body  style="TEXT-ALIGN: center;width:100%;">
<div id="u0">
	<div id="head" style="height:11%;width:100%;">
			<%@include file="component/head.jsp"%>
	</div>
	
	<div id="body" style="width:100%;height:81%">
		<div style="height:100%;width:18%; float:left;">
				<%@ include file="component/leftMenu.jsp" %>			
		</div>
		<div style="height:100%;width:82%;float:right;" >
			<div style="font-size: 13px;width:100%;background-color: E8F1F6;text-align: left;margin-top:10px;vertical-align: middle;height:45px;">
				&nbsp;<input id="u84_input" type="submit" value="返回上级图层"  style="margin-left:20px;vertical-align: middle;margin-top:15px;" onclick="returnlast()">
			</div>
			<div id="menuIcon" style="width:100%;border-bottom:1px solid #CACACA;text-align: left;margin-top:5px;height:6%;">
					<input type="button"  id="mapData" style="background-image: url(${IconPath}/u86.png);width:140px;height:32px;border: 0 none;color: #ffffff;"  value="区域图示" onclick="show('views/component/map.jsp','pluginLoaded')">
					<input type="button"  id="instruData" style="background-image: url(${IconPath}/u86.png);width:140px;height:32px;border: 0 none;color: #ffffff;"  value="仪表数据" onclick="show('views/component/instrumentData.jsp','echarts')">
			</div>
			<div id="dataShow" style="height:84%;width:100%">
				
			</div>
		</div>
	</div>

	<div id="foot" style="height:8%;width:100%">
		<%@include file="component/foot.jsp"%>
	</div>
</div>

  </body>
</html>