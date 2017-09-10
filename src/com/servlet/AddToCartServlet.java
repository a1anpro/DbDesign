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

		String bookid = request.getParameter("bookid");//得到 用get方法提交过来的书的id
		String buyNumber = request.getParameter("buyNumber");//得到购买的数量
		String price = request.getParameter("price");//得到单价
		String custid = request.getParameter("custid");
		
		//现在去数据库里操作。存在临时的表里
		double total = 0;//price*buyNumber
		
		DBUtil util = new DBUtil();
		Connection conn = util.getConnection();
		String sql = "insert into tempcarttab values(";
		sql += custid + "," + bookid + "," + buyNumber + "," + price + "," + total + ")";//单价和总价都在
		System.out.println(sql);
		try {
			
			Statement stmt = conn.createStatement();
			stmt.executeUpdate(sql);//插入更新
			
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
