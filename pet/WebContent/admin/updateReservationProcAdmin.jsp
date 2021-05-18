<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8");%>
<jsp:useBean id="prMgr" class="com.pet.dao.PetReservationMgr"/>
<jsp:useBean id="bean" class="com.pet.vo.PetReservationBean"/>
<jsp:setProperty name="bean" property="*"/>
<%
	String userId=request.getParameter("userId");
	bean.setUserId(userId);
	boolean result=prMgr.updateReservation(bean);
	if(result){
%>
	<script>
		alert("예약정보수정을 하였습니다.");
		location.href="../index.jsp";
	</script>
<%
	}else{
%>
	<script>
		alert("예약정보수정에 실패하였습니다.");
		history.back();
	</script>
<%
	}
%>