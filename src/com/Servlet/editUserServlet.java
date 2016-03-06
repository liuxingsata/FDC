package com.Servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.javaBean.newOperation;
import com.javaBean.userBean;

/**
 * 编辑用户信息
 */
@WebServlet(urlPatterns={"/admin/editUserServlet","/editUserServlet"})
public class editUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public editUserServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		request.setCharacterEncoding("utf-8");
		newOperation nop=new newOperation();
		String tablename=request.getParameter("tablename");
		String id=request.getParameter("id");
		userBean ub=new userBean();
	      ub.setUsername(request.getParameter("username"));
	      ub.setPassword(request.getParameter("password"));
	      ub.setSex(request.getParameter("sex"));
	      ub.setTruename(request.getParameter("truename"));
	      ub.setEmail(request.getParameter("email"));
	      ub.setPhonenumber(request.getParameter("phone"));
	      String username=ub.getUsername();
	      String truename=ub.getTruename();
	      String sex=ub.getSex();
		String sql="update "+tablename+" t set t.user_name='"+username+"',t.password='"+ub.getPassword()+"',t.true_name='"+truename+"',t.sex='"+sex+"',t.phone='"+ub.getPhonenumber()+"',t.email='"+ub.getEmail()+"' where user_id='"+id+"'";
		System.out.println(sql);
		nop.update(sql);
		if(session.getAttribute("admin")=="true"){
		response.sendRedirect("userm.jsp");}
		else{
			response.sendRedirect("personinfo.jsp");
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
