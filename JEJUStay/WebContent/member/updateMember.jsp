<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<html>
<head>
<link rel="stylesheet" href="../resources/css/bootstrap.min.css" />
<%
	String sessionId = (String) session.getAttribute("sessionId");
%>
<sql:setDataSource var="dataSource"
	url="jdbc:mysql://localhost:3306/jejudb"
	driver="com.mysql.jdbc.Driver" user="root" password="12345" />

<sql:query dataSource="${dataSource}" var="resultSet">
   SELECT * FROM tbl_member WHERE mem_id=?
   <sql:param value="<%=sessionId%>" />
</sql:query>
<title>회원정보수정 | 제주의 밤 </title>
</head>
<body onLoad="init()">
	<jsp:include page="../mypageMenu.jsp" />
	<div class="container" style="margin-left:550px; margin-top:-160px;">
		<h1 class="display-4"><b>회원정보 수정</b></h1>
	</div>
	<c:forEach var="row" items="${resultSet.rows}">
	<c:set var="mail" value="${row.mem_email}" />
	<c:set var="mail1" value="${mail.split('@')[0]}" />
	<c:set var="mail2" value="${mail.split('@')[1]}" />

	<c:set var="birth" value="${row.mem_birth }" />
	<c:set var="year" value="${birth.split('-')[0]}" />
	<c:set var="month" value="${birth.split('-')[1]}" />
	<c:set var="day" value="${birth.split('-')[2]}" />
	
	<br><br><br>
	<div class="container" style="margin-left:700px; margin-top:10px;">
		<form name="newMember" class="form-horizontal" action="http://localhost:9000/JEJUStay/member/processUpdateMember.jsp" method="post" onSubmit="return checkForm()">
			<div class="form-group row">
				<label class="col-sm-2 ">아이디</label>
				<div class="col-sm-3">
					<%=sessionId%>
				</div>
			</div>			
			<div class="form-group  row">
				<label class="col-sm-2">비밀번호</label>
				<div class="col-sm-3">
					<input name="password" type="text" class="form-control" placeholder="비밀번호" >
				</div>
			</div>
			<div class="form-group  row">
				<label class="col-sm-2">비밀번호확인</label>
				<div class="col-sm-3">
					<input name="password_confirm" type="text" class="form-control" placeholder="비밀번호 확인" >
				</div>
			</div>
			<div class="form-group  row">
				<label class="col-sm-2">이름</label>
				<div class="col-sm-3">
					<input name="name" type="text" class="form-control" placeholder="이름" value="<c:out value='${row.mem_name}'/>">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">생년월일</label>
				<div class="col-sm-4  ">
					<input type="text" name="birthyy" maxlength="4" placeholder="(4자)" size="6"  value="${year}"> 년
					<select name="birthmm" id="birthmm">
						<option value="">월</option>
						<option value="01">1</option>
						<option value="02">2</option>
						<option value="03">3</option>
						<option value="04">4</option>
						<option value="05">5</option>
						<option value="06">6</option>
						<option value="07">7</option>
						<option value="08">8</option>
						<option value="09">9</option>
						<option value="10">10</option>
						<option value="11">11</option>
						<option value="12">12</option>
					</select> 월 <input type="text" name="birthdd" maxlength="2" placeholder="일" size="4" value="${day}"> 일
				</div>
			</div>
			<div class="form-group  row ">
				<label class="col-sm-2">이메일</label>
				<div class="col-sm-10">
					<input type="text" name="mail1" maxlength="50" value="${mail1}">@ 
					<select name="mail2" id="mail2">
						<option>naver.com</option>
						<option>daum.net</option>
						<option>gmail.com</option>
						<option>nate.com</option>
					</select>
				</div>				
			</div>
			<div class="form-group  row">
				<label class="col-sm-2">전화번호</label>
				<div class="col-sm-3">
					<input name="phone" type="text" class="form-control" placeholder="phone" value="<c:out value='${row.mem_phone}'/>">
				</div>
			</div>
			<br>		
			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10 ">
					<input type="submit" class="btn btn-info" value="수정완료 " > 
					<a href="http://localhost:9000/JEJUStay/member/deleteMember.jsp" class="btn btn-secondary">회원탈퇴</a>
				</div>
			</div>
		</form>
	</div>
	</c:forEach>
	<hr>
	<jsp:include page="../footer.jsp"/>
</body>
</html>
<script type="text/javascript">
	function init() {
		setComboMailValue("${mail2}");
		setComboBirthValue("${month}");
	}

	function setComboMailValue(val) {
		var selectMail = document.getElementById('mail2');
		for (i = 0, j = selectMail.length; i < j; i++) {
			if (selectMail.options[i].value == val) {
				selectMail.options[i].selected = true; 
				break;
			}
		}
	}
	function setComboBirthValue(val) {
		var selectBirth = document.getElementById('birthmm'); 
		for (i = 0, j = selectBirth.length; i < j; i++){
			if (selectBirth.options[i].value == val){
				selectBirth.options[i].selected = true; 
				break;
			}
		}
	}
	function checkForm() {
		if (!document.newMember.password.value) {
			alert("비밀번호를 입력하세요.");
			return false;
		}
		if (document.newMember.password.value != document.newMember.password_confirm.value) {
			alert("비밀번호를 동일하게 입력하세요.");
			return false;
		}
	}
</script>