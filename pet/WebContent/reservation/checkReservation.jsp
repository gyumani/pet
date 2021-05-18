<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="prMgr" class="com.pet.dao.PetReservationMgr"/>
<jsp:useBean id="bean" class="com.pet.vo.PetReservationBean"/>
<%
	request.setCharacterEncoding("utf-8");
	String userId=(String)session.getAttribute("idKey");
	
	bean=prMgr.getReservation(userId);
	boolean result=prMgr.checkReservation(userId);
%>
<%
if(result){
%>
	<table>
		<tr>
			<th>예약자 이름</th>
			<th>체크인</th>
			<th>체크아웃</th>
			<th>패키지</th>
		<tr>
		<tr>
			<td><%=bean.getName() %></td>
			<td><%=bean.getDateStart() %></td>
			<td><%=bean.getDateEnd() %></td>
			<td><%=bean.getWithPackage() %></td>
		</tr>
	</table>
	<ul class="btnGroup">
		<li><a href="/pet/reservation/deleteReservation.jsp">예약삭제</a></li>
		<li><a href="/pet/reservation/updateReservation.jsp">예약수정</a></li>
	</ul>
<%
}else{
%>
<p class="check_reser">예약정보가 없습니다.</p>
<%
}
%>