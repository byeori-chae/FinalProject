<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dto.StayDTO"%>
<%@page import="dao.StayDAO"%>
<%@page import="java.sql.*"%>
<%
	String sessionId = (String) session.getAttribute("sessionId");
%>   
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<meta charset="UTF-8">
<title>예약내역 | 제주의 밤</title>
<style type="text/css">
body {
	background: #ffffff;
	font-family: "맑은 고딕";
}
div#history_bar {
    background: #6799FF;
    padding-bottom: 10px;
    color: #ffffff;
}

#history_bar ul { /* 여백과 패딩 모두 0 */
	margin : 0;
	padding : 0;
	width : 500px;  /* 모든 아이템(<li>)을 한 줄에 품을 수 있는 폭 */
	height : 30px;
}

#history_bar ul li {
	display : inline;	 /* 새 줄로 넘어가지 않게 */
	list-style-type : none; 	/* 마커 삭제 */
	padding : 0px 0px 20px 20px;	 /* top=bottom=0, left=right=15px */ 	
	
}

#history_bar ul li a {
	display : inline-block;
	color : #ffffff;
	text-decoration : none; /* 링크 보이지 않게 */
	font-weight: bold;
	font-size: 15px;
}
#history_bar ul li a:hover {
	color : #EAEAEA;  /* 마우스 올라 갈 때 색 */
}
</style>
</head>
<body>
	<jsp:include page="mypageMenu.jsp" />
	<div style="margin-left:250px; margin-top:-85px;">
	
<!-- 
	<div class="container"> 
		<div id="history_bar">
			<ul class="title">
				<li class="now"><a href="#">예약내역 </a></li>
				<li><a href="#"> 취소내역 </a></li>
			</ul>
		</div>
	</div>
 -->
 
		<div class="container">
		<h4 class="display-4"><b>예약 내역</b></h4>
			<div style="padding-top: 50px;">
				<table class="table">
					<tr>
						<th>예약일</th>
						<th>상품이름</th>
						<th>객실유형</th>
						<th>체크인날짜</th>
						<th>체크아웃날짜</th>
						<th>인원</th>
						<th>합계</th>
						<th>예약상태</th>
					</tr>
			<%
				int sum=0;
				StayDAO dao = new StayDAO();	
				StayDTO reservedto = new StayDTO();
				ArrayList<StayDTO> reserveConfirm = dao.reserveConfirm(sessionId);	
				for (int i = 0; i < reserveConfirm.size(); i++) {
					reservedto = reserveConfirm.get(i);				
			%>	
			<tr>
				<td><%=reservedto.getRsvDate()%></td>
				<td style="text-align:left"><%=reservedto.getStayName()%></td>
				<td style="text-align:left"><%=reservedto.getStayRoomType()%></td>
				<td><%=reservedto.getRsvCheckin()%></td>
				<td><%=reservedto.getRsvCheckout()%></td>
				<td>성인 <%=reservedto.getRsvAdult()%>, 소아 <%=reservedto.getRsvChild()%></td>
				<td><%=reservedto.getRsvTotalprice()%></td>
				<td><%=reservedto.getRsvCondition()%></td>
			</tr>
			<% 
				}
			%>		
				</table>
			</div>
		</div>
	</div>
	<br><br><br><br><br><br><br><br><br>
	<hr>
	<jsp:include page="footer.jsp"/>
</body>
</html>