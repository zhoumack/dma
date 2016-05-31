package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mobile.GlobalFunction;
import com.mobile.GlobalMapClass;
import com.mobile.GlobalStrings;
import com.mobile.platform.security.AccessSecurity;
import com.mobile.util.ClsReflect;

public class FormServlet extends HttpServlet {
	 private static final String CONTENT_TYPE = "text/html; charset=UTF-8";
	/**
	 * Constructor of the object.
	 */
	public FormServlet() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		
	//	response.setContentType(CONTENT_TYPE);

		//PrintWriter out = response.getWriter();
		//out.print("\n sssssssssssssssss");
		//response.setStatus(401);
	/*
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
		out.println("  <BODY>");
		out.print("    This is ");
		out.print(this.getClass());
		out.println(", using the GET method");
		out.println("  </BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();*/
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType(CONTENT_TYPE);
		
		request.setCharacterEncoding("UTF-8");
	
	
		
		//String MethodName="";//方法名
		HashMap hashParame =new HashMap(); 
		
		 HttpSession session = request.getSession();
		 hashParame=GlobalFunction.getParameter(request); //将请求的request转换为hashmap
    	 
	
		 hashParame.put("[session]", request.getSession()); //在参数中保存sessin对象
    	 String requestKey=(String) hashParame.get("classname"); //得到类名
    	String  MethodName=(String)hashParame.get("method"); //得到方法名
    	String returnjsp=(String) hashParame.get("returnjsp"); //得到返回页面
    	String isAjaxReturn=(String)hashParame.get("isAjaxReturn"); //得到是否ajax返回页面
    	String returnjs=(String) hashParame.get("returnjs"); //得到返回回调函数
    	String pid=(String) hashParame.get("pid"); //得到主键字段
    	String pidz=(String) hashParame.get(pid); //得到主键的值 
    	String primary="-1";
    	String ClassName=(String) GlobalMapClass.MapClass.get(requestKey);//得到请求处理类名
    	
    	// System.out.print("requestKey="+requestKey+"\n");
    	  String err="";
    	if(ClassName!=null&&!"".equals(ClassName)){
    		 Object[] paramValue = null; //参数值数组
		     Class[] pType = null; //参数类型数组
		     Object[] tmpParamValue =null;     
    	   
		     
		    paramValue = new Object[1];
          	pType = new Class[paramValue.length]; //得到参数类型数组
     	    tmpParamValue = new Object[paramValue.length];
     	
			tmpParamValue[0]=hashParame;
			pType[0] =HashMap.class;
           
			//ClassName="com.zenith.wsbsdt.qysb.qyxx"; 
			//MethodName="InsertData";
			//反射调用方法得到数据
			try {
				primary = (String) ClsReflect.invokeMethod(ClassName,MethodName, tmpParamValue, pType);
			} catch (Exception e) {
		    	err=e.toString();
				e.printStackTrace();
				primary="-1";
			}  
    	}else{
    		err="没有找到处理的业务类！";
    		
    	}	
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
	   
		StringBuffer buffer=new StringBuffer();
		
		buffer.append(" <SCRIPT type=\"text/javascript\">");
	   
		if(returnjs!=null && !"".equals(returnjs)){ //如果有回调js 
			  String  callback=returnjs.substring(0,returnjs.indexOf("("));
	    	   //buffer.append("eval(\""+callback+"(1)'\"");
	    	  buffer.append("parent.eval(\""+callback+"('"+primary+"','"+err+"')\");");
			
		}else{ //如果没有回调js
		  if(err.equals("")){
		     buffer.append(" alert(\"保存数据成功!\");");
	       }else{
	         buffer.append(" alert(\"保存数据失败!  错误信息:"+err+"\");");	
	         }
		}
		if(isAjaxReturn!=null){
			 String url=(String) request.getParameter("url");
		 	 RequestDispatcher dispatcher = request.getRequestDispatcher(url);    // 使用req对象获取RequestDispatcher对象
		 	 dispatcher.forward(request, response);  
		}else{
			if(returnjsp!=null){
			    if(pidz!=null&& !pidz.equals("")){
			        if(returnjsp.indexOf("?")>-1){
			          buffer.append(" location.href=\""+returnjsp+"&"+pid+"="+pidz+"&isedit=true\";");
			        }else{
			    	  buffer.append(" location.href=\""+returnjsp+"?"+pid+"="+pidz+"&isedit=true\";");
			        }
			     }else{
			    	 if(returnjsp.indexOf("?")>-1){
			    	  buffer.append(" location.href=\""+returnjsp+"&"+pid+"="+primary+"&isedit=true\";");
			    	 }else{
			    	  buffer.append(" location.href=\""+returnjsp+"?"+pid+"="+primary+"&isedit=true\";");
			    	 }
			    }
			}
		}
		
		buffer.append(" </SCRIPT>");
		
	    out.println(buffer.toString());
		
		out.flush();
		out.close();
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
