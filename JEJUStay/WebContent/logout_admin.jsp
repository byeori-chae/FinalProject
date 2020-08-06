<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	session.invalidate();	//로그인 인증을 할 떄 웹 브라우저에 저장되 ㄴ모든 사용자를 삭제하도록 session 내장 객체의 invalidate()메소드를 작성
	response.sendRedirect("admin.jsp"); //login 페이지로 강제 이동하도록 response 내장 객체의 sendRedirect()메소드를 작성
%>