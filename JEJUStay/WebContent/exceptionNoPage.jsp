<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href=".resources/css/bootstrap.min.css" />
<title>페이지 오류</title>
</head>
<body>
	<jsp:include page="menu.jsp" />
		<div class="container">
			<h2 class="alert alert-danger">요청하신 페이지를 찾을 수가 없습니다.</h2>
		</div>
<hr>
<jsp:include page="../footer.jsp" />
</body>
</html>