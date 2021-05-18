<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="bm" class="com.pet.dao.PetBoardMgr"/>
<jsp:useBean id="reBean" class="com.pet.vo.PetBoardBean"/>
<jsp:setProperty name="reBean" property="*"/>

<%
	String userId=(String)session.getAttribute("idKey");
	bm.replyUpBoard(reBean.getRef( ), reBean.getPos( ));	
	bm.replyBoard(reBean, userId);
	String nowPage = request.getParameter("nowPage");
	response.sendRedirect("list.jsp?nowPage="+nowPage);
%>