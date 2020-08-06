<%@page import="java.util.ArrayList"%>
<%@page import="dto.StayDTO"%>
<%@page import="dao.StayDAO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String code = request.getParameter("code");
		if(code == null || code.trim().equals("")){
			response.sendRedirect("http://localhost:9090/JEJUStay/cart.jsp");	
			return;
		}
		
		StayDAO dao = StayDAO.getInstance();
		
		StayDTO dto = dao.getStayByCode(code);
		if(dto == null){
			out.println("예외발생");
		}
		dao.deleteOneCart(code);
			
		response.sendRedirect("http://localhost:9090/JEJUStay/cart.jsp");
	%>


</body>
</html>