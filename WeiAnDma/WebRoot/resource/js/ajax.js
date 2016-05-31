  var g_currentpage=1; //当前选中的页面
 var g_pagesize="";//每页记录数
 var g_Total="";//总记录数
 var g_TotalPage="";//总页数

 //上一页
 function previvoPage(Total,TotalPage){
	//  alert(g_currentpage);
	 if(Total!=g_Total) g_Total=Total
     if(TotalPage!=g_TotalPage) g_TotalPage=TotalPage
    if(g_currentpage!=1){
       var index=parseInt(g_currentpage)-1;  
       onSelectPage(index,Total,TotalPage); 
    }
  }
  //下一页
  function nextPage(Total,TotalPage){
 // alert(g_currentpage+"___"+g_TotalPage);
	  if(Total!=g_Total) g_Total=Total
      if(TotalPage!=g_TotalPage) g_TotalPage=TotalPage
     if(g_currentpage<=g_TotalPage){
         var index=parseInt(g_currentpage)+1;  
        // alert("index==="+index);
         onSelectPage(index,Total,TotalPage); 
     }
  }
  /*下载附件文件 
  filename 文件名称
  */
 function DownloadFj(filename){
    alert("ddd");
    var form=document.getElementById("hiddenIframe"); 
    form.src="<%=ContextPath%>/FileDownloadServlet?file="+filename;
    // alert(form.src);
    
 }

//取分页数据
 function  onSelectPage(index,Total,TotalPage){
   
     if(Total!=g_Total) g_Total=Total
     if(TotalPage!=g_TotalPage) g_TotalPage=TotalPage
     if(g_currentpage==index){ // 如果选中的页面是当前页面返回
         return;
     }else{  
        //设置点击的页面为选中
     var a=document.getElementById("page_"+index);
       //a.src= g_IconPath+"/page_sel.png";
       a.className="otherpage_a";
    
     var currentA=document.getElementById("page_"+g_currentpage);
       //currentA.src=g_IconPath+"/page.png";
       currentA.className="currentpage_a";
     
  //     currentA.className="";
		//取下一页的数据
       var parameter="";
       if(document.getElementById("serachDownLoad")){
    	    parameter="pagesize="+g_pagesize+"&currentpage="+index+"&Total="+g_Total+"&search="+document.getElementById("serachDownLoad").value;
       }else{
    	    parameter="pagesize="+g_pagesize+"&currentpage="+index+"&Total="+g_Total;
       }
        ajax({
			    type:"post",
			    url:item_jsp,
			    data:parameter,
			    dataType:"text",
			    async:true,
			    success:function(data){
			    	//alert(data);
			    	var items=document.getElementById("items");
			    	//alert(items);
			    	items.innerHTML=data;
			    	
				  }
			  }); 
        g_currentpage=index;
     }     
 }

var createAjax = function() {
    var xhr = null;
    try {
        //IE系列浏览器
        xhr = new ActiveXObject("microsoft.xmlhttp");
    } catch (e1) {
        try {
            //非IE浏览器
            xhr = new XMLHttpRequest();
        } catch (e2) {
            window.alert("您的浏览器不支持ajax，请更换！");
        }
    }
    return xhr;
};

var ajax = function(conf) {
    // 初始化
    //type参数,可选
    var type = conf.type;
    //url参数，必填 
    var url = conf.url;
    //data参数可选，只有在post请求时需要
    var data = conf.data;
    //datatype参数可选    
    var dataType = conf.dataType;
    //回调函数可选
    var success = conf.success;
    //是同步还是异步 true 异步  false 同步
    var async=conf.async;
    
    if(async==null){
    	 async=true;
     }
    
    if (type == null){
        //type参数可选，默认为get
        type = "get";
    }
    if (dataType == null){
        //dataType参数可选，默认为text
        dataType = "text";
    }
    // 创建ajax引擎对象
    var xhr = createAjax();
    // 打开
    xhr.open(type, url, async);
    // 发送
    if (type == "GET" || type == "get") {
        xhr.send(null);
    } else if (type == "POST" || type == "post") {
        xhr.setRequestHeader("content-type",
                    "application/x-www-form-urlencoded");
       xhr.send(data);
       //如果是同步调用
       if(async==false){
    	
    	  
    	   if (xhr.readyState == 4 && xhr.status == 200) {
               if(dataType == "text"||dataType=="TEXT") {
                   if (success != null){
                       //普通文本
                       success(xhr.responseText);
                   }
               }else if(dataType=="xml"||dataType=="XML") {
                   if (success != null){
                       //接收xml文档    
                       success(xhr.responseXML);
                   }  
               }else if(dataType=="json"||dataType=="JSON") {
                   if (success != null){
                	
                     //将json字符串转换为js对象  
                       success(eval("("+xhr.responseText+")"));
                   }
               }
           }
    	   return;
       }
    }
    xhr.onreadystatechange = function() {
        if (xhr.readyState == 4 && xhr.status == 200) {
            
        	
        	if(dataType == "text"||dataType=="TEXT") {
                if (success != null){
                    //普通文本
                    success(xhr.responseText);
                }
            }else if(dataType=="xml"||dataType=="XML") {
                if (success != null){
                    //接收xml文档    
                    success(xhr.responseXML);
                }  
            }else if(dataType=="json"||dataType=="JSON") {
                if (success != null){
                 
                	//将json字符串转换为js对象  
                    success(eval("("+xhr.responseText+")"));
                }
            }
        }
    };
    
};


