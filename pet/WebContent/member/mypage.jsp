<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="pmMgr" class="com.pet.dao.PetMemberMgr"/>
<jsp:useBean id="bean" class="com.pet.vo.PetMemberBean"/>
<%
	request.setCharacterEncoding("utf-8");
	String userId=(String)session.getAttribute("idKey");
	
	bean=pmMgr.getMember(userId);
%>
            <table>
                <tr>
                    <th>아이디</th>
                    <th>이름</th>
                    <th>이메일</th>
                    <th>성별</th>
                </tr>
                <tr>
                  	<td><%=bean.getUserId() %></td>
					<td><%=bean.getName() %></td>
					<td><%=bean.getEmail() %></td>
					<%
						String num=bean.getGender();
						String sex=null;
						if(num.equals("1")) sex="남자";
						else sex="여자";
					%>
					<td><%=sex %></td>
            </table>
			<jsp:include page="../reservation/checkReservation.jsp" flush="false"></jsp:include>
            <ul class="btnGroup">
                <li><a href="/pet/member/updateInfo.jsp">정보수정</a></li>
                <li><a href="/pet/member/deleteMember.jsp">회원 탈퇴</a></li>
            </ul>