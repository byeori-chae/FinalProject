<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dto.StayDTO"%>
<%@page import="dao.StayDAO"%>
<%@page import="java.sql.*"%>

<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style type="text/css">
table {
	margin-left: auto;
	margin-right: auto;
	font-family: "맑은 고딕";
}

td {
	text-align: center;
}

.tab {
	white-space: pre;
}
table tr th{
	text-align: center;
}
</style>

<title>상품바구니 | 제주의밤</title>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<%@include file="dbconn.jsp" %>
	<% 
		String cartId = session.getId();
		StayDTO sdto = new StayDTO();
		
	 %>
	<div class="container">
		<h1 class="display-4" style="font-size: 35px; color:#6799FF; margin:0px 0px;">
			<b>상품 바구니</b>
		</h1>
		<span class="tab">&#9;<a href="./deleteCart.jsp?cartId=<%=cartId%>" class="btn btn-danger btn-sm"
			style="margin-left: 80%;">전체 삭제</a></span>
	</div>
	<div class="container" style="padding-top: 50px">
		<table class="table table-hover">
			<tr>				
				<th>상품이름</th>
				<th>객실유형</th>
				<th>체크인날짜</th>
				<th>체크아웃날짜</th>
				<th>인원</th>
				<th>상품가</th>
				<th>합계</th>
				<th>주문 관리</th>
			</tr>
			<%
				int sum = 0;
				int cnt = 0;
				int total = 0;
				int dateCnt = 0;
				StayDTO staydto = new StayDTO();
				StayDAO dao = new StayDAO();
				
				ArrayList<StayDTO> listOfStays = dao.getCart();
				if(listOfStays == null)
					listOfStays = new ArrayList<StayDTO>();								
				for(int i = 0; i < listOfStays.size(); i++) {					
					staydto = listOfStays.get(i);
					total = (int) staydto.getStayPrice() * staydto.getTempDays(); 
					//합계금액이 마이너스면 0원으로 출력
					if(total < 0){
						total = 0;
					}
					sum = sum + total;
					dao.updateCart(total,staydto.getStayCode());
					
			%>
			
			<tr>
				<td style="text-align:left"><%=staydto.getStayName()%></td>
				<td style="text-align:left"><%=staydto.getStayRoomType()%></td>
				<td><%=staydto.getTempCheckin()%></td>
				<td><%=staydto.getTempCheckout()%></td>
				<td>성인 <%=staydto.getTempAdult()%>, 소아 <%=staydto.getTempChild()%></td>
				<td><%=staydto.getStayPrice()%></td>
				<td><%=total %></td>
				<td><a href="http://localhost:9090/JEJUStay/removeCart.jsp?code=<%=staydto.getStayCode()%>" class="btn btn-secondary btn-sm">삭제</a></td>
			</tr>
			<%
				//체크인보다 체크아웃날짜가 작으면 dateCnt에 1더하기
				int compare = staydto.getTempCheckin().compareTo(staydto.getTempCheckout());
				if(compare > 0){
					dateCnt += 1;
				}
				}
			%>
		</table>
		<br>
			
		<table class="table" style="width: 400px; margin-right: 10px">
			<tr>
				<th>총 결제 예정금액</th>
				<td><%=sum%></td>
			</tr>
		</table>
		<br> <form name="reserve" class="form-horizontal" action="http://localhost:9090/JEJUStay/reserveConfirm.jsp?code=<%=staydto.getStayCode()%>" 
				method="post" onSubmit="return showPopup()">
		<a href="http://localhost:9090/JEJUStay/stayAll.jsp" type="button" class="btn btn-light"
				style="margin-left: 430px;"> 상품 더 둘러보기</a><span class="tab">&#9;</span>	
		<input type="button" class="btn btn-secondary" onClick="showPopup()" value="예약 접수하기">
		</form>
	</div>
	<hr>
	<jsp:include page="footer.jsp" />
</body>
</html>

<script type="text/javascript">
	 function showPopup() {	
		 if(${sessionId==null}){
			  alert("로그인 후 이용해주세요.");
			  location.href = "http://localhost:9090/JEJUStay/login.jsp";
			  return false;
		  }
		 if(${dateCnt>0}){
			 alert("체크아웃 날짜를 확인해주세요.");
			 return false;
		 }
		 window.open("reserveOk.html", "예약접수완료", "width=800, height=450, left=400, top=200");			
		 document.reserve.submit(); 
	}
</script>