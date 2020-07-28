<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dto.StayDTO" %>
<%@ page import="dao.StayDAO" %>

<%
	String code = request.getParameter("code");
	if(code == null || code.trim().equals("")) {
		response.sendRedirect("menuRoom.jsp");
		return;
	}
	
	StayDAO dao = StayDAO.getInstance(); //상품데이터 접근 클래스 DAO의 기본생성자에 대한 객체 변수 instance를 얻도록 작성
	
	StayDTO dto = dao.getStayByCode(code);
	if(dto == null) {
		out.print("오류");
	}
	
	//상품 목록을 얻어오도록 productDAO 객체의 getAllStays() 메소드를 호출하여 ArrayList에 저장
	ArrayList<StayDTO> staysList = dao.getAllStays();
	StayDTO stays = new StayDTO();
	for(int i=0; i<staysList.size(); i++) {
		stays = staysList.get(i);
		if(stays.getStayCode().equals(code)) {
			break;
		}
	}
	
	ArrayList<StayDTO> list = (ArrayList<StayDTO>)session.getAttribute("cartlist");
	if(list == null) {
		list = new ArrayList<StayDTO>();
		session.setAttribute("cartlist", list);
	}
	
	int cnt = 0;
	StayDTO staysQnt = new StayDTO();
	
	for(int i = 0; i < list.size(); i++) {
		staysQnt = list.get(i);
		if(staysQnt.getStayCode().equals(code)) {
			cnt++;
			int orderQuantity = staysQnt.getQuantity() + 1;
			staysQnt.setQuantity(orderQuantity);
		}
	}
	
	if(cnt == 0) {
		stays.setQuantity(1);
		list.add(stays);
	}
	
	response.sendRedirect("menuRoom.jsp?code="+code);
	
	
	
%>