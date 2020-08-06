<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
<link rel="stylesheet" href="../resources/css/bootstrap.min.css" />
<script type="text/javascript">
	function idCheck(){ 
		if(!document.newMember.id.value){
			alter("아이디를 입력하세요");
			return;
		}
		url = "idCheckForm.jsp?id="+document.newMember.id.value;
		open(url, "confirm", "toolbar=no,location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=300,height=200");
	}

	function checkForm() {
		if (!document.newMember.id.value) {
			alert("아이디를 입력하세요.");
			return false;
		}
		if (!document.newMember.password.value) {
			alert("비밀번호를 입력하세요.");
			return false;
		}
		if (document.newMember.password.value != document.newMember.password_confirm.value) {
			alert("비밀번호를 동일하게 입력하세요.");
			return false;
		}
		if (!document.newMember.name.value) {
			alert("이름을 입력하세요.");
			return false;
		}
		if (isNaN(document.newMember.birthyy.value)) {
			alert("년도는 숫자만 입력 가능합니다.");
			return false;
		}
	}
	
</script>
	

<title>회원 가입</title>
</head>
<body>
	<jsp:include page="../menu.jsp" />
	<div class="container" style="margin-left:550px; position: relative;">
		<img src="media/bg-painting.png" width="200" height="100" style="margin-left:-80px; margin-top:-15px; position:absolute;" >
		<div style="position: absolute;"><h4 class="display-4"><b>회원 가입</b></h4></div>
	</div>
	<br><br><br><br>
	<div class="container" style="margin-left:700px;">
		<form name="newMember" class="form-horizontal"  action="processAddMember.jsp" method="post" onSubmit="return checkForm()">
			<div class="form-group row">
				<label class="col-sm-2 ">아이디</label>
				<div class="col-sm-3">
					<input name="id" type="text" class="form-control" placeholder="아이디">
				</div>
				<div class="col-sm-3">
					<input type="button" name="idConfirm" class="btn btn-light" value="아이디 중복확인 " onclick="idCheck(this.form)" >
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
					<input name="name" type="text" class="form-control" placeholder="이름" >
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">생년월일</label>
				<div class="col-sm-4  ">
					<input type="text" name="birthyy" maxlength="4" placeholder="(4자)" size="6"> 
					<select name="birthmm">
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
					</select> <input type="text" name="birthdd" maxlength="2" placeholder="일" size="4">
				</div>
			</div>
			<div class="form-group  row ">
				<label class="col-sm-2">이메일</label>
				<div class="col-sm-10">
					<input type="text" name="mail1" maxlength="50">@ 
					<select name="mail2">
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
					<select name = "phone1">
						<option value="010">010</option>
						<option value="011">011</option>
						<option value="016">016</option>
						<option value="017">017</option>
						<option value="019">019</option>
					</select> 
						- <input type="text" maxlength="4" size="4" name="phone2">
				 		 - <input type="text" maxlength="4" size="4" name="phone3">
				</div>
			</div><br>		
			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10 ">
					<input type="submit" class="btn btn-info" value="등록 " > 
					<input type="reset" class="btn btn-info" value="취소 " onClick="reset()" >
				</div>
			</div>  
		</form>
	</div>
	<hr>
	<jsp:include page="../footer.jsp"/>
	</body>
</html>