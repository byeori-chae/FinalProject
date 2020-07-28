<%@page language="java" contentType="text/html; charset=utf-8"%>
<%@page import="java.util.*"%>
<%@page import="com.oreilly.servlet.multipart.*"%>
<%@page import="com.oreilly.servlet.*"%>
<%@ page import="java.sql.*"%>
<%@ include file ="dbconn.jsp"%>

<%
	request.setCharacterEncoding("UTF-8");
	
	String stay_fileName= "";
	String stay_fileRoom= "";
	String stay_fileInfo= "";
	String realFolder = "C:\\upload"; 	//웹 애플리케이션 상의 절대 경로
	int maxSize = 5 * 1024 * 1024;		//최대 업로드될 파일의 크기 5MB
	String encType = "utf-8";			//인코딩 유형
	
	MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());
	
	String stay_code = multi.getParameter("stay_code");
	String stay_type = multi.getParameter("stay_type");
	String stay_name = multi.getParameter("stay_name");
	String stay_place = multi.getParameter("stay_place");
	String stay_address = multi.getParameter("stay_address");
	String stay_roomType = multi.getParameter("stay_roomType");
	String stay_price = multi.getParameter("stay_price");
	String stay_max = multi.getParameter("stay_max");

	Integer price;

	if (stay_price.isEmpty()) {
		price = 0; 
	} else {
		price = Integer.valueOf(stay_price);
	}

	Integer max;

	if (stay_max.isEmpty()) {
		max = 0;
	} else {
		max = Integer.valueOf(stay_max);
	}
	
	Enumeration files1= multi.getFileNames();
	Enumeration files2 = multi.getFileNames();
	Enumeration files3 = multi.getFileNames();
	
	String fname = (String) files1.nextElement();
	String fRoom = (String) files2.nextElement();
	String fInfo = (String) files3.nextElement();
	
	String fileName = multi.getFilesystemName(fname);
	String fileRoom = multi.getFilesystemName(fRoom);
	String fileInfo = multi.getFilesystemName(fInfo);

	PreparedStatement pstmt = null;
	
	String sql = "insert into tbl_stay values(?,?,?,?,?,?,?,?,?,?,?)";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, stay_code);
	pstmt.setString(2, stay_type);
	pstmt.setString(3, stay_name);
	pstmt.setString(4, stay_place);
	pstmt.setString(5, stay_address);
	pstmt.setString(6, stay_roomType);
	pstmt.setInt(7, price);
	pstmt.setInt(8, max);
	pstmt.setString(9, fileName);
	pstmt.setString(10, fileRoom);
	pstmt.setString(11, fileInfo);
	
	pstmt.executeUpdate();
	
	if(pstmt != null) pstmt.close();
	if(conn != null) conn.close();

	response.sendRedirect("menuRoom.jsp");
%>
