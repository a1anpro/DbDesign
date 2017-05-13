package com.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBUtil {
	public Connection getConnection(){
		//
		String url = "jdbc:mysql://localhost:3306/dbdesign";
		String root = "root";
		String password = "123456";
		String Driver = "com.mysql.jdbc.Driver";//要加载的驱动
		
		try {
			Class.forName(Driver);//加载驱动
			try {
				return DriverManager.getConnection(url,root,password);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
	public void closeConnection(Connection conn){
		try {
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
