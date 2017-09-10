<%@ page language="java"
	import="java.util.*, com.util.*, java.sql.*, com.bean.*"
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

<title>购物车页面</title>

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
			<%!
				double totalPrice = 0;
			%>

			<%
				DBUtil util = new DBUtil();
				Connection conn = util.getConnection();

				CustomerBean cust = (CustomerBean) session.getAttribute("cust");
				totalPrice = 0;
				
				String sql = "select picture,bookname,author,number,booktab.price,total from booktab,tempcarttab where booktab.bookid=tempcarttab.bookid and tempcarttab.custid=?";
				try {
					PreparedStatement pstmt = conn.prepareStatement(sql);
					pstmt.setInt(1, cust.getId());
					ResultSet rs = pstmt.executeQuery();
					
					//Statement stmt = conn.createStatement();
					//ResultSet rs = stmt.executeQuery(sql);//执行查询
					List list = new ArrayList();//存bean对象的

					while (rs.next()) {
						CartListBean clb = new CartListBean();

						clb.setPicture(rs.getString("picture"));
						clb.setBookname(rs.getString("bookname"));
						clb.setAuthor(rs.getString("author"));
						clb.setNumber(rs.getInt("number"));
						clb.setPrice(rs.getDouble("booktab.price"));
						clb.setTotal(rs.getDouble("total"));

						totalPrice += rs.getDouble("total");//统计所有书的总价

						list.add(clb);//
					}
					rs.close();
					session.setAttribute("cartlist", list);//将购物车的列表 放入session
					session.setAttribute("totalPrice", totalPrice);//把所有书的总价放入session，在js中获取 与 用户的余额比较。
					//getTotalPrice = true;
					
				} catch (SQLException e) {
					e.printStackTrace();
				} finally {
					util.closeConnection(conn);
				}
			%>

			<main class="col-sm-9 offset-sm-3 col-md-10 offset-md-2 pt-3">
			<h1><img src="img/cart.png" width="80px" height="70px">&nbsp您的购物车：</h1>
			<!-- 把list循环显示 -->

			<form action="SubmitOrderServlet" method="post">
				<c:forEach var="list" items="${cartlist }">
					<div class="row " style="border:solid 0px black;">
						<!-- 4个大小放书的图片 -->
						<div class="col-md-2" border="1">
							<center>
								<img src="${list.getPicture() }" alt="this is a book"
									class="img-thumbnail" width="250" height="320">
							</center>
						</div>

						<!-- 8个：上面放书名、简介、价格；下面放购买按钮 -->
						<table class="">
							<tr>
								<td style="padding: 20px" class="align-middle">
									<h5 class="text-danger">${list.getBookname() }</h5>
									<p>作者:${list.getAuthor() }</p>
									<p class="text-success">单价:${list.getPrice() }</p>
									<p class="text-success">数量:${list.getNumber() }</p>
									<p class="text-success">总价:${list.getTotal() }</p></td>
							</tr>

							<tr>
								<td style="padding: 5px">
									<!-- 加个删除功能 --></td>
							</tr>
						</table>
						<!-- 点击购买，form提交到servlet，然后进行后台处理 -->
					</div>
					<hr>
				</c:forEach>

				<c:set var="price" value="<%=totalPrice %>"></c:set><!-- 设置一个临时变量使用el表达式 -->
				<!--<c:out value="${cust.getAccount() }"></c:out>-->
				<c:choose>
					<c:when test="${price == 0}">
						<h3><center><img src="img/cart1.png" width="50" height="50">您的购物车还是空的，赶紧行动吧！您可以：</center></h3>
						<h4 style="text-align:center">看看:<a href="index.jsp">主页</a></h4>
					</c:when>
					<c:otherwise>
						<table>
							<tr>
								<td width="70%">
									<center>
										<p style="font-size:20px; padding-top:15px;">
											总价:
											<%out.print(totalPrice);%>元
										</p>
									</center></td>
								<td width="30%">
									<button type="submit" class="btn btn-success"
										style="align-item:right;" onclick="check()">购买</button></td>
							</tr>
						</table>
					</c:otherwise>
				</c:choose>
			</form>
			</main>

			<!-- Bootstrap core JavaScript
    ================================================== -->
			<!-- Placed at the end of the document so the pages load faster -->

			<script>
				function check() {
					//查询余额是否够
					if (('${cust.getAccount()}') < ('${price}')) {
						alert("余额不足，请充值后购买");
					}
				}
			</script>
</body>
</html>

