<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
<%@page import="dto.StayDTO"%>
<%@page import="dao.StayDAO"%>
	<%
		String sessionId = (String) session.getAttribute("sessionId");
		
		StayDAO dao = new StayDAO();
		dao.deleteAllCart();
		
		response.sendRedirect("http://localhost:9090/JEJUStay/cart.jsp?sessionId="+sessionId);
	
	%>
