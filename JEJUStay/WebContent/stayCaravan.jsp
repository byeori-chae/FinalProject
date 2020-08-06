<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@page import="dao.StayDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dto.StayDTO" %>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<link href="resources/css/menu.css" type="text/css" rel="stylesheet">
<title>숙소 | 제주의밤</title>
</head>

<body>
	<jsp:include page="menu.jsp" />		

	<div class="container" style="padding-top: 30px">
      <div class="row">
        <div class="col">
          <span>숙소 예약</span>
          <ul class="nav nav-tabs" style="padding-top: 50px">
            <li class="nav-item">
              <a class="nav-link" href="http://localhost:9090/JEJUStay/stayAll.jsp">전체</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="http://localhost:9090/JEJUStay/stayHotel.jsp">호텔</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="http://localhost:9090/JEJUStay/stayPension.jsp">펜션</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="http://localhost:9090/JEJUStay/stayResort.jsp">리조트</a>
            </li>
            <li class="nav-item">
              <a class="nav-link active" href="http://localhost:9090/JEJUStay/stayCaravan.jsp">카라반</a>
            </li>
          </ul>
        </div>
      </div>
    </div>

	<%
//		StayDAO dao = StayDAO.getInstance();
//		ArrayList<StayDTO> listOfStays = dao.getAllStays();
	%>

	<div class="container"  style="margin-left:300px">
      <div class="row">      
        <%@ include file = "dbconn.jsp" %>
        <%
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				String sql = "select * from tbl_stay where stay_type='카라반' and stay_fileRoom like '%_1';";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while(rs.next()){
		%>
		
		<div >
			<table border="0" style="margin-top: 70px; margin-left:100px;">
				<tr><td rowspan="3">
					<a href="http://localhost:9090/JEJUStay/stayRoom.jsp?code=<%=rs.getString("stay_code")%>"><img src="media/<%=rs.getString("stay_fileName")%>.PNG" width="650" height="250"></a></td>
					<th style="padding-left:20px"><%=rs.getString("stay_name")%></th></tr>
				<tr><td width="200" align=right style="padding-right:20px"><%=rs.getString("stay_price") %>원</td></tr>						 
				<tr><td align=right style="padding-right:20px"><a href="http://localhost:9090/JEJUStay/stayRoom.jsp?code=<%=rs.getString("stay_code")%>" class="btn btn-light" role="button"> 예약하기  &raquo;</a></td></tr>
			</table>
			<br><br>
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
	</div>
</div>
<hr>
 <jsp:include page="footer.jsp" />   
    
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

</body>
</html>
