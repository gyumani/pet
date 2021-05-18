<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <jsp:useBean id="pmMgr" class="com.pet.dao.PetMemberMgr"/>
 <jsp:useBean id="prMgr" class="com.pet.dao.PetReservationMgr"/>
 <jsp:useBean id="pbMgr" class="com.pet.dao.PetBoardMgr"/>
<%
	request.setCharacterEncoding("utf-8");
	String userId=(String)session.getAttribute("idKey");
	String url="../index.jsp";
	String msg="회원탈퇴에 실패하였습니다.";

	boolean result1=prMgr.deleteReservation(userId);
	pbMgr.deleteBoardUserId(userId);
	boolean result=pmMgr.deleteMember(userId);
	
	if(result ){
		session.invalidate();
		msg="성공적으로 회원탈퇴를 하였습니다.";
	}
%>
	<script>
		alert('<%=msg%>');
		location.href="<%=url%>";
	</script>