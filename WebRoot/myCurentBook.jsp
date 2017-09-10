	<%@ page language="java"
	import="java.util.*, com.util.*, java.sql.*, com.bean.BookBean"
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

			<h1>Dashboard</h1>
			<!-- 在这里使用JSTL的标签，把list全部读出来 --> <!-- ############################# -->
			<%
				String bookid = request.getParameter("curbook");//得到点击的是哪一本书，去数据库里查找
				DBUtil util = new DBUtil();
				Connection conn = util.getConnection();
				
				String sql = "select bookid,bookname,description,author,price,isbn,quantity,picture from booktab where bookid=";
				sql += bookid;//根据这个id查
				try {
					Statement stmt = conn.createStatement();
					ResultSet rs = stmt.executeQuery(sql);//查询放入结果集
					if (rs.next()) {
						//拿到了
						BookBean book = new BookBean();

						book.setBookid(rs.getInt("bookid"));
						book.setBookname(rs.getString("bookname"));
						book.setDescription(rs.getString("description"));//设置书的描述
						book.setAuthor(rs.getString("author"));
						book.setPrice(rs.getDouble("price"));
						book.setIsbn(rs.getString("isbn"));
						book.setQuantity(rs.getInt("quantity"));
						book.setPicture(rs.getString("picture"));

						session.setAttribute("curbook", book);//在session里设置book，和request不同
						
						if (session.getAttribute("cust")!=null)
						{
							List list = (List)session.getAttribute("record");//登陆之后才有这个记录。取出来存这条浏览记录
							list.add(book);//record里放的是book
							session.setAttribute("record", list);
						}
					}
				} catch (SQLException e) {
					e.printStackTrace();
				} finally {
					util.closeConnection(conn);
				}
			%> 
			<c:set var="book" value="${sessionScope.curbook }"></c:set>
			<div class="row">
				<div class="col-md-4">
					<!-- 显示图片 用bootstrap改成别的样式 -->
					<img src="${book.getPicture() }" alt="this is a book" width="400"
						height="500">
				</div>

				<div class="col-md-8">

					<!-- 显示信息 -->
					<h2>书名:&nbsp&nbsp&nbsp ${book.getBookname() }</h2>
					<br>
					<h4>作者:&nbsp&nbsp&nbsp ${book.getAuthor() }</h4>
					<br>
					<h4>价格:&nbsp&nbsp&nbsp ${book.getPrice() }</h4>
					<br>
					<h4>
						描述:<br> ${book.getDescription() }
						</h5>
						<br>
						<table>
							<tr>
								<span>&nbsp</span>
							</tr>
							<tr>
								<span>&nbsp</span>
							</tr>
							<tr>
								<span>&nbsp</span>
							</tr>
							<tr>
								<td width="50%"></td>
								<td width="50%">
									<form
										action="AddToCart.jsp?bookid=${book.getBookid() }&custid=${sessionScope.cust.getId()}&price=${book.getPrice()}"
										method="post">
										购买数量: <input type="button" value="-" onclick="sub()">
										<input type="text" style="text-align:center" name="buyNumber"
											id="buyNumber" size="5" value="1"> <input
											type="button" value="+" onclick="add()">

										<c:choose>
											<c:when test="${cust!=null }">
												<button type="submit" class="btn btn-success" style="">添加到购物车</button>
											</c:when>
											<c:otherwise>
												<a href="myLogin.jsp"><button type="button"
														class="btn btn-outline-secondary">购买请先登陆</button>
												</a>
											</c:otherwise>
										</c:choose>
								</td>
								</form>
							</tr>
						</table>
				</div>
			</div>

			</main>
		</div>
	</div>

	<script>
		function addToCart() {
			//var num = parseInt(document.getElementById("buyNumber").value);
			//if (num > '${book.getQuantity()}')//用el表达式访问书剩余的数量
			//{
			//库存不够，将num设置为最大数量
			//	num = '${book.getQuantity()}';
			//}
		}

		function sub() {
			var b = document.getElementById("buyNumber").value;
			b = parseInt(b);
			b--;
			if (b < 0)
				b = 0;
			document.getElementById("buyNumber").value = b;
		}
		function add() {
			var b = document.getElementById("buyNumber").value;
			b = parseInt(b);
			b++;
			if (b > '${book.getQuantity()}')//用el表达式访问书剩余的数量
			{
				//库存不够，将num设置为最大数量
				b = '${book.getQuantity()}';
			}
			document.getElementById("buyNumber").value = b;
		}
	</script>

</body>
</html>

