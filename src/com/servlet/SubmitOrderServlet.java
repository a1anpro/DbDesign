package com.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bean.CustomerBean;
import com.util.DBUtil;

public class SubmitOrderServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public SubmitOrderServlet() {
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
		// �����session��ά����һ��list(���list������չʾ���ﳵ��)����session��list������ݶ�������
		// ����ʱ�Ķ����ֱ�д��boughtordertab��ordertab,����tempcarttab���
		// ���ڷ������ݿ�
		HttpSession session = request.getSession();
		
		CustomerBean cust = (CustomerBean) session.getAttribute("cust");
		double custAccount = cust.getAccount();
		double totalPrice = (Double) session.getAttribute("totalPrice");
		
		if (custAccount >= totalPrice){//���Ǯ�����飬�Ͳ������ݿ�
			DBUtil util = new DBUtil();
			Connection conn = util.getConnection();
			// ��ѯtempcarttab�����������
			String sql = "select custid,bookid,number,price,total from tempcarttab";// ��ѯ�����е�
	
			try {
				Statement stmt = conn.createStatement();
	
				ResultSet rs = stmt.executeQuery(sql);// ֻ����һ��ordertab�Ϳ���
				boolean orderGet = false;
				String ordername=null;// �ֲ���������
	
				while (rs.next()) {
					//����֮�����ݿ���������
					String updateSql_book = "update booktab set quantity=quantity-? where bookid=?";
					PreparedStatement pstmt = conn.prepareStatement(updateSql_book);
					pstmt.setInt(1, rs.getInt("number"));//����Ҫ���ٵı���
					pstmt.setInt(2, rs.getInt("bookid"));//����Ҫ���bookid
					pstmt.executeUpdate();
					
					//�ʻ���������
					String updateSql_customer = "update customertab set account=account-? where id = ?";
					PreparedStatement pstmt1 = conn.prepareStatement(updateSql_customer);
					pstmt1.setDouble(1, rs.getDouble("total"));
					pstmt1.setInt(2, rs.getInt("custid"));
					pstmt1.executeUpdate();//����
					//HttpSession session = request.getSession();
					//CustomerBean cust = (CustomerBean) session.getAttribute("cust");
					cust.setAccount(cust.getAccount()-rs.getDouble("total"));
					session.setAttribute("cust", cust);
					
					// ���Ǵ��������tempcarttab���棬�ֱ���custid,bookid,number,price,total;
					if (!orderGet) {
						// ��δ����ordertab�ļ�¼,���ɼ�¼
						orderGet = true;
						//Timestamp ts = new Timestamp(System.currentTimeMillis());
						//DateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
						//ordername = sdf.format(ts);// ��ʽ��
						//ordername = ts.toString();//����ʱ���
						
						Statement stmt1 = conn.createStatement();
						Statement stmt2 = conn.createStatement();
						
						long time = System.currentTimeMillis();
						ordername = String.valueOf(time);//ת��String��long
						
						String insertSql1 = "insert into ordertab(ordername,customer_id) values(" 
						+ ordername + "," + rs.getString("custid") + ")";
						String insertSql2 = "insert into boughtordertab(order_name,book_id,bought_num,bought_cost) values("
								+ ordername
								+ ","
								+ rs.getInt("bookid")
								+ ","
								+ rs.getInt("number")
								+ ","
								+ rs.getDouble("total") + ")";
	
						stmt1.executeUpdate(insertSql1);// ����ordertab��Ψ��һ����¼
						stmt2.executeUpdate(insertSql2);//���������һ����¼����ordertab��ͬ
					}
					else
					{
						//�Ѿ�������ordertab�����,���ھͲ���boughtordertab;
						//�ڲ��빺���¼��ʱ��booktab�Ŀ���customertab����Ҫ�ı�
						
						Statement stmt_temp = conn.createStatement();
						
						String insertSql = "insert into boughtordertab(order_name,book_id,bought_num,bought_cost) values("
								+ ordername//��һ�β�ֵ���ᵽ���������Կ��Գ�ʼ��Ϊ�ա���һ��ִ�еıض���if������
								+ ","
								+ rs.getInt("bookid")
								+ ","
								+ rs.getInt("number")
								+ ","
								+ rs.getDouble("total") + ")";
						
						stmt_temp.executeUpdate(insertSql);//���������һ����¼
					}
				}
				//Ŀǰordertab �� boughtordertab���Ѿ���ֵ��ϣ�����Ҫ���tempcarttab��session���list
				String clearSql = "delete from tempcarttab";//���
				stmt.executeUpdate(clearSql);//
				
				session.removeAttribute("cartlist");//���session��Ĺ��ﳵlist���´η��ʹ��ﳵ��ʱ�򣬹��ﳵ�ǿյ�
				session.removeAttribute("totalPrice");//���֮ǰ���õ��ܼۣ���js�õģ�
				
				response.sendRedirect("index.jsp");
				
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			finally{
				util.closeConnection(conn);
			}
		}
		else{
			//Ǯ�����ͷ��ص����ﳵ������ɾ������
			response.sendRedirect("myShopCar.jsp");
		}
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