var string={};
string.monthLength=[31,28,31,30,31,30,31,31,30,31,30,31];  //用每个月的天数初始化string的数组元素monthLength
string.defaultDateMask="yyyy-mm-dd";    //string的默认日期格式

String.prototype.now=function() //扩展String的获得本地时间的属性
{
return new Date()
};


String.prototype.date=function() //扩展String的获得当前日期
{

 var d=new Date()
 var strdate=this.createDate(d.getMonth(),d.getDate() ,d.getYear())

return strdate
};


String.prototype.trim=function()   //扩展String的去掉字符串两端空格的属性
{
	var s=this.replace(/^\s+/g,"");
	return s.replace(/\s+$/g,"")
};

String.prototype.isInteger=function(s) //扩展String的判断整型数的属性
{
	
return s==parseInt(s,10)
};

String.prototype.isFloat=function(s) //扩展String的判断是否为浮点型数的属性
{
	if(s.trim()=="" || s.trim()==null)			//如果s为空则返回false
		return false;
	return s==String(s).match(/\d*\.{0,1}\d*/)[0]
};

String.prototype.isMoney=function(s) //扩展String的判断是否表示金钱数量的属性
{
	if(s.trim()=="" || s.trim()==null)			//如果s为空则返回false
		return false;
	return s==String(s).match(/^\${0,1}\d*\.{0,1}\d{0,2}/)[0]
};

String.prototype.rightStr=function(s,n) //扩展String的取得字符串右端n个字符的属性
{
	s=String(s);
	return s.substr(s.length-n,n)
};

String.prototype.filterChars=function(s,c) //扩展String的去掉s中的c的属性
{
	var r=new RegExp();				//创建空的正则表达式r
	r.compile(c,"gi");				//将正则表达式中的c转换为内部格式并赋给r
	return String(s).replace(r,"")
};

String.prototype.formatString=function(s,p) //扩展String的将数组p中的值依次放入s中对应的位置（%1,%2....出现的位置）的属性
{
	if(!p||!p.length)				//如果p为false或为空数组则s不变
		return s;
	var r=s;
	var re;
	for(var a=0;a<p.length;a++)
	{
		re=new RegExp("%"+(a+1),"g");  //创建所有%1,%2,%3......的正则表达式re
		r=r.replace(re,p[a])			//用数组中第1,2,3....的值替换r中的%1,%2,%3.....
	}
	return r
};

String.prototype.filterNonDigits=function(s) //扩展String的去掉s中非0－9和“.”的字符的属性
{
	return String(s).replace(/[^\d\.]/g,"")
};

String.prototype.padZeros=function(s,n) //扩展String的用前面补0的方法将s扩展到n位的属性
{
	s=String(s);
	while(s.length<n)
		s="0"+s;	//长度不足在前面补0
	return s
};

String.prototype.roundTo=function(s,d) //扩展String的将s四舍五入并取s的d位小数，不足补0的属性
{
	var B=s==6.996;
	var r,i,a,b,c;
	r=s*Math.pow(10,d);	//将s扩大10的d次方倍赋给r
	r=Math.round(r);	//对r四舍五入
	c=String(r).length; //保留r的位数
	r=String(r/Math.pow(10,d));//将r缩小10的d次方倍
	if(isNaN(r))		//如果r不再是数字类型则返回“NAN”
		return r;
	i=r.indexOf(".");
	if(i<1)				//用0将r扩为d位小数
	{
		r+=".";
		for(a=0;a<d;a++)
			r+="0"
	}
	else
	{
		b=r.length-i-1;
		for(a=0;a<d-b;a++)
			r+="0";
		r=r.substr(0,c+1+d)  //如果r的小数部分超过d位则只取d位
	}
	return r
};

