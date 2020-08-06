<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@page import="dao.ConsultDAO, dto.ConsultDTO"%>
<%@page import="dao.ReserveDAO, dto.ReserveDTO"%>
<%@page import="java.util.*"%>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script type="text/javascript">
function del(no) {
	if (confirm("정말로 삭제하시겠습니까?") == true) { // 확인, 취소 선택 할 수 있는 선택창 뜨게 confirm함수사용
		location.href = "./consult_Del.jsp?cst_no="+no;	
	}
	return;
}
</script>
<style type="text/css">
.tab {
	white-space: pre;
}

#content_box {
	margin-left: 200px;
	float: left;
	position: absolute.
}

#reserve_info {
	display: inline;
}
#rsv_condition1 {
	width: 120px; /* 원하는 너비설정 */
	padding: .2em .2em; /* 여백으로 높이 설정 */
	font-family: inherit; /* 폰트 상속 */
	background: url(https://farm1.staticflickr.com/379/19928272501_4ef877c265_t.jpg) no-repeat 95% 50%;/* 네이티브 화살표 대체 */
	border: 1px solid #999;
	-webkit-appearance: none; /* 네이티브 외형 감추기 */
	-moz-appearance: none;
	appearance: none;
}
#rsv_cancelRule {
	width: 220px; /* 원하는 너비설정 */
	padding: .2em .2em; /* 여백으로 높이 설정 */
	font-family: inherit; /* 폰트 상속 */
	background: url(https://farm1.staticflickr.com/379/19928272501_4ef877c265_t.jpg) no-repeat 95% 50%;/* 네이티브 화살표 대체 */
	border: 1px solid #999;
	-webkit-appearance: none; /* 네이티브 외형 감추기 */
	-moz-appearance: none;
	appearance: none;
}

</style>

