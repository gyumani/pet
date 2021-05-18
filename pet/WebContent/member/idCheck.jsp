<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:useBean id="pmMgr" class="com.pet.dao.PetMemberMgr"/>
<%
	request.setCharacterEncoding("utf-8");
	String userId=request.getParameter("userId");
	boolean result=pmMgr.checkId(userId);
%>
<meta charset="UTF-8">
<title>ID 중복체크</title>
</head>
<body>
	<div>
		<br/><b><%=userId %></b>
		<%
			if(result){
				out.println("는 이미 존재하는 ID입니다.<p>");
			}else{
				out.println("는 사용 가능 합니다. <p>");
			}
		%>
		<a href="#" onClick="self.close()">닫기</a>
	</div>
</body>
</html>