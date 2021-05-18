<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="pmMgr" class="com.pet.dao.PetMemberMgr"/>
<jsp:useBean id="bean" class="com.pet.vo.PetMemberBean"/>
<%
	request.setCharacterEncoding("utf-8");
	String userId=request.getParameter("userId");
	
	bean=pmMgr.getMember(userId);
%>
	<jsp:include page="../include/pet-join-header.jsp" flush="false"></jsp:include>
	<script>
		function zipCheck(){
			url="zipCheck.jsp?check=y";
			window.open(url,"ZipCodeSearch","width=500, height=300,scrollbars=yes");
		}
	</script>
	<jsp:include page="../member/login.jsp" flush="false"></jsp:include>
    <div class="join_bn">
        <div class="join_bn_bg"></div>
        <div class="join_bn_opa"></div>
        <div class="join_bn_bity">
            <h2><span>Up</span>dat<span>e</span></h2>
            <p>개인정보수정</p>
        </div>
    </div>
    <div class="container">
    	<h2><span>PET</span>정보수정</h2>
		<form name="regFrm" action="updateInfoProcAdmin.jsp" method="post">
			<ul class="default">
				<li><p>기본정보</p></li>
				<li>
					<input type="text"  name="userId" value="<%=bean.getUserId()%>" placeholder="아이디를 입력해주세요" readonly>
				</li>
				<li><input type="password" name="userPwd"  placeholder="패스워드 입력" required></li>
				<li><input type="password" name="userPwdCheck" placeholder="패스워드 확인" required></li>
				<li><input type="text" name="name" value="<%=bean.getName()%>"placeholder="이름을 입력해주세요" required></li>
				<li>
					성별: 남<input type="radio" name="gender" value="1" checked="checked">
					여 <input type="radio" name="gender" value="2">
				</li>
				<li><span class="birth">생일</span><input type="date"  name="birth" value="<%=bean.getBirth()%>" placeholder="생년월일을 입력해주세요" readonly></li>
				<li><input type="email" name="email" value="<%=bean.getEmail()%>"placeholder="이메일 주소를 입력해주세요" required></li>
				<li>
					<input type="text" name="zipcode"  value="<%=bean.getZipcode()%>" placeholder="우편번호" readonly >
					<input type="button" value="우편번호 찾기" onClick="zipCheck()">
				</li>
				<li><input type="text"  name="addr" value="<%=bean.getAddr()%>" placeholder="주소를 입력해주세요" required></li>
				<li><input type="tel" name="mobile1" value="<%=bean.getMobile1() %>" placeholder="지역번호 및 휴대폰 앞자리 입력" required>-<input type="tel" name="mobile2" value="<%=bean.getMobile2()%>"placeholder="휴대전화 번호입력" required></li>
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
				<li><p>선택사항</p><li>
				<li>
					<p>키우는 반려견의 크기를 선택해주세요</p>
					<input type="checkbox" name="dogSize" value="소형견">소형견 &nbsp;&nbsp;&nbsp;<input type="checkbox" name="dogSize" value="중형견">중형견&nbsp;&nbsp;&nbsp;<input type="checkbox" name="dogSize" value="대형견">대형견
				</li>
				<li>
					<p>원하는 패키지를 선택해주세요</p>
					<input type="checkbox" name="wantPackage" value="trecking">with Trecking&nbsp;&nbsp;&nbsp;<input type="checkbox" name="wantPackage" value="waterpool">with waterpool&nbsp;&nbsp;<input type="checkbox" name="wantPackage" value="rest">with rest
				</li>
				<li>
					<p>차량 소유 여부를 선택해주세요</p>
					<input type="radio" name="ownCar" value="네" checked>네&nbsp;&nbsp;&nbsp;<input type="radio" name="ownCar" value="아니오">아니오
				</li>
				<li class="btn-group">
					<button onclick="inputcheck()" ><span></span>&nbsp;정보수정</button>
					<button type="reset" ><span></span>&nbsp;다시쓰기</button>
				</li>
			</ul>
		</form>
    </div>
    <form action="deleteMemberAdmin.jsp" method="post">
					<input type="text"  name="userId" value="<%=bean.getUserId()%>" placeholder="아이디를 입력해주세요" hidden>
					<input type="submit" value="회원탈퇴">
    </form>
	<jsp:include page="checkReservationAdmin.jsp" flush="false"></jsp:include>
	<jsp:include page="../include/pet-aside.jsp" flush="false"></jsp:include>
	<jsp:include page="../include/pet-footer.jsp" flush="false"></jsp:include>