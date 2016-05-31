<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
  <link href="/WeiAnDma/resource/css/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
<%--  <link href="/WeiAnDma/resource/css/bootstrap/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">--%>
<%--	    <script type="text/javascript" src="/WeiAnDma/resource/js/datetimepicker/bootstrap.min.js"></script>--%>
	   <script type="text/javascript" src="/WeiAnDma/resource/js/datetimepicker/bootstrap-datetimepicker.js" charset="UTF-8"></script>
        <script type="text/javascript" src="/WeiAnDma/resource/js/datetimepicker/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>
 
<div style="float:left;width:290px;text-align: left;font-size: 14px">
					<div id="downData">
						<input type="hidden" value="${result.devList.deviceid}"  id="deviceid"/>
						<input type="hidden" value="dddd"  id="deviceid2"/>
						<div><span>表号：${result.devList.devicecode}<span></div>
						<div><span>安装时间：2015年10月20日</span></div>
						<div  >
								<span>采集时间：</span>
								<input id="datetimepicker"  readonly="readonly"  type="text" style="height:30px;margin-bottom: 0px;width:170px">
<%--								<span><i class="icon-remove"></i></span>--%>
						</div>
						<div  >
								<span>采集月份：</span>
								<input id="datetimepicker2" readonly="readonly" type="text" style="height:30px;margin-bottom: 0px;width:170px">
<%--								<span><i class="icon-remove"></i></span>--%>
						</div>
						<div><span>地址：重庆市北部新区中智联伟岸测器</span></div>
						<div><span>特征：特征DN100 节点考核表/官网流量计</span></div>
						<div><span>压力上限：${result.devList.pressupperlimit}MPA</span><span style="margin-left:10px">压力下限：${result.devList.presslowerlimit}MPA</span></div>
						<div><span>压力量程：${result.devList.pressrange}MPA</span><span style="margin-left:10px">测量周期：${result.devList.pressperiod}分钟</span><br/></div>
						<div><span>设备上传时间：03:20</span></div>
						<div><span>当前软件版本：403.2</span></div>
						<div><span>压力报警电话：${result.devList.telephone}</span></div>
						<div><span>DMA分析时间：2015/10/28 02:30  开启</span></div>
					</div>
</div>
					
				<div style="float:right ;width:748px;height:100%" id="line_bar_table">
				</div>
<script type="text/javascript">
	$('#datetimepicker').datetimepicker({
	    language:  'zh-CN',
	    weekStart: 1,
	    todayBtn:  1,
		autoclose: 1,
		todayHighlight: 1,
		startView: 2,
		minView: 2,
		forceParse: 0,
		format: "yyyy-mm-dd"
	});
	$('#datetimepicker2').datetimepicker({
	    language:  'zh-CN',
	    weekStart: 1,
	    todayBtn:  1,
		autoclose: 1,
		todayHighlight: 1,
		startView: 3,
		minView: 3,
		forceParse: 0,
		format: "yyyy-mm"
	});
	$('#datetimepicker').datetimepicker().on('changeDate', function(ev){
<%--		var date =ev.date.getDate()-1;--%>
<%--		var time=ev.date;--%>
<%--		time.setDate(date);--%>
<%--		updateDay(time.getFullYear()+"-"+(time.getMonth()+1)+"-"+(time.getDate()));--%>
			updateDay($(this).val());
	});
	$('#datetimepicker2').datetimepicker().on('changeDate', function(ev){
					updateDay($(this).val());
			});
</script>
				<%@ include file="../NewFile.jsp"%>