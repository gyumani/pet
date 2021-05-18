<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="pmMgr" class="com.pet.dao.PetMemberMgr"/>
<%
	request.setCharacterEncoding("utf-8");
	String userId=request.getParameter("userId");
	String findPwdQuest=request.getParameter("findPwdQuest");
	String findPwdAnswer=request.getParameter("findPwdAnswer");
	String userPwd=pmMgr.findPwd(userId, findPwdQuest, findPwdAnswer);
			
%>
	
	<jsp:include page="../include/pet-find-header.jsp" flush="false"></jsp:include>
	<%
		if(userPwd!=null){
	%>
	 <p><%=userId %>님의 패스워드는 <strong><%=userPwd%></strong>입니다.</p>
	<br/><a href="#" onClick="self.close()">닫기</a>
	<% 		
		}else{
	%>
	<p>회원정보가 존재하지 않거나 질문에 대한 답변이 존재하지 않습니다.</p>
	<br/><a href="#" onClick="history.go(-1)">이전페이지로</a>
	<% 
		}
	%>
</body>
</html>