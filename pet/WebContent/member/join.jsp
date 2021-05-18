<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<script>
		function idCheck(userId){
			frm=document.regFrm;
			if(userId==""){
				alert('아이디를 입력해주세요');
				frm.userId.focus();
				return;
			}
			url="idCheck.jsp?userId="+userId;
			window.open(url,"IDCheck","width=300, height=150");
		}
		function zipCheck(){
			url="zipCheck.jsp?check=y";
			window.open(url,"ZipCodeSearch","width=500, height=300,scrollbars=yes");
		}
	</script>
	<jsp:include page="login.jsp" flush="false"></jsp:include>
	<jsp:include page="../include/pet-join-header.jsp" flush="false"></jsp:include>
	 <div class="clear"></div>
    <div class="join_bn">
        <div class="join_bn_bg"></div>
        <div class="join_bn_opa"></div>
        <div class="join_bn_bity">
            <h2><span>J</span>o<span>in</span></h2>
            <p>회원가입</p>
        </div>
    </div>
	<div class="container">
		<h2><span>P</span>ET</h2>
		<p>회원가입</p>
		<form name="regFrm" action="joinProc.jsp" method="post">
			<ul class="default">
				<li><h3>기본정보</h3></li>
				<li>
					<input type="text" class="id" name="userId" placeholder="아이디 입력" required autofocus>
					<input type="button" class="confirm" value="ID중복확인" onClick="idCheck(this.form.userId.value)">
				</li>
				<li><input type="password" name="userPwd"  placeholder="비밀번호 입력" required></li>
				<li><input type="password" name="userPwdCheck" placeholder="비밀번호 확인" required></li>
				<li><input type="text" name="name" placeholder="이름 입력" required></li>
				<li>
                    <p>성별</p>
					<input type="radio" name="gender" value="1" checked="checked"> 남
					<input type="radio" name="gender" value="2"> 여
				</li>
				<li>
                    <p>생일</p>
                    <input type="date"  name="birth" placeholder="생년월일 입력" required>
                </li>
				<li><input type="email" name="email" placeholder="이메일 주소 입력" required></li>
				<li>
					<input type="text" class="zip" name="zipcode"  placeholder="우편번호 입력" readonly >
					<input type="button" class="confirm" value="우편번호 검색" onClick="zipCheck()">
				</li>
				<li><input type="text"  name="addr" placeholder="주소 입력"></li>
				<li><input type="tel" name="mobile1" placeholder="휴대폰 번호 앞자리" required> - <input type="tel" name="mobile2" placeholder="휴대폰 번호 뒷자리" required></li>
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
				<li><input type="text" name="findPwdAnswer" placeholder="비밀번호 찾기 답변 입력" required></li>
			</ul>
			<ul class="opt">
				<li><h3>선택사항</h3><li>
				<li>
					<p>반려견의 크기</p>
					<input type="checkbox" name="dogSize" value="소형견">소형견 &nbsp;&nbsp;&nbsp;<input type="checkbox" name="dogSize" value="중형견">중형견&nbsp;&nbsp;&nbsp;<input type="checkbox" name="dogSize" value="대형견">대형견
				</li>
				<li>
					<p>원하는 패키지</p>
					<input type="checkbox" name="wantPackage" value="trecking">with Trecking&nbsp;&nbsp;&nbsp;<input type="checkbox" name="wantPackage" value="waterpool">with waterpool&nbsp;&nbsp;<input type="checkbox" name="wantPackage" value="rest">with rest
				</li>
				<li>
					<p>차량 소유 여부</p>
					<input type="radio" name="ownCar" value="네" checked>네&nbsp;&nbsp;&nbsp;<input type="radio" name="ownCar" value="아니오">아니오
				</li>
				<li class="btn-group">
					<button onclick="inputcheck()">회원가입</button>
					<button type="reset">다시쓰기</button>
					<a href="../index.html"><i class="fas fa-home"></i></a>
				</li>
			</ul>
		</form>
	</div>
	<jsp:include page="../include/pet-aside.jsp" flush="false"></jsp:include>
	<jsp:include page="../include/pet-footer.jsp" flush="false"></jsp:include>
</body>
</html>