<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dto.StayDTO"%>
<%@ page import="dao.StayDAO"%>

<%
	String code = request.getParameter("code");
	if(code == null || code.trim().equals("")) {
		response.sendRedirect("menuRoom.jsp"); //전송된 코드가 없을 때 웹페이지 menuroom으로 이동하도록 
		return;
	}
	
	StayDAO dao = StayDAO.getInstance(); //숙소데이터 접근 클래스 DAO의 기본생성자에 대한 객체 변수 instance를 얻도록 작성
	
	StayDTO dto = dao.getStayByCode(code); //숙소 코드에 대한 정보 얻어오도록 DAO객체의 getStayByCode()메소드 호출 → dto에 저장
	if(dto == null) {
		out.print("오류");	//코드에 대한 정보가 없으면 오류나옴
	}
	
	ArrayList<StayDTO> cartList = (ArrayList<StayDTO>)session.getAttribute("cartlist"); //상품 바구니 cartList에 등록된 모든 상품 가져오도록 
	
	StayDTO staysQnt = new StayDTO();	//dto객체 생성
	
	for(int i=0; i<cartList.size(); i++) {	//cartList에 등록된 숙소상품을 하나씩 가져와서 요청 파라미터 코드랑 같음녀 cartlist에서 삭제하도록 작성
		staysQnt = cartList.get(i);
		if(staysQnt.getStayCode().equals(code)) {
			cartList.remove(staysQnt);
		}
	}
	
	response.sendRedirect("cart.jsp");
%>