<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ page import="dao.ReserveDAO"%>
<%@ page import="dto.ReserveDTO"%>
<html>
<head>
<title>취소</title>
</head>
<body>
	<%
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		ReserveDAO dao = new ReserveDAO();
		ReserveDTO dto = new ReserveDTO();
		
	%>
	<%
		dto.setRsvCancelFee(Integer.parseInt(request.getParameter("rsv_cancelFee")));
		dto.setRsvCancelReason(request.getParameter("rsv_cancelReason"));
		dto.setRsvRefund(Integer.parseInt(request.getParameter("rsv_refund")));
		dto.setRsvIdx(Integer.parseInt(request.getParameter("rsv_idx")));
		
		int result = dao.cancel_insert(dto);
	
		response.sendRedirect("adminDetails.jsp?rsv_idx="+dto.getRsvIdx()); 
	%>
</body>
</html>