package com.dao.impl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.bean.BookBean;
import com.dao.GetBookListDao;
import com.util.DBUtil;

public class GetBookListDaoImpl implements GetBookListDao {

	public List GetBookList() {
		DBUtil util = new DBUtil();
		Connection conn = util.getConnection();
		String sql = "select bookid,bookname,author,price,isbn,quantity,picture from booktab";//取出所有的书
		
		try {
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);//得到查询结果集
			
			List list = new ArrayList();
			
			while (rs.next())
			{
				BookBean book = new BookBean();
				
				book.setBookid(rs.getInt("bookid"));
				book.setBookname(rs.getString("bookname"));
				book.setDescription("description");//设置书的描述
				book.setAuthor(rs.getString("author"));
				book.setPrice(rs.getDouble("price"));
				book.setIsbn(rs.getString("isbn"));
				book.setQuantity(rs.getInt("quantity"));
				book.setPicture(rs.getString("picture"));
				
				list.add(book);//把得到的这个对象放入list
			}
			rs.close();
			return list;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally{
			util.closeConnection(conn);
		}
		
		return null;
	}

}
