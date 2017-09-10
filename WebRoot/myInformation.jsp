<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="myHeader.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="../../favicon.ico">

<title>个人信息</title>

<!-- Bootstrap core CSS -->
<link href="docs/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="docs/examples/dashboard/dashboard.css" rel="stylesheet">
</head>
<body>
	<c:set var="cust" value="${cust }" scope="session"></c:set>
	
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

			<div class="container">
				<div class="card w-75">
					<div class="row">
						<div class="col-md-4 ">
							<!-- 放头像 -->
							<center>
								<img src="${cust.getPicture() }" width="200" height="180">
							</center>
						</div>
						<div style="text-align:center" class="col-md-8">
							<table class="table table-hover">
								<!--3行两列 -->
								<tr class="success">
									<td style="color:#A52A2A" class="warning">用户名:</td>
									<td><c:choose>
											<c:when test="${cust!=null }">
												<c:out value="${cust.getUsername() }"></c:out>
											</c:when>
											<c:otherwise>未登陆</c:otherwise>
										</c:choose></td>
								</tr>
								<tr>
									<td style="color:#A52A2A">地 址:</td>
									<td><c:choose>
											<c:when test="${cust!=null }">
												<c:out value="${cust.getAddress() }"></c:out>
											</c:when>
											<c:otherwise>未登陆</c:otherwise>
										</c:choose></td>
								</tr>
								<tr>
									<td style="color:#A52A2A">帐户余额:</td>
									<td><c:choose>
											<c:when test="${cust!=null }">
												<c:out value="${cust.getAccount() }"></c:out>
											</c:when>
											<c:otherwise>未登陆</c:otherwise>
										</c:choose></td>
								</tr>
								<tr>
									<td></td>
									<td>
										<!-- 点击弹出模态框，在里面添加 -->
										<button type="button" class="btn btn-success">充值</button>
									</td>
								</tr>
							</table>
						</div>
					</div>
				</div>
			</div>
			</main>
		</div>
	</div>
</body>
</html>