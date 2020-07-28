<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@page import="java.util.*"%>
<%@page import="dao.ConsultDAO, dto.ConsultDTO"%>
<%@page import="dao.ReserveDAO, dto.ReserveDTO"%>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style type ="text/css">
#content{
	float:left;
	margin:5px;
}
#content_box{
	display: block;
}
</style>
<title>예약 목록</title>
</head>
<body>

	<jsp:include page="/menu_admin.jsp" />
	<div id="content" class="container">
		<input type="button" class="btn btn-warning btn-lg"	style="margin: 10px 10px 10px 270px;" onclick="window.location.reload()" value="새로고침">
		<div class="form-group">
			<form class="form-inline">
				<input style="margin-left: 270px;" type="date" name="checkin1">	~ <input type="date" name="checkin2"> &nbsp;
				<label for="input">&nbsp;&nbsp;검색&nbsp;</label>
				<input type="text" class="form-control" name="keyWord" size="40" placeholder="이름 또는 연락처로 검색 (-제외)"> &nbsp;
				<input type="submit" class="btn btn-default" value="검색" onclick="searchCheck()">
			</form>
		</div>
		<div id="content_box" class="container">
			<table class="table table-hover"
				style="margin: 10px 10px 10px 250px;">
				<thead>
					<tr>
						<th style="text-align: center;">체크인 날짜</th>
						<th style="text-align: center;">대표자</th>
						<th style="text-align: center;">상품코드</th>
						<th style="text-align: center;">상품명</th>
						<th style="text-align: center;">금액</th>
						<th style="text-align: center;">예약상태</th>
					</tr>
				</thead>
				<%
					ReserveDAO reservedao = new ReserveDAO();
					ReserveDTO reservedto =  new ReserveDTO();
					
					ArrayList<ReserveDTO> reservedaoList = reservedao.select(); //reserve테이블에 있는 값을 list형태로 가지고 옴
						if (reservedaoList.size() > 0 && reservedaoList != null) {
							for (int i = 0; i < reservedaoList.size(); i++) {
								reservedto = reservedaoList.get(i);
					%>
				<tbody>
					
					<tr>
						<td class="col-sm-1" style="text-align: center;"><%=reservedto.getStayCheckin()%></td>
						<td class="col-sm-1" style="text-align: center;"><%=reservedto.getMemName()%></td>
						<td class="col-sm-1" style="text-align: center;"><span
							class="badge progress-bar-info"><%=reservedto.getStayCode()%></span></td>
						<td class="col-sm-3" style="text-align: center;"><a
							href="http://localhost:9090/JEJUStay/adminDetails.jsp?rsv_idx=<%=reservedto.getRsvIdx()%>"><%=reservedto.getStayName()%></a></td>
						<td class="col-sm-2" style="text-align: right;"><%=reservedto.getStayPrice() + reservedto.getRsvAddprice()%>원</td>
						<td class="col-sm-2" style="text-align: center;">
						
						<%
							if(Boolean.parseBoolean((request.getParameter("rsv_condition"))) == true) {
						%> <span class="badge progress-bar-success">예약완료</span>
						<% 
							} else {
						%> <span class="badge progress-bar-danger">예약취소</span>
						<%
							}
						%>
						</td>

					</tr>
				</tbody>
				<%
						}
					}
				%>	
			</table>
		</div>
	</div>
</body>
<script>
    function searchCheck(frm){ //검색
       
        if(frm.keyWord.value ==""){
            alert("검색 단어를 입력하세요.");
            frm.keyWord.focus();
            return;
        }
        frm.submit();      
    }
</script>
</html>