<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style type="text/css">
#content {
	margin-left: 300px;
	float: left;
	position: absolute.
}
</style>
<title>상품수정 | Admin</title>
</head>
<body>
	<jsp:include page="menu_admin.jsp" />
	<div class="jumbotron" style="height: 180px;">
		<div class="container">
			<h1 class="display-3"><b>상품 수정</b></h1>
		</div>
	</div>
	<%@ include file="dbconn.jsp"%>
	<%
		String stay_code = request.getParameter("code");
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select * from tbl_stay where stay_code = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, stay_code);
		rs = pstmt.executeQuery();
		
		if (rs.next()) {
	%>
	<div class="container" id="content">
		<form name="newStay" action="./processUpdateStay.jsp" class="form-horizontal" method="post" enctype="multipart/form-data">
			<div class="form-group row">
				<label class="col-sm-2">상품 코드</label>
				<div class="col-sm-3">
					<input type="text" id="stay_code" name="stay_code" class="form-control" value="<%=rs.getString("stay_code")%>">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">숙소 타입</label>
				<div class="col-sm-5">
					<input type="radio" name="stay_type" value="호텔"> 호텔&nbsp;&nbsp;
					<input type="radio" name="stay_type" value="리조트"> 리조트&nbsp;&nbsp;
					<input type="radio" name="stay_type" value="펜션"> 펜션&nbsp;&nbsp;
					<input type="radio" name="stay_type" value="카라반"> 카라반&nbsp;&nbsp;
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">숙소 명</label>
				<div class="col-sm-3">
					<input type="text" id="stay_name" name="stay_name" value='<%=rs.getString("stay_name")%>'
						class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">숙소 위치</label>
				<div class="col-sm-3">
					<input type="text" id="stay_place" name="stay_place" value='<%=rs.getString("stay_place")%>'
						class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">숙소 주소</label>
				<div class="col-sm-3">
					<input type="text" id="stay_address" name="stay_address" value='<%=rs.getString("stay_address")%>'
						class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">객실 타입</label>
				<div class="col-sm-3">
					<input type="text" id="stay_roomType" name="stay_roomType" value='<%=rs.getString("stay_roomType")%>'
						class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">기본 요금</label>
				<div class="col-sm-2">
					<input type="text" id="stay_price" name="stay_price" value='<%=rs.getInt("stay_price")%>'
						class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">최대 숙박 인원</label>
				<div class="col-sm-1">
					<input type="text" id="stay_max" name="stay_max" value='<%=rs.getInt("stay_max")%>'
						class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">숙소 사진</label>
				<div class="col-sm-5">
					<input type="file" id="stay_fileName" name="stay_fileName" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">객실 사진</label>
				<div class="col-sm-5">
					<input type="file" id="stay_fileRoom" name="stay_fileRoom" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">숙소 정보</label>
				<div class="col-sm-5">
					<input type="file" name="stay_fileInfo" name="stay_fileInfo" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10 ">
					<input type="submit" class="btn btn-primary" value="수정">
				</div>
			</div>
		</form>
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
</body>
</html>