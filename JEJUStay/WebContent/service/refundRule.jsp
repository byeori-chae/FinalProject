<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<meta charset="UTF-8">
<title>환불규정 | 제주의밤</title>
</head>
<body>
	<jsp:include page="../menu_service.jsp" />
	<div class="container">
		<div style="margin-top: -250px;">
			<h1 class="display-4"
				style="font-size: 35px; color: #6799FF; margin: 0px 0px;">
				<b>환불규정</b>
			</h1>
		</div>
		<br><br>
		<div class="well">
			<font color="#7401DF">※ 조/석식 등 "사전예약상품" 모두 객실 취소수수료와 동일한 취소수수료가 적용됩니다.<br></font>
			※ 주말(토,일) 및 공휴일, 퇴근 후 시간은 담당 근무자의 부재로 예약 취소가 불가합니다 (변경 및 취소전 반드시 확인 바랍니다.)<br>
			※ 기간에 따라 다른 환불규정이 적용 됩니다.<br>
			※ 상담원 근무시간 [평일 09:00-18:00 (주말/법정휴무)제외] 이후에는 예약취소가 불가합니다.<br>
			※ 특정 업체인 경우, 제주닷컴 취소규정이 아닌 숙소 자체 규정에 의거 취소/환불처리를 하오니 예약 시 반드시 확인해주시기 바랍니다.<br>
			&nbsp;&nbsp;&nbsp;(숙소 자체 취소규정인 경우는 제주닷컴 숙소 취소규정이 적용되지 않습니다.)<br>
			<font color="#7401DF">※ 투데이 핫세일 / 타임세일, 한정특가 상품은 취소/환불이 불가하오니, 구매 시 신중히 결정해 주시기 바랍니다.<br></font>
			※ 결제 후 투데이 핫세일 / 타임세일, 한정특가상품은 취소 시 : 전액환불불가<br>
		</div><br>
		<hr>
		<h3><b>취소수수료 안내</b></h3><br>
			<table class="table table-bordered" style="text-align:center;">				
			<tr style="background:#A9BCF5">
				<td class="col-md-3"><b>예약취소시점</b></td><td class="col-md-3"><b>취소 수수료</b></td>
			</tr>
			<tr>
				<td>여행시작 10일~9일전 취소 시</td><td>숙박 이용요금의 10% 수수료 부과</td>
			</tr>
			<tr>
				<td>여행시작 8일 ~6일 전 취소 시</td><td>숙박 이용요금의 20% 수수료 부과</td>
			</tr>
			<tr>
				<td>여행시작 5일 ~4일 전 취소 시</td><td>숙박 이용요금의 30% 수수료 부과</td>
			</tr>
			<tr>
				<td>여행시작 3일 ~ 2일 전 취소 시</td><td>숙박 이용요금의 50% 수수료 부과</td>
			</tr>
			<tr>
				<td>여행시작 1일 전 취소 시	</td><td>숙박 이용요금의 80% 수수료 부과</td>
			</tr>
			<tr>
				<td>당일 취소 시</td><td>전액 환불불가</td>
			</tr>
			</table>
		<br>
	</div>
	<hr>
	<jsp:include page="../footer.jsp" />
</body>
</html>