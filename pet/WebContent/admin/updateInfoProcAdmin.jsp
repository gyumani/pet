<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8");%>
<jsp:useBean id="pmMgr" class="com.pet.dao.PetMemberMgr"/>
<jsp:useBean id="bean" class="com.pet.vo.PetMemberBean"/>
<jsp:setProperty name="bean" property="*"/>
<%
	String userId=request.getParameter("userId");
	bean.setUserId(userId);
	boolean result=pmMgr.updateMember(bean);
	if(result){
%>
	<script>
		alert("정보 수정을 하였습니다.");
		location.href="admin.jsp";
	</script>
<%
	}else{
%>
	<script>
		alert("정보 수정에 실패하였습니다.");
		history.back();
	</script>
<%
	}
%>