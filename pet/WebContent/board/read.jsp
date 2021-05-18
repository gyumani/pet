<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.pet.vo.PetBoardBean"%>

<jsp:useBean id="bm" class="com.pet.dao.PetBoardMgr" />

<%
	request.setCharacterEncoding("utf-8");
	String id = (String)session.getAttribute("idKey");
	int num = Integer.parseInt(request.getParameter("num"));
	String nowPage = request.getParameter("nowPage");
	String keyField = request.getParameter("keyField");
	String keyWord = request.getParameter("keyWord");
	bm.upCount(num);
	PetBoardBean bean = bm.getBoard(num);
	String name = bean.getName( );
	String subject = bean.getSubject( );
	String regdate = bean.getRegdate( );
	String content = bean.getContent( );
	String filename = bean.getFilename( );
	int filesize = bean.getFilesize( );
	String ip = bean.getIp( );
	int count = bean.getCount( );
	session.setAttribute("bean", bean);
%>
	<jsp:include page="../include/pet-common-header.jsp" flush="false"/>
	<script>
		function list( ) {
		 	document.listFrm.action="list.jsp";
		    document.listFrm.submit( );
		 } 
		
		function down(filename) {
			 document.downFrm.filename.value=filename;
			 document.downFrm.submit( );
		}
	</script>
	<style>
		h2{display:block; width:200px; height:50px; font-size:34px; text-align:center; line-height:50px;  margin:80px auto; }
		.space {position:relative; width:100%; height:50px; }
		form{padding-bottom:60px;}
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

	<h2 >후기</h2>
	<p class="info">조회수 : <%=count%></p>
	<table class="table">
		<tr> 
			<td class="td-title">이 름</td>
			<td class="text-left"><%=name%></td>
			<td class="td-title">작성일</td>
			<td class="text-left"><%=regdate%></td>
		</tr>
		<tr> 
			<td class="td-title">제 목</td>
			<td colspan="3" class="text-left"><%=subject%></td>
		</tr>
		<tr> 
			<td class="td-title">첨부파일</td>
			<td colspan="3" class="text-left">
<%		if(filename !=null && !filename.equals("")) { %>
				<a href="javascript:down('<%=filename%>')"><%=filename%></a>
				&nbsp;&nbsp;<font color="blue">(<%=filesize%>KBytes)</font>
<%		}else { %>
				등록된 파일이 없습니다.
<%		} %>
			</td>
		</tr>
		<tr><td colspan="4" class="text-left"><br><pre><%=content%></pre><br></td></tr>
		<tr><td colspan="4" class="text-left">IP 주소 : <%=ip%></td>	</tr>
	</table>
	<div class="h30"></div>
	<table>
		<tr>
			<td colspan="4">				
				<a href="javascript:list( )"  class="btn btn-default btn-right b-btn">목 록</a>				
<%		if(id != null) { %>
				<a href="update.jsp?nowPage=<%=nowPage%>&num=<%=num%>" class="btn btn-info btn-right b-btn">수 정</a>				
				<a href="reply.jsp?nowPage=<%=nowPage%>" class="btn btn-success btn-right b-btn">답 변</a>				
				<a href="delete.jsp?nowPage=<%=nowPage%>&num=<%=num%>" class="btn btn-danger btn-right b-btn">삭 제</a>				
<%		} %>
			</td>
		</tr>
	</table>
	
	<form name="downFrm" method="post" action="download.jsp">
		<input type="hidden" name="filename">
	</form>
	
	<form name="listFrm" method="post">
		<input type="hidden" name="num" value="<%=num%>">
		<input type="hidden" name="nowPage" value="<%=nowPage%>">
<%if(!(keyWord==null || keyWord.equals("null"))) { %>
		<input type="hidden" name="keyField" value="<%=keyField%>">
		<input type="hidden" name="keyWord" value="<%=keyWord%>">
<%}%>
	</form>

	<jsp:include page="../include/pet-aside.jsp" flush="false"/>
	<jsp:include page="../include/pet-footer.jsp" flush="false"/>