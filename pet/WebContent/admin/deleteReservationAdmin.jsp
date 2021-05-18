<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="prMgr" class="com.pet.dao.PetReservationMgr"/>
<jsp:useBean id="bean" class="com.pet.vo.PetReservationBean"/>
<%
	request.setCharacterEncoding("utf-8");
	String userId=request.getParameter("userId");
	String url="readAdmin.jsp";
	String msg="예약취소에 실패하였습니다.";
	
	boolean result=prMgr.deleteReservation(userId);
	if(result){
		msg="성공적으로 예약을 취소하였습니다.";
	}
%>
	<script>
		alert('<%=msg%>');
		location.href="<%=url%>";
	</script>