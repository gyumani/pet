<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8");%>
<jsp:useBean id="prMgr" class="com.pet.dao.PetReservationMgr"/>
<jsp:useBean id="bean" class="com.pet.vo.PetReservationBean"/>
<jsp:setProperty name="bean" property="*"/>
<%
	boolean result=prMgr.insertReservation(bean);
	if(result){
%>
	<script>
		alert("예약을 하였습니다.");
		history.back();
	</script>
<%
	}else{
%>
	<script>
		alert("예약에 실패하였습니다.");
		history.back();
	</script>
<%
	}
%>