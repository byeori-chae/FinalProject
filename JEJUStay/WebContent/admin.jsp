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
.tab {
   white-space: pre;
}

</style>

<%
	request.setCharacterEncoding("UTF-8");
	
	String keyWord = request.getParameter("keyWord");

	ReserveDAO reservedao = new ReserveDAO();
	ReserveDTO reservedto =  new ReserveDTO();
%>
<title>예약목록 | Admin</title>
</head>
<body>
	
	<jsp:include page="/menu_admin.jsp" />
	<div id="content" class="container">
		<input type="button" class="btn btn-warning btn-lg"	style="margin: 10px 10px 10px 270px;" onclick="window.location.reload()" value="새로고침">	
		<div class="form-group">
			<form class="form-inline" method="post">
         	<span class="tab">&#9;&#9;&#9;&#9;&#9;&#9;&#9;&#9;&#9;</span>
            <b>예약 검색&nbsp;&nbsp;</b><input type="text" class="form-control" name="keyWord" size="40" placeholder="이름 또는 연락처로 검색 (- 포함)"> &nbsp;
            <input type="submit" class="btn btn-default" value="검색" onclick="searchCheck(form)">
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
					
					ArrayList<ReserveDTO> reservedaoList = reservedao.select(keyWord); //reserve테이블에 있는 값을 list형태로 가지고 옴
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
						<td class="col-sm-4" style="text-align: center;"><a
							href="http://localhost:9090/JEJUStay/adminDetails.jsp?rsv_idx=<%=reservedto.getRsvIdx()%>"><%=reservedto.getStayName()%> - <%=reservedto.getStayRoomType()%></a></td>
						<td class="col-sm-2" style="text-align: right;"><%=reservedto.getStayPrice() + reservedto.getRsvAddprice()%>원</td>
						<td class="col-sm-2" style="text-align: center;">
						<%
							if(reservedto.getRsvCondition() != null) {
								if(reservedto.getRsvCondition().equals("예약완료")){
						%>
							<span class="badge progress-bar-success"><%=reservedto.getRsvCondition()%></span>
						<%
								}else if(reservedto.getRsvCondition().equals("예약취소")){
						%>
							<span class="badge progress-bar-danger"><%=reservedto.getRsvCondition()%></span>
						<%
								}
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
</html>