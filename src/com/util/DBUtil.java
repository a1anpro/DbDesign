package com.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBUtil {
	public Connection getConnection(){
		//
		String url = "jdbc:mysql://localhost:3306/dbdesign?useUnicode=true&amp;characterEncoding=UTF-8 ";
		String root = "root";
		String password = "root";//�޸�������
		String Driver = "com.mysql.jdbc.Driver";//Ҫ���ص�����
		
		try {
			Class.forName(Driver);//��������
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
