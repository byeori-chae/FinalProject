<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	String password = request.getParameter("password");
	String name = request.getParameter("name");
	String year = request.getParameter("birthyy");
	String month = request.getParameterValues("birthmm")[0];
	String day = request.getParameter("birthdd");
	String birth = year + "-" + month + "-" + day;
	String mail1 = request.getParameter("mail1");
	String mail2 = request.getParameterValues("mail2")[0];
	String mail = mail1 + "@" + mail2;
	String phone1 = request.getParameter("phone1");
	String phone2 = request.getParameter("phone2");
	String phone3 = request.getParameter("phone3");
	String phone = phone1 + "-" + phone2 + "-" + phone3;

%>

<sql:setDataSource var="dataSource"
	url="jdbc:mysql://localhost:3306/jejudb"
	driver="com.mysql.jdbc.Driver" user="root" password="12345" />

<sql:update dataSource="${dataSource}" var="resultSet">
   INSERT INTO tbl_member VALUES (null, ?, ?, ?, ?, ?, ?)
    <sql:param value="<%=id%>" />
	<sql:param value="<%=password%>" />
	<sql:param value="<%=name%>" />
	<sql:param value="<%=birth%>" />
	<sql:param value="<%=phone%>" />
	<sql:param value="<%=mail%>" />
</sql:update>

<c:if test="${resultSet>=1}">
	<c:redirect url="http://localhost:9000/JEJUStay/member/resultMember.jsp?msg=1" />
</c:if>

