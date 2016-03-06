package com.Servlet;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.javaBean.codeExchange;
import com.javaBean.newOperation;

/**
 * 管理员登录
 */
@WebServlet("/admin/adminServlet")
public class adminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adminServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		codeExchange ce=new codeExchange();
	 	String user_name= ce.ChineseCoding(request.getParameter("username"));
	 	System.out.println(user_name);
		String pass_word = request.getParameter("password");
	 	if(user_name!=null && !user_name.equals("")){
	 		 newOperation nop=new newOperation();
	 		 HttpSession session=request.getSession();

             String sql="select * from ADMINUSERS where USER_NAME='"+user_name+"'";
             sql +="and PASSWORD='"+pass_word+"'";
             ResultSet rs=nop.select(sql);
             try {
				if(rs.next()){
					  session.setAttribute("login","ok");
				      session.setAttribute("admin","true");
				      session.setAttribute("uname",user_name);
				      response.sendRedirect("../index.jsp");                 
				      rs.close();
				      nop.close();
				   }else{response.sendRedirect("denglushibai.jsp");}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
