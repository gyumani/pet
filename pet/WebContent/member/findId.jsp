<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<jsp:include page="../include/pet-find-header.jsp" flush="false"></jsp:include>
	<script>
		function idCheck(){
			frm=document.findIdFrm;
			if(frm.name.value==""){
				alert('이름을 입력해주세요');
				frm.name.focus();
				return;
			}
			if(frm.email.value==""){
				alert('이메일을 입력해주세요');
				frm.email.focus();
				return;
			}
			frm.submit()
		}
	</script>
	<div>
		<br/>
		<form name="findIdFrm" action="findIdCtl.jsp" method="post">
				<h4>아이디 찾기</h4>
				<ul>
					<li><input type="text" name="name" placeholder="이름을 입력해주세요"></li>
					<li><input type="text" name="email" placeholder="이메일을 입력해주세요"></li>
					<li><input type="button" value="아이디 찾기" onclick="idCheck();"></li>
				</ul>
		</form>
		<a href="#" onClick="self.close()">닫기</a>
	</div>
				
</body>
</html>