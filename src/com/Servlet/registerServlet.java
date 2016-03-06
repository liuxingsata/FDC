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
import com.javaBean.userBean;

/**
 * 注册验证
 */
@WebServlet("/registerServlet")
public class registerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public registerServlet() {
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
	      userBean ub=new userBean();
	      ub.setUsername(request.getParameter("username"));
	      ub.setPassword(request.getParameter("password"));
	      ub.setPasswordcon(request.getParameter("confirm"));
	      ub.setSex(request.getParameter("sex"));
	      ub.setTruename(request.getParameter("name"));
	      ub.setEmail(request.getParameter("email"));
	      ub.setPhonenumber(request.getParameter("phone"));
	      String tableName="USERS";
	      String sql1="";
	      String sql="SELECT USER_NAME FROM "+tableName;
	      ResultSet rs=nop.select(sql);
	      String username=ce.ChineseCoding(ub.getUsername());
	      System.out.println(username+"++"+ub.getPassword());
	      String truename=ce.ChineseCoding(ub.getTruename());
	      String sex=ce.ChineseCoding(ub.getSex());
	      while(true) 
	      {
	          try {
				if(rs.next()){
				    if(username.equals(rs.getString("USER_NAME"))) {
				    	response.sendRedirect("register.jsp");break;}}
				   else if(ub.check()!=null){
					   
					   System.out.println(ub.check());
					   response.sendRedirect("register.jsp");break;
					  }
				   else{		
    	 				System.out.println("success");
				        sql1="INSERT INTO "+tableName+"(user_name,password,true_name,sex,phone,email) VALUES('"+username+"','"+ub.getPassword()+"','"+truename+"','"+sex+"','"+ub.getPhonenumber()+"','"+ub.getEmail()+"')";
				        System.out.println(sql1);
				        nop.update(sql1);
				        HttpSession session=request.getSession();
				        session.setAttribute("admin", "false");
				        session.setAttribute("login","ok");
				        session.setAttribute("uname",username);
				        response.sendRedirect("zccg.jsp");
break; }
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}}
			try {
				rs.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	      nop.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
