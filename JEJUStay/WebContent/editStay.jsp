<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<title>상품편집 | Admin</title>
<script type="text/javascript">
	function deleteConfirm(code) {
		if (confirm("해당 상품을 삭제합니다.") == true)
			location.href = "./deleteStay.jsp?code="+code;
		else
			return;
	}
</script>
</head>
<%
	String edit = request.getParameter("edit");
%>
</head>
<body>
	<jsp:include page="menu_admin.jsp" />
	<div class="jumbotron" style="height: 180px;">
		<div class="container">
			<h1 class="display-3"><b>상품 편집</b></h1>
		</div>
	</div>
	<div class="container">
		<div class="row" align="center">
			<%@ include file="dbconn.jsp"%>
			<%
				PreparedStatement pstmt = null;	
				ResultSet rs = null;
				
				String sql = "select * from tbl_stay";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while (rs.next()) {
			%>
			<div class="col-md-6">
			<img src="./media/<%=rs.getString("stay_fileName")%>.PNG" width="500" height="350">
				<h3>상품코드 : <%=rs.getString("stay_code")%></h3>
				<p><b>[ <%=rs.getString("stay_name")%> ]</b> - <%=rs.getString("stay_roomType")%>
				<p><%=rs.getString("stay_price")%>원
				<p><%
						if (edit.equals("update")) {
					%>
					<a href="http://localhost:9090/JEJUStay/updateStay.jsp?code=<%=rs.getString("stay_code")%>" class="btn btn-success" role="button">수정</a>
					<%
						} else if (edit.equals("delete")) {
					%>
					<a href="#" onclick="deleteConfirm('<%=rs.getString("stay_code")%>')" class="btn btn-danger" role="button">삭제</a>
					<%
						}
					%>	
			</div>
			<%
				}
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			%>			
		</div>
		<hr>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>