<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>관리자 페이지 메뉴</title>
</head>
<style type="text/css">
#sidebar {
	width: 150px;
	height: 1500px;
	background-color: #e3d8e8;
	float: left;
	font-weight: bold;
	font-size: 1.2em;
	font-weight: bold;
	text-decoration: none;
}

#sidebar ul li {
	list-style-type: none; /* 마커 삭제 */
	text-align: right;
}
</style>
<body>
	<div id="sidebar">
		<ul class="nav nav-pills nav-stacked">
			<li><a href="http://localhost:9090/JEJUStay/welcome.jsp">제주의 밤 <br>홈페이지</a></li>
			<li><a href="http://localhost:9090/JEJUStay/admin.jsp">예약관리</a></li>
			<li><a href="http://localhost:9090/JEJUStay/addStay.jsp">상품등록</a></li>
			<li><a href="http://localhost:9090/JEJUStay/editStay.jsp?edit=update">상품수정</a></li>
			<li><a href="http://localhost:9090/JEJUStay/editStay.jsp?edit=delete">상품삭제</a></li>
		</ul>
	</div>
</body>
</html>