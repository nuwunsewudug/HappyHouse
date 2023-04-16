<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Happy House</title>


    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="css/index.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&family=Roboto:wght@100&display=swap"
        rel="stylesheet">

    <script src="https://kit.fontawesome.com/b65e009655.js" crossorigin="anonymous"></script>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"
        integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"
        integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"
        integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13"
        crossorigin="anonymous"></script>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>

<body>
    <nav class="navbar navbar-expand-lg">
        <div class="container-xl">
            <a href="${pageContext.request.contextPath }" class="d-flex align-items-center col-md-3 mb-2 mb-md-0 text-dark text-decoration-none">
                <i class="text-primary fa-solid fa-apartment" style="font-size: 30px;"> <span
                        style="font-size: 20px;">happy house</span> </i>

            </a>

            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor03"
                aria-controls="navbarColor03" aria-expanded="false" aria-label="Toggle navigation">
                <i class="fa-regular fa-bars"></i>
            </button>
            <div class="collapse navbar-collapse" id="navbarColor03">
                <ul class="navbar-nav me-auto">
                    <li class="nav-item">
                        <a class="nav-link active" href="<%=request.getContextPath()%>/board/list">공지 사항
                            <span class="visually-hidden">(current)</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">오늘의 뉴스</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">주변 탐방</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">관심 지역 설정</a>
                    </li>
                </ul>
                
                <c:if test="${empty loginInfo}">
                <div id="login-banner">
                    <a href="<%=request.getContextPath()%>/member/login" class="btn btn-primary">로그인</a>
                    <a href="<%=request.getContextPath()%>/member/regist" class="btn btn-secondary">회원가입</a>
                </div>
				</c:if>
				<c:if test="${!empty loginInfo}">
                <div id="logout-banner">
                    <a href="<%=request.getContextPath()%>/member/logout" class="btn btn-primary" id="logout">로그아웃</a>
                    
                    <a href="<%=request.getContextPath()%>/member/memberinfo" class="btn btn-secondary">회원정보</a>
                </div>
                </c:if>

            </div>
        </div>

    </nav>

    <main class="container-xl bg-lihgt">
        <section id="main">
            <!-- style="background-image: url('./img/로그인.png');" -->
            <div class="h-100 w-100 d-flex">
            	<a href="${pageContext.request.contextPath}/search">
	                <div id="search-btn" class="h-100 w-100 d-flex justify-content-center align-items-center flex-wrap">
	                    <div id="search-btn-a" class="btn btn-primary btn-lg">우리집 실거래가 조회하기&nbsp;&nbsp;<i
	                            class="fa-light fa-arrow-right"></i></d>
	                </div>
                </a>
            </div>


        </section>
        <!-- <section id="map-box">
            <div id="map" style="width:100%;height:500px;"></div>
        </section> -->
        <section id="cards-box">
            <div class="card-container mt-4 d-flex justify-content-between">
                <!-- 카드 시작 -->
                <div class="card">
                    <div class="card-body">
                        <div><i class="fa-thin fa-house card-icon"></i></div>
                        <div class="card-title fw-bold fs-4">내집 마련하기</div>
                        <div class="card-text">가용자금 확인 및 대출계획</div>
                        <div class="card-text">집 종류 및 지역 선택</div>
                        <div class="card-text">정보 수집 & 시세파악</div>
                        <div class="card-text">인테리어 공사</div>
                    </div>
                </div>
                <div class="card">
                    <div class=" card-body">
                        <div><i class="fa-thin fa-newspaper card-icon"></i></div>
                        <div class="card-title fw-bold fs-4">오늘의 뉴스</div>
                        <div class="card-text">서울 입주 2년차 아파트 전셋값 1억 4000만원 올라...</div>
                        <div class="card-text">서울 입주 2년차 아파트 전셋값 1억 4000만원 올라...</div>
                        <div class="card-text">서울 입주 2년차 아파트 전셋값 1억 4000만원 올라...</div>
                    </div>
                </div>
                <div class="card">
                    <div class="card-body">
                        <div><i class="fa-thin fa-bullhorn card-icon"></i></div>
                        <div class="card-title fw-bold fs-4">공지사항</div>
                        <div class="card-text"><a href="">서비스 이용약관 변경 안내</a></div>
                        <div class="card-text"><a href="">고객센터 전화상담 점검 안내</a></div>
                        <div class="card-text"><a href="">개인정보 처리방침 개정 안내</a></div>
                        <div class="card-text"><a href="">[서비스 점검 공지 (3/30 04:00 ~ 06:00)]</a></div>
                    </div>
                </div>
                <!-- 카드 끝 -->
            </div>
        </section>
    </main>

    <footer>
        <!-- Copyright -->
        <div class="text-center p-3">
            © 2022 Copyright
            <a class="text-dark" href="#">HAPPY HOUSE</a>
        </div>
        <!-- Copyright -->
    </footer>



</body>

</html>