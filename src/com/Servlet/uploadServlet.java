package com.Servlet;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 * Servlet implementation class uploadServlet
 */
@WebServlet("/uploadServlet")
public class uploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private String contextPath;
    @Override
    public void init(){
    	contextPath = getServletContext().getRealPath("/");
    }
    /**
     * @see HttpServlet#HttpServlet()
     */
    public uploadServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
	


	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=utf-8");
		//SmartUpload su=new SmartUpload();
		Part part = request.getPart("housephoto");
		String fileName=getFileName(part);
		System.out.println(fileName);
		//writeTo(fileName,part);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	private String getFileName(Part part){
		String header = part.getHeader("Context-Disposition");
		String fileName = header.substring(header.indexOf("filename=\"")+10,header.lastIndexOf("\""));
		
		return fileName;
		
	}
	private void writeTo(String fileName,Part part) throws IOException{
		InputStream in = part.getInputStream();
		OutputStream out = new FileOutputStream(contextPath+fileName);
		byte[] buffer = new byte[1024];
		int length=-1;
		while((length=in.read(buffer))!=-1){
			out.write(buffer, 0, length);
		}
		in.close();
		out.close();
	}

}
