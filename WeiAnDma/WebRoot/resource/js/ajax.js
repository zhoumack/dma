  var g_currentpage=1; //��ǰѡ�е�ҳ��
 var g_pagesize="";//ÿҳ��¼��
 var g_Total="";//�ܼ�¼��
 var g_TotalPage="";//��ҳ��

 //��һҳ
 function previvoPage(Total,TotalPage){
	//  alert(g_currentpage);
	 if(Total!=g_Total) g_Total=Total
     if(TotalPage!=g_TotalPage) g_TotalPage=TotalPage
    if(g_currentpage!=1){
       var index=parseInt(g_currentpage)-1;  
       onSelectPage(index,Total,TotalPage); 
    }
  }
  //��һҳ
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
  /*���ظ����ļ� 
  filename �ļ�����
  */
 function DownloadFj(filename){
    alert("ddd");
    var form=document.getElementById("hiddenIframe"); 
    form.src="<%=ContextPath%>/FileDownloadServlet?file="+filename;
    // alert(form.src);
    
 }

//ȡ��ҳ����
 function  onSelectPage(index,Total,TotalPage){
   
     if(Total!=g_Total) g_Total=Total
     if(TotalPage!=g_TotalPage) g_TotalPage=TotalPage
     if(g_currentpage==index){ // ���ѡ�е�ҳ���ǵ�ǰҳ�淵��
         return;
     }else{  
        //���õ����ҳ��Ϊѡ��
     var a=document.getElementById("page_"+index);
       //a.src= g_IconPath+"/page_sel.png";
       a.className="otherpage_a";
    
     var currentA=document.getElementById("page_"+g_currentpage);
       //currentA.src=g_IconPath+"/page.png";
       currentA.className="currentpage_a";
     
  //     currentA.className="";
		//ȡ��һҳ������
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
        //IEϵ�������
        xhr = new ActiveXObject("microsoft.xmlhttp");
    } catch (e1) {
        try {
            //��IE�����
            xhr = new XMLHttpRequest();
        } catch (e2) {
            window.alert("�����������֧��ajax���������");
        }
    }
    return xhr;
};

