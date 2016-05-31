<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%
   String  ContextPath=request.getContextPath();//得到当前发布应用路径
   String  PageTitle="";
 %>
<object id="plugin0" type="application/x-fbtestplugin" width="100%" height="78%" >
				   <param name="onload" value="pluginLoaded" />
				</object>
		<div style="padding-left: auto;padding-right: auto;width:100%">			
				<a href="#" onclick="javascript:Zoom()" style="text-decoration:none;font-size: 15px;color:#2fa4e7; "><img src="/WeiAnDma/resource/image/zoom in.png" style="vertical-align:middle;">放大</a> 
				<a href="#" onclick="javascript:narrow()" style="margin-left:30px;text-decoration:none;font-size: 15px;color:#2fa4e7;"><img src="/WeiAnDma/resource/image/zoom out.png" style="vertical-align:middle;">缩小</a> 
				<a href="#" onclick="javascript:Reset()" style="margin-left:30px;text-decoration:none;font-size: 15px;color:#2fa4e7;"><img src="/WeiAnDma/resource/image/in.png" style="vertical-align:middle;">还原</a> 
				<a href="#" onclick="javascript:startpy()" style="margin-left:30px;text-decoration:none;font-size: 15px;color:#2fa4e7;"><img src="/WeiAnDma/resource/image/move.png" style="vertical-align:middle;">开始平移</a> 
				<a href="#" onclick="javascript:endpy()" style="margin-left:30px;text-decoration:none;font-size: 15px;color:#2fa4e7;"><img src="/WeiAnDma/resource/image/Pause.png" style="vertical-align:middle;">结束平移</a>
				<a href="#" onclick="javascript:startdh()" style="margin-left:30px;text-decoration:none;font-size: 15px;color:#2fa4e7;"><img src="/WeiAnDma/resource/image/play.png" style="vertical-align:middle;">开始动画</a>
				<a href="#" onclick="javascript:enddh()" style="margin-left:30px;text-decoration:none;font-size: 15px;color:#2fa4e7;"><img src="/WeiAnDma/resource/image/Pause.png" style="vertical-align:middle;">结束动画</a>
		</div>	
				
<script type="text/javascript">
   $(function(){
	   $("#dataShow a").click(function(){
		   $("#dataShow a").css('text-decoration','none');
		   $(this).css('text-decoration','underline');
	   });
	   $("#dataShow a").each(function(){
		   $(this).css({display:"inline-block"});
	   });
   })
//开始动画
function  startdh(){
 //var str=plugin().charArray();
 //alert(str);
 
 	var data=new Array();
			data[0]="105";
			data[1]="106";
			data[2]="107";
			data[3]="108";
			data[4]="113";
			data[5]="114";
			data[6]="115";
			data[7]="116";
			data[8]="117";
			data[9]="121";
			data[10]="123";
			data[11]="124";
			data[12]="120";
			data[13]="129";
			
			data[14]="118";
			data[15]="119";
			data[16]="122";
			data[17]="130";
			data[18]="133";
			data[19]="134";
			data[20]="135";
			
			data[21]="128";
			data[22]="125";
			data[23]="132";
			
			data[24]="126";
			data[25]="127";
			/*
			data[0]="42";
			data[1]="134";
			data[2]="126";
			data[3]="127";
			
			data[4]="119";
			data[5]="122";
			
			data[6]="44";
			data[7]="47";
			data[8]="31";
			
			data[9]="128";
			data[10]="130";
			data[11]="135";
			*/
			//alert("11");
		plugin().StartAnimation(data);	
		//alert("22");
}
 
 //结束动画
function enddh(){
  plugin().EndAnimation();
}
   
   function Event(val){
    
    
    
   //var data= plugin().systemHelpersTest();
     
    // alert(data["homedir"]);
 // alert("得到的图元id=="+val);
    //$("#instruData").click();
     // plugin().testEvent("dsf");
    var vals= val.split(",")
	   if(vals.length==3){
		//   if(vals[2]==2||vals[2]==1){
			if(vals[2]==2){
			   $("#dataShow").jqLoading({type:1});
			       $.ajax({
				    type:"post",
				    url:"<%=ContextPath%>/getInstrumentData.data",
				    data:"method=getInstrumentData&pixelId="+vals[0]+"&isAjaxReturn=views/component/instrumentData.jsp",
				    success:function(data){
				    	loadShow(data,'echarts');
			     }
			   });
		   }
	   }
   }
   
   
   
   function Open(){
        //官网欢迎页
    layer.open({
        type: 2,
        //skin: 'layui-layer-lan',
        title: 'layer弹层组件11',
        fix: false,
        shadeClose: true,
        maxmin: true,
        area: ['1000px', '500px'],
        content: 'index.jsp',
        end: function(){
            //layer.tips('试试相册模块？', '#photosDemo', {tips: 1})
        }
    });
   }
  
   function addEvent(obj, name, func)
        {
            if (obj.attachEvent) {
                obj.attachEvent("on"+name, func);
            } else {
                obj.addEventListener(name, func, false); 
            }
        }
        
  
  function t1(){
  
    alert("调用js函数！");
  }
    //开始平移
   function startpy(){
    // plugin().testEvent("dsf");
     plugin().setpy("1");
   }
    //结束平移
   function endpy(){
     plugin().setpy("0");
   }
   
   function plugin()
        {
            return document.getElementById('plugin0');
        }
       
  
   //放大
   function Zoom(){
   
    plugin().Zoom();
   }
   
   //缩小
   function narrow(){
     plugin().narrow();
   }
   
   function Reset(){
     plugin().Reset();
   }
   
  function charArray(){

			var data=new Array();
			data["type"]="1";
			data["x"]="10";
			data["y"]="20";
			
			var sj=plugin().getObjectKeys(data);
			alert(sj);
		}
		
		 //控件加载成功
		 function pluginLoaded() {
            addEvent(plugin(), 'clickPixel', Event);
			//console.log("Log level 1111");
			$("#dataShow").jqLoading({type:1});
            $.ajax({
		    type:"post",
		    url:"<%=ContextPath%>/getMap.data",
		    data:"method=getMapData&CHART_ID=2",
		    dataType:"json",
		    success:function(data){
		    	loadData(data);
		     }
		   });
          }
            
            //加载数据
           function loadData(data){
                 var length=data["return"].length;
                 
                  for(var i=0;i<length;i++){
                     var item=data["return"][i];
                    // var sj=plugin().getObjectKeys(item);
			       //    alert(sj);
			         //  alert(item["zx_x"]);
			           var ret=plugin().addPixelData(item);
                      // alert(ret);
                  }
                  $("#dataShow").jqLoading("destroy");
                  plugin().setZoom(0,2);
                plugin().setYd(-320,-120);
                  plugin().Draw();
                  
           }
  </script>