String.prototype.bintodec=function(s) //扩展String的将二进制s转换为十进制的属性
{
	return parseInt(s,2)
};

String.prototype.dectobin=function(s) //扩展String的将十进制s转换为二进制的属性
{
	return parseInt(s).toString(2)
};

String.prototype.makeFourDigitYear=function(s) //扩展String的将年份转换为四位数的属性
{
	if(s.length>2)   //如果s长度超过两位则不变
		return s;
	if(s<50)
		return "20"+String(s).padZeros(s,2);  //如果s小于50则认为是2000年以后
	else
		return "19"+s	 //如果s大于50则认为是2000年以前
};

String.prototype.getMonthLength=function(m,y) //扩展String的取得y年m月共有多少天的属性
{
	y=String(y).makeFourDigitYear(y);  //将年份转换为四位数
	m=parseInt(m,10);
	if(m==1)   //如果y年为闰年，则二月份返回29天，否则为28天
		if(y/4==Math.floor(y/4)||y/400==Math.floor(y/400))
			return 29;
	return string.monthLength[m]
};

String.prototype.addDaysToDate=function(d,n) //扩展String的取得d日期增加n(-31<=n<=31)天以后的日期的属性
{
	//alert(d)
	d=new Date(d);  //将d转换为日期格式
	//alert(d)
	n=parseInt(n);
	var month=d.getMonth(); //取得d日期对应的月份
	var day=d.getDate();  //取得d日期对应的天数
	var year=d.getFullYear();
	var tempday=day+n;
	if(tempday<1) //如果日期推到上一月则月份减1
	{
		month--;
		if(month<0) //如果日期推到上一年则月份变为12月（对应为11）
			month=11;
		tempday=String(n).getMonthLength(month,year)-tempday
	}
	if(tempday>String(n).getMonthLength(month,year))
	{
		tempday=tempday-String(n).getMonthLength(month,year);
		month++;
		if(month>11)
			month=0
	}
	return String(d).createDate(month,tempday,year)
};


String.prototype.createDate=function(m,d,y) //扩展String的按照月日年顺序新建日期形式的属性
{
	return String(y).formatDate(new Date(parseInt(y,10),parseInt(m,10),parseInt(d,10)))
};


String.prototype.formatDate=function(d,f) //扩展String的将日期转换为f格式的属性
{
	//f=core.rVal(f,string.defaultDateMask); //取得日期格式，如果格式为空取string的默认日期格式
	if(String(f).trim()=="" || f==null)
		f=string.defaultDateMask;
	var del=null;
	if(f.indexOf("/")>-1)  //取得日期的分隔符
		del="/";
	else if(f.indexOf("-")>-1)
		del="-";
	else if(f.indexOf(".")>-1)
		del=".";
	if(!del)
		return;
	f=f.split(del);  //取得f中以del分割的字符存入数组f中
	d=new Date(d);   //将d转换为日期格式
	for(var a=0;a<f.length;a++) //按照f数组中的标志值取得f格式的日期
	{
		f[a]=String(f[a].toUpperCase()).trim();
		if(f[a].charAt(0)=="M")
			f[a]=String(d).padZeros(d.getMonth()+1,f[a].length);
		if(f[a].charAt(0)=="D")
			f[a]=String(d).padZeros(d.getDate(),f[a].length);
		if(f[a].charAt(0)=="Y")
			f[a]=String(d).padZeros(String(d).rightStr(d.getFullYear(),f[a].length))

	}
	var r=f[0];
	for(a=1;a<f.length;a++)
		r+=del+f[a];
	return r
};

