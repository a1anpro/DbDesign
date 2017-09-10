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
		// 在这里，session里维护着一个list(这个list是用来展示购物车的)；从session的list里把数据读出来。
		// 把临时的订单分别写入boughtordertab和ordertab,并将tempcarttab清空
		// 现在访问数据库
		HttpSession session = request.getSession();
		
		CustomerBean cust = (CustomerBean) session.getAttribute("cust");
		double custAccount = cust.getAccount();
		double totalPrice = (Double) session.getAttribute("totalPrice");
		
		if (custAccount >= totalPrice){//如果钱够买书，就操作数据库
			DBUtil util = new DBUtil();
			Connection conn = util.getConnection();
			// 查询tempcarttab里的所有数据
			String sql = "select custid,bookid,number,price,total from tempcarttab";// 查询出所有的
	
			try {
				Statement stmt = conn.createStatement();
	
				ResultSet rs = stmt.executeQuery(sql);// 只产生一个ordertab就可以
				boolean orderGet = false;
				String ordername=null;// 局部都可以用
	
				while (rs.next()) {
					//买书之后，数据库里的书减少
					String updateSql_book = "update booktab set quantity=quantity-? where bookid=?";
					PreparedStatement pstmt = conn.prepareStatement(updateSql_book);
					pstmt.setInt(1, rs.getInt("number"));//设置要减少的本数
					pstmt.setInt(2, rs.getInt("bookid"));//设置要查的bookid
					pstmt.executeUpdate();
					
					//帐户的余额减少
					String updateSql_customer = "update customertab set account=account-? where id = ?";
					PreparedStatement pstmt1 = conn.prepareStatement(updateSql_customer);
					pstmt1.setDouble(1, rs.getDouble("total"));
					pstmt1.setInt(2, rs.getInt("custid"));
					pstmt1.executeUpdate();//更新
					//HttpSession session = request.getSession();
					//CustomerBean cust = (CustomerBean) session.getAttribute("cust");
					cust.setAccount(cust.getAccount()-rs.getDouble("total"));
					session.setAttribute("cust", cust);
					
					// 我们存的数据在tempcarttab里面，分别有custid,bookid,number,price,total;
					if (!orderGet) {
						// 还未生成ordertab的记录,生成记录
						orderGet = true;
						//Timestamp ts = new Timestamp(System.currentTimeMillis());
						//DateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
						//ordername = sdf.format(ts);// 格式化
						//ordername = ts.toString();//测试时间戳
						
						Statement stmt1 = conn.createStatement();
						Statement stmt2 = conn.createStatement();
						
						long time = System.currentTimeMillis();
						ordername = String.valueOf(time);//转成String，long
						
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
	
						stmt1.executeUpdate(insertSql1);// 插入ordertab，唯此一条记录
						stmt2.executeUpdate(insertSql2);//插入买书的一条记录，与ordertab不同
					}
					else
					{
						//已经插入了ordertab的情况,现在就插入boughtordertab;
						//在插入购买记录的时候，booktab的库存和customertab的余额都要改变
						
						Statement stmt_temp = conn.createStatement();
						
						String insertSql = "insert into boughtordertab(order_name,book_id,bought_num,bought_cost) values("
								+ ordername//第一次插值不会到这来，所以可以初始化为空。第一次执行的必定是if的内容
								+ ","
								+ rs.getInt("bookid")
								+ ","
								+ rs.getInt("number")
								+ ","
								+ rs.getDouble("total") + ")";
						
						stmt_temp.executeUpdate(insertSql);//插入买书的一条记录
					}
				}
				//目前ordertab 和 boughtordertab都已经插值完毕，现在要清空tempcarttab和session里的list
				String clearSql = "delete from tempcarttab";//清空
				stmt.executeUpdate(clearSql);//
				
				session.removeAttribute("cartlist");//清空session里的购物车list，下次访问购物车的时候，购物车是空的
				session.removeAttribute("totalPrice");//清空之前设置的总价（给js用的）
				
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
			//钱不够就返回到购物车，进行删减工作
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
