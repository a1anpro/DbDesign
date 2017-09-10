package com.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bean.BookBean;
import com.dao.GetBookListDao;
import com.dao.impl.GetBookListDaoImpl;

public class GetBookListServlet extends HttpServlet {

	public GetBookListServlet() {
		super();
	}
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		List bookList = new ArrayList();
		GetBookListDao gbld = new GetBookListDaoImpl();
		bookList = gbld.GetBookList();//得到书单list
		
		HttpSession session = request.getSession();
		session.setAttribute("bookList", bookList);//放入session 在jsp中获取即可
		
		//跳转到主页面
		response.sendRedirect("myLeftNav.jsp");
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
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

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
