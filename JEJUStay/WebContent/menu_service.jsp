<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<title>고객센터 | 제주의밤</title>
</head>
<style>
body {
	margin: 20px auto;
	padding: 0;
	font-family: "맑은 고딕";
	font-size: 3em;
	margin-left: 30px
}

ul#Vertical {
	width: 250px;
	lengh: 50px;
	text-indent: 20px;
}

ul#Vertical, ul#Vertical ul {
	margin: 0;
	padding: 0;
	list-style: none;
}

li.group {
	margin-bottom: 3px;
}

li.group div.title {
	height: 65px;
	line-height: 65px;
	background: #6799FF;
	cursor: pointer;
	color: #fff;
	font-size: 20px;
	font-weight: bold;
}

ul.sub li {
	margin-bottom: 2px;
	height: 40px;
	line-height: 40px;
	background: #f4f4f4;
	cursor: pointer;
}

ul.sub li a {
	display: block;
	width: 100%;
	height: 100%;
	text-decoration: none;
	color: #000;
}

ul.sub li:hover {
	background: #D9E5FF;
}
</style>
<body>
	<jsp:include page="menu.jsp" />
	<ul id="Vertical">
        <li class="group">
            <div class="title">고객센터</div>
            <ul class="sub">
                <li><a href="http://localhost:9090/JEJUStay/BoardListAction.do?pageNum=1">문의게시판</a></li>
                <li><a href="http://localhost:9090/JEJUStay/service/privacyStatement.jsp">개인정보 취급방침</a></li>
                <li><a href="http://localhost:9090/JEJUStay/service/useTerms.jsp">이용약관</a></li>
                <li><a href="http://localhost:9090/JEJUStay/service/standardTerms.jsp">국내여행약관</a></li>
                <li><a href="http://localhost:9090/JEJUStay/service/refundRule.jsp">환불규정</a></li>
            </ul>
        </li>       
    </ul>	
</body>
</html>