<title>예약세부정보 | Admin</title>
</head>
<body>
	<jsp:include page="/menu_admin.jsp" />
	<div id="content_box" class="container">
		<input type="button" class="btn btn-warning btn-lg"
			style="margin: 10px 10px 10px 200px;"
			onclick="location.href='http://localhost:9090/JEJUStay/admin.jsp'" value="목록보기" >
			<%
				int idx = Integer.parseInt(request.getParameter("rsv_idx").trim());
			
				ReserveDAO reservedao = new ReserveDAO();
				ReserveDTO reservedto = new ReserveDTO();
			
				ArrayList<ReserveDTO> reservelist = reservedao.select(); //consult테이블에 있는 값을 list형태로 가지고 옴
					if (reservelist.size() > 0 && reservelist != null) {
						for (int i = 0; i < reservelist.size(); i++) {
							reservedto = reservelist.get(i);
								if(idx == reservedto.getRsvIdx()) {
			%>
		<form action="reserve_con_Up.jsp?rsv_idx=<%=reservedto.getRsvIdx()%>" method="post">
		<div class="container">
			<table class="table">
				<tr>
					<td class="col-md-2"><span class="badge progress-bar-info"
						style="margin-left: 200px">예약번호 : <%=reservedto.getRsvIdx()%></span></td>
					<td class="col-md-6"><%=reservedto.getStayName()%> - <%=reservedto.getStayRoomType()%></td>
					<td class="col-md-4"><select name="rsv_condition1"
						id="rsv_condition1" onchange="conditionValue(this.form)">
							<option value="0">접수완료</option>
							<option value="1">예약완료</option>
							<option value="2">예약취소</option>
					</select>
					<input type="text" name="rsv_condition" size="6" style="color: red; font-weight:bold;" value="<%=reservedto.getRsvCondition()%>">
					<input class="btn btn-warning" type="submit" value="저장" style="padding: 2px"></td>
					<td class="col-md-1"><input type="button"
						class="btn btn-danger" style="padding: 5px; float:left;" value="예약상품 확인"
						onclick="location.href='http://localhost:9090/JEJUStay/stayRoom.jsp?code=<%=reservedto.getStayCode()%>'">
					</td>
				</tr>
			</table>
		</div>
		</form>
	</div>

	<div id="content" class="container">
		<div id="content_box" class="panel-group">
			<!-- 예약자 정보 시작-->
			<form action="reserve_booker_Up.jsp?rsv_idx=<%=reservedto.getRsvIdx()%>" method="post">                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
				<div class="panel panel-default"
					style="width: 900px; height: 200 px;">
					<div class="panel-heading">
						<b>예약자 정보 </b><input class="btn btn-warning" type="submit"
							value="저장" style="float: right; padding: 2px">
					</div>
					<div class="panel-body"
						style="padding-left: 40px; padding-top: 20px;">
						<div>
							<span style="text-align: left"><b>체크인 </b></span> <input
								name="stay_checkin" type="date"
								value="<%=reservedto.getStayCheckin()%>">
							<p>
								<br> <span class="badge progress-bar-info"><%=reservedto.getMemIdx()%></span>
								<span class="tab" style="text-align: left"><b>이름 </b></span>
								<input name="mem_name" type="text" size="8"
									value="<%=reservedto.getMemName()%>">
								<span class="tab" style="text-align: left">&#9;&#9;<b>연락처 </b></span>
								<input name="mem_phone" type="text" size="15"
									value="<%=reservedto.getMemPhone()%>">
								<span class="tab" style="text-align: left">&#9;&#9;<b>메일 </b></span>
								<input name="mem_email" type="text"
									value="<%=reservedto.getMemEmail()%>">
						</div>
					</div>
				</div>
			</form>
			<!-- 예약자 정보 끝-->
			<!-- 예약 정보 시작-->
			<form action="reserve_info_Up.jsp?rsv_idx=<%=reservedto.getRsvIdx()%>" method="post">
				<div class="panel panel-default"
					style="width: 900px; height: 270px;">
					<div class="panel-heading">
						<b>예약 정보 </b><input class="btn btn-warning" type="submit"
							value="저장" style="float: right; padding: 2px">
					</div>
					<div class="panel-body"
						style="padding-left: 40px; padding-top: 20px;">
						&nbsp;<b>예약 일자 </b>&nbsp;&nbsp;<input type="date" name="rsv_date"
							value="<%=reservedto.getRsvDate()%>"> <span class="tab">&#9;&#9;&#9;&#9;&#9;&#9;&#9;</span><b>성인</b>
						<input name="stay_adult" type="text" size="1"
							value="<%=reservedto.getStayAdult()%>"><b>명</b>&nbsp;&nbsp;
						<b>아동 </b><input name="stay_child" type="text" size="1"
							value="<%=reservedto.getStayChild()%>"><b>명</b> <span
							class="tab">&#9;</span>

						<p>
							<br> &nbsp;<b>숙박 일자 </b>&nbsp;&nbsp;<input type="date"
								name="stay_checkin" value="<%=reservedto.getStayCheckin()%>">
							~ <input type="date" name="stay_checkout"
								value="<%=reservedto.getStayCheckout()%>"> <span
								class="tab">&#9;&#9;&#9;</span>&nbsp;&nbsp;<b>요금 </b>&nbsp;&nbsp;<input
								name="stay_price" type="text" size="7" style="text-align: right"
								value="<%=reservedto.getStayPrice()%>"><b>원</b>
						<p>
							<br> &nbsp;<b>숙소 유형 </b>&nbsp;&nbsp;<input type="text"
								style="background-color: #e2e2e2; text-align: center;" size="10"
								name="stay_type" value="<%=reservedto.getStayType()%>" readonly>
							<span class="tab">&#9;&#9;&#9;&#9;&#9;&#9;&#9;&#9;</span> <b>추가
								비용 </b>&nbsp;&nbsp; <input type="text" name="rsv_addPrice" size="7"
								style="text-align: right"
								value="<%=reservedto.getRsvAddprice()%>"><b>원 </b>
							&nbsp;&nbsp; <input type="text" name="rsv_addReason"
								placeholder="추가비용 사유란" size="20"
								value="<%=reservedto.getRsvAddreason()%>">
						<p>
							<br> <span class="tab">&#9;&#9;&#9;&#9;&#9;&#9;&#9;&#9;&#9;&#9;&#9;&#9;&#9;&#9;</span>
							&nbsp;&nbsp;&nbsp;<b>총 금액 </b>&nbsp;&nbsp;&nbsp; <input
								name="rsv_totalPrice" type="text" size="7"
								style="text-align: right; color: red;"
								value="<%= reservedto.getStayPrice()+reservedto.getRsvAddprice() %>"><b>원
							</b>
					</div>
				</div>
			</form>
			<p>
			<form method="post" action="cancel_Ins.jsp?rsv_idx=<%=reservedto.getRsvIdx()%>">
				<div class="panel panel-default"
					style="width: 900px; height: 200px;">
					<div class="panel-heading">
						<b>취소 정보 </b> <input class="btn btn-warning" type="submit"
							value="저장" style="float: right; padding: 2px">
					</div>
					<div class="panel-body"
						style="display: inline; padding-left: 50px; padding-top: 20px;">
						<span class="tab">&#9;</span> <b>취소료 규정</b>&nbsp;&nbsp;<br> <span
							class="tab">&#9;</span> <select name="rsv_cancelRule"
							id="rsv_cancelRule" onchange="cancelFeeValue(this.form)">
							<option value="0">-- 선택 --</option>
							<option value="1">여행시작 10일~9일 전 취소</option>
							<option value="2">여행시작 8일~6일 전 취소</option>
							<option value="3">여행시작 5일~4일 전 취소</option>
							<option value="4">여행시작 3일~2일 전 취소</option>
							<option value="5">여행시작 1일 전 취소</option>
							<option value="6">당일 취소</option>
						</select> <span class="tab">&#9;&#9;</span> &nbsp; <b>취소 수수료</b>&nbsp;<input
							type="text" name="rsv_cancelFee" size="8"
							style="text-align: right; color: red;"
							value="<%=reservedto.getRsvCancelFee()%>">원 <span
							class="tab">&#9;&#9;</span> &nbsp;&nbsp;<b>취소 사유</b>&nbsp; <input
							type="text" name="rsv_cancelReason" style="text-align: left;"
							size="20" value="<%=reservedto.getRsvCancelReason()%>"> <br>
						<br> <span class="tab">&#9;&#9;&#9;&#9;&#9;&#9;&#9;&#9;&#9;&#9;&#9;&#9;&#9;&#9;&#9;&#9;&#9;&#9;&#9;&#9;&#9;</span>
						<b>환불 금액</b>&nbsp;<input type="text" name="rsv_refund" size="8" placeholder="환불금액"
							value="<%=reservedto.getStayPrice() + reservedto.getRsvAddprice() - reservedto.getRsvCancelFee()%>"
							style="text-align: right; color: red;">원
					</div>
				</div>
			</form>
			
			<!-- 취소 정보 끝-->
			<!-- 상담내용 등록 시작-->
			<form method="post" action="consult_Ins.jsp?rsv_idx=<%=reservedto.getRsvIdx()%>">
				<div class="panel panel-default"
					style="width: 900px; height: 250px;">
					<div class="panel-heading">
						<b>이름 &raquo; </b><input name="cst_name" type="text" size="5">
						<input class="btn btn-warning" type="submit" value="저장"
							style="float: right; padding: 2px">
					</div>
					<div class="panel-body"
						style="padding-left: 40px; padding-top: 20px;">
						<textarea name="cst_content" placeholder="상담내용 입력" cols="115"
							rows="8"></textarea>
					</div>
				</div>
			</form>
			<!-- 상담내용 등록 끝 -->
				<%
					ConsultDAO consultdao = new ConsultDAO();
					ConsultDTO consultdto = new ConsultDTO();

					ArrayList<ConsultDTO> consultlist = consultdao.select(reservedto.getRsvIdx()); //consult테이블에 있는 값을 list형태로 가지고 옴
					if (consultlist.size() > 0 && consultlist != null) {
						for (int j = 0; j < consultlist.size(); j++) {
							consultdto = consultlist.get(j);
				%>
			<!-- 상담내용 목록 시작 -->
				<form method="post" action="consult_Del.jsp?rsv_idx=<%=reservedto.getRsvIdx()%>">
				<input type="hidden">
				<div>
					<table class="table table-hover">
						<tr>
							<td class="col-md-1"><span class="badge badge-secondary">
									상담 : <%=consultdto.getCstName()%></span></td>
							<td class="col-md-5"><%=consultdto.getCstContent()%></td>
							<td style="text-align: center" class="col-md-1"><%=consultdto.getCstDate()%></td>
							<td class="col-md-1"><input style="float: right;"
								type="button" class="btn btn-outline-secondary btn-sm"
								onclick="del(<%=consultdto.getCstNo()%>)" value="X"></td>
						</tr>
					</table>
				</div>
				<%
						}
					}
				%>
			</form>

			<!-- 상담내용 목록 끝 -->
		</div>
	</div>
<script type="text/javascript">
function cancelFeeValue(frm) { 
    var rsv_cancelFee = frm.rsv_cancelRule.selectedIndex;  
    switch( rsv_cancelFee ){
       case 0:
         frm.rsv_cancelFee.value = '<%= 0 %>';
         break;
       case 1:
         frm.rsv_cancelFee.value = '<%= (reservedto.getStayPrice() + reservedto.getRsvAddprice()) * 10 / 100 %>';
         break;
       case 2:
         frm.rsv_cancelFee.value = '<%= (reservedto.getStayPrice() + reservedto.getRsvAddprice()) * 20 / 100 %>';
         break;
       case 3:
         frm.rsv_cancelFee.value = '<%= (reservedto.getStayPrice() + reservedto.getRsvAddprice()) * 30 / 100 %>';
         break;
       case 4:
         frm.rsv_cancelFee.value = '<%= (reservedto.getStayPrice() + reservedto.getRsvAddprice()) * 50 / 100 %>';
         break;
       case 5:
	     frm.rsv_cancelFee.value = '<%= (reservedto.getStayPrice() + reservedto.getRsvAddprice()) * 80 / 100 %>';
	         break;
       case 6:
    	   frm.rsv_cancelFee.value = '<%= reservedto.getStayPrice() + reservedto.getRsvAddprice() %>';
	         break;
	}  
	return true;
}
</script>
<script type="text/javascript">
function conditionValue(frm) { 
    var rsv_condition = frm.rsv_condition1.selectedIndex;  
    switch( rsv_condition ){
       case 0:
         frm.rsv_condition.value = '접수완료';
         break;
       case 1:
         frm.rsv_condition.value = '예약완료';
         break;
       case 2:
         frm.rsv_condition.value = '예약취소';
         break;
	}  
	return true;
}
</script>
<script type="text/javascript">

</script>
			<%
						}
					}
				}
			%>
</body>
</html>