<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="dto.StayDTO"%>
<%@ page import="dao.StayDAO"%>
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
</style>
<script type="text/javascript">
 function showPopup() {
	  window.open("reserveOk.html", "예약접수완료", "width=800, height=445, left=400, top=200");
}
</script>
<%
	String cartId = session.getId();
%>
</head>
<title>상품 바구니</title>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<div class="container">
		<h4 class="display-4">
			<b>상품 바구니</b>
		</h4>
		<span class="tab">&#9;<a href="#" class="btn btn-danger btn-sm"
			style="margin-left: 80%;">전체 삭제</a></span>
	</div>
	<div class="container" style="padding-top: 50px">
		<table class="table table-hover">
			<tr>
				<th style="text-align: center;">구분</th>
				<th style="text-align: center;">상품정보</th>
				<th style="text-align: center;">상품가</th>
				<th style="text-align: center;">주문 관리</th>
			</tr>
			<%
				int sum = 0;
				ArrayList<StayDTO> cartList = (ArrayList<StayDTO>) session.getAttribute("cartlist");
				if(cartList == null)
					cartList = new ArrayList<StayDTO>();
				
				for(int i = 0; i < cartList.size(); i++) {
					StayDTO staydto = cartList.get(i);
					int total = staydto.getStayPrice() * staydto.getQuantity();
					sum = sum + total;
			%>
			<tr>
				<td><%=staydto.getStayType()%></td>
				<td><span class="badge badge-secondary">상품코드<%=staydto.getStayCode()%></span><p>
					<%=staydto.getStayName()%></td>
				<td><%=total %></td>
				<td><a href="#" class="btn btn-secondary btn-sm">삭제</a></td>
			</tr>
		</table>
		<br>
			<%
				}
			%>
		<table class="table" style="width: 400px; margin-right: 10px">
			<tr>
				<th>총 결제 예정금액</th>
				<td><%=sum%></td>
			</tr>
		</table>
		<br> <a href="#" type="button" class="btn btn-light"
			style="margin-left: 430px;"> 상품 더 둘러보기</a><span class="tab">&#9;</span>
		<a href="#" type="button" class="btn btn-secondary"
			onclick="showPopup();"> 예약 접수하기</a>
		<hr>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>