<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ page import="dao.ReserveDAO"%>
<%@ page import="dto.ReserveDTO"%>
<html>
<head>
<title>취소</title>
</head>
<body>
	<%
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		ReserveDAO dao = new ReserveDAO();
		ReserveDTO dto = new ReserveDTO();
		
	%>
	<%
		dto.setRsvCondition(request.getParameter("rsv_condition"));
		dto.setRsvIdx(Integer.parseInt(request.getParameter("rsv_idx")));
		
		int result = dao.condition_up(dto);
	
		response.sendRedirect("http://localhost:9090/JEJUStay/adminDetails.jsp?rsv_idx="+dto.getRsvIdx()); 
	%>
</body>
</html>