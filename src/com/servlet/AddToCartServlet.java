package com.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.DBUtil;

public class AddToCartServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public AddToCartServlet() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String bookid = request.getParameter("bookid");//�õ� ��get�����ύ���������id
		String buyNumber = request.getParameter("buyNumber");//�õ����������
		String price = request.getParameter("price");//�õ�����
		String custid = request.getParameter("custid");
		
		//����ȥ���ݿ��������������ʱ�ı���
		double total = 0;//price*buyNumber
		
		DBUtil util = new DBUtil();
		Connection conn = util.getConnection();
		String sql = "insert into tempcarttab values(";
		sql += custid + "," + bookid + "," + buyNumber + "," + price + "," + total + ")";//���ۺ��ܼ۶���
		System.out.println(sql);
		try {
			
			Statement stmt = conn.createStatement();
			stmt.executeUpdate(sql);//�������
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}


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
