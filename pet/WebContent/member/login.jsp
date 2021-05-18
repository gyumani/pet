<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String userId=(String)session.getAttribute("idKey");
%>
<script>
	function loginCheck(){
		if(document.loginFrm.userId.value==""){
			alert("아이디를 입력해주세요.");
			document.loginFrm.userId.focus();
			return;
		}
		if(document.loginFrm.userPwd.value==""){
			alert("비밀번호를 입력해 주세요");
			document.loginFrm.userPwd.focus();
			return;
		}
		
		document.loginFrm.submit();
	}
	function findId(){
		url="/pet/member/findId.jsp";
		window.open(url,"findId","width=500, height=200,scrollbars=yes");
	}
	
	function findPwd(){
		url="/pet/member/findPwd.jsp";
		window.open(url,"findPwd","width=500, height=200,scrollbars=yes");
	}
</script>
	<%
		if(userId!=null){
	%>
	<div id="modal">
        <div class="login">
            <h3><span>My</span>page</h3>
			<p class="welcome">
				<strong><%=userId %></strong>님 환영합니다.
				<%
				if(userId.equals("admin")){
				%>
				<a href="/pet/admin/admin.jsp">관리자페이지</a>	
				<%	
				}
				%>
				<jsp:include page="../member/mypage.jsp" flush="false"/>
			</p>
            <button type="button" id="login-close-btn">X</button>
        </div>
    </div>
    <%
    } else{
	%>
	<div id="modal">
        <div class="login">
            <h3><span>L</span>ogin</h3>
            <form name="loginFrm" action="/pet/member/loginProc.jsp" method="POST">
                <input type="text" name="userId" placeholder="ID 입력" required>
                <input type="password" name="userPwd" placeholder="패스워드 입력" required>
                <input type="button" value="로그인" onClick="loginCheck()">
            </form>
			<ul>
				<li><input type="button" value="ID찾기" onClick="findId()"><li>
				<li><input type="button" value="비밀번호 찾기" onClick="findPwd()"></li>
			</ul>
            <button type="button" id="login-close-btn">X</button>
        </div>
    </div>
	
	<%
	}
	%>