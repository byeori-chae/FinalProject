<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<title>Login</title>
</head>
<body>
	<jsp:include page="menu.jsp" />	
	<div class="container" align="center">
		<div class="col-md-4 col-md-offset-4">
		<br><br><br><br>
			<h3 class="form-signin-heading" align="center">회원 로그인</h3>
			<br>
			<%
				String error = request.getParameter("error");
				if (error != null) {
					out.println("<div class='alert alert-danger'>");
					out.println("아이디와 비밀번호를 확인해 주세요");
					out.println("</div>");
				}
			%>
			<form class="form-signin" action="http://localhost:9090/JEJUStay/member/processLoginMember.jsp" method="post">
				<div class="form-group">
					<label for="inputUserName" class="sr-only">ID</label>
					<input type="text" class="form-control" placeholder="ID" name='id' required autofocus>
				</div>
				<div class="form-group">
					<label for="inputPassword" class="sr-only"> 비밀번호 :</label> 
					<input type="password" class="form-control" placeholder="Password" name='password' required>
				</div>
				<button class="btn btn btn-lg btn-info btn-light" type="submit">로그인</button>
			</form>
		</div>
	</div>
<hr>
<jsp:include page="footer.jsp" />   
</body>
</html>