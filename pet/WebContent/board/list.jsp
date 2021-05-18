<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.pet.vo.PetBoardBean"%>
<%@ page import="java.util.Vector"%>

<jsp:useBean id="dao" class="com.pet.dao.PetBoardMgr" />

<%
	request.setCharacterEncoding("utf-8");
	String id = (String)session.getAttribute("idKey");
	  
	int totalRecord=0;
	int numPerPage=10;
	int pagePerBlock=15;
	int totalPage=0;
	int totalBlock=0;
	int nowPage=1;
	int nowBlock=1;
	int start=0;
	int end=10;
	int listSize=0;
	String keyWord = "", keyField = "";
	Vector<PetBoardBean> vlist = null;
	
	if(request.getParameter("keyWord") != null) {
		keyWord = request.getParameter("keyWord");
		keyField = request.getParameter("keyField");
	}
	
	if(request.getParameter("reload") != null) {
		if(request.getParameter("reload").equals("true")) {
			keyWord = "";
			keyField = "";
		}
	}
	
	if(request.getParameter("nowPage") != null) {
		nowPage = Integer.parseInt(request.getParameter("nowPage"));
	}
	
	start=(nowPage * numPerPage)-numPerPage;
	end= start+numPerPage;
	totalRecord = dao.getTotalCount(keyField, keyWord);
	totalPage =(int)Math.ceil((double)totalRecord / numPerPage);
	nowBlock= (int)Math.ceil((double)nowPage/pagePerBlock);
	totalBlock =(int)Math.ceil((double)totalPage / pagePerBlock);
%>
	<jsp:include page="../include/pet-common-header.jsp" flush="false"/>
    <script>
		function list( ) {
			document.listFrm.action = "list.jsp";
			document.listFrm.submit( );
		}
		
		function pageing(page) {		
			document.readFrm.nowPage.value = page;
			document.readFrm.submit( );
		}
		
		function block(value) {
			document.readFrm.nowPage.value=<%=pagePerBlock%>*(value-1)+1;
			document.readFrm.submit( );
		} 
		
		function read(num) {
			document.readFrm.num.value=num;
			document.readFrm.action="read.jsp";
			document.readFrm.submit( );
		}
		
		function check( ) {
			if(document.searchFrm.keyWord.value == "") {
				alert("검색어를 입력하세요.");
				document.searchFrm.keyWord.focus( );
				return;
			}
			document.searchFrm.submit( );
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
	            <h2><span>B</span>oar<span>d</span></h2>
	            <p>후기게시판</p>
	        </div>
	    </div>
		<h2>Pet 후기</h2>	
	
		<p class="info">전체 게시글 : <%=totalRecord%> (현재페이지:<%=nowPage%>/전체페이지:<%=totalPage%>)</p>	
		<table class="table">
			<tr>
				<th>번 호</th>
				<th class="subject">제 목</th>
				<th>아이디</th>
				<th>날 짜</th>
				<th>조회수</th>
			</tr>
	<%
		vlist = dao.getBoardList(keyField, keyWord, start, end);
		listSize = vlist.size( );
		
		if (vlist.isEmpty( )) {
			out.println("<table><tr><td>등록된 게시물이 없습니다.</td></tr></table>");
		}else {
			for(int i = 0; i<numPerPage; i++) {
				if (i == listSize) break;
				PetBoardBean bean = vlist.get(i);			
				int num = bean.getNum( );
				String name = bean.getName( );
				String subject = bean.getSubject( );
				String regdate = bean.getRegdate( );
				int depth = bean.getDepth( );
				int count = bean.getCount( );
	%>
			<tr>
				<td><%=totalRecord-((nowPage-1)*numPerPage)-i%></td>
				<td class="subject">
	<% if(depth>0) { for(int j=0;j<depth;j++) { out.println("&nbsp;&nbsp;<span class='glyphicon glyphicon-arrow-right'></span> "); } } %>
					<a href="javascript:read('<%=num%>')"><%=subject%></a>							
				</td>
				<td><%=name%></td>
				<td><%=regdate%></td>
				<td><%=count%></td>
			</tr>
	<%  	} //for:end 
	 	} //else:end
	%>
		</table>
		<div class="h30"></div>
		<table>
			<tr>
				<td class="btn-group pa">
	<%
		int pageStart = (nowBlock -1)*pagePerBlock + 1 ;
		int pageEnd = ((pageStart + pagePerBlock) < totalPage) ?  (pageStart + pagePerBlock): totalPage+1;
		if(totalPage !=0) {
			if(nowBlock > 1) { %>
					<a href="javascript:block('<%=nowBlock-1%>')" class="btn btn-default">prev</a>
	<%	}		
			for( ; pageStart < pageEnd; pageStart++) { %>
					<a href="javascript:pageing('<%=pageStart %>')" class="btn btn-default">
	<%		if(pageStart==nowPage) { %>
						<span>
	<%		} %>
						<%=pageStart %>
	<%		if(pageStart==nowPage) { %>
						</span>
	<%		} %>
					</a> 
	<%
			} // for:end
			if(totalBlock > nowBlock ) { %>
					<a href="javascript:block('<%=nowBlock+1%>')" class="btn btn-default">next</a>
	<%	}
		} // if:end
	%>			
				</td>			
			</tr>	
		</table>
		<div class="clear"></div>
		
		<table>
			<tr>
				<td>
	<%	if(id != null) { %>
					<a href="post.jsp" class="btn btn-primary b-btn btn-right">글쓰기</a>
	<%	} %>
					<a href="javascript:list( )" class="btn btn-default b-btn btn-right">목 록</a>
				</td>
			</tr>
		</table>
		<div class="clear"></div>
		<div class="h30"></div>
		
		<form  name="searchFrm"  method="post" action="list.jsp" class="form-inline">
			<table>
		 		<tr>
		  			<td>
		   				<select name="keyField" class="form-control">
		    				<option value="name"> 이 름</option>
		    				<option value="subject"> 제 목</option>
		    				<option value="content"> 내 용</option>
		   				</select>
		   				<input type="text" name="keyWord" placeholder="검색어" class="form-control">
		   				<input type="button"  value="찾기" onClick="javascript:check( )" class="btn btn-primary btn-find">
		   				<input type="hidden" name="nowPage" value="1">
		  			</td>
		 		</tr>
			</table>
		</form>	
		
		<form name="listFrm" method="post">	
			<input type="hidden" name="reload" value="true">
			<input type="hidden" name="nowPage" value="1">
		</form>
		<form name="readFrm" method="get">
			<input type="hidden" name="num"> 
			<input type="hidden" name="nowPage" value="<%=nowPage%>"> 
			<input type="hidden" name="keyField" value="<%=keyField%>"> 
			<input type="hidden" name="keyWord" value="<%=keyWord%>">
		</form>
	
	<jsp:include page="../include/pet-aside.jsp" flush="false"/>
	<jsp:include page="../include/pet-footer.jsp" flush="false"/>
