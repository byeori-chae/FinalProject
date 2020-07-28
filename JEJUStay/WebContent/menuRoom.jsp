<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@page import="dto.StayDTO" %>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<title>예약하기</title>
<script type="text/javascript">
	function addToCart() {
		if (confirm("상품을 장바구니에 추가하시겠습니까?")) {
			document.addForm.submit();
		} else {		
			document.addForm.reset();
		}
	}
</script>

</head>
<body>
	<jsp:include page="menu.jsp" />	
	
	<div class="container">
      <div class="row">      
        <%@ include file = "dbconn.jsp" %>
        <%
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				String sql = "select * from tbl_stay";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while(rs.next()){
		%>
		
		<h2> <%=rs.getString("stay_name")%></h2><br> 
		<%=rs.getString("stay_place")%><br>
		<p> 숙박유형 <%=rs.getString("stay_type")%> 주소 <%=rs.getString("stay_address")%>
		<p>		<img src="media/<%=rs.getString("stay_fileName")%>.PNG" width="800" height="350"></a></td>
			
			
			 
		<%
				}
				if(rs != null)
					rs.close();
				if(pstmt != null)
					pstmt.close();
				if(conn != null)
					conn.close();
		
		%>	
		
 	</div>
	<hr>
	</div>
</body>
</html>