package com.Servlet;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.javaBean.codeExchange;
import com.javaBean.newOperation;

/**
 * 论坛内容提交
 */
@WebServlet("/bbsServlet")
public class bbsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public bbsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		codeExchange ce=new codeExchange();
		newOperation nop=new newOperation();
		HttpSession session=request.getSession();
       String content = ce.ChineseCoding(request.getParameter("CONTENT"));
       System.out.println(content);
       String tablename = "messageboard";
       String username=(String)session.getAttribute("uname");
      // username=ce.ChineseCoding((String)session.getAttribute("uname"));
       
 	   String Nowtime=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
	   
	   
	   String sqlinsert="INSERT INTO "+tablename+"(USER_NAME,MESSAGE_DATE,CONTENT) VALUES('"+username+"','"+Nowtime+"','"+content+"')";
	  nop.update(sqlinsert);
	   nop.close();
	   response.sendRedirect("houseBBS.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
