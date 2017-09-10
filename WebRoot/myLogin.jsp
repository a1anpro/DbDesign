<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">

    <title>登陆页面</title>

    <!-- Bootstrap core CSS -->
    <link href="docs/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="docs/examples/signin/signin.css" rel="stylesheet">
  </head>

  <body background="img/blur.jpg" width="100%" height="100%">
	
	<%
		
	
		String err = request.getParameter("error");
		if (err!=null)
		{
			out.print("<script>alert(\"用户名和密码不匹配,请重新登陆\")</script>");
		}
	 %>
	
    <div class="container">

      <form class="form-signin" action="LoginServlet" method="post">
        <h2 class="form-signin-heading" style="color: white;" >Please sign in</h2>
        <label for="inputUsername" class="sr-only">用户名</label>
        <input type="text" name="username" id="inputUsername" class="form-control" placeholder="Username" required autofocus>
        <label for="inputPassword" class="sr-only">密码</label>
        <input type="password" name="password" id="inputPassword" class="form-control" placeholder="Password" required>
        <div class="checkbox">
          <label style="color:white;">
            <input type="checkbox" value="remember-me" > Remember me
          </label>
          &nbsp&nbsp&nbsp
          <a href="myRegister.jsp">没有帐号？注册</a>
        </div>
        <button class="btn btn-lg btn-primary btn-block" type="submit">Login</button>
      </form>

    </div> <!-- /container -->


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="docs/assets/js/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>
