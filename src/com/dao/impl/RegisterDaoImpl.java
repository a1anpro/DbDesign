package com.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.bean.CustomerBean;
import com.dao.RegisterDao;
import com.util.DBUtil;

public class RegisterDaoImpl implements RegisterDao {

	public void RegisterDaoImpl(CustomerBean cust) {
		DBUtil util = new DBUtil();
		Connection conn = util.getConnection();
		
		String sql = "insert into customerTab(username,password,address,picture,account) values(?,?,?,?,?)";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			String username = cust.getUsername();
			String password = cust.getPassword();
			String address = cust.getAddress();
			String picture = cust.getPicture();
			double account = cust.getAccount();
			
			pstmt.setString(1, username);
			pstmt.setString(2, password);
			pstmt.setString(3, address);
			pstmt.setString(4, picture);
			pstmt.setDouble(5, account);
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally{
			util.closeConnection(conn);
		}
	}

}
