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

		// ��ñ����ݵĶ��壬����ǰ��
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
		//System.out.println("���·��:" + picture);
		
		//HttpSession session = request.getSession();
		//String picture = (String) session.getAttribute("filePath");//
		//System.out.println(picture);//���ͼƬ��·���������ַ

		String[] type = request.getParameterValues("type");
		for (int i = 0; i < type.length; ++i) {
			System.out.println("����:" + type[i]);
		}

		BookBean book = new BookBean();// ������Ķ��������ݿ���� һһ��Ӧ��ʵ��orm��ӳ���ϵ
		book.setBookname(bookname);
		book.setDescription(description);//�����������
		book.setAuthor(author);
		book.setPrice(price);
		book.setIsbn(isbn);
		book.setQuantity(quantity);
		book.setPicture(picture);// �õ���Ķ���

		AddBookDao abd = new AddBookDaoImpl();
		abd.AddBook(book);// �����

		// �Ȳ����鼮 �ٲ�������
		AddTypeDao atd = new AddTypeDaoImpl();
		atd.AddType(type, bookname);// ���Ȿ�� ����type�������������

		// ���ϲ�����������ת���ٶȡ�
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