String.prototype.isDate=function(d,f) //扩展String的属性,如果d为f形式的日期，则返回d的本地时间，否则返回false
{
	d=String(d).trim();
	//f=core.rVal(f,string.defaultDateMask);
	if(String(f).trim()=="" || f==null)
		f=string.defaultDateMask;
	var del=null;
	if(f.indexOf("/")>-1)  //取得分隔符del
		del="/";
	else if(f.indexOf("-")>-1)
		del="-";
	else if(f.indexOf(".")>-1)
		del=".";
	if(!del)
		return false;
	f=f.split(del);  //取得f中以del分割的字符存入数组f中
	d=d.split(del);  //取得d中以del分割的字符存入数组d中
	if(d.length!=f.length)  //如果d中以del分割的段数与f不等则返回false
		return false;
	var mo=null;
	var da=null;
	var yr=null;
	for(var a=0;a<f.length;a++)  //按照f中的年月日顺序取得d中的值
	{
		f[a]=f[a].toUpperCase().trim();
		if(f[a].charAt(0)=="M")
			mo=String(d).padZeros(d[a],f[a].length);
		if(f[a].charAt(0)=="D")
			da=String(d).padZeros(d[a],f[a].length);
		if(f[a].charAt(0)=="Y")
			yr=String(d).padZeros(d[a],f[a].length)
	}
	if(!String(d).isInteger(mo)||!String(d).isInteger(da)||!String(d).isInteger(yr)) //如果d中的年月日不为整型则返回false
		return false;
	if((mo<1)||(mo>12)) //如果d中的月份不是1－12则返回false
		return false;
	if((da<1)||(mo>String(d).getMonthLength(mo-1,yr))) //如果d中的天数不在当月总共天数内，返回false
		return false;
	mo=parseInt(mo,10)-1;
	da=parseInt(da,10);
	yr=parseInt(yr,10);
	return new Date(yr,mo,da)  //返回d的本地时间
};

String.prototype.getStartDay=function(m,y) //扩展String的取得y年m月1号是星期几的属性
{
	var tempdate=new Date(); //取得本地时间
	tempdate.setDate(1);     //设定时间为1号
	tempdate.setMonth(m);    //设定时间为m月
	tempdate.setFullYear(y); //设定时间为y年
	return tempdate.getDay() //返回y年m月1号是星期几
};

String.prototype.daysSince=function(d1,d2) //扩展String的属性,取得从d1毫秒到d2毫秒经过的天数
{
	if(d2==null || d2=="")
		d2=(new Date()).getTime();
	return Math.abs(Math.floor((d1-d2)/86400000))
};




//字符串替换函数
String.prototype.ReplaceString=function(oldstr, middlestr,replacestr) {

		if(oldstr=="")//为null返回""
         return "";

	    if(middlestr=="")
		   return oldstr;

		var i=oldstr.indexOf(middlestr);

		while(i!=-1)
        {
                oldstr=oldstr.substring(0,i)+replacestr+oldstr.substring(i+middlestr.length);
    			i=oldstr.indexOf(middlestr);

        }

		return oldstr;//返回组成的新串
}
//
//闵东  替换所有查找字符串 2008-07-02
//
String.prototype.replaceAll = function(rgExp, replaceText)
{
	if(this == "")
	 return "";
	 
    if(rgExp == "")
	 return this;
	 
	var newString = this;	
	while(newString.search(rgExp) != -1)
	{	
		newString = newString.replace(rgExp,replaceText);
	}
	
	return newString;
}
   
/**得到一个字符串的长度(非英文字符的长度按2计算)
* @param str 字符串
* return 字符串长度
*/
String.prototype.getStrLength=function(str){
 if(str==null || str == "") return 0;
	var len = 0;
        var c;
	for(var i=0; i < str.length; i++){
		var t=str.substring(i,i+1);
                c=t.charCodeAt(0);
		//if(c < 0x4e00 ){
                if(c < 255 ){
		 // if(c!=0x3002&&c!=0x2018&&c!=0x2019){
                  	len ++;
		 	//continue;
                 // }
		}else{

                  len += 2;
		}
	}
	return len;
}
function searchDownLoad(index){
	
       //设置点击的页面为选中
   
 
 //     currentA.className="";
		//取下一页的数据
  var parameter="pagesize="+g_pagesize+"&currentpage="+index+"&search="+$('#serachDownLoad').val(); 
       ajax({
			    type:"post",
			    url:item_jsp,
			    data:parameter,
			    dataType:"text",
			    async:true,
			    success:function(data){
			    	//alert(data);
			    	var items=document.getElementById("items");
			    	//alert(items);
			    	items.innerHTML=data;
			    	
				  }
			  }); 
       g_currentpage=index;
    
}


