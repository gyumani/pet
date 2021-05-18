<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="pmMgr" class="com.pet.dao.PetMemberMgr"/>
<%
	request.setCharacterEncoding("utf-8");
	String name=request.getParameter("name");
	String email=request.getParameter("email");
	String userId=pmMgr.findId(name, email);
%>
	<jsp:include page="../include/pet-find-header.jsp" flush="false"></jsp:include>
	<%
		if(userId!=null){
	%>
	 <p>당신의 아이디는 <strong><%=userId%></strong>입니다.</p>
	<br/><a href="#" onClick="self.close()">닫기</a>
	<% 		
		}else{
	%>
	<p>회원정보가 존재하지 않습니다.</p>
	<br/><a href="#" onClick="history.go(-1)">이전페이지로</a>
	<% 
		}
	%>
</body>
</html>