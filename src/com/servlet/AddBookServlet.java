package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bean.BookBean;
import com.dao.AddBookDao;
import com.dao.AddTypeDao;
import com.dao.impl.AddBookDaoImpl;
import com.dao.impl.AddTypeDaoImpl;

public class AddBookServlet extends HttpServlet {
	
	/**
	 * Constructor of the object.
	 */
	public AddBookServlet() {
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

		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");

		// 获得表单数据的定义，放在前面
		String bookname = request.getParameter("bookname");
		String description = request.getParameter("description");
		String author = request.getParameter("author");
		double price = new Double(request.getParameter("price")).doubleValue();
		String isbn = request.getParameter("isbn");
		int quantity = new Integer(request.getParameter("quantity")).intValue();
		
		//String picture = request.getContextPath();
		//picture += "/img/";
		String picture = "img/picture/";
		picture += request.getParameter("picture");
		//System.out.println("书的路径:" + picture);
		
		//HttpSession session = request.getSession();
		//String picture = (String) session.getAttribute("filePath");//
		//System.out.println(picture);//输出图片的路径，物理地址

		String[] type = request.getParameterValues("type");
		for (int i = 0; i < type.length; ++i) {
			System.out.println("类型:" + type[i]);
		}

		BookBean book = new BookBean();// 创建书的对象，与数据库的类 一一对应，实现orm的映射关系
		book.setBookname(bookname);
		book.setDescription(description);//设置书的描述
		book.setAuthor(author);
		book.setPrice(price);
		book.setIsbn(isbn);
		book.setQuantity(quantity);
		book.setPicture(picture);// 得到书的对象

		AddBookDao abd = new AddBookDaoImpl();
		abd.AddBook(book);// 添加书

		// 先插入书籍 再插入类型
		AddTypeDao atd = new AddTypeDaoImpl();
		atd.AddType(type, bookname);// 对这本书 插入type数组的所有属性

		// 以上操作结束就跳转到百度。
		response.sendRedirect("admin.jsp");
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

	/**
	 * Initialization of the servlet. <br>
	 * 
	 * @throws ServletException
	 *             if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
