<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="board.model.BoardDTO"%>
<%@ page import="board.model.BoardDAO"%>
<%
   String sessionId = (String) session.getAttribute("sessionId");
   List boardList = (List) request.getAttribute("boardlist");
   int total_record = ((Integer) request.getAttribute("total_record")).intValue();
   int pageNum = ((Integer) request.getAttribute("pageNum")).intValue();
   int total_page = ((Integer) request.getAttribute("total_page")).intValue();
%>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script   src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<title>문의게시판 | 제주의밤</title>

<script type="text/javascript">
   function checkForm() {   
      if (${sessionId==null}) {
         alert("로그인 해주세요.");
         return false;
      }
      location.href = "./BoardWriteForm.do?id=<%=sessionId%>"
   }

</script>
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
</head>
<body>
   <jsp:include page="../menu_service.jsp" />
   <marquee behavior="alternate" scrolldelay="100" direction="right" style="margin-top: -300px;"><font color="#29088A">
   <b>★ 제주의 밤 문의 게시판 입니다. 문의 시 연락처를 남겨주시면 담당자가 연락드리며, 연락처 누락 시 답변 어려운 점 참고 바랍니다. ★</b></font></marquee>
   <div class="container">
   <div style="margin-top: -250px;">
      <h1 class="display-4" style="font-size: 35px; color:#6799FF; margin:0px 0px;">
         <b>문의 게시판</b>
      </h1>
   </div>
   <br>
   <div class="container">
      <form action="<c:url value="./BoardListAction.do"/>" method="post">
         <div>
            <div class="text-right">
               <span class="badge badge-success">전체 <%=total_record%>건   </span>
            </div>
         </div>
         <div style="padding-top: 50px">
            <table class="table table-striped">
               <tr>
                  <th class="col-sm-1" style="text-align: center;">번호</th>
                  <th class="col-sm-5" style="text-align: center;">제목</th>
                  <th class="col-sm-2" style="text-align: center;">작성일</th>
                  <th class="col-sm-1" style="text-align: center;">조회</th>
                  <th class="col-sm-2" style="text-align: center;">글쓴이</th>
               </tr>
               <%
                  for (int j = 0; j < boardList.size(); j++) {
                     BoardDTO notice = (BoardDTO) boardList.get(j);
               %>
               <tr>
                  <td class="col-sm-1" style="text-align: center;"><%=notice.getNum()%></td>
                  <td class="col-sm-1" style="text-align: center;"><a href="./BoardViewAction.do?num=<%=notice.getNum()%>&pageNum=<%=pageNum%>"><%=notice.getSubject()%></a></td>
                  <td class="col-sm-1" style="text-align: center;"><%=notice.getRegist_day()%></td>
                  <td class="col-sm-1" style="text-align: center;"><%=notice.getHit()%></td>
                  <td class="col-sm-1" style="text-align: center;"><%=notice.getName()%></td>
               </tr>
               <%
                  }
               %>
            </table>
         </div>
         <div align="center">
            <c:set var="pageNum" value="<%=pageNum%>" />
            <c:forEach var="i" begin="1" end="<%=total_page%>">
               <a href="<c:url value="./BoardListAction.do?pageNum=${i}" /> ">
                  <c:choose>
                     <c:when test="${pageNum==i}">
                        <font color='4C5317'><b> [${i}]</b></font>
                     </c:when>
                     <c:otherwise>
                        <font color='4C5317'> [${i}]</font>
                     </c:otherwise>
                  </c:choose>
               </a>
            </c:forEach>
         </div>
         <div align="left">
            <table>
               <tr>
                  <td width="100%" align="left">&nbsp;&nbsp; 
                  <select name="items" class="txt">
                        <option value="subject">제목에서</option>
                        <option value="content">본문에서</option>
                        <option value="name">글쓴이에서</option>
                  </select> <input name="text" type="text" /> <input type="submit" id="btnAdd" class="btn btn-primary" value="검색 " />
                  </td>
                  <td width="100%" align="right">
                     <a href="#" onclick="checkForm(); return false;" class="btn btn-info">&laquo;글쓰기</a>
                  </td>
               </tr>
            </table>
         </div>
      </form>
      <hr>
   </div>
   </div>
   <hr>
   <jsp:include page="../footer.jsp" />
</body>
</html>