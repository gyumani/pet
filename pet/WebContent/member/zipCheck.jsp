<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.pet.vo.ZipcodeBean" %>
<%@page import="java.util.Vector"%>

<jsp:useBean id="pmMgr" class="com.pet.dao.PetMemberMgr"/>

<%
	request.setCharacterEncoding("utf-8");
	String check=request.getParameter("check");
	String area3=null;
	Vector<ZipcodeBean> vlist=null;
	
	if(check.equals("n")){
		area3=request.getParameter("area3");
		vlist=pmMgr.zipcodeRead(area3);
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>우편번호 검색</title>
<script>
	function dongCheck(){
		frm=document.zipFrm;
		if(frm.area3.value==""){
			alert('동이름을 입력하세요.');
			frm.area3.focus();
			return;
		}
		frm.action="zipCheck.jsp";
		frm.submit();
	}
	function sendAdd(zipcode, area1, area2, area3, area4){
		add=area1+" "+area2+" "+area3+" "+area4+" ";
		opener.document.regFrm.zipcode.value = zipcode;
		opener.document.regFrm.addr.value = add;
		self.close();
	}
</script>
</head>
<body>
	<div >
		<br/>
		<form name="zipFrm" method="post">
			<table>
				<tr>
					<td><br>동이름입력: <input name="area3" type="text" value=""><input type="button" value="검색"  onclick="dongCheck();"></td>
				</tr>
				<%
					if(check.equals("n")){
						if(vlist.isEmpty()){
				%>
				<tr>
					<td><br>검색된 결과가 없습니다.</td>
				</tr>
				<%
						}else{
				%>
				<tr>
					<td><br>※검색 후, 아래 우편번호를 클릭하면 자동으로 주소와 우편번호가 입력됩니다.</td>
				<%
							for(int i=0; i<vlist.size(); i++){
								ZipcodeBean bean=vlist.get(i);
								String rZipcode=bean.getZipcode();
								String rArea1=bean.getArea1();
								String rArea2=bean.getArea2();
								String rArea3=bean.getArea3();
								String rArea4=bean.getArea4();
				%>
				<tr>
					<td>
						<a href="#" onclick="javascript:sendAdd('<%=rZipcode %>','<%=rArea1 %>','<%=rArea2 %>','<%=rArea3 %>','<%=rArea4 %>')"><%=rZipcode %>&nbsp;<%=rArea1%>&nbsp;<%=rArea2%>&nbsp;<%=rArea3%>&nbsp;<%=rArea4%></a>
					</td>
				</tr>
				<%
							}
						}
					}
				%>
				<tr>
					<td><br/><a href="#" onClick="self.close()">닫기</a></td>
				</tr>
			</table>
			<input type="hidden" name="check" value="n">
		</form>
	</div>
</body>
</html>