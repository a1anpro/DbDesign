package com.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.bean.BookBean;
import com.dao.AddBookDao;
import com.util.DBUtil;

public class AddBookDaoImpl implements AddBookDao {

	public void AddBook(BookBean book) {
		DBUtil util = new DBUtil();
		Connection conn = util.getConnection();
		
		String sql = "insert into booktab(bookname,description,author,price,isbn,quantity,picture) values(?,?,?,?,?,?,?)";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, book.getBookname());
			pstmt.setString(2, book.getDescription());//ÐÂ¼ÓµÄ
			pstmt.setString(3, book.getAuthor());
			pstmt.setDouble(4, book.getPrice());
			pstmt.setString(5, book.getIsbn());
			pstmt.setInt(6,book.getQuantity());
			pstmt.setString(7, book.getPicture());
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally{
			util.closeConnection(conn);
		}
	}

}
