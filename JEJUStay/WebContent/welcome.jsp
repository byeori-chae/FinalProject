<html>
<%@ page contentType="text/html; charset=utf-8" %>

<head>
<title>Welcome | 제주의밤</title>
<link rel="stylesheet" href="resources/css/search.css" />
 <script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
 <script src="resources/js/mainbanner.js"></script>
 <style type="text/css">
* {
	margin: 0;
	padding: 0;
}

body {
	font-family: "돋움", dotum, sans-serif;
	color: #000;.
}

li {
	list-style: none;
}

#wrap {
	width: 1080px;
	position: relative;
	margin: 0 auto;
}

#wrap #banner {
	border-radius: 10px;
	padding: 15px 35px;
	margin-bottom: 10px;
}

#wrap #banner .vis_frame {
	width: 1000px;
	height: 400px;
	overflow: hidden;
	position: relative;
}

#wrap #banner .vis_frame ul {
	width: 175px;
}

#wrap #banner .vis_frame ul li {
	width: 1000px;
	padding: 0 8px;
}

#wrap #b_control {
	position: absolute;
	right: 0;
	top: 5px;
}

#wrap #b_bt a.left {
	position: absolute;
	left: 15px;
	top: 50%;
}

#wrap #b_bt a.right {
	position: absolute;
	right: 15px;
	top: 50%;
}

 </style>
</head>

<body>
	<%@ include file = "/menu.jsp" %>	
		<div id="wrap">
			<div id="banner" style="text-align: center">
				<div class="vis_frame">
					<ul>
						<li><a href="#"><img src="media/main1.png" alt="" height="400" align="top" vspace=50 hspace=50/></a></li>
						<li><a href="#"><img src="media/main1-2.PNG" alt="" width="1000" height="400" align="top" vspace=50 hspace=50/></a></li>
						<li><a href="#"><img src="media/main1-3.PNG" alt="" width="1000" height="400" align="top" vspace=50 hspace=50/></a></li>
					</ul>
				</div>
			</div>
			<div id="b_bt">
				<a href="#left" class="left"><img src="media/left.gif" alt="이전 배너이미지" /></a> 
				<a href="#right" class="right"><img src="media/right.gif" alt="다음 배너이미지" /></a>
			</div>
		</div>
		
		<!-- 검색창 -->
		
		<div class="container" style="padding-top: 50px" >
		  <div class="row" >
			<div class="form-group" >
				 <form name="search" class="form-inline" action="http://localhost:9090/JEJUStay/stayAll.jsp?" style="padding-left: 250px" onSubmit="return checkForm()">					
					<input type="text" name="keyField" class="form-control" placeholder="숙소명 " size=70/>
					<input type="submit" class="btn btn-default btn-group-lg" value="찾기">
				 </form>				  		
			</div>			
		  </div>
		  <br>
		    <div class="form-group row" >
				<div class="col-sm-5" style="padding-left: 220px">
					<a href="http://localhost:9090/JEJUStay/stayHotel.jsp"><img src="media/main2.png" width="280" height="180"></a>
				</div>
				<div class="col-sm-5" style="padding-left: 100px">
					<a href="http://localhost:9090/JEJUStay/stayPension.jsp"><img src="media/main3.png" width="280" height="180"></a>
				</div>
		  	</div>
			<div class="form-group row">
				<div class="col-sm-5" style="padding-left: 220px">
					<a href="http://localhost:9090/JEJUStay/stayResort.jsp"><img src="media/main4.png" width="280" height="180"></a>
				</div>
				<div class="col-sm-5" style="padding-left: 100px">
					<a href="http://localhost:9090/JEJUStay/stayCaravan.jsp"><img src="media/main5.png" width="280" height="180"></a>
				</div>
		
			</div>
		</div>
		<!-- 
		
				<div class="input-group" style="width:500px" >
					<input type="text" name="search" class="form-control" placeholder="숙소명, 지역명 ">
					  <div>
						<button type="button" class="btn btn-default btn-group-lg">
							<span class="glyphicon glyphicon-search" aria-hidden="true" onclick="#"></span> 찾기
						</button>
					  </div>
				</div>
		-->		
		<!-- /.row -->
		<br><br><br>
		<hr>
<jsp:include page="footer.jsp" />	
</body>
</html>
<script type="text/javascript">
function checkForm() {
		if (!document.search.keyField.value) {
			alert("검색어를 입력하세요.");
			return false;
		}
	}
</script>