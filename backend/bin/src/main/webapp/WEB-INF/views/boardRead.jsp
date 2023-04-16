<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
    <link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="../css/board.css">
    <script src="https://kit.fontawesome.com/b65e009655.js" crossorigin="anonymous"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
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

    <section id="main">
	<table border="1" class="board">
		<tr>
			<td style="background: lightcyan;" >제목</td>
			<td>${map.board.btitle}</td>
		</tr>
		<tr>
			<td style="background: lightcyan;" >작성일시</td>
			<td>${map.board.bwrite_date}</td>
		</tr>
		<tr>
			<td style="background: lightcyan;" >작성자</td>
			<td>${map.board.bwriter}</td>
		</tr>
		<tr>
			<td style="background: lightcyan;" >조회수</td>
			<td>${map.board.bread_count}</td>
		</tr>
		<tr>
			<td style="background: lightcyan;" >내용</td>
			<td>${map.board.bcontent}</td>
		</tr>
	</table>
	</section>

	<hr>

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






