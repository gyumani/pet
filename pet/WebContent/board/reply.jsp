<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:useBean id="bean" class="com.pet.vo.PetBoardBean" scope="session"/>

<%
	String nowPage = request.getParameter("nowPage");
	String subject = bean.getSubject( );
	String content = bean.getContent( );
%>
	<jsp:include page="../include/pet-common-header.jsp" flush="false"/>
	<script>
		function check( ) {
			if (document.delFrm.pass.value == "") {
				alert("패스워드를 입력하세요.");
				document.delFrm.pass.focus( );
				return false;
			}
			document.delFrm.submit( );
		}
	</script>
	<style>
		h2{display:block; width:200px; height:50px; font-size:34px; text-align:center; line-height:50px;  margin:80px auto; }
		.space {position:relative; width:100%; height:50px; }
		.pa>a{float:left; margin: 10px 0 0 5px;} 
		form{padding-bottom:150px;}
	</style>
	<jsp:include page="../member/login.jsp" flush="false"/>
	<div class="space"></div>
	<h2>후기 답글</h2>
	
	<form name="post" method="post" action="replyProc.jsp" >
		<table class="table b-table">
			<tr><td><input type="text" name="name" placeholder="이 름" class="form-control" autofocus></td></tr>
			<tr><td><input type="text" name="subject" size="50" value="답변 : <%=subject%>" class="form-control"></td></tr>
			<tr><td><textarea name="content" rows="12" cols="50" placeholder="내 용" class="form-control"><%=content %></textarea></td></tr>
			<tr><td><input type="password" name="pass" placeholder="비밀번호" class="form-control"></td></tr>
		</table>
		<div class="h30"></div>
		<table>
			<tr> 
				<td>
					<input type="submit" value="답변등록" class="btn btn-success b-btn">
					<input type="reset" value="다시쓰기" class="btn btn-warning b-btn">
					<input type="button" value="뒤로" onClick="history.back( )" class="btn btn-default b-btn btn-last">
				</td>
			</tr>
		</table>
		<input type="hidden" name="ip" value="<%=request.getRemoteAddr( )%>" >
		<input type="hidden" name="nowPage" value="<%=nowPage%>">
		<input type="hidden" name="ref" value="<%=bean.getRef( )%>">
		<input type="hidden" name="pos" value="<%=bean.getPos( )%>">
		<input type="hidden" name="depth" value="<%=bean.getDepth( )%>">
	</form>
	<jsp:include page="../include/pet-aside.jsp" flush="false"/>
	<jsp:include page="../include/pet-footer.jsp" flush="false"/>
</body>
</html>
