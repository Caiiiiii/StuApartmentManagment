package com.EletricManager;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import MySql.DbControl;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class eletricSearch extends HttpServlet {

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
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

			String value = request.getParameter("selectOption");
			String iCondition = request.getParameter("inputCondition");
			
			response.setCharacterEncoding("utf-8"); 
			response.setHeader("Charset", "utf-8");
			response.setContentType("text/html; charset=utf-8");  
			DbControl db = new DbControl();

			 if(value.equals("1")){				//¥��ѯ
				 	List list =db.buildingEletricInfo(iCondition);
				 	PrintWriter out = response.getWriter();
				 	if(list!=null){
				 		JSONArray jsonArr  = JSONArray.fromObject(list); //��list��װ
						JSONObject json  = new JSONObject();   
						json.put("ElectricBean", jsonArr);
						out.write(json.toString());
						out.close();
				 	}else{
				 		out.write("null");
				 	}
			 }
			 else if(value.equals("2")){      //����Ų�ѯ
				 	List list  = db.dromNoEletricInfo(iCondition);
				 	PrintWriter out = response.getWriter();
				 	if(list!=null){
				 		JSONArray jsonArr  = JSONArray.fromObject(list); //��list��װ
						JSONObject json  = new JSONObject();   
						json.put("ElectricBean", jsonArr);
						out.write(json.toString());
						out.close();
				 	}else{
				 		out.write("null");
				 	}
			 }
			 
			 
			
			
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
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request,response);
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
