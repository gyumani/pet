<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pet Easy Tour</title>
    <link rel="shortcut icon" href="imgs/favicon.ico">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Playball&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Monoton&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/common.css">
    <link rel="stylesheet " href="css/main.css">
    <link rel="stylesheet " href="css/mypage.css">
    <script  defer src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script  defer src="js/common.js"></script>
</head>
<html>
<body>
	<% 
		request.setCharacterEncoding("utf-8");
		String userId=(String)session.getAttribute("idKey");
	%>
	<header>
	        <nav>  
	            <h1><a href="index.jsp"><span>p</span>et</a></h1>
	            <ul id="mainMenu">
	                <li><a href="pet/sub1.jsp">pet란?</a></li>
	                <li>
	                    <a href="#">여행상품</a>
	                    <ul class="subMenu">
	                        <li><a href="pet/sub2.jsp">대형견과 여행</a></li>
	                        <li><a href="pet/sub3.jsp">소형견과 여행</a></li>
	                    </ul>
	                </li>
	                <li><a href="reservation/reservation.jsp">예약하기</a></li>
	                <li>
	                    <a href="#">커뮤니티</a>
	                    <ul class="subMenu">
	                        <li><a href="board/list.jsp">후기</a></li>
	                        <li><a href="pet/FAQ.jsp">자주하는 질문</a></li>
	                    </ul>
	                </li>
	            </ul>
	            <%
	            if(userId!=null){
	            %>
	            <ul id="topMenu">
	                <li id="login-btn"><a href="#">마이페이지</a></li>
					<li><a  href="member/logout.jsp">로그아웃</a></li>
	            </ul>
	            <%	
	            }else{
	            %>
	            <ul id="topMenu">
	                <li id="login-btn"><a href="#">로그인</a></li>
	                <li><a href="member/join.jsp">회원가입</a></li>
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
	<jsp:include page="member/login.jsp" flush="false"></jsp:include>
    <section>
        <video src="video/main_bg.mp4" autoplay muted loop preload id="m_bg"></video>
        <div class="m_it_wrap">
            <div class="m_it1"></div>
            <div class="m_it2"></div> 
            <div class="m_it3"></div>  
        </div>
        <div class="m_ct fhd">
            <div class="m_biTy fhd">
                <p><span>p</span>et</p>
                <p><span>e</span>asy</p>
                <p><span>t</span>our</p>
            </div>
            <a href="sub01.html" >view about</a>
        </div>
        </div>
        <div class="m_ct hd">
            <div class="m_biTy hd">
                <p><span>p</span>et</p>
                <p><span >e</span>asy</p>
                <p><span>t</span>our</p>
            </div>
            <a href="pet/sub01.jsp">view about</a>
        </div>
        <div class="m_ct tablet">   
            <div class="m_biTy tb">
                <p><span>p</span>et</p>
                <p><span>e</span>asy</p>
                <p><span>t</span>our</p>
            </div>
            <a href="pet/sub01.jsp">view about</a>
        </div>
        <div class="m_ct mobile">
            <div class="m_biTy mobile">
                <p><span>p</span>et</p>
                <p><span>e</span>asy</p>
                <p><span>t</span>our</p>
            </div>
            <a href="pet/sub01.jsp">view about</a>
        </div>  
    </section>
	<jsp:include page="include/pet-aside.jsp" flush="false"></jsp:include>
</body>
</html>
	