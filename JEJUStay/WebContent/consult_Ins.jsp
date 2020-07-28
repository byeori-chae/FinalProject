<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ page import="dao.ConsultDAO"%>
<%@ page import="dto.ConsultDTO"%>
<html>
<head>
<title>상담내용</title>
</head>
<body>
	<%
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		ConsultDAO dao = new ConsultDAO();
		ConsultDTO dto = new ConsultDTO();
		
	%>
	<%
		dto.setCstName(request.getParameter("cst_name"));
		dto.setCstContent(request.getParameter("cst_content"));
		dto.setRsvIdx(Integer.parseInt(request.getParameter("rsv_idx")));
		
		int result = dao.insert(dto);
	
		response.sendRedirect("http://localhost:9090/JEJUStay/adminDetails.jsp?rsv_idx="+dto.getRsvIdx()); 
	%>
</body>
</html>