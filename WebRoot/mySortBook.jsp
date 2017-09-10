<%@ page language="java" import="java.util.*, com.util.*, java.sql.*, com.bean.BookBean" pageEncoding="utf-8"%>
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

<title>主页后的第一界面</title>

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
			<%
				String type=request.getParameter("type");//获得点击的书籍类型,通过类型去查找符合条件的书
				DBUtil util = new DBUtil();
				Connection conn = util.getConnection();
				
				String sql = "select bookid,bookname,description,author,price,isbn,quantity,picture from booktab,sorttab,typetab where typetab.typename=? and typetab.typeid=sorttab.type_id and booktab.bookid=sorttab.book_id";
				
				try {
					PreparedStatement pstmt = conn.prepareStatement(sql);
					pstmt.setString(1,type);//设置查询的类型。
					ResultSet rs = pstmt.executeQuery();
					List list = new ArrayList();
					while (rs.next())
					{
						BookBean book = new BookBean();

						book.setBookid(rs.getInt("bookid"));
						book.setBookname(rs.getString("bookname"));
						book.setDescription(rs.getString("description"));//设置书的描述
						book.setAuthor(rs.getString("author"));
						book.setPrice(rs.getDouble("price"));
						book.setIsbn(rs.getString("isbn"));
						book.setQuantity(rs.getInt("quantity"));
						book.setPicture(rs.getString("picture"));
						
						list.add(book);//放入列表
					}
					
					session.setAttribute("typeList", list);
				} catch (SQLException e) {
					e.printStackTrace();
				} finally {
					util.closeConnection(conn);
				}
			 %>
			<h1></h1>
				<c:forEach var="book" items="${sessionScope.typeList }">
				<div class="row " style="border:solid 0px black;">
					<!-- 4个大小放书的图片 -->
					<div class="col-md-2" border="1">
						<center>
							<a href="myCurentBook.jsp?curbook=${book.getBookid() }">
								<img src="${book.getPicture() }" alt="this is a book"
								class="img-thumbnail" width="125px" height="125px">
							</a>
						</center>
					</div>

					<!-- 8个：上面放书名、简介、价格；下面放购买按钮 -->
					<form name="buy">
						<table class="">
							<tr>
								<td style="padding: 20px" class="align-middle">
									<a href="myCurentBook.jsp?curbook=${book.getBookid() }">
										<h5 class="text-danger">${book.getBookname() }</h5>
									</a>
									<p>作者:${book.getAuthor() }</p>
									<h4 style="color:#FF7F00">¥ ${book.getPrice() }</h4></td>
							</tr>
							
							<!-- 
							<tr>
								<td style="padding: 5px">
									<button type="button" class="btn btn-success">加入购物车</button>
								</td>
							</tr>
							 -->
						</table>
					</form>
					<!-- 点击购买，form提交到servlet，然后进行后台处理 -->
				</div>
				<hr>
				</c:forEach> 
			
			</main>
		</div>
	</div>
		

</body>
</html>
