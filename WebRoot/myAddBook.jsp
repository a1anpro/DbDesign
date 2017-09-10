<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
			<form style="text-align: center;" action="AddBookServlet"
				method="post">
				<p>书名：</p>
				<input type="text" name="bookname" required>
				
				<p>描述：</p>
				<input type="text" name="description" maxlength="200" required>
				
				<p>作者：</p>
				<input type="text" name="author" required>

				<p>价格：</p>
				<input type="text" name="price" required>

				<p>isbn：</p>
				<input type="text" name="isbn" required>

				<p>数量：</p>
				<input type="text" name="quantity" required>
				<hr>
				<p>类型：</p>
				<input type="checkbox" name="type" value="textbook">教材 
				<input type="checkbox" name="type" value="foreign">外语 
				<input type="checkbox" name="type" value="exam">考试
				<input type="checkbox" name="type" value="reference">工具书
				<input type="checkbox" name="type" value="literature">文学
				<input type="checkbox" name="type" value="photo">摄影 
				<input type="checkbox" name="type" value="art">艺术 
				<input type="checkbox" name="type" value="food">美食 
				<input type="checkbox" name="type" value="travel">旅游 
				<input type="checkbox" name="type" value="sport">运动
				<input type="checkbox" name="type" value="biography">自传
				
				<p>封面图：</p>
				<input type="file" name="picture" required>
				
				<button type="submit">提交</button>
			</form>

	<!-- 用一个简单的表单来添加书籍，之后再来修改样式 -->

	<!-- jQuery first, then Tether, then Bootstrap JS. -->
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
<!-- 多选按钮 -->
<!-- 
      <select name="types">
        <option value="textbook">教材</option>
        <option value="foreign">外语</option>
        <option value="exam">考试</option>
        <option value="reference">工具书</option>
        <option value="literature">文学</option>
        <option value="biography">传记</option>
        <option value="photo">摄影</option>
        <option value="art">艺术</option>
        <option value="food">美食</option>
        <option value="travel">旅游</option>
        <option value="sport">运动</option>
      </select>-->