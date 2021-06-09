package com.myproject.utils;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

public class ScriptUtils {

	public static void init(HttpServletResponse response) {
        response.setContentType("text/html; charset=euc-kr");
        response.setCharacterEncoding("euc-kr");
    }
	
	public static void onlyUseHtmlTag(HttpServletResponse response, String tagText) throws IOException {
    	init(response);
    	PrintWriter out = response.getWriter();
    	out.println(tagText);
    	out.flush();
    }
 
    public static void alert(HttpServletResponse response, String alertText) throws IOException {
        init(response);
        PrintWriter out = response.getWriter();
        out.println("<script>alert('" + alertText + "');</script> ");
        out.flush();
    }
 
    public static void alertAndMovePage(HttpServletResponse response, String alertText, String nextPage)
            throws IOException {
        init(response);
        PrintWriter out = response.getWriter();
        out.println("<script>alert('" + alertText + "'); location.href='" + nextPage + "';</script> ");
        out.flush();
    }
 
    public static void alertAndBackPage(HttpServletResponse response, String alertText) throws IOException {
        init(response);
        PrintWriter out = response.getWriter();
        out.println("<script>alert('" + alertText + "'); history.go(-1);</script>");
        out.flush();
    }
    
    

}


/*java에서 html 태그 사용할 때
 * 1. response 객체에 setContentType을 사용한다.
 * 2. PrintWriter 객체를 생성하고 response 변수에 getWriter()메서드로 초기화 해준다.
 * out.println("<script> $('#input_pw_txtbox').focus(); </script>");
*/
