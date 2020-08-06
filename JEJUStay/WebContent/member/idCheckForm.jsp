<%@page import="dao.StayDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 중복확인</title>
</head>
<body>
	<%
		String id = request.getParameter("id");
		StayDAO dao = StayDAO.getInstance(); 
		boolean result = dao.confirmId(id);
		
		if(result){
	%>
			<center>
			<br /><br />
			<h4>이미 사용중인 아이디입니다.</h4>
			</center>
	<%  
		}else{ 
	%>
		<center>
			<br /><br />
			<h4>입력하신 <%=id %>는 사용하실 수 있는 아이디입니다.</h4>
			</center>
	<%
		}
	%>
</body>
</html>