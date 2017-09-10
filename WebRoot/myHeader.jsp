<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.bootcss.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css"
	integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ"
	crossorigin="anonymous">
</head>

<body>


	<nav class="navbar navbar-toggleable-md navbar-light fixed-top"
		style="background-color: #F4F4F4;padding-left: 200px">
	<button class="navbar-toggler navbar-toggler-right hidden-lg-up"
		type="button" data-toggle="collapse"
		data-target="#navbarsExampleDefault"
		aria-controls="navbarsExampleDefault" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<a class="navbar-brand" href="index.jsp"><img src="img/book.png"
		width="30" height="30" alt="this is brand icon"> yanhui's store</a>

	<div style="padding-left: 800px" class="collapse navbar-collapse"
		id="navbarsExampleDefault">
		<ul class="navbar-nav mr-auto ">

		</ul>
		<ul class="navbar-nav mr-auto ">
			<li class="nav-item active">
				<!-- 登陆之后才看得到购物车 --> <c:if test="${sessionScope.cust!=null }">
					<a style="color:#FF7F24;" class="nav-link" href="myShopCar.jsp">
						<img src="img/boughtCar.png" width="25" height="25"
						alt="this is shopping car"> 购物车 </a>
				</c:if> 
			</li> &nbsp &nbsp&nbsp&nbsp&nbsp&nbsp
			<li class="nav-item">
				<!-- 
          	<c:if test="${sessionScope.cust != null }">
          		<a class="nav-link" href="" style="color:#FF7F55;">${sessionScope.cust.getUsername() }</a>
          	</c:if>
            <a class="nav-link" href="myLogin.jsp" style="color:#FF7F24">登录</a>
           --> <!-- 判断是否登陆成功 --> <c:choose>
					<c:when test="${sessionScope.cust != null }">
						<!-- <a class="nav-link" href="#" style="color:#FF7F55;"></a> -->
						<div class="dropdown">
							<button class="btn btn-secondary dropdown-toggle text-warning"
								type="button" id="dropdownMenuButton" data-toggle="dropdown"
								aria-haspopup="true" aria-expanded="false">
								${sessionScope.cust.getUsername() }</button>
							<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
								<a class="dropdown-item" href="myInformation.jsp">个人信息</a> <a
									class="dropdown-item" href="myHistory.jsp">历史订单</a> <a
									class="dropdown-item" href="myLogout.jsp">登&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp出
								</a>
							</div>
						</div>
					</c:when>
					<c:otherwise>
						<a class="nav-link" href="myLogin.jsp" style="color:#FF7F24">登录</a>
					</c:otherwise>
				</c:choose>
			</li>
			<!-- <li class="nav-item">
            <a class="nav-link" href="#">Help</a>
          </li> -->
		</ul>

		<!-- <form class="form-inline mt-2 mt-md-0">
          <input class="form-control mr-sm-2" type="text" placeholder="Search">
          <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
        </form> -->
	</div>
	</nav>

	<!-- 引用 -->
	<script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.slim.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
		crossorigin="anonymous"></script>
	<script src="https://cdn.bootcss.com/tether/1.4.0/js/tether.min.js"
		integrity="sha384-DztdAPBWPRXSA/3eYEEUWrWCy7G5KFbe8fFjk5JAIxUYHKkDx6Qin1DkWx51bBrb"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.bootcss.com/bootstrap/4.0.0-alpha.6/js/bootstrap.min.js"
		integrity="sha384-vBWWzlZJ8ea9aCX4pEW3rVHjgjt7zpkNpZk+02D9phzyeVkE+jo0ieGizqPLForn"
		crossorigin="anonymous"></script>
</body>
</html>