<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<script>
		var err = '<%=request.getParameter("error")%>';
		if (err="yes"){
			alert("登陆失败!");
		}
	</script>
	<form name="f1" id="f1" action="LoginServlet" method="post">
		<table border="0">
			<tr>
				<td>用户名:</td>
				<td><input type="text" name="username" id="login"></td>
			</tr>
			<tr>
				<td>密码:</td>
				<td><input type="password" name="password" id="password">
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit"></td>
			</tr>
		</table>
	</form>
</body>
</html>