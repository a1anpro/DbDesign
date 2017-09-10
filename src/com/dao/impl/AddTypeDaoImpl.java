package com.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.dao.AddTypeDao;
import com.util.DBUtil;

public class AddTypeDaoImpl implements AddTypeDao {

	public void AddType(String[] types, String bookname) {
		//��ͼ������bookname�����id�ҵ�����typeһ�����sort��
		
		DBUtil util = new DBUtil();
		Connection conn = util.getConnection();
		
		String sql1 = "select bookid from booktab where bookname=?";
		String sql2 = "insert into sorttab(book_id,type_id) values(?,?)";//�������� �� ����-��id ����
		String sql3 = "select typeid from typetab where typename=?";
		try {
			PreparedStatement pstmt1 = conn.prepareStatement(sql1);//����ѯ
			PreparedStatement pstmt2 = conn.prepareStatement(sql2);//������
			PreparedStatement pstmt3 = conn.prepareStatement(sql3);//����ѯ����ѯ���͵ı��
			
			pstmt1.setString(1, bookname);
			ResultSet rs = pstmt1.executeQuery();//�õ�id�Ľ����
			int bookid [] = new int[100];//
			int len = 0;
			while (rs.next()){
				bookid[len++] = rs.getInt(1);//�õ�id ����id������
				System.out.println("��ı��:" + bookid[len-1]);//������� book��id
			}
			
			//ͨ�����������õ����ͱ��
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
			
			
			//����һ�����ͣ�len����Ҫ����len��
			for (int i = 0; i < types.length; ++i){
				//��������i��Ҫ��len������в���
				for (int j = 0 ; j < len; ++j){
					pstmt2.setInt(1, bookid[j]);//�Ե�j����
					pstmt2.setInt(2, typeid[i]);//����i���������ø���j����
					
					pstmt2.executeUpdate();//ִ�и���
				}
			}
			
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
