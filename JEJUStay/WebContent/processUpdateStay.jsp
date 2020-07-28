<%@page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ include file="dbconn.jsp" %>
<%
	String stay_fileName= "";
	String stay_fileRoom= "";
	String stay_fileInfo= "";
	String realFolder = "C:\\upload"; //웹 어플리케이션상의 절대 경로
	String encType = "utf-8"; //인코딩 타입
	int maxSize = 5 * 1024 * 1024; //최대 업로드될 파일의 크기5Mb

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
	ResultSet rs = null;
	
	String sql = "select * from tbl_stay where stay_code = ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, stay_code);
	rs = pstmt.executeQuery();	
	
	if (rs.next()) {		
		if (fileName != null) {
			sql = "UPDATE product SET stay_code=?, stay_type=?, stay_name=?, stay_place=?, stay_address=?, stay_roomType=?, price=?, max=?, fileName=?, fileRoom=?, fileInfo=? WHERE stay_code=?";	
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
		} else {
			sql = "UPDATE product SET stay_code=?, stay_type=?, stay_name=?, stay_place=?, stay_address=?, stay_roomType=?, price=?, max=? WHERE stay_code=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, stay_code);
			pstmt.setString(2, stay_type);
			pstmt.setString(3, stay_name);
			pstmt.setString(4, stay_place);
			pstmt.setString(5, stay_address);
			pstmt.setString(6, stay_roomType);
			pstmt.setInt(7, price);
			pstmt.setInt(8, max);
			pstmt.executeUpdate();			
		}		
	}
	if (rs != null)
		rs.close();
	if (pstmt != null)
		pstmt.close();
	if (conn != null)
		conn.close();
	
	response.sendRedirect("editStay.jsp?edit=update");
%>



