<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<jsp:include page="../include/pet-find-header.jsp" flush="false"></jsp:include>
	<script>
		function pwdCheck(){
			frm=document.findPwdFrm;
			if(frm.userId.value==""){
				alert('아이디를 입력해주세요');
				frm.name.focus();
				return;
			}
			if(frm.findPwdQuest.value==""){
				alert('비밀번호 찾기 질문을 선택해주세요');
				frm.email.focus();
				return;
			}
			if(frm.findPwdAnswer.value==""){
				alert('비밀번호 찾기 답변을 입력해주세요');
				frm.email.focus();
				return;
			}
			frm.submit()
		}
	</script>
	<div>
		<br/>
		<form name="findPwdFrm" action="findPwdCtl.jsp" method="post">
				<h4>비밀번호 찾기</h4>
				<ul>
					<li><input type="text" name="userId" placeholder="아이디을 입력해주세요"></li>
					<li>
						<select name="findPwdQuest">
							<option value="0">비밀번호 찾기 질문을 선택해주세요</option>
							<option value="내가 가장 아끼는 물건은?">내가 가장 아끼는 물건은?</option>
							<option value="아버지의 성함은?">아버지의 성함은?</option>
							<option value="어머니의 성함은?">어머니의 성함은?</option>
							<option value="반려동물 이름은?">반려동물 이름은?</option>
							<option value="일년 중 제일 중요한 날은?">일년 중 제일 중요한 날은?</option>
						</select>
					</li>
					<li><input type="text" name="findPwdAnswer" placeholder="비밀번호 찾기 답변을 입력해주세요"></li>
					<li><input type="button" value="비밀번호 찾기" onclick="pwdCheck();"></li>
				</ul>
				
		</form>
		<a href="#" onClick="self.close()">닫기</a>
	</div>
</body>
</html>