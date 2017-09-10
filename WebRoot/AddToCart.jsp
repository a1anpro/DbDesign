<%@ page language="java" import="java.util.*, com.util.*, java.sql.*, com.bean.BookBean"
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

<title>Dashboard Template for Bootstrap</title>

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
					int bookid = new Integer(request.getParameter("bookid")).intValue();//得到 用get方法提交过来的书的id
					int buyNumber = new Integer(request.getParameter("buyNumber")).intValue();//得到购买的数量
					double price = new Double(request.getParameter("price")).doubleValue();//得到单价
					String custid = request.getParameter("custid");
					
					//现在去数据库里操作。存在临时的表里
					double total = price * buyNumber;//price*buyNumber
					
					DBUtil util = new DBUtil();
					Connection conn = util.getConnection();
					
					//先做一个查询操作，如果找到本次插入的，则修改添加数量和金额。如果没找到则插入新数据
					String checkSql = "select bookid from tempcarttab where bookid=" + bookid + " and custid=" + custid;//在这里查询 本次传来的书的id，看表里是否有
					
					try {
						
						Statement stmt = conn.createStatement();
						//创建了statement，先做查询。判断后 1：插入；2：修改
						ResultSet rs = stmt.executeQuery(checkSql);
						
						if (rs.next())
						{
							//已经插入过这本书了。现在修改它
							String modifySql = "update tempcarttab set number=number+" + buyNumber + ",total=total+" + total;
							out.println(modifySql);//输出看一下。
							stmt.executeUpdate(modifySql);//
						}
						else
						{
							String insertSql = "insert into tempcarttab values(";
							insertSql += custid + "," + bookid + "," + buyNumber + "," + price + "," + total + ")";//单价和总价都在
						
							stmt.executeUpdate(insertSql);
						}
						rs.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}	
					finally{
						util.closeConnection(conn);
					}
				 %>
				 <!-- 后期加样式 -->
				 添加购物车成功
			</main>
			
	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="https://code.jquery.com/jquery-3.1.1.slim.min.js"
		integrity="sha384-A7FZj7v+d/sdmMqp/nOQwliLvUsJfDHW+k9Omg/a/EheAdgtzNs3hpfag6Ed950n"
		crossorigin="anonymous"></script>
	<script>
		window.jQuery
				|| document
						.write('<script src="docs/assets/js/vendor/jquery.min.js"><\/script>')
	</script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js"
		integrity="sha384-DztdAPBWPRXSA/3eYEEUWrWCy7G5KFbe8fFjk5JAIxUYHKkDx6Qin1DkWx51bBrb"
		crossorigin="anonymous"></script>
	<script src="docs/dist/js/bootstrap.min.js"></script>
	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	<script src="docs/assets/js/ie10-viewport-bug-workaround.js"></script>
</body>
</html>

