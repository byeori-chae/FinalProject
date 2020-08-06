<%@page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ include file="dbconn.jsp" %>
<%
   request.setCharacterEncoding("UTF-8");

   String stay_fileName= "";
   String stay_fileRoom= "";
   String stay_fileInfo= "";
   String original_stay_fileName= "";
   String original_stay_fileRoom= "";
   String original_stay_fileInfo= "";
   String realFolder = request.getSession().getServletContext().getRealPath("/media"); //웹 어플리케이션상의 절대 경로
   String encType = "utf-8"; //인코딩 타입
   int maxSize = 5 * 1024 * 1024; //최대 업로드될 파일의 크기5Mb

//request: 요청받은 내용 / realFolder: 업로드할 실제 경로 /maxSize: 한번에 업로드할 때마다 최대 파일 크기 /encType: 제목, 내용등 인코딩타입 / 중복이름 삭제
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

   Enumeration files= multi.getFileNames();
   
   String fname = (String) files.nextElement();
   stay_fileName = multi.getFilesystemName(fname);
   original_stay_fileName = multi.getOriginalFileName(fname);
   
   
   String fRoom = (String) files.nextElement();
   stay_fileRoom = multi.getFilesystemName(fRoom);
   original_stay_fileRoom = multi.getOriginalFileName(fRoom);
   
   String fInfo = (String) files.nextElement();
   stay_fileInfo = multi.getFilesystemName(fInfo);
   original_stay_fileInfo = multi.getOriginalFileName(fInfo);
   

   PreparedStatement pstmt = null;
   ResultSet rs = null;
   
   String sql = "select * from tbl_stay where stay_code = ?";
   pstmt = conn.prepareStatement(sql);
   pstmt.setString(1, stay_code);
   rs = pstmt.executeQuery();   
   
   if (rs.next()) {      
      if (stay_fileName != null) {
         sql = "UPDATE tbl_stay SET stay_type=?, stay_name=?, stay_place=?, stay_address=?, stay_roomType=?, stay_price=?, stay_max=?, stay_fileName=?, stay_fileRoom=?, stay_fileInfo=? WHERE stay_code=?";   
         pstmt = conn.prepareStatement(sql);
         
         pstmt.setString(1, stay_type);
         pstmt.setString(2, stay_name);
         pstmt.setString(3, stay_place);
         pstmt.setString(4, stay_address);
         pstmt.setString(5, stay_roomType);
         pstmt.setInt(6, price);
         pstmt.setInt(7, max);
         pstmt.setString(8, stay_fileName);
         pstmt.setString(9, stay_fileRoom);   
         pstmt.setString(10, stay_fileInfo);
         pstmt.setString(11, stay_code);
         pstmt.executeUpdate();
      } else {
         sql = "UPDATE tbl_stay SET stay_type=?, stay_name=?, stay_place=?, stay_address=?, stay_roomType=?, stay_price=?, stay_max=? WHERE stay_code=?";
         pstmt = conn.prepareStatement(sql);
         
         pstmt.setString(1, stay_type);
         pstmt.setString(2, stay_name);
         pstmt.setString(3, stay_place);
         pstmt.setString(4, stay_address);
         pstmt.setString(5, stay_roomType);
         pstmt.setInt(6, price);
         pstmt.setInt(7, max);
         pstmt.setString(8, stay_code);
         pstmt.executeUpdate();   
      }      
   }
   if (rs != null)
      rs.close();
   if (pstmt != null)
      pstmt.close();
   if (conn != null)
      conn.close();
   
   response.sendRedirect("http://localhost:9090/JEJUStay/editStay.jsp?edit=update");
%>