<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.pet.vo.PetMemberBean" %>
<%@ page import="java.util.Vector" %>
<jsp:useBean id="dao" class="com.pet.dao.PetAdminMgr"/>
<%
	request.setCharacterEncoding("utf-8");
	String keyWord="", keyField="";
	Vector<PetMemberBean> vlist=null;
	if(request.getParameter("keyWord")!=null){
		keyWord=request.getParameter("keyWord");
		keyField=request.getParameter("keyField");
	}
	int listSize=0;
%>
	<jsp:include page="../include/pet-common-header.jsp" flush="false"/>
    <style>
    	input{border:0; outline:0; background:none;}
    </style>
    <script>
    	function check(){
    		if(document.searchFrm.keyWord.value==""){
    			alert("검색어를 입력하세요.");
    			document.searchFrm.keyWord.focus();
    			return;
    		}
    		document.searchFrm.submit();
    	}
    </script>
	<style>
		h2{display:block; width:200px; height:50px; font-size:34px; text-align:center; line-height:50px;  margin:80px auto; }
		.space {position:relative; width:100%; height:30px; }
		.pa>a{float:left; margin: 10px 0 0 5px;} 
	</style>
	<jsp:include page="../member/login.jsp" flush="false"/>
    <div class="clear"></div>
    <div class="Board_bn">
        <div class="Board_bn_bg"></div>
        <div class="Board_bn_bg_opa"></div>
        <div class="Board_bn_bity">
            <h2><span>A</span>d<span>min</span></h2>
            <p>관리자페이지</p>
        </div>
    </div>
	<h2>관리자 페이지</h2>
	<table class="table">
		<tr>
			<th class="subject">아이디</th>
			<th>이름</th>
			<th>이메일</th>
			<th>주소</th>
			<th>정보보기</th>
		</tr>
<%
	vlist=dao.getMemberList(keyField, keyWord);
	listSize=vlist.size();
	if(vlist.isEmpty()){
		out.println("<table><tr><td>등록된 회원이 없습니다.</td></tr><table>");
	}else{
		for(int i=0; i<listSize; i++) {
			PetMemberBean bean=vlist.get(i);
			String userId=bean.getUserId();
			String name=bean.getName();
			String addr=bean.getAddr();
			String email=bean.getEmail();
%>
		<tr>
			<form name="readFrm"  action="readAdmin.jsp" method="post">
				<td><input type="text" name="userId" value="<%= userId%>" readonly></td>
				<td><input type="text" name="name" value="<%= name%>" readonly></td>
				<td><input type="text" name="email" value="<%= email%>" readonly></td>
				<td><input type="text" name="addr" value="<%= addr%>" readonly></td>
				<td><input type="submit" value="정보보기"></td>
			</form>
		</tr>	
<%
		}
	}
%>
	</table>	
	
	<form  name="searchFrm"  method="post" action="admin.jsp" >
		<table>
	 		<tr>
	  			<td>
	   				<select name="keyField" >
	    				<option value="userId"> 아이디</option>
	    				<option value="name"> 이 름</option>
	    				<option value="addr"> 주 소</option>
	   				</select>
	   				<input type="text" name="keyWord" placeholder="검색어" class="form-control">
	   				<input type="button"  value="찾기" onClick="javascript:check( )" class="btn btn-primary btn-find">
	   				<input type="hidden" name="nowPage" value="1">
	  			</td>
	 		</tr>
		</table>
	</form>	
	<jsp:include page="../include/pet-aside.jsp" flush="false"/>
	<jsp:include page="../include/pet-footer.jsp" flush="false"/>