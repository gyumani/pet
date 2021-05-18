<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% String userId = (String)session.getAttribute("idKey"); %>
	<jsp:include page="../include/pet-common-header.jsp" flush="false"/>
	<style>
		h2{display:block; width:200px; height:50px; font-size:34px; text-align:center; line-height:50px;  margin:80px auto; }
		.space {position:relative; width:100%; height:50px; }
		.pa>a{float:left; margin: 10px 0 0 5px;} 
	</style>
	<jsp:include page="../member/login.jsp" flush="false"/>
	<div class="space"></div>
	<h2 >게시글 작성</h2>

	<form name="postFrm" method="post" action="postProc.jsp" enctype="multipart/form-data">
		<table class="table b-table">
			<tr><td><input type="text" name="name" value="<%=userId %>" class="form-control" readonly></td></tr>			
			<tr><td><input type="text" name="subject" placeholder="제목" class="form-control" autofocus required></td></tr>
			<tr><td><textarea name="content" rows="10" cols="25" placeholder="내용" class="form-control" required></textarea></td></tr>
			<tr><td><input type="password" name="pass" placeholder="비밀번호" class="form-control" required></td></tr>
			<tr><td><input type="file" name="filename" class="form-control b-input"></td></tr>
			<tr>
				<td>내용타입 : HTML <input type=radio name="contentType" value="HTTP" >&nbsp;&nbsp;
				TEXT <input type=radio name="contentType" value="TEXT" checked></td>
			</tr>
		</table>
		<div class="h30"></div>
		<table>			
			<tr>
				<td>
					 <input type="submit" value="등 록" class="btn btn-primary b-btn">
					 <input type="reset" value="다시쓰기" class="btn btn-warning b-btn">
					 <input type="button" value="목 록" onClick="javascript:location.href='list.jsp'" class="btn btn-default b-btn btn-last">
				</td>
			</tr>
		</table>
	<input type="hidden" name="ip" value="<%=request.getRemoteAddr( )%>">
	</form>
	<jsp:include page="../include/pet-aside.jsp" flush="false"/>
	<jsp:include page="../include/pet-footer.jsp" flush="false"/>
</body>
</html>
