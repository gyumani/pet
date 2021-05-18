<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="pmMgr" class="com.pet.dao.PetMemberMgr"/>
<jsp:useBean id="bean" class="com.pet.vo.PetMemberBean"/>
<% 
	request.setCharacterEncoding("utf-8");
	String userId=(String)session.getAttribute("idKey");
	bean=pmMgr.getMember(userId);
	
	if(userId!=null){	
%>
	<jsp:include page="../member/login.jsp" flush="false"></jsp:include>
	<jsp:include page="../include/pet-common-header.jsp" flush="false"></jsp:include>
    <div class="clear"></div>
    <div class="reservation_bn">
        <div class="reservation_bn_bg"></div>
        <div class="reservation_bn_opa"></div>
        <div class="reservation_bn_bity">
            <h2><span>Re</span>servati<span>on</span></h2>
            <p>예약하기</p>
        </div>
    </div>
	<div class="container">
        <form name="reserFrm" action="reservationProc.jsp" method="POST">
            <ul>
                <li><h3>예약하기</h3></li>
                <li><input type="text" name="userId" value="<%=userId %>" readonly hidden></li>
                <li><input type="text" name="name"  value="<%=bean.getName() %>"></li>
                <li>
                    <select name="point_addr">
                        <option value="0">픽업지점을 선택해주세요</option>
                        <option value="광주 서구 월드컵경기장">광주 서구 월드컵경기장</option>
                        <option value="광주 북구 한경빌딩">광주 북구 한경빌딩 </option>
                        <option value="광주 남구 남구청 청사 앞">광주 남구 남구청 청사 앞</option>
                        <option value="광주 동구 조선대 정문">광주 동구 조선대 정문</option>
                        <option value="광주 광산구 수완지구 롯데마트">광주 광산구 수완지구 롯데마트</option>
                    </select>
                </li>
                <% 
				if(!bean.getOwnCar().equals("네")){
				%>
				<li>
					<p>픽업 여부를 선택해주세요</p>
					<input type="radio" name="pickUp" value="네" checked>네&nbsp;&nbsp;&nbsp;<input type="radio" name="pickUp" value="아니오">아니오
				</li>
				<%
					}else{
				%>
				<li>
					<p>픽업 여부를 선택해주세요</p>
					<input type="radio" name="pickUp" value="네" >네&nbsp;&nbsp;&nbsp;<input type="radio" name="pickUp" value="아니오" checked >아니오
				</li>
				<% 
					}
				%>
                <li><span>체크인</span><input type="date" name="dateStart"></li>
                <li><span>체크아웃</span><input type="date" name="dateEnd"></li>	
                <li>
                    <p>원하는 패키지를 선택해주세요</p>
                    <input type="radio" name="withPackage" value="trecking"><span>with Trecking</span>&nbsp;&nbsp;&nbsp;<input type="radio" name="withPackage" value="waterpool"><span>with waterpool</span>&nbsp;&nbsp;<input type="radio" name="withPackage" value="rest"><span>with rest</span>
                </li>
                <li>
                    <p>키우는 반려견의 크기를 선택해주세요</p>
                    <input type="checkbox" name="dogSize" value="소형견"><span>소형견</span> &nbsp;&nbsp;&nbsp;<input type="checkbox" name="dogSize" value="중형견"><span>중형견</span>&nbsp;&nbsp;&nbsp;<input type="checkbox" name="dogSize" value="대형견"><span>대형견</span>
                </li>
                <li><input type="text" name="memo" placeholder="필요사항이 있으시면 적어주세요.">
                <li class="btn-group">
                    <button onclick="reserCheck()" ><span></span>&nbsp;예약하기</button>
                    <button type="reset" ><span></span>&nbsp;다시쓰기</button>
                </li>
            </ul>
        </form>
	</div>
	<jsp:include page="../include/pet-aside.jsp" flush="false"></jsp:include>
	<jsp:include page="../include/pet-footer.jsp" flush="false"></jsp:include>
</body>
</html>
<%
	}else{
%>
<script>
	alert("회원가입이 필요한 페이지 입니다.");
	history.go(-1);
</script>
<%
}
%>
