<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@page contentType="text/html; charset=UTF-8"%>
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
<meta charset="UTF-8">
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
<title>예약 확인 | 제주의밤</title>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<%@include file="dbconn.jsp" %>
	<%
//		request.setCharacterEncoding("utf-8");
//		int sum = (Integer)request.getAttribute("sum");
//		int cnt = (Integer)request.getAttribute("cnt");
//		int total = (Integer)request.getAttribute("total");
	%>
	<div class="container">
		<h4 class="display-4">
			<b>예약접수 완료</b>
		</h4>

	</div>
	<div class="container" style="padding-top: 50px">
		<table class="table table-hover">
			<tr>				
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
				StayDTO staydto = new StayDTO();
				StayDTO memberdto = new StayDTO();
				StayDTO reservedto = new StayDTO();
				
				
				ArrayList<StayDTO> memberList = dao.getMemeberList(sessionId);
				for(int i=0; i<memberList.size(); i++){
					memberdto = memberList.get(i);					
				}				
				String condition = "접수완료";					
				ArrayList<StayDTO> reserveList = dao.getAllTemp();	
				if(reserveList.size()>0 && reserveList!=null ){
				  for (int i = 0; i < reserveList.size(); i++) {
					staydto = reserveList.get(i);									
					PreparedStatement pstmt = null;					
			 	 	try {					
			 	 		String sql = "INSERT INTO tbl_reserve(rsv_idx, rsv_date, rsv_checkin, rsv_checkout, rsv_code," 
								+" rsv_totalPrice, rsv_adult, rsv_child, rsv_memidx, rsv_condition)" 
								+"VALUES((select concat(date_format(now(),'%Y%m%d'), cast(cast(rand()*100 as unsigned) as char))),?,?,?,?,?,?,?,?,?)";
						pstmt = conn.prepareStatement(sql);
						pstmt.setDate(1, staydto.getTempDate());
						pstmt.setDate(2, staydto.getTempCheckin());
						pstmt.setDate(3, staydto.getTempCheckout());
						pstmt.setString(4, staydto.getStayCode());
						pstmt.setInt(5, staydto.getTempTotal());
						pstmt.setInt(6, staydto.getTempAdult());
						pstmt.setInt(7, staydto.getTempChild());						
						pstmt.setInt(8, memberdto.getMemIdx());
   					    pstmt.setString(9, condition);
						pstmt.executeUpdate();
					} catch (SQLException e) {
						e.printStackTrace();  
					} finally {
						if(pstmt != null){ pstmt.close(); }
						if(conn != null){ conn.close(); }
					}
					sum = sum + staydto.getTempTotal();
				  }
				}
			dao.deleteAllCart();	
			ArrayList<StayDTO> reserveConfirm = dao.reserveConfirm(sessionId);
			for (int i = 0; i < reserveConfirm.size(); i++) {
				reservedto = reserveConfirm.get(i);				
			%>
			<tr>
				<td style="text-align:left"><%=reservedto.getStayName()%></td>
				<td style="text-align:left"><%=reservedto.getStayRoomType()%></td>
				<td><%=reservedto.getRsvCheckin()%></td>
				<td><%=reservedto.getRsvCheckout()%></td>
				<td>성인 <%=reservedto.getRsvAdult()%>, 소아 <%=reservedto.getRsvChild()%></td>
				<td><%=reservedto.getRsvTotalprice()%></td>
				<td><%=condition%></td>
			</tr>
			<% 
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
	</div>
</body>
</html>