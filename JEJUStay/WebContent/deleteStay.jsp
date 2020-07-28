<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*" %>
<%@ include file ="dbconn.jsp"%>
<%
	String stay_code = request.getParameter("code");
	
	PreparedStatement pstmt = null;	
	ResultSet rs = null;

	String sql = "select * from tbl_stay";
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
	
	if(rs.next()) {
		sql = "delete from tbl_stay where stay_code=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, stay_code);
		pstmt.executeUpdate();
	}else 
		out.println("일치하는 상품이 없습니다.");
	
	if(rs != null) rs.close();
	if(pstmt != null) pstmt.close();
	if(conn != null) conn.close();
	
	response.sendRedirect("editStay.jsp?edit=delete");
%>