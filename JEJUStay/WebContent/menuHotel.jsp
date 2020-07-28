<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@page import="dto.StayDTO" %>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<title>숙소 예약</title>

<style type="text/css">
body {
	background: #ffffff;
	font-family: "맑은 고딕";
	position: relative;	
}
span { 
 margin:20px 0px; 
 font-size: 20px;
 font-family: sans-serif;
 color:#6799FF;
 font-weight: bold;
 }
 
table.list{	
	border-collapse:collapse;
}
table.list td{
	border: 1px solid #c7c7bc;
	text-align: right;
	vertical-align:middle; 
	color:#0B0B61;
	font-weight: bold;	
	cellpadding:"40px";
}
table.list td a{
	display:block;
}

table.list td a : hover{
	bordercolor: #8000FF;
}
tr, th{
	font-size: 20px;
	color:#08088A;
}
tr, td{
	font-size: 15px;
}
</style>

</head>
<body>
	<jsp:include page="menu.jsp" />		
	<div class="container" style="padding-top: 50px">
		<div class="row">
			<div class="form-group">
				 <form class="form-inline">					
					<input type="text" name="search" class="form-control" placeholder="숙소명, 지역명 " size=50/>
					<input type="submit" class="btn btn-default btn-group-lg" value="찾기">
				 </form>				  		
			</div>			
		</div>
	</div>


	<div class="container" style="padding-top: 100px">
      <div class="row">
        <div class="col">
          <span>숙소 예약</span>
          <ul class="nav nav-tabs" style="padding-top: 50px">
            <li class="nav-item">
              <a class="nav-link active" href="#">전체</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">호텔</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">펜션</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">리조트</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">게스트하우스</a>
            </li>
          </ul>
        </div>
      </div>
    </div>


<div class="container" style="padding-top: 50px">      
 	<form name="newMember" class="form-horizontal"  
		action="#" method="post" onSubmit="return checkForm()">
		
    	<div class="form-group row">
    		<div class="col-sm-2">
    				<label>유형</label>
					<select name="type" style="width:130px; height:40px;">
						<option value="숙소유형 전체">숙소유형 전체</option>
						<option value="호텔">호텔</option>
						<option value="펜션">펜션</option>
						<option value="리조트">리조트</option>
						<option value="게스트하우스">게스트하우스</option>				
					</select> 
			</div>
			<div class="col-sm-2">
    				<label>지역</label>
					<select name="place" style="width:130px; height:40px;">
						<option value="제주도 전체">제주도 전체</option>
						<option value="제주시">제주시</option>
						<option value="제주시 동부">제주시 동부</option>
						<option value="제주시 서부">제주시 서부</option>
						<option value="서귀포시">서귀포시</option>			
						<option value="서귀포시 동부">서귀포시 동부</option>	
						<option value="서귀포시 서부">서귀포시 서부</option>		
					</select> 
			</div>
    		<div class="col-sm-2">
    				<label>체크인</label>
					<input type="date" name="checkin" min="2020-01-01" max="2021-12-31" value="체크인 날짜">
			</div>
			<div class="col-sm-2">
    				<label>체크아웃</label>
					<input type="date" name="checkout" min="2020-01-01" max="2021-12-31" value="체크아웃 날짜">
			</div>
    </div>
  
 	<div class="form-group row">
 			<div class="col-sm-5">												
					<input type="text" name="search" class="form-control" placeholder="숙소명, 지역명 "/>
					<input type="submit" class="btn btn-default btn-group-lg" value="검색">				  						
			</div>
	</div>
</form> 
</div>

   	
  <div class="container">
      <div class="row">      
        <%@ include file = "dbconn.jsp" %>
        <%
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				String sql = "select * from tbl_stay where stay_fileRoom like '%_1';";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while(rs.next()){
		%>
		
		<div class="container" align="center">
			<table border="0">
				<tr><td rowspan="3">
					<a href="#"><img src="media/<%=rs.getString("stay_fileName")%>.PNG" width="650" height="250"></a></td>
					<th style="padding-left:20px"><%=rs.getString("stay_name")%></th></tr>
				<tr><td width="200" align=right style="padding-right:20px"><%=rs.getString("stay_price") %></td></tr>						 
				<tr><td align=right style="padding-right:20px"><a href="#" class="btn btn-light" role="button"> 예약하기  &raquo;</a></td></tr>
			</table>
			<br><br><br>
		</div>
			 
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
    
    
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>





</body>
</html>