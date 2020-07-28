<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ page import="dao.ReserveDAO"%>
<%@ page import="dto.ReserveDTO"%>
<%@page import="java.sql.Date"%>
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
		
		dto.setStayCheckin(Date.valueOf(request.getParameter("stay_checkin")));
		dto.setMemName(request.getParameter("mem_name"));
		dto.setMemPhone(request.getParameter("mem_phone"));
		dto.setMemEmail(request.getParameter("mem_email"));
		dto.setRsvIdx(Integer.parseInt(request.getParameter("rsv_idx")));
		
		int result = dao.booker_update(dto);
	
		response.sendRedirect("adminDetails.jsp?rsv_idx="+ dto.getRsvIdx()); 
	%>
</body>
</html>