var ajax = function(conf) {
    // ��ʼ��
    //type����,��ѡ
    var type = conf.type;
    //url���������� 
    var url = conf.url;
    //data������ѡ��ֻ����post����ʱ��Ҫ
    var data = conf.data;
    //datatype������ѡ    
    var dataType = conf.dataType;
    //�ص�������ѡ
    var success = conf.success;
    //��ͬ�������첽 true �첽  false ͬ��
    var async=conf.async;
    
    if(async==null){
    	 async=true;
     }
    
    if (type == null){
        //type������ѡ��Ĭ��Ϊget
        type = "get";
    }
    if (dataType == null){
        //dataType������ѡ��Ĭ��Ϊtext
        dataType = "text";
    }
    // ����ajax�������
    var xhr = createAjax();
    // ��
    xhr.open(type, url, async);
    // ����
    if (type == "GET" || type == "get") {
        xhr.send(null);
    } else if (type == "POST" || type == "post") {
        xhr.setRequestHeader("content-type",
                    "application/x-www-form-urlencoded");
       xhr.send(data);
       //�����ͬ������
       if(async==false){
    	
    	  
    	   if (xhr.readyState == 4 && xhr.status == 200) {
               if(dataType == "text"||dataType=="TEXT") {
                   if (success != null){
                       //��ͨ�ı�
                       success(xhr.responseText);
                   }
               }else if(dataType=="xml"||dataType=="XML") {
                   if (success != null){
                       //����xml�ĵ�    
                       success(xhr.responseXML);
                   }  
               }else if(dataType=="json"||dataType=="JSON") {
                   if (success != null){
                	
                     //��json�ַ���ת��Ϊjs����  
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
                    //��ͨ�ı�
                    success(xhr.responseText);
                }
            }else if(dataType=="xml"||dataType=="XML") {
                if (success != null){
                    //����xml�ĵ�    
                    success(xhr.responseXML);
                }  
            }else if(dataType=="json"||dataType=="JSON") {
                if (success != null){
                 
                	//��json�ַ���ת��Ϊjs����  
                    success(eval("("+xhr.responseText+")"));
                }
            }
        }
    };
    
};


var string={};
string.monthLength=[31,28,31,30,31,30,31,31,30,31,30,31];  //��ÿ���µ�������ʼ��string������Ԫ��monthLength
string.defaultDateMask="yyyy-mm-dd";    //string��Ĭ�����ڸ�ʽ

String.prototype.now=function() //��չString�Ļ�ñ���ʱ�������
{
return new Date()
};


String.prototype.date=function() //��չString�Ļ�õ�ǰ����
{

 var d=new Date()
 var strdate=this.createDate(d.getMonth(),d.getDate() ,d.getYear())

return strdate
};


String.prototype.trim=function()   //��չString��ȥ���ַ������˿ո������
{
	var s=this.replace(/^\s+/g,"");
	return s.replace(/\s+$/g,"")
};

String.prototype.isInteger=function(s) //��չString���ж�������������
{
	
return s==parseInt(s,10)
};

String.prototype.isFloat=function(s) //��չString���ж��Ƿ�Ϊ��������������
{
	if(s.trim()=="" || s.trim()==null)			//���sΪ���򷵻�false
		return false;
	return s==String(s).match(/\d*\.{0,1}\d*/)[0]
};

String.prototype.isMoney=function(s) //��չString���ж��Ƿ��ʾ��Ǯ����������
{
	if(s.trim()=="" || s.trim()==null)			//���sΪ���򷵻�false
		return false;
	return s==String(s).match(/^\${0,1}\d*\.{0,1}\d{0,2}/)[0]
};

String.prototype.rightStr=function(s,n) //��չString��ȡ���ַ����Ҷ�n���ַ�������
{
	s=String(s);
	return s.substr(s.length-n,n)
};

String.prototype.filterChars=function(s,c) //��չString��ȥ��s�е�c������
{
	var r=new RegExp();				//�����յ�������ʽr
	r.compile(c,"gi");				//��������ʽ�е�cת��Ϊ�ڲ���ʽ������r
	return String(s).replace(r,"")
};

String.prototype.formatString=function(s,p) //��չString�Ľ�����p�е�ֵ���η���s�ж�Ӧ��λ�ã�%1,%2....���ֵ�λ�ã�������
{
	if(!p||!p.length)				//���pΪfalse��Ϊ��������s����
		return s;
	var r=s;
	var re;
	for(var a=0;a<p.length;a++)
	{
		re=new RegExp("%"+(a+1),"g");  //��������%1,%2,%3......��������ʽre
		r=r.replace(re,p[a])			//�������е�1,2,3....��ֵ�滻r�е�%1,%2,%3.....
	}
	return r
};

String.prototype.filterNonDigits=function(s) //��չString��ȥ��s�з�0��9�͡�.�����ַ�������
{
	return String(s).replace(/[^\d\.]/g,"")
};

String.prototype.padZeros=function(s,n) //��չString����ǰ�油0�ķ�����s��չ��nλ������
{
	s=String(s);
	while(s.length<n)
		s="0"+s;	//���Ȳ�����ǰ�油0
	return s
};

String.prototype.roundTo=function(s,d) //��չString�Ľ�s�������벢ȡs��dλС�������㲹0������
{
	var B=s==6.996;
	var r,i,a,b,c;
	r=s*Math.pow(10,d);	//��s����10��d�η�������r
	r=Math.round(r);	//��r��������
	c=String(r).length; //����r��λ��
	r=String(r/Math.pow(10,d));//��r��С10��d�η���
	if(isNaN(r))		//���r���������������򷵻ء�NAN��
		return r;
	i=r.indexOf(".");
	if(i<1)				//��0��r��ΪdλС��
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
		r=r.substr(0,c+1+d)  //���r��С�����ֳ���dλ��ֻȡdλ
	}
	return r
};

String.prototype.bintodec=function(s) //��չString�Ľ�������sת��Ϊʮ���Ƶ�����
{
	return parseInt(s,2)
};

String.prototype.dectobin=function(s) //��չString�Ľ�ʮ����sת��Ϊ�����Ƶ�����
{
	return parseInt(s).toString(2)
};

String.prototype.makeFourDigitYear=function(s) //��չString�Ľ����ת��Ϊ��λ��������
{
	if(s.length>2)   //���s���ȳ�����λ�򲻱�
		return s;
	if(s<50)
		return "20"+String(s).padZeros(s,2);  //���sС��50����Ϊ��2000���Ժ�
	else
		return "19"+s	 //���s����50����Ϊ��2000����ǰ
};

String.prototype.getMonthLength=function(m,y) //��չString��ȡ��y��m�¹��ж����������
{
	y=String(y).makeFourDigitYear(y);  //�����ת��Ϊ��λ��
	m=parseInt(m,10);
	if(m==1)   //���y��Ϊ���꣬����·ݷ���29�죬����Ϊ28��
		if(y/4==Math.floor(y/4)||y/400==Math.floor(y/400))
			return 29;
	return string.monthLength[m]
};

