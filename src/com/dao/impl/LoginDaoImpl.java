package com.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.bean.CustomerBean;
import com.dao.LoginDao;
import com.util.DBUtil;

public class LoginDaoImpl implements LoginDao {

	public CustomerBean Login(String username, String password) {
		DBUtil util = new DBUtil();
		Connection conn = util.getConnection();
		String sql = "select id,address,picture,account from customerTab where username=? and password=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, username);
			pstmt.setString(2, password);
			ResultSet rs = pstmt.executeQuery();
			
			if (rs != null && rs.next())
			{
				int id = rs.getInt("id");
				String addr = rs.getString("address");
				String picture = rs.getString("picture");
				double acc = rs.getDouble("account");
				
				CustomerBean cust = new CustomerBean();
				cust.setUsername(username);
				cust.setPassword(password);
				cust.setId(id);
				cust.setAddress(addr);
				cust.setPicture(picture);
				cust.setAccount(acc);
				
				return cust;
			}
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally{
			//util.closeConnection(conn);
		}
		return null;
	}

}
