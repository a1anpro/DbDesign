package com.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.dao.AddTypeDao;
import com.util.DBUtil;

public class AddTypeDaoImpl implements AddTypeDao {

	public void AddType(String[] types, String bookname) {
		//在图书表里把bookname的书的id找到，和type一起插入sort表
		
		DBUtil util = new DBUtil();
		Connection conn = util.getConnection();
		
		String sql1 = "select bookid from booktab where bookname=?";
		String sql2 = "insert into sorttab(book_id,type_id) values(?,?)";//插入数据 到 类型-书id 表中
		String sql3 = "select typeid from typetab where typename=?";
		try {
			PreparedStatement pstmt1 = conn.prepareStatement(sql1);//做查询
			PreparedStatement pstmt2 = conn.prepareStatement(sql2);//做插入
			PreparedStatement pstmt3 = conn.prepareStatement(sql3);//做查询。查询类型的编号
			
			pstmt1.setString(1, bookname);
			ResultSet rs = pstmt1.executeQuery();//得到id的结果集
			int bookid [] = new int[100];//
			int len = 0;
			while (rs.next()){
				bookid[len++] = rs.getInt(1);//得到id 放入id的数组
				System.out.println("书的编号:" + bookid[len-1]);//调试输出 book的id
			}
			
			//通过类型名，得到类型编号
			int typeid[] = new int[12];
			for (int i = 0; i < types.length; ++i)
			{
				pstmt3.setString(1, types[i]);
				ResultSet rs1 = pstmt3.executeQuery();
				
				if (rs1.next()){
					typeid[i] = rs1.getInt("typeid");
				}
				System.out.println(types[i] + typeid[i]);
			}
			
			
			//对于一个类型，len本书要插入len次
			for (int i = 0; i < types.length; ++i){
				//对于类型i，要对len本书进行插入
				for (int j = 0 ; j < len; ++j){
					pstmt2.setInt(1, bookid[j]);//对第j本书
					pstmt2.setInt(2, typeid[i]);//将第i个类型设置给第j本书
					
					pstmt2.executeUpdate();//执行更新
				}
			}
			
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
