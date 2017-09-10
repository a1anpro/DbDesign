<%@ page language="java"
	import="java.util.*, com.util.*, java.sql.*, com.bean.DetailedOrderBean"
	pageEncoding="utf-8"%>
<%@ include file="myHeader.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="../../favicon.ico">

<title>当前书信息</title>

<!-- Bootstrap core CSS -->
<link href="docs/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="docs/examples/dashboard/dashboard.css" rel="stylesheet">
</head>

<body>
	<div class="container-fluid">
		<div class="row">
			<nav class="col-sm-2 col-md-2 hidden-xs-down bg-faded sidebar">
			<ul class="nav nav-pills flex-column">
				<li class="nav-item">
					<h5 style="color:grey;padding-left: 50px">
						教育
						<hr>
				</li>
				<li class="nav-item"><a style="padding-left: 80px"
					class="nav-link" href="mySortBook.jsp?type=textbook">教材 </a></li>
				<li class="nav-item"><a style="padding-left: 80px"
					class="nav-link" href="mySortBook.jsp?type=foreign">外语</a></li>
				<li class="nav-item"><a style="padding-left: 80px"
					class="nav-link" href="mySortBook.jsp?type=exam">考试</a></li>
				<li class="nav-item"><a style="padding-left: 80px"
					class="nav-link" href="mySortBook.jsp?type=reference">工具书</a></li>
			</ul>

			<ul class="nav nav-pills flex-column">
				<li class="nav-item">
					<h5 style="color:grey;padding-left: 50px">
						文艺
						<hr>
				</li>
				<li class="nav-item"><a style="padding-left: 80px"
					class="nav-link" href="mySortBook.jsp?type=literature">文学</a></li>
				<li class="nav-item"><a style="padding-left: 80px"
					class="nav-link" href="mySortBook.jsp?type=biography">传记</a></li>
				<li class="nav-item"><a style="padding-left: 80px"
					class="nav-link" href="mySortBook.jsp?type=photo">摄影</a></li>
				<li class="nav-item"><a style="padding-left: 80px"
					class="nav-link" href="mySortBook.jsp?type=art">艺术</a></li>
			</ul>

			<ul class="nav nav-pills flex-column">
				<li class="nav-item">
					<h5 style="color:grey;padding-left: 50px">
						生活
						<hr>
				</li>
				<li class="nav-item"><a style="padding-left: 80px"
					class="nav-link" href="mySortBook.jsp?type=food">美食</a></li>
				<li class="nav-item"><a style="padding-left: 80px"
					class="nav-link" href="mySortBook.jsp?type=travel">旅游</a></li>
				<li class="nav-item"><a style="padding-left: 80px"
					class="nav-link" href="mySortBook.jsp?type=sport">运动</a></li>
			</ul>
			</nav>

			<main class="col-sm-9 offset-sm-3 col-md-10 offset-md-2 pt-3">

			<h1>历史订单</h1>
			
			<%
				DBUtil util = new DBUtil();
				Connection conn = util.getConnection();	
				
				List detailedOrder = new ArrayList();
				String order_name = request.getParameter("ordername");//在？号后面传过来的参数
				
				//联合查询
				String sql = "select bookname,bought_num,bought_cost from boughtordertab,booktab where order_name=?"+
							" and boughtordertab.book_id=booktab.bookid";
				
				try{
					PreparedStatement pstmt = conn.prepareStatement(sql);//
					
					pstmt.setString(1, order_name);//传递id去查询
					ResultSet rs = pstmt.executeQuery();
					
					while (rs.next())
					{
						DetailedOrderBean orderitem = new DetailedOrderBean();
						String bookname = rs.getString("bookname");
						double boughtcost = rs.getDouble("bought_cost");
						int boughtnum = rs.getInt("bought_num");
						
						orderitem.setBookname(bookname);
						orderitem.setBoughtcost(boughtcost);
						orderitem.setBoughtnum(boughtnum);
												
						detailedOrder.add(orderitem);
					}
					
					session.setAttribute("detailedOrder", detailedOrder);
				}
				catch(SQLException e){
					e.printStackTrace();//
				}
				finally{
					util.closeConnection(conn);
				}
			%>
				
			<div>
				<h4>详细订单记录:</h4>
				<table class="table">
				  <thead class="thead-inverse">
				    <tr>
				      <th>#</th>
				      <th>书名</th>
				      <th>购买数量</th>
				      <th>购买金额</th>
				    </tr>
				  </thead>
				  <tbody>
				  	<c:set var="i" value="${1 }" scope="session"/>
					<c:forEach var="item" items="${sessionScope.detailedOrder }">
							<tr>
						      <th scope="row">
						      	<c:out value="${i }"/>
						      </th>
						      <td>${item.getBookname()}</td>
						      <td>${item.getBoughtnum()}</td>
						      <td>${item.getBoughtcost()}元</td>
						    </tr>
						    <c:set var="i" value="${i+1 }"/>
					</c:forEach>
					</tbody>
				</table>
				
			</div>
			<hr>
			<div>
				<h4>浏览记录:</h4>
				<c:forEach var="lookforward" items="${sessionScope.record }">
					<a href="myCurentBook.jsp?curbook=${book.getBookid() }">
						<h6 class="text-success">${lookforward.getBookname() }</h6>
					</a>
					
					<br>
				</c:forEach>
			</div>
			</main>
		</div>
	</div>

</body>
</html>

