<%@ page language="java" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"   %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
   String  ContextPath=request.getContextPath();//得到当前发布应用路径
   String  CssPath=Resource.getCssPath(ContextPath);// 得到样式文件路径
   String  JsPath=Resource.getJsPath(ContextPath);// 得到当前发布应用路径
   String  IconPath=Resource.getIconCssPath(ContextPath);// 当前应用图标路径
   String  PageTitle="";
   //String json=MapData.getMapData("1"); //得到地图图元json 数据
 %>
 <c:set var="ContextPath" value="${pageContext.request.contextPath}" />
<c:set var="CssPath" value="${ContextPath}/resource/css" />
<c:set var="JsPath" value="${ContextPath}/resource/js" />
<c:set var="IconPath" value="${ContextPath}/resource/image" />
<c:set var="imagesLinkPath" value="${ContextPath}/resource/images" />
<script type="text/javascript"  src="${JsPath }/jquery-1.7.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="${CssPath}/basic.css">
<script type="text/javascript">
	$(function() {
		$("body").css({overflow:"hidden"});
		$("#u0").height($(window).innerHeight());
		$("#u0").width($(window).innerWidth() * 0.98);
		
	});
	var ContextPath="${ContextPath}";
	var CssPath="${CssPath}";
	var JsPATH="${JsPath}";
	var IconPath="${IconPath}";
</script>
<script type="text/javascript"  src="${JsPath }/jquery-ui-jqLoding.js"></script>
