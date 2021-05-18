<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="dao" class="com.pet.dao.PetBoardMgr"/>

<%
	request.setCharacterEncoding("utf-8");
	String userId=(String)session.getAttribute("idKey");
	dao.insertBoard(request, userId);
	response.sendRedirect("list.jsp");
%>