<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="dto.StayDTO"%>
<%@ page import="dao.StayDAO"%>

<%
	String id = request.getParameter("cartId");	//cartId 전송
	if(id == null || id.trim().equals("")) {
		response.sendRedirect("cart.jsp");  //전송 cartId없으면 cart.jsp로 이동
		return;
	}
	
	session.invalidate(); //상품 바구니에 등록된 모든 상품을 삭제하도록 invalidate() 메소드 작성
	
	response.sendRedirect("cart.jsp");
%>