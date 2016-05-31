<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id="Resource" scope="page" class="com.mobile.resource.ResourceMamage" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
<title>主界面</title>
<%@include file="JsVariblePath.jsp"%>
<link rel="stylesheet" type="text/css" href="${CssPath }/main.css">
<script type="text/javascript">
	$(function() {
		$(".body_3div").not($(".body_3div")[0]).find("img").each(function(){
			var child=$(this);
			$(this).parent().mouseover(function(){
				child.attr('src','${IconPath}/main/u2_mouseOver.png')
			});
			$(this).parent().mouseout(function(){
				child.attr('src','${IconPath}/main/u2.png')
			});
		})
		
	});
	function show(){
		//location.href="geogShow.jsp";
		location.href="${ContextPath}/views/geogShow.jsp";
	}
</script>
</head>
<body style="TEXT-ALIGN: center;width:100%;">
	<div id="u0">
		<div id="head" style="height:11%;width:100%;">
			<%@include file="component/head.jsp"%>
		</div>
		<div id="body" style="width:100%;height:81%">
			<div style="width:100%;height:100%;background-color: rgb(232,241,246);">
				<div style="width:80%;height:100%;margin:auto auto;">
					<div class="body_3div" style="width:40%">
						<div style="height:33%;margin-top:10px;margin-left: 20%">
							<img src="${IconPath}/main/u42.jpg" class="align"><span class="sign" style="margin-left:30px">></span><span class="sign" style="color: #afdbff;">></span><span class="sign" style="color: #c9e7ff;">></span>
						</div>
						<div style="height:33%;margin-left: 20%">
							<img src="${IconPath}/main/u46.jpg" class="align"><span class="sign" style="margin-left:70px">></span><span class="sign" style="color: #afdbff;">></span><span class="sign" style="color: #c9e7ff;">></span>
						</div>
						<div style="height:33%;margin-left: 20%">
							<img src="${IconPath}/main/u44.jpg" class="align"><span class="sign" style="margin-left:30px">></span><span class="sign" style="color: #afdbff;">></span><span class="sign" style="color: #c9e7ff;">></span>
						</div>
					</div>
					<div class="body_3div" style="width:30%">
						<div style="height:20%;">
								<a herf="#" onclick="show()">
									<img src="${IconPath}/main/u2.png" class="align" >
									<div class="imgPrevDiv">
										<span>管网GIS地理信息系统</span>
									</div>
								</a>
						</div>
						<div style="height:20%;">
							<a herf="#">
								<img src="${IconPath}/main/u2.png" class="align" style="position: relative;">
								<div style="top:-51%" class="imgPrevDiv">
									<span>供水管网实时监测</span><br /> <span>统(SCADA)</span>
								</div>
							</a>	
						</div>
						<div style="height:20%;">
							<a herf="#">
								<img src="${IconPath}/main/u2.png" class="align" style="position: relative;">
								<div class="imgPrevDiv">
									<span>管网维护维修管理系统</span>
								</div>
							</a>
						</div>
						<div style="height:20%;">
							<a herf="#">
								<img src="${IconPath}/main/u2.png" class="align" style="position: relative;">
								<div class="imgPrevDiv">
									<span>工程管理系统</span>
								</div>
							</a>
						</div>
						<div style="height:20%;">
							<a herf="#">
								<img src="${IconPath}/main/u18.png" class="align" style="position: relative;">
								<div style="top:-51%" class="imgPrevDiv">
									<span>二次供水在线监测和饮用水</span><br /> <span>预警系统</span>
								</div>
							</a>
						</div>
					</div>
					<div class="body_3div" style="width:30%">
						<div style="height:20%;">
							<a herf="#">
								<img src="${IconPath}/main/u2.png" class="align" style="position: relative;left:-16%">
								<div  class="imgPrevDiv" style="left:-16%;">
									<span>管网DMA分区计量管理系统</span>
								</div>
							</a>
						</div>
						<div style="height:20%;">
							<a herf="#">
								<img src="${IconPath}/main/u2.png" class="align" style="position: relative;left:-16%">
								<div  class="imgPrevDiv" style="left:-16%;">
									<span>供水业务管理系统</span>
								</div>
							</a>
						</div>
						<div style="height:20%;">
							<a herf="#">
								<img src="${IconPath}/main/u2.png" class="align" style="position: relative;left:-16%">
								<div  class="imgPrevDiv" style="left:-16%;">
									<span>管网巡检管理系统</span>
								</div>
							</a>
						</div>
						<div style="height:20%;">
							<a herf="#">
								<img src="${IconPath}/main/u2.png" class="align" style="position: relative;left:-16%">
								<div  class="imgPrevDiv" style="left:-16%;">
									<span>管网预案处理系统</span>
								</div>
							</a>
						</div>
						<div style="height:20%;">
							<a herf="#">
								<img src="${IconPath}/main/u2.png" class="align" style="position: relative;left:-16%">
								<div style="left:-16%;" class="imgPrevDiv" >
									<span>供水运行调度管理系统</span>
								</div>
							</a>
						</div>
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
