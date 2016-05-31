<%@ page language="java" contentType="text/html; charset=UTF-8" import="com.mobile.GlobalFunction,com.mobile.GlobalNames,com.mobile.db.info.DbInfoImp,java.util.LinkedList,java.util.HashMap,java.util.LinkedHashMap" pageEncoding="UTF-8"%>

<jsp:useBean id="Resource" scope="page" class="com.mobile.resource.ResourceMamage" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@include file="JsVariblePath.jsp"%>
<html>
<head>
<script type="text/javascript">
	function show(){
		if($("#usePassword").val()=="123456"){
			alert("登陆成功");
			location.href="${ContextPath}/views/main.jsp";
		}else{
			alert("登陆失败");
		}
		
	}
</script>
<title>水务综合管理云系统</title>

<link rel="stylesheet" type="text/css" href="${CssPath }/login.css">
<body style="TEXT-ALIGN: center;width:100%;">
	<div  id="u0">
		<%--	上层div	--%>
		<div style="width:100%;height:30%"></div>
		<%--登陆界面div	title	  --%>
		<div  id="u32">
			<div class="text" id="u33">
				<span style="line-height: 55px">水务综合管理云系统</span>
			</div>
			<div class="ax_h1" id="u36">
				<span style="font-family:'wATCHMEn Regular', 'wATCHMEn';font-weight:400;">管网</span><span style="font-family:'Humnst777 Blk BT Black', 'Humnst777 Blk BT';font-weight:900;">GIS</span><span style="font-family:'wATCHMEn Regular', 'wATCHMEn';font-weight:400;">地理信息系统</span>
			</div>
		</div>

		<%--登陆界面div	主体	  --%>
		<div  id="u2">
			<div style="width:100%;height: 13px"></div>
			<div  id="u30">
				<span>&nbsp;&nbsp; </span><span style="line-height:25px">欢迎进入登录界面</span>
			</div>
			<div class="u4">
				<div id="u12"></div>
				<input type="text" id="userId" style="line-height:39px;float:left" class="user" placeholder="  用户名">
			</div>
			<div class="u4">
				<div id="u20"></div>
				<input type="password"  id="usePassword" style="line-height:39px;float:left" class="user" placeholder="  密码">
			</div>
			<div style="height:15px;width:100%"></div>
			<div style="height:35px;font-size: 13px;">
				<div style="float:left;margin-left:46px;margin-top:5px">
					<span>校验码</span>
				</div>
				<div style="float:left;margin-left:10px">
					<input class="checkinput" type="text">
				</div>
				<div style="float:left;margin-left:10px">
					<img id="u38_img" src="${IconPath}/u38.jpg">
				</div>
				<div style="width:40px;height:32px; float:left;white-space: nowrap;margin-left:10px">
					<p style="margin:0px">
						<span>看不清</span>
					</p>
					<p style="margin:0px">
						<span>换一张</span>
					</p>
				</div>
			</div>
			<input type="button" style="background-image: url(${IconPath}/u10.png);width:146px;height:30px;margin-top:10px" class="checkinput font" value="登  陆" onclick="show()">
		</div>
	</div>


</body>
</html>
