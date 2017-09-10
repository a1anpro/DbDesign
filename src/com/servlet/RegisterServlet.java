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
import com.dao.RegisterDao;
import com.dao.impl.RegisterDaoImpl;

/**
 * Servlet implementation class RegisterServlet
 */
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		response.setContentType("text/html;charset=utf-8"); 
		request.setCharacterEncoding("utf-8"); 
		
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String address = request.getParameter("address");
		
		String picture = "img/";
		picture += request.getParameter("picture");
		
		CustomerBean cust = new CustomerBean();
		cust.setUsername(username);
		cust.setPassword(password);
		cust.setAddress(address);
		cust.setPicture(picture);
		cust.setAccount(1000.0);//�ʼע��ʱ���ʻ���10Ԫ,���ڲ���Ĭ��1000Ԫ
		
		RegisterDao rd = new RegisterDaoImpl();
		rd.RegisterDaoImpl(cust);//ע��
		
		HttpSession session = request.getSession();//�ѵ�ǰ�û�����session
		
		session.setAttribute("cust", cust);
		List list = new ArrayList();
		session.setAttribute("record", list);//�ڵ�½��ʱ�����һ�� session�Ĳ��������������¼
		
		response.sendRedirect("myLeftNav.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}

}
