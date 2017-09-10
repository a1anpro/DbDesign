<%@ page language="java"
	import="java.util.*, com.util.*, java.sql.*, com.bean.BookBean, com.bean.CustomerBean"
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
				CustomerBean cust = (CustomerBean)session.getAttribute("cust");
				DBUtil util = new DBUtil();
				Connection conn = util.getConnection();	
				
				List historyOrder = new ArrayList();//存放查找的历史记录
				
				String sql = "select ordername from ordertab where customer_id=?";
				try{
					PreparedStatement pstmt = conn.prepareStatement(sql);//
					
					pstmt.setString(1, String.valueOf(cust.getId()));//传递id去查询
					ResultSet rs = pstmt.executeQuery();
					
					while (rs.next())
					{
						String ordername = rs.getString("ordername");
						historyOrder.add(ordername);
					}
					
					session.setAttribute("historyOrder", historyOrder);
				}
				catch(SQLException e){
					e.printStackTrace();//
				}
				finally{
					util.closeConnection(conn);
				}
			%>
				
			<div>
				<h4>订单记录:</h4>
				<c:forEach var="historyOrder" items="${sessionScope.historyOrder }">
					<a href="myDetailedOrder.jsp?ordername=${historyOrder}">${historyOrder }</a>
					<br>
				</c:forEach>
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

