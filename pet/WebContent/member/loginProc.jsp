<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="pmMgr" class="com.pet.dao.PetMemberMgr"/>
<%
	request.setCharacterEncoding("utf-8");
	String userId=request.getParameter("userId");
	String userPwd=request.getParameter("userPwd");
	String url="../index.jsp";
	String msg="로그인에 실패하였습니다.";
	
	boolean result=pmMgr.loginMember(userId, userPwd);
	if(result){
		session.setAttribute("idKey", userId);
		msg="로그인에 성공하였습니다.";
	}
%>
<script>
	alert("<%=msg%>");
	location.href="<%=url%>";
</script>