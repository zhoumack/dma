/*jadclipse*/// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) radix(10) lradix(10) 
// Source File Name:   DataServlet.java
package servlet;

import com.mobile.GlobalFunction;
import com.mobile.GlobalMapClass;
import com.mobile.util.ClsReflect;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.*;

public class DataServlet extends HttpServlet
{

    public DataServlet()
    {
    }

    public void destroy()
    {
        super.destroy();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException
    {
        response.setContentType("application/json; charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String strparame = "";
        String MethodName = "";
        String parameters = "";
        String url = request.getRequestURI();
        strparame = request.getQueryString();
        HashMap hashParame = new HashMap();
        Object paramValue[] = (Object[])null;
        Class pType[] = (Class[])null;
        Object tmpParamValue[] = (Object[])null;
        String requestKey = url.substring(url.lastIndexOf("/") + 1, url.lastIndexOf("."));
        String ClassName = (String)GlobalMapClass.MapClass.get(requestKey);
        String getdate = request.getParameter("getdate");
        String method = request.getParameter("method");
        String isAjaxReturn=request.getParameter("isAjaxReturn"); //得到是否ajax返回页面
        if(method == null || method.equals(""))
            getdate = "true";
        if(getdate != null && getdate.equals("true"))
            strparame = null;
        if(strparame != null && !strparame.equals("") || method != null && !method.equals(""))
        {
            response.setContentType("text/html; charset=UTF-8");
            hashParame = GlobalFunction.getParameter(request);
            hashParame.put("[session]", request.getSession());
            MethodName = (String)hashParame.get("method");
            parameters = (String)hashParame.get("parameters");
            if(parameters != null && !parameters.equals(""))
            {
                paramValue = parameters.split(",");
                pType = new Class[paramValue.length];
                tmpParamValue = new Object[paramValue.length];
                for(int i = 0; i < paramValue.length; i++)
                    if(paramValue[i].toString().equalsIgnoreCase("[servletContext]"))
                    {
                        tmpParamValue[i] = getServletContext();
                        pType[i] = javax.servlet.ServletContext.class;
                    } else
                    if(paramValue[i].toString().equalsIgnoreCase("[session]"))
                    {
                        tmpParamValue[i] = request.getSession();
                        pType[i] = javax.servlet.http.HttpSession.class;
                    } else
                    if(paramValue[i].toString().equalsIgnoreCase("[request]"))
                    {
                        tmpParamValue[i] = request;
                        pType[i] = javax.servlet.http.HttpServletRequest.class;
                    } else
                    {
                        tmpParamValue[i] = paramValue[i];
                        pType[i] =java.lang.String.class;
                    }

            } else
            {
                hashParame = GlobalFunction.getParameter(request);
                hashParame.put("[session]", request.getSession());
                paramValue = new Object[1];
                pType = new Class[paramValue.length];
                tmpParamValue = new Object[paramValue.length];
                MethodName = method;
                tmpParamValue[0] = hashParame;
                pType[0] = java.util.HashMap.class;
            }
        } else
        {
            hashParame = GlobalFunction.getParameter(request);
            hashParame.put("[session]", request.getSession());
            paramValue = new Object[1];
            pType = new Class[paramValue.length];
            tmpParamValue = new Object[paramValue.length];
            MethodName = "getData";
            tmpParamValue[0] = hashParame;
            pType[0] = java.util.HashMap.class;
        }
        if(isAjaxReturn!=null&&!"".equals(isAjaxReturn)){
        	Map result;
        	try {
				result=(Map)ClsReflect.invokeMethod(ClassName, MethodName, tmpParamValue, pType);
				request.setAttribute("result", result);
			} catch (Exception e) {
				e.printStackTrace();
			}
    	    RequestDispatcher dispatcher = request.getRequestDispatcher(isAjaxReturn);    // 使用req对象获取RequestDispatcher对象
    	    dispatcher.forward(request, response);  
        }else{
        	String json = "";
            try
            {
                json = (String)ClsReflect.invokeMethod(ClassName, MethodName, tmpParamValue, pType);
            }
            catch(Exception e)
            {
                json = GlobalFunction.ErrorToJson(e.toString());
                e.printStackTrace();
            }
            PrintWriter out = response.getWriter();
            out.print(json);
        }
        
        
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException
    {
        doGet(request, response);
    }

    public void init()
        throws ServletException
    {
    }

    private static final String CONTENT_TYPE = "application/json; charset=UTF-8";
    private static final String CONTENT_TYPE_TEXT = "text/html; charset=UTF-8";
}


/*
	DECOMPILATION REPORT

	Decompiled from: E:\WorkSpace\WeiAnDma\WebRoot\WEB-INF\lib\MobileDK.jar
	Total time: 16 ms
	Jad reported messages/errors:
	Exit status: 0
	Caught exceptions:
*/