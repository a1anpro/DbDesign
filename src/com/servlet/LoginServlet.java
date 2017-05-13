package com.servlet;

import java.io.IOException;

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
		
		LoginDao lg = new LoginDaoImpl();
		
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		CustomerBean cust = lg.Login(username, password);
		if (cust == null)//��½ʧ�ܣ�û�������ݿ����ҵ�
		{
			//System.out.println("ʧ��");
			response.sendRedirect("Login.jsp?error=yes");
			//���ز���������jsp��ȡ��½����
		}
		else{
			//System.out.println("�ɹ�");
			request.getRequestDispatcher("/SuccessedLogin.jsp").forward(request, response);//
			//��½�ɹ������û��ŵ�session
			HttpSession session = request.getSession();
			session.setAttribute("cust", cust);
		}
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