String.prototype.addDaysToDate=function(d,n) //��չString��ȡ��d��������n(-31<=n<=31)���Ժ�����ڵ�����
{
	//alert(d)
	d=new Date(d);  //��dת��Ϊ���ڸ�ʽ
	//alert(d)
	n=parseInt(n);
	var month=d.getMonth(); //ȡ��d���ڶ�Ӧ���·�
	var day=d.getDate();  //ȡ��d���ڶ�Ӧ������
	var year=d.getFullYear();
	var tempday=day+n;
	if(tempday<1) //��������Ƶ���һ�����·ݼ�1
	{
		month--;
		if(month<0) //��������Ƶ���һ�����·ݱ�Ϊ12�£���ӦΪ11��
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


String.prototype.createDate=function(m,d,y) //��չString�İ���������˳���½�������ʽ������
{
	return String(y).formatDate(new Date(parseInt(y,10),parseInt(m,10),parseInt(d,10)))
};


String.prototype.formatDate=function(d,f) //��չString�Ľ�����ת��Ϊf��ʽ������
{
	//f=core.rVal(f,string.defaultDateMask); //ȡ�����ڸ�ʽ�������ʽΪ��ȡstring��Ĭ�����ڸ�ʽ
	if(String(f).trim()=="" || f==null)
		f=string.defaultDateMask;
	var del=null;
	if(f.indexOf("/")>-1)  //ȡ�����ڵķָ���
		del="/";
	else if(f.indexOf("-")>-1)
		del="-";
	else if(f.indexOf(".")>-1)
		del=".";
	if(!del)
		return;
	f=f.split(del);  //ȡ��f����del�ָ���ַ���������f��
	d=new Date(d);   //��dת��Ϊ���ڸ�ʽ
	for(var a=0;a<f.length;a++) //����f�����еı�־ֵȡ��f��ʽ������
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

String.prototype.isDate=function(d,f) //��չString������,���dΪf��ʽ�����ڣ��򷵻�d�ı���ʱ�䣬���򷵻�false
{
	d=String(d).trim();
	//f=core.rVal(f,string.defaultDateMask);
	if(String(f).trim()=="" || f==null)
		f=string.defaultDateMask;
	var del=null;
	if(f.indexOf("/")>-1)  //ȡ�÷ָ���del
		del="/";
	else if(f.indexOf("-")>-1)
		del="-";
	else if(f.indexOf(".")>-1)
		del=".";
	if(!del)
		return false;
	f=f.split(del);  //ȡ��f����del�ָ���ַ���������f��
	d=d.split(del);  //ȡ��d����del�ָ���ַ���������d��
	if(d.length!=f.length)  //���d����del�ָ�Ķ�����f�����򷵻�false
		return false;
	var mo=null;
	var da=null;
	var yr=null;
	for(var a=0;a<f.length;a++)  //����f�е�������˳��ȡ��d�е�ֵ
	{
		f[a]=f[a].toUpperCase().trim();
		if(f[a].charAt(0)=="M")
			mo=String(d).padZeros(d[a],f[a].length);
		if(f[a].charAt(0)=="D")
			da=String(d).padZeros(d[a],f[a].length);
		if(f[a].charAt(0)=="Y")
			yr=String(d).padZeros(d[a],f[a].length)
	}
	if(!String(d).isInteger(mo)||!String(d).isInteger(da)||!String(d).isInteger(yr)) //���d�е������ղ�Ϊ�����򷵻�false
		return false;
	if((mo<1)||(mo>12)) //���d�е��·ݲ���1��12�򷵻�false
		return false;
	if((da<1)||(mo>String(d).getMonthLength(mo-1,yr))) //���d�е��������ڵ����ܹ������ڣ�����false
		return false;
	mo=parseInt(mo,10)-1;
	da=parseInt(da,10);
	yr=parseInt(yr,10);
	return new Date(yr,mo,da)  //����d�ı���ʱ��
};

String.prototype.getStartDay=function(m,y) //��չString��ȡ��y��m��1�������ڼ�������
{
	var tempdate=new Date(); //ȡ�ñ���ʱ��
	tempdate.setDate(1);     //�趨ʱ��Ϊ1��
	tempdate.setMonth(m);    //�趨ʱ��Ϊm��
	tempdate.setFullYear(y); //�趨ʱ��Ϊy��
	return tempdate.getDay() //����y��m��1�������ڼ�
};

String.prototype.daysSince=function(d1,d2) //��չString������,ȡ�ô�d1���뵽d2���뾭��������
{
	if(d2==null || d2=="")
		d2=(new Date()).getTime();
	return Math.abs(Math.floor((d1-d2)/86400000))
};




//�ַ����滻����
String.prototype.ReplaceString=function(oldstr, middlestr,replacestr) {

		if(oldstr=="")//Ϊnull����""
         return "";

	    if(middlestr=="")
		   return oldstr;

		var i=oldstr.indexOf(middlestr);

		while(i!=-1)
        {
                oldstr=oldstr.substring(0,i)+replacestr+oldstr.substring(i+middlestr.length);
    			i=oldstr.indexOf(middlestr);

        }

		return oldstr;//������ɵ��´�
}
//
//�ɶ�  �滻���в����ַ��� 2008-07-02
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
   
/**�õ�һ���ַ����ĳ���(��Ӣ���ַ��ĳ��Ȱ�2����)
* @param str �ַ���
* return �ַ�������
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
	
       //���õ����ҳ��Ϊѡ��
   
 
 //     currentA.className="";
		//ȡ��һҳ������
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


