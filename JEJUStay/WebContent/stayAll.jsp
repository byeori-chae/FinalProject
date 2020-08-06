<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@page import="dao.StayDAO"%>
<%@page import="dto.StayDTO" %>
<%@page import="java.sql.*" %>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
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
              <a class="nav-link active" href="#">전체</a>
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
              <a class="nav-link" href="http://localhost:9090/JEJUStay/stayCaravan.jsp">카라반</a>
            </li>
          </ul>
        </div>
      </div>
    </div>

<div class="container" style="padding-top: 40px;  padding-left: 60px;">      
 	<form name="search" class="form-horizontal" action="http://localhost:9090/JEJUStay/stayAll.jsp?" method="post" onSubmit="return checkForm()">
    	<div class="form-group row">
			<div class="col-sm-8">  
				<div class="form-inline">											
					<p style="margin-top: 25px;">
					<input type="text" name="keyField" class="form-control" size="50"
					 placeholder="숙소명"/>
					<input onclick="checkForm()" type="button" class="btn btn-default btn-group-lg" value="검색"></p>			  						
				</div>
			</div>
    	</div>
	</form> 
</div> <br>

	<%
//		StayDAO dao = StayDAO.getInstance();
//		ArrayList<StayDTO> listOfStays = dao.getAllStays();
	%>

	<%
		request.setCharacterEncoding("UTF-8");
		//ArrayList<MemberVO> list = dao.getMemberlist();
	%>


	<div class="container">
      <div class="row">      
        <%
        		String keyField = request.getParameter("keyField");     			
        		StayDAO dao = new StayDAO();
     			ArrayList<StayDTO> listOfStays = null;
     			if(keyField==null || keyField.equals("")){
     				listOfStays = dao.getAllStays();
     			}else{
     				listOfStays = dao.getSearch(keyField); 
     			}
     			StayDTO sdto = null;
     			for(int i=0; i<listOfStays.size(); i++){
					sdto = listOfStays.get(i);	
		%>		
		<div>
			<table border="0" style="margin-left:50px;">
				<tr><td rowspan="3" width="700">
					<a href="http://localhost:9090/JEJUStay/stayRoom.jsp?code=<%=sdto.getStayCode()%>"><img src="media/<%=sdto.getStayFileName()%>.PNG" width="650" height="250"></a></td>
					<th style="padding-left:20px"><%=sdto.getStayName()%></th></tr>
				<tr><td width="200" align=right style="padding-right:20px"><%=sdto.getStayPrice()%>원</td></tr>				 
				<tr><td align=right style="padding-right:20px"><a href="http://localhost:9090/JEJUStay/stayRoom.jsp?code=<%=sdto.getStayCode()%>" class="btn btn-light" role="button"> 예약하기  &raquo;</a></td></tr>
			</table>
			<br><br><br>	
		<%
     			}
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
<script type="text/javascript">
 function checkForm(){
	 if(!document.search.keyField.value){
         alert("검색어를 입력하세요.");
         forms.search.focus();
         return false;
     }
	 document.search.submit(); 
 }	 
</script>