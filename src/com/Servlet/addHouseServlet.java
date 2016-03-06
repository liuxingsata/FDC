package com.Servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.FileItem;
import org.apache.tomcat.util.http.fileupload.FileUploadException;
import org.apache.tomcat.util.http.fileupload.RequestContext;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.javaBean.houseBean;
import com.javaBean.newOperation;

/**
 * 添加房产信息
 */
@WebServlet(urlPatterns={"/admin/addHouseServlet","/addHouseServlet"})
public class addHouseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addHouseServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String path;
		String filename;
	      newOperation nop=new newOperation();
	      houseBean ub=new houseBean();
	      request.setCharacterEncoding("utf-8");
	      ub.setHousetype(request.getParameter("housetype"));
	      ub.setHousearea(request.getParameter("housearea"));
	      ub.setHousefloor(request.getParameter("housefloor"));
	      ub.setHouseadd(request.getParameter("houseadd"));
	      ub.setHouseowner(request.getParameter("houseowner"));
	      
	      response.setContentType("text/html;charset=utf-8");
	      DiskFileItemFactory factory = new DiskFileItemFactory();
	      ServletFileUpload sfu = new ServletFileUpload(factory);
	      sfu.setFileSizeMax(1024*400);
	      try {
			List<FileItem> items = sfu.parseRequest((RequestContext) request);
			for(FileItem item:items){
				if(!item.isFormField()){
					ServletContext sctx = getServletContext();
					path = sctx.getRealPath("");
					filename = item.getName();
					System.out.println(filename);
					System.out.println(path);
				}
			}
		} catch (FileUploadException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	      String hp="";
	      ub.setHousephoto(hp);
	      String house_all=ub.getHousetype()+ub.getHousearea()+ub.getHousefloor()+ub.getHouseadd()+ub.getHouseowner();
	      String sql;
	      sql="insert into house(house_type,house_area,house_floor,house_add,house_owner,house_p,house_all) value('"+ub.getHousetype()+"','"+ub.getHousearea()+"','"+ub.getHousefloor()+"','"+ub.getHouseadd()+"','"+ub.getHouseowner()+"','"+ub.getHousephoto()+"','"+house_all+"')";
	      System.out.println(sql);
	      nop.update(sql);
	      response.sendRedirect("../addcg.jsp");
	      
	      
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
