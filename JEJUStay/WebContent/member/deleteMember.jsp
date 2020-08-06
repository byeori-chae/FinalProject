<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%
	String sessionId = (String) session.getAttribute("sessionId");
%>
<sql:setDataSource var="dataSource"
	url="jdbc:mysql://localhost:3306/jejudb"
	driver="com.mysql.jdbc.Driver" user="root" password="12345" />

<sql:update dataSource="${dataSource}" var="resultSet">
   DELETE FROM tbl_member WHERE mem_id = ?
   <sql:param value="<%=sessionId%>" />
</sql:update>

<c:if test="${resultSet>=1}">
	<c:import var="url" url="http://localhost:9000/JEJUStay/member/logoutMember.jsp" />
	<c:redirect url="http://localhost:9000/JEJUStay/member/resultMember.jsp" />
</c:if>

<hr>
<jsp:include page="../footer.jsp" />

