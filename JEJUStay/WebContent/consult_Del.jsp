<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@page import="dao.ConsultDAO, dto.ConsultDTO"%>
<%@page import="dao.ReserveDAO, dto.ReserveDTO"%>
<%@page import="java.util.*"%>

<html>
<head>
<title>삭제</title>
</head>
<body>
	<%
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		ConsultDAO dao = new ConsultDAO();
		ConsultDTO dto = new ConsultDTO();
			
		dto.setCstNo(Integer.parseInt(request.getParameter("cst_no")));

		dao.delete(dto);
			
	%>
	<%
			
		
	%>
	
</body>
</html>