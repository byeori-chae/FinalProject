<%@page import="dao.StayDAO"%>
<%@ page contentType="text/html; charset=utf-8"%>
<%
	session.invalidate();
	StayDAO dao = new StayDAO();
	dao.deleteAllCart();
	response.sendRedirect("http://localhost:9000/JEJUStay/login.jsp");
%>