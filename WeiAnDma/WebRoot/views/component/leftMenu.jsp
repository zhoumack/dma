<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="${CssPath }/leftMenu.css">
<script type="text/javascript">
	$(function() {
		$(".thirdLi").each(function(){
			var child=$(this);
			$(this).mouseover(function(){
				child.attr('style', 'background-image:url("${IconPath}/geogShow/u19_mouseOver.png")');
			});
			$(this).mouseout(function(){
				child.attr('style', 'background-image:url("${IconPath}/geogShow/u19.png")');
			});
		})
		
	});
</script>
<div style="background-image: url('${IconPath}/geogShow/u1.png');" class="menudiv">
	<ul style="margin-left:4px;position: relative;top: 5px">
		<li class="secondLi" style="margin-top: 5px"><span class="veralign">GIS地理展示</span></li>
		
		<a href="DataAnalyze.jsp"><li class="thirdLi">
			<img alt="" src="${IconPath }/geogShow/u51.png" style="vertical-align:middle;margin-left: 15px;"><span style="margin-left: 20px;vertical-align:middle">管网展图示</span>
		</li></a>
		<a href="DataAnalyze.jsp"><li class="thirdLi">
			<img alt="" src="${IconPath }/geogShow/u53.png" style="vertical-align:middle;margin-left: 15px;"><span style="margin-left: 20px;vertical-align:middle">阀门展示图</span>
		</li></a>
		<li class="secondLi" style="margin-top: 5px">阀门展示图</li>
		<a href="DataAnalyze.jsp"><li class="thirdLi">
			<img alt="" src="${IconPath }/geogShow/u55.png" style="vertical-align:middle;margin-left: 15px;"><span style="margin-left: 20px;vertical-align:middle">导入管网</span>
		</li></a>
		<a href="DataAnalyze.jsp"><li class="thirdLi">
			<img alt="" src="${IconPath }/geogShow/u57.png" style="vertical-align:middle;margin-left: 15px;"><span style="margin-left: 20px;vertical-align:middle">区域设置</span>
		</li></a>
		<a href="DataAnalyze.jsp"><li class="thirdLi">
			<img alt="" src="${IconPath }/geogShow/u59.png" style="vertical-align:middle;margin-left: 15px;"><span style="margin-left: 20px;vertical-align:middle">水厂信息</span>
		</li></a>
		<a href="DataAnalyze.jsp"><li class="thirdLi">
			<img alt="" src="${IconPath }/geogShow/u61.png" style="vertical-align:middle;margin-left: 15px;"><span style="margin-left: 20px;vertical-align:middle">水司信息</span>
		</li></a>
		<a href="DataAnalyze.jsp"><li class="thirdLi">
			<img alt="" src="${IconPath }/geogShow/u63.png" style="vertical-align:middle;margin-left: 15px;"><span style="margin-left: 20px;vertical-align:middle">管网信息</span>
		</li></a>
		<a href="DataAnalyze.jsp"><li class="thirdLi">
			<img alt="" src="${IconPath }/geogShow/u65.png" style="vertical-align:middle;margin-left: 15px;"><span style="margin-left: 20px;vertical-align:middle">阀门信息</span>
		</li></a>
		<a href="DataAnalyze.jsp"><li class="thirdLi">
			<img alt="" src="${IconPath }/geogShow/u67.png" style="vertical-align:middle;margin-left: 15px;"><span style="margin-left: 20px;vertical-align:middle">管件信息</span>
		</li></a>
		<a href="DataAnalyze.jsp"><li class="thirdLi">
			<img alt="" src="${IconPath }/geogShow/u69.png" style="vertical-align:middle;margin-left: 15px;"><span style="margin-left: 20px;vertical-align:middle">用户信息</span>
		</li></a>
		<li class="secondLi" style="margin-top: 5px">统计分析</li>
		<a href="DataAnalyze.jsp"><li class="thirdLi">
			<img alt="" src="${IconPath }/geogShow/u71.png" style="vertical-align:middle;margin-left: 15px;"><span style="margin-left: 20px;vertical-align:middle">管网统计</span>
		</li></a>
	</ul>
</div>