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

import com.javaBean.newOperation;

/**
 * 请求处理
 */
@WebServlet({ "/requestServlet", "/admin/requestServlet" })
public class requestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public requestServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session=request.getSession();
		request.setCharacterEncoding("utf-8");
		newOperation nop=new newOperation();
		String username=(String)session.getAttribute("uname");
		String id=request.getParameter("id");
		String action=request.getParameter("action");
		System.out.println(action);
		if(action.equals("agree")){
			String sql1="select * from request where id='"+id+"'";
			ResultSet rs1=nop.select(sql1);
			try {if(rs1.next()){
				String houseid=rs1.getString(3);
				String sql2="select * from house where house_id='"+houseid+"'";
				System.out.println(sql2);
				ResultSet rs2=nop.select(sql2);
				if(rs2.next()){
				String sql="insert into "+rs1.getString(4)+"(house_type,house_area,house_floor,house_add,house_owner,house_p,house_all) value('"+rs2.getString(2)+"','"+rs2.getString(3)+"','"+rs2.getString(4)+"','"+rs2.getString(5)+"','"+rs2.getString(6)+"','"+rs2.getString(7)+"','"+rs2.getString(8)+"')";
				System.out.println(sql);
				nop.update(sql);
				String sqld="delete from request where id="+id;
				nop.update(sqld);}}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
			response.sendRedirect("userrequest.jsp");
		}
		else if(action.equals("oldhouse")||action.equals("renthouse")){
			String tablename=action;
			String sql1="select house_all from "+tablename;
			String sql2="select house_all from house where house_id="+id;
			System.out.println(sql2);
			ResultSet rs1=nop.select(sql1);
			ResultSet rs2=nop.select(sql2);
			boolean flag=true;
			while(true){
				try {
					if(rs1.next()){
						if(rs2.getString(1).equals(rs1.getString(1))){
							flag=false;
							response.sendRedirect("edithouseinfo.jsp");break;}
						
					}else{break;}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}}
			if(flag){
				String sql="insert into request(username,houseid,applytype) value('"+username+"','"+id+"','"+action+"')";
				System.out.println(sql);
				nop.update(sql);
				response.sendRedirect("houseinfo.jsp");
				}
		}
		else if(action.equals("disagree")){
			String sql="delete from request where id="+id;
			nop.update(sql);
			response.sendRedirect("userrequest.jsp");
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
