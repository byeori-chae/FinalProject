<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page language="java" contentType="text/html; charset=UTF-8"%>
<%@page import="dto.StayDTO" %>
<%@page import="dao.StayDAO"%>
<%
	String sessionId = (String) session.getAttribute("sessionId");
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<title>숙소 | 제주의밤</title>

<style type="text/css">
table tr td{
	padding :20;
	font-size:18px;
	font-weight: bold	
}
</style>
</head>
<body>
	<jsp:include page="menu.jsp" />	
		<%
			String code = request.getParameter("code"); 
			StayDAO dao = StayDAO.getInstance();
		//  StayDAO dao = new StayDAO();
			StayDTO dto = dao.getRoom(code);
		%>
	
	<div class="container">
		<table border="0">
			<tr>
				<td colspan="2">
				<h4 class="display-4">		
					<b style=color:#000069><%=dto.getStayName()%></b>
				</h4></td>
			</tr>
			<tr>
			<td width="400"><b><span style=font-size:18px>&nbsp;숙박유형&nbsp; </span></b><span style=font-size:14px> <%=dto.getStayType()%></span>
			</td>
			<td height="50"><b><span style=font-size:18px> 주소&nbsp; </span></b><span style=font-size:14px><%=dto.getStayAddress()%></span>
			</td>
			</tr>		
		</table>
		<p><br><br> <img src="media/<%=dto.getStayFileName()%>.PNG"  width="800" height="350">
	</div>
	<div class="container" style="padding-top: 50px">
		<form name="reserve" class="form-horizontal"
			action="http://localhost:9090/JEJUStay/addCart.jsp?code=<%=dto.getStayCode()%>"
			method="post" onSubmit="return checkForm()">
			<div class="form-group row">
				<div class="col-sm-3">
					<label>체크인</label> <input type="date" name="checkin"  id="currentDate"
						min="2020-01-01" max="2021-12-31" value="체크인 날짜">
				</div>
				<div class="col-sm-3">
					<label>체크아웃</label> <input type="date" name="checkout" id="currentDate1"
						min="2020-01-01" max="2021-12-31" value="체크아웃 날짜">
				</div>
				<div class="col-sm-2">
					<label>성인</label> <input type="number" name="adult" min="0" max="8"
						value="0" size="10">
				</div>
				<div class="col-sm-2">
					<label>소아</label> <input type="number" name="child" min="0" max="8"
						value="0" size="10">
				</div>
			</div>

			<div class="container">
				<div style="padding-top: 50px">
					<table class="table">
						<tr>
							<th width="400">객실유형</th>
							<th></th>
							<th>가격</th>
							<th>예약</th>
						</tr>
						<%
								String stayName = dto.getStayName(); //숙소별 객실 목록 
								ArrayList<StayDTO> listOfStays = dao.getRoomList(stayName);
								StayDTO sdto = null;
						
								for(int i=0; i<listOfStays.size(); i++){
									sdto = listOfStays.get(i);			
						%>
						<tr height="90" valign="middle">
							<th><img src="media/<%=sdto.getStayFileRoom()%>.PNG"
								width="380" height="230"></th>
							<td style="padding-top: -100"><br>
							<br>
							<br>[<%=sdto.getStayRoomType()%>] <br>
							<span style="font-size: 12px"> (기준 인원 : <%=sdto.getStayMax()%>명)
							</span></td>
							<td><br>
							<br>
							<br><%=sdto.getStayPrice()%>원</td>
							<td><br>
							<br>
							<br>
							<input type="submit" class="btn btn-light" value="예약하기"></td>
						</tr>
						<%
								}
						%>
					</table>
					<img src="media/<%=dto.getStayFileInfo()%>.PNG">

				</div>
			</div>
		</form>
		<br>
		<br>
		<script>
  					document.getElementById('currentDate').value = new Date().toISOString().substring(0, 10);
  					document.getElementById('currentDate1').value = new Date().toISOString().substring(0, 10);
		</script>
		
		
		<!-- 지도API -->
		<b><span style=font-size:18px>&nbsp;숙소 위치&nbsp; </span></b>
		<p>
		<div id="map" style="width: 100%; height: 350px;"></div>
		<script type="text/javascript"
			src="//dapi.kakao.com/v2/maps/sdk.js?appkey=540d67ea42461991a052c36879e4172f&libraries=services"></script>
			<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
		<script>
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			mapOption = {
				center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
				level : 3
			// 지도의 확대 레벨
			};

			// 지도를 생성합니다    
			var map = new kakao.maps.Map(mapContainer, mapOption);

			// 주소-좌표 변환 객체를 생성합니다
			var geocoder = new kakao.maps.services.Geocoder();

			// 주소로 좌표를 검색합니다
			geocoder.addressSearch(
							'<%=dto.getStayAddress()%>',
							function(result, status) {

								// 정상적으로 검색이 완료됐으면 
								if (status === kakao.maps.services.Status.OK) {

									var coords = new kakao.maps.LatLng(
											result[0].y, result[0].x);

									// 결과값으로 받은 위치를 마커로 표시합니다
									var marker = new kakao.maps.Marker({
										map : map,
										position : coords
									});

									// 인포윈도우로 장소에 대한 설명을 표시합니다
									var infowindow = new kakao.maps.InfoWindow(
											{
												content : '<div style="width:150px;text-align:center;padding:6px 0;"><%=dto.getStayName()%></div>'
											});
									infowindow.open(map, marker);

									// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
									map.setCenter(coords);
								}
							});
		</script>
	</div>
<hr>
<jsp:include page="footer.jsp" />	
</body>
</html>