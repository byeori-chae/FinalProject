<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<html>
<head>
<link rel="stylesheet" href="../resources/css/bootstrap.min.css" />
<title>회원정보</title>
</head>
<body>
	<jsp:include page="../menu.jsp" />
		<div class="container">
			<h3 class="display-4">회원정보</h3>
		</div>
	<div class="container" align="center">
		<%
			String msg = request.getParameter("msg");

			if (msg != null) {
				if (msg.equals("0"))
					out.println(" <h3 class='alert alert-info'>회원정보가 수정되었습니다.</h3>");
				else if (msg.equals("1"))
					out.println(" <h3 class='alert alert-info'>회원가입을 축하드립니다.</h3>");
				else if (msg.equals("2")) {
					String loginId = (String) session.getAttribute("sessionId");
					out.println(" <h3 class='alert alert-info'>" + loginId + "님 환영합니다</h3>");
				}
			}else {
				session.invalidate();
				out.println(" <h3 class='alert alert-info'> 회원 탈퇴되었습니다. 이용해주셔서 감사합니다 :) </h3>");
			} 
		%>
	</div>	
</body>
</html>