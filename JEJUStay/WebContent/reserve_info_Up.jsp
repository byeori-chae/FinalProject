 <%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ page import="dao.ReserveDAO"%>
<%@ page import="dto.ReserveDTO"%>
<%@ page import="java.sql.*"%>

<html>
<head>
<title>예약</title>
</head>
<body>
	<%
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		ReserveDAO dao = new ReserveDAO();
		ReserveDTO dto = new ReserveDTO();	
	%>
	<%	
		dto.setRsvDate(Date.valueOf(request.getParameter("rsv_date")));
		dto.setStayCheckin(Date.valueOf(request.getParameter("stay_checkin")));
		dto.setStayCheckout(Date.valueOf(request.getParameter("stay_checkout")));
				
		dto.setStayAdult(Integer.parseInt(request.getParameter("stay_adult")));
		dto.setStayChild(Integer.parseInt(request.getParameter("stay_child")));
		
		dto.setStayPrice(Integer.parseInt(request.getParameter("stay_price")));
		dto.setRsvAddprice(Integer.parseInt(request.getParameter("rsv_addPrice")));
		dto.setRsvAddreason(request.getParameter("rsv_addReason"));
		dto.setRsvTotalprice(Integer.parseInt(request.getParameter("rsv_totalPrice")));
		dto.setRsvIdx(Integer.parseInt(request.getParameter("rsv_idx")));
		
		int result = dao.info_update(dto);
	
		response.sendRedirect("adminDetails.jsp?rsv_idx="+dto.getRsvIdx()); 
	%>
</body>
</html>