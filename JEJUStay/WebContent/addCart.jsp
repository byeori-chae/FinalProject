<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dto.StayDTO" %>
<%@ page import="dao.StayDAO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품바구니 | 제주의밤</title>
</head>
<body>

<%
	
	request.setCharacterEncoding("utf-8");
	//체크인,체크아웃 날짜
	String checkin = request.getParameter("checkin");
	String checkout = request.getParameter("checkout");
//	SimpleDateFormat fm = new SimpleDateFormat("yyyy-MM-dd");
	Date rsvCheckin = Date.valueOf(checkin);
	Date rsvCheckout = Date.valueOf(checkout);
	
	//숙박 기간 계산(체크아웃일 - 체크인일)
	long days = rsvCheckout.getTime() - rsvCheckin.getTime();
	int rsvDays = (int) (days / (24 * 60 * 60* 1000));
	out.println(rsvDays);
	//인원(성인,소아)
	int rsvAdult = Integer.parseInt(request.getParameter("adult"));
	int rsvChild = Integer.parseInt(request.getParameter("child"));
	
	//예약접수일
	Date rsvDate = new Date(System.currentTimeMillis());
	
	//장바구니
	String code = request.getParameter("code");
	if(code == null || code.trim().equals("")) {
		response.sendRedirect("http://localhost:9090/JEJUStay/stayAll.jsp");
		return;
	}

	
	StayDAO dao = StayDAO.getInstance(); 

	
	StayDTO dto = dao.getStayByCode(code);
	
	if(dto==null) {
		out.print("오류");
	}
	
	//장바구니 입력정보 DB에 저장
	dao.insertCart(code,rsvDate,rsvCheckin,rsvCheckout,rsvAdult,rsvChild,rsvDays);
	
	//상품 목록을 얻어오도록 StayDAO 객체의 getCart() 메소드를 호출하여 ArrayList에 저장
	ArrayList<StayDTO> staysList = dao.getCart();
	StayDTO stays = new StayDTO();
	
	for(int i=0; i<staysList.size(); i++) {
		stays = staysList.get(i);
//		if(stays.getStayCode().equals(code)){		
//			break;
//		}		
	}
	
	int cnt = 0;
	StayDTO staysQnt = new StayDTO();

	response.sendRedirect("http://localhost:9090/JEJUStay/cart.jsp?code="+code);

%>

</body>
</html>