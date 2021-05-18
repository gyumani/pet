<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>반려견과 여행</title>
    <link rel="shortcut icon" href="../imgs/favicon.ico">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Playball&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Monoton&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="../plugin/css/owl.carousel.css">
    <link rel="stylesheet" href="../css/reset.css">
    <link rel="stylesheet" href="../css/common.css">
    <link rel="stylesheet" href="../css/sub_interface.css">
    <link rel="stylesheet" href="../css/sub2.css">
    <link rel="stylesheet" href="../css/sub3.css">
    <link rel="stylesheet" href="../css/mypage.css" >
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
    <style>
        .up-on-scroll {transition: transform 0.7s, opacity 1s;}
    </style>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="../plugin/js/owl.carousel.js"></script>
    <script src="../js/common.js"></script>
    <script src="../js/sub2,3.js"></script>
</head>
<body>
<% 
	request.setCharacterEncoding("utf-8");
	String userId=(String)session.getAttribute("idKey");
%>
<header>
        <nav>  
            <h1><a href="../index.jsp"><span>p</span>et</a></h1>
            <ul id="mainMenu">
                <li><a href="../pet/sub1.jsp">pet란?</a></li>
                <li>
                    <a href="#">여행상품</a>
                    <ul class="subMenu">
                        <li><a href="../pet/sub2.jsp">대형견과 여행</a></li>
                        <li><a href="../pet/sub3.jsp">소형견과 여행</a></li>
                    </ul>
                </li>
                <li><a href="../reservation/reservation.jsp">예약하기</a></li>
                <li>
                    <a href="#">커뮤니티</a>
                    <ul class="subMenu">
                        <li><a href="../board/list.jsp">후기</a></li>
                        <li><a href="../pet/FAQ.jsp">자주하는 질문</a></li>
                    </ul>
                </li>
            </ul>
            <%
            if(userId!=null){
            %>
            <ul id="topMenu">
                <li id="login-btn"><a href="#">마이페이지</a></li>
				<li><a  href="../member/logout.jsp">로그아웃</a></li>
            </ul>
            <%	
            }else{
            %>
            <ul id="topMenu">
                <li id="login-btn"><a href="#">로그인</a></li>
                <li><a href="../member/join.jsp">회원가입</a></li>
            </ul>
            <%
            }
            %>
            
            <a href="#" id="trigger">
                <span></span>
                <span></span>
                <span></span>
                <span></span>
            </a>                  
        </nav>    
</header> 
   