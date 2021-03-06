<html>
<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String sessionId = (String) session.getAttribute("sessionId");
%>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
	<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<title>Welcome | 제주의밤</title>

<style type="text/css">
body {
    background: #ffffff;
    font-family: sans-serif;
}

div#menubar {
    background: #e3d8e8;
    padding-bottom: 10px;
    color: #380f4c;
}

#menubar ul { /* 여백과 패딩 모두 0 */
	margin : 0;
	padding : 0;
  /* 모든 아이템(<li>)을 한 줄에 품을 수 있는 폭 */
}
#menubar ul li {
	display : inline;	 /* 새 줄로 넘어가지 않게 */
	list-style-type : none; 	/* 마커 삭제 */
	padding : 0px 0px 20px 20px;	 /* top=bottom=0, left=right */ 	
}
#menubar ul li a {
	display : inline-block;
	color : #380f4c;
	text-decoration : none; /* 링크 보이지 않게 */
	font-weight: bold;
	font-size: 15px;
}
#menubar ul li a:hover {
	color : #9e40cd;  /* 마우스 올라 갈 때 색 */
}
#menubar2 ul { /* 여백과 패딩 모두 0 */
	margin : 0;
	padding : 0;
	width : 700px;  /* 모든 아이템(<li>)을 한 줄에 품을 수 있는 폭 */
}
#menubar2 ul li {
	display : inline;	 /* 새 줄로 넘어가지 않게 */
	list-style-type : none; 	/* 마커 삭제 */
	padding : 0px 0px 20px 20px;	 /* top=bottom=0, left=right=15px */ 	
}
#menubar2 ul li a {
	display : inline-block;
	color : #328cd6;
	text-decoration : none;
	font-weight: bold;
	font-size: 18px;
	
}
#menubar2 ul li a:hover {
	color : #113e63; 
}

div#scrollable {
    overflow-y: scroll;
    height: 100%;
}

</style>

</head>
<body>
		<div id="menubar" align="right" >
		  <c:choose>
			<c:when test="${empty sessionId}">
			  <ul>
				<li class="nav-item"><a class="nav-link" href="<c:url value='http://localhost:9090/JEJUStay/login.jsp'/>"> 로그인 </a></li>
				<li class="nav-item"><a class="nav-link" href="<c:url value='http://localhost:9090/JEJUStay/member/agreement.jsp'/>"> 회원가입 </a></li>
				<li class="nav-item"><a class="nav-link" href="<c:url value='http://localhost:9090/JEJUStay/admin.jsp'/>"> 관리자페이지 </a></li>
			  </ul>
			</c:when>
			<c:otherwise>
			  <ul>
				<li style="padding-top: 7px"><a style="color: #8041D9">[ <%=sessionId%>님 ]</a></li>
				<li class="nav-item"><a class="nav-link" href="<c:url value='http://localhost:9090/JEJUStay/member/logoutMember.jsp'/>"> 로그아웃 </a></li>
				<li class="nav-item"><a class="nav-link" href="<c:url value='http://localhost:9090/JEJUStay/reserveHistory.jsp'/>"> 마이페이지</a></li>
			  </ul>
			</c:otherwise>
		  </c:choose>
		</div>
		<a href="http://localhost:9090/JEJUStay/welcome.jsp"><img src="./media/jeju.png" width="200" height="100" alt=""></a>
			<div id="menubar2" align="center" >
			  <ul>
				<li class="nav-item"><a class="nav-link" href="http://localhost:9090/JEJUStay/tourList.jsp" > 추천여행지 </a></li>
				<li class="nav-item"><a class="nav-link" href="http://localhost:9090/JEJUStay/stayAll.jsp" > 숙소 예약</a></li>
				<li class="nav-item"><a class="nav-link" href="http://localhost:9090/JEJUStay/cart.jsp" > 상품 바구니  </a></li>
				<li class="nav-item"><a class="nav-link" href="http://localhost:9090/JEJUStay/BoardListAction.do?pageNum=1" > 고객센터 </a></li>
			  </ul>
			</div>
		<hr>
</body>
</html>