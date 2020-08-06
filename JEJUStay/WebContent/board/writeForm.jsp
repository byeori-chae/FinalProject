<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String name = (String) request.getAttribute("name");
	
%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<title>문의글쓰기 | 제주의밤</title>
<style>
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);

body {
	font-family: 'Nanum Gothic', sans-serif;
}
</style>
</head>
<script type="text/javascript">
	function checkForm() {
		if (!document.newWrite.name.value) {
			alert("닉네임을 입력하세요.");
			return false;
		}
		if (!document.newWrite.subject.value) {
			alert("제목을 입력하세요.");
			return false;
		}
		if (!document.newWrite.content.value) {
			alert("내용을 입력하세요.");
			return false;
		}		
	}
</script>
<body>
	<jsp:include page="../menu.jsp" />
	<div class="container" style="margin-left:550px; position: relative;">
		<img src="media/bg-painting.png" width="200" height="100" style="margin-left:-70px; margin-top:-15px; position:absolute;" >
		<div style="position: absolute;"><h4 class="display-4"><b>문의글쓰기</b></h4></div>
	</div>
	<br><br><br><br>
	<br>
	<div class="container" style="margin-left: 500px;">

		<form name="newWrite" action="./BoardWriteAction.do"
			class="form-horizontal" method="post" onSubmit="return checkForm()">
			<input name="id" type="hidden" class="form-control"
				value="${sessionId}">
			<div class="form-group row">
				<label class="col-sm-2 control-label" ><b>작성자</b></label>
				<div class="col-sm-2">
					<input name="name" type="text" class="form-control" value="<%=name%>"
						placeholder="name">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 control-label" ><b>제목</b></label>
				<div class="col-sm-5">
					<input name="subject" type="text" class="form-control"
						placeholder="제목을 입력해주세요">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 control-label" ><b>내용</b></label>
				<div class="col-sm-6">
					<textarea name="content" cols="20" rows="15" class="form-control"
						placeholder="content">> 답변 연락 받으실 연락처 : 
----------------------------------------------------------------------
</textarea>
				</div>
			</div>
			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10 ">
				 <input type="submit" class="btn btn-secondary " value="등록하기 ">				
					 <input type="reset" class="btn btn-light " value="취소하기 ">
				</div>
			</div>
		</form>
	</div>
	<hr>
	<jsp:include page="../footer.jsp" />
</body>
</html>



          