<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.pet.vo.PetBoardBean"%>

<%
	String id = (String)session.getAttribute("idKey");
	int num = Integer.parseInt(request.getParameter("num"));
	String nowPage = request.getParameter("nowPage");
	PetBoardBean bean = (PetBoardBean)session.getAttribute("bean");
	String subject = bean.getSubject( );
	String name = bean.getName( ); 
	String content = bean.getContent( );
%>
	<jsp:include page="../include/pet-common-header.jsp" flush="false"/>
	<script>
		function check( ) {
			if (document.updateFrm.pass.value == "") {
				alert("수정을 위해 패스워드를 입력하세요.");
				document.updateFrm.pass.focus( );
				return false;
			}
			document.updateFrm.submit( );
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
	<h2 >후기글 수정</h2>
	
	<form name="updateFrm" method="post" action="updateProc.jsp" >
		<table class="table b-table">
			<tr><td><input type="text" name="name" value="<%=name%>" class="form-control" autofocus></td></tr>
			<tr><td><input type="text" name="subject" size="50" value="<%=subject%>" class="form-control"></td></tr>
		    <tr><td><textarea name="content" rows="10" cols="50" class="form-control"><%=content%></textarea></td></tr>
		    <tr><td><input type="password" name="pass" placeholder="비밀번호" class="form-control"></td></tr>
		</table>
		<div class="h30"></div>
		<table>   
		    <tr>
		    	<td>
		    		<input type="button" value="수정완료" onClick="check( )" class="btn btn-info b-btn">
		    		<input type="reset" value="다시쓰기" class="btn btn-warning b-btn">
		    		<input type="button" value="뒤 로" onClick="history.go(-1)" class="btn btn-default btn-last b-btn">
		    	</td>
		    </tr>
		</table>
		<input type="hidden" name="nowPage" value="<%=nowPage %>">
		<input type='hidden' name="num" value="<%=num%>">
	</form>
	<jsp:include page="../include/pet-aside.jsp" flush="false"/>
	<jsp:include page="../include/pet-footer.jsp" flush="false"/>
</body>
</html>
