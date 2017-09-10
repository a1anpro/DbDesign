package com.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bean.CustomerBean;
import com.dao.LoginDao;
import com.dao.impl.LoginDaoImpl;

/**
 * Servlet implementation class LoginServlet
 */
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public LoginServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8"); 
		request.setCharacterEncoding("utf-8"); 
		LoginDao lg = new LoginDaoImpl();
		
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		CustomerBean cust = lg.Login(username, password);
		
		if (cust == null)//登陆失败，没有在数据库里找到
		{
			//System.out.println("失败");//测试
			response.sendRedirect("myLogin.jsp?error=yes");
			//返回参数错误，用jsp获取登陆错误
		}
		else{
			HttpSession session = request.getSession();
			
			List list = new ArrayList();
			session.setAttribute("record", list);//在登陆的时候就设一个 session的参数，保存浏览记录
			session.setAttribute("cust", cust);
			
			request.getRequestDispatcher("/index.jsp").forward(request, response);//
			//登陆成功，把用户放到session
		}
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
