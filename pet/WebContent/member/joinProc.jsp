<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8");%>
<jsp:useBean id="pmMgr" class="com.pet.dao.PetMemberMgr"/>
<jsp:useBean id="bean" class="com.pet.vo.PetMemberBean"/>
<jsp:setProperty name="bean" property="*"/>
<%
	boolean result=pmMgr.insertMember(bean);
	if(result){
%>
	<script>
		alert("회원가입을 하였습니다.");
		location.href="../index.jsp";
	</script>
<%
	}else{
%>
	<script>
		alert("회원가입에 실패하였습니다.");
		history.back();
	</script>
<%
	}
%>