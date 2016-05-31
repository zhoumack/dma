<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id="Resource" scope="page" class="com.mobile.resource.ResourceMamage" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
<%@include file="JsVariblePath.jsp"%>
<title>GIS地理展示</title>
<%--<link rel="stylesheet" type="text/css" href="${CssPath }/geogShow.css">--%>
<script type="text/javascript">
	function show(){
		location.href="DataAnalyze.jsp";
	}
	
	var map;
	var label=null;
	$(function(){
		createMap();//创建地图
	      setMapEvent();//设置地图事件
	      addMapControl();//向地图添加控件
	      addMapOverlay();//向地图添加覆盖物
	      map.setCurrentCity("重庆");    
	      map.enableScrollWheelZoom(true);
	    
	});
	function createMap(){
		map = new BMap.Map("container");
		map.centerAndZoom(new BMap.Point(106.492561, 29.534365), 19);
	}
	function setMapEvent(){
		map.addEventListener("click", show);
	}
	function addMapControl(){
		map.addControl(new BMap.MapTypeControl());   //添加地图类型控件
		var top_left_control = new BMap.ScaleControl({anchor: BMAP_ANCHOR_TOP_LEFT});// 左上角，添加比例尺
		var top_left_navigation = new BMap.NavigationControl();  //左上角，添加默认缩放平移控件
		var top_right_navigation = new BMap.NavigationControl({anchor: BMAP_ANCHOR_TOP_RIGHT, type: BMAP_NAVIGATION_CONTROL_SMALL}); //右上角，仅包含平移和缩放按钮
		map.addControl(top_left_control);        
		map.addControl(top_left_navigation);     
		map.addControl(top_right_navigation); 
	}
	function addMapOverlay(){
		 var plOpts = [
		               {strokeColor:"#0ff",strokeWeight:"2",strokeOpacity:"0.6"},
		              	{strokeColor:"#00f",strokeWeight:"2",strokeOpacity:"0.6"}
		             ];
           var plPath =[
     	        [
     	         new BMap.Point(106.491845,29.537743),
     	         new BMap.Point(106.492159,29.536572),
     	          new BMap.Point(106.492478,29.535418),
     	          new BMap.Point(106.492667,29.534491),
     	          new BMap.Point(106.492689,29.533913),
     	          new BMap.Point(106.492608,29.533544),
     	          new BMap.Point(106.491943,29.534066),
     	          new BMap.Point(106.49188,29.535241),
     	          new BMap.Point(106.491575,29.536415),
     	          new BMap.Point(106.491409,29.536816),
     	          new BMap.Point(106.491548,29.53733),
     	          new BMap.Point(106.490973,29.537224),
     	          new BMap.Point(106.490789,29.537429),
     	          new BMap.Point(106.491018,29.537566),
     	          new BMap.Point(106.491845,29.537739),
     	          new BMap.Point(106.491845,29.537739),
     	          new BMap.Point(106.491845,29.537739)
     	      ],[
     	          new BMap.Point(106.538149,29.581584),
     	          new BMap.Point(106.538904,29.581844),
     	          new BMap.Point(106.53938,29.582158),
     	          new BMap.Point(106.539897,29.583579),
     	          new BMap.Point(106.539281,29.583987),
     	          new BMap.Point(106.538801,29.58383),
     	          new BMap.Point(106.53837,29.583461),
     	          new BMap.Point(106.537988,29.583182),
     	          new BMap.Point(106.537377,29.582805),
     	          new BMap.Point(106.53708,29.582405),
     	          new BMap.Point(106.537143,29.581808),
     	          new BMap.Point(106.537399,29.581427),
     	          new BMap.Point(106.53788,29.58151),
     	          new BMap.Point(106.538136,29.58158),
     	          new BMap.Point(106.538154,29.581588),
     	          new BMap.Point(106.538154,29.581588),
     	          new BMap.Point(106.538154,29.581588)
     	      ]
           ];
           for(var index = 0; index < plOpts.length; index++){
      			var polygon= new BMap.Polygon(plPath[index],plOpts[index]);
      		    polygon.addEventListener("mousemove", function(e){
	      			map.removeOverlay(label);
	    	        var opts = {
	    		      position : e.point,    // 指定文本标注所在的地理位置
	    		      offset   : new BMap.Size(20,0)    //设置文本偏移量
	    		    }
	    	        label = new BMap.Label("DMA",opts); // 创建文本标注对象
	    	        label.setStyle({
	    	             color : "red",
	    	             fontSize : "12px",
	    	             height : "20px",
	    	             lineHeight : "20px",
	    	             fontFamily:"微软雅黑"
	    	         });
    	  	  	    map.addOverlay(label); 
      	   	  });
      		  polygon.addEventListener("mouseout", function(){
  	    		map.removeOverlay(label);
  	    	  });
             map.addOverlay(polygon);
           }
	}
	function theLocation(x,y){
	//		map.clearOverlays(); 
			var new_point = new BMap.Point(x,y);
<%--			var marker = new BMap.Marker(new_point);  // 创建标注--%>
<%--			map.addOverlay(marker);              // 将标注添加到地图中--%>
			map.panTo(new_point);      
	}
	
	function coordChange(){
		var x,y;
		var strs= new Array(); //定义一数组 
		strs=$("#area_code").val().split(",")
		x=strs[0];
		y=strs[1];
		theLocation(x,y);
	}
</script>
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=BbTsVGHdcKUkNRjD9zvrgRNw"></script>
</head>
<body style="TEXT-ALIGN: center;width:100%;">
	<div id="u0">
		<div id="head" style="height:11%;width:100%;">
			<%@include file="component/head.jsp"%>
		</div>
		<div id="body" style="width:100%;height:81%">
			<div style="width:100%;height:100%;">
				<div style="height:100%;width:18%; float:left;">
					<%@ include file="component/leftMenu.jsp" %>			
				</div>
				<div style="height:100%;width:82%;float:right;" >
						<div style="width:100%;height:31px;margin-top:9px;background-color:#F5F5F5;border-radius:5px;text-align:left">
							<span style="line-height:31px ;margin-left:10px;color: #2fa4e7;font-size: 13px;">当前位置  /  首页</span>
						</div>
						<div style="width:100%;height:70px;margin-top:9px;background-color:#E8F1F6;border-radius:5px;text-align:left">
							<div><span style="line-height:31px ;margin-left:10px;color: #317eac;font-size: 15px;font-weight: 700;">重庆市</span></div>
							<div style="font-size: 13px;width:60%;margin:0 auto;">
								<label>区域</label>
								<select id="area_code" onchange="coordChange()">
									<option value="106.492561,29.534365" selected="">九龙坡区</option>
									<option value="106.537579,29.581659" >江北区</option>
									<option value="渝北区">渝北区</option>
									<option value="渝中区">渝中区</option>
									<option value="沙坪坝区">沙坪坝区</option>
								</select>
								<label style="margin-left:10%">二级区域</label>
								<select id="u89_input">
									<option value="观音桥" selected="">观音桥</option>
									<option value="江北嘴">江北嘴</option>
									<option value="五里店 ">五里店 </option>
									<option value="小湾">小湾</option>
									<option value="红旗河沟">红旗河沟</option>
								</select>
								<input id="u92_input" type="submit" style="margin-left:10%;width: 100px;" value="查询">
							</div>
						</div>
<%--						background-image: url('${IconPath }/geogShow/360.jpg'--%>
						<div id="container" style="width:100%;height:463px;margin-top:9px;border-radius:5px;);">
							<div style="top: 234px;left:420px;height:36px;width:208px;background-color: gray;display: block;position: relative;opacity:0.5;cursor: pointer;"></div> 
						</div>
				</div>
			</div>
		</div>
		<div id="foot" style="height:8%;width:100%">
			<%@include file="component/foot.jsp"%>
		</div>
	</div>
</body>
</html>
