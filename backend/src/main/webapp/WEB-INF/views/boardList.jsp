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
			<th>no</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일시</th>
			<th>조회수</th>
		</tr>
		<tr>
			<td colspan="5">게시글이 존재하지 않습니다. 게시글을 작성해주세요.</td>
		</tr>
	</table>
	</section>

	<hr>
	<div class="writeboard">
		<a class="btn btn-primary" href="<%=request.getContextPath()%>/board/write">글쓰기</a>
	</div>

    <footer>
        <!-- Copyright -->
        <div class="text-center p-3">
            © 2022 Copyright
            <a class="text-dark" href="#">HAPPY HOUSE</a>
        </div>
        <!-- Copyright -->
    </footer>

	<script type="text/javascript">
		// 일단 html 화면은 그렸는데.. 데이터가 없으니... 백엔드한테 달라고 졸라볼까 ... ?
		let currPage = '${param.p}';
		function getBoards() {
			$.ajax({
				url : '<%=request.getContextPath()%>/board/ajax/list?p='+currPage,
				method : 'get',
				success:function(data){ // boardList, startPage, page, endPage, totalPage
					console.log(data);
					let el = ``;
					let boardList = data.boardList; // 게시글들
					if(boardList.length==0) return; // 엥? 진짜 백엔드에도 게시글 없나보네? 그럼 테이블 안건드려야징~
					
					for(let i=0; i<boardList.length; i++){
						let board = boardList[i]; // java 객체? js객체?
						console.log('board',board);
						el += `<tr> 
							<td>\${board.bno}</td>
							<td><a
								href="<%=request.getContextPath()%>/board/read?bno=\${board.bno}&p=\${currPage}">\${board.btitle}</a></td>
							<td>\${board.bwriter}</td>
							<td>\${board.bwrite_date}</td>
							<td>\${board.bread_count}</td>
						</tr>`;
					}
					$('table tr:gt(0)').remove(); 
					$('table tr:eq(0)').after(el); 
					$('.page-link').remove();
					el = ``;
					if(data.startPage>1){ // 현재 시작페이지가 1보다 크면 이전페이지 있음.
						el += `<a href="#" class="page-link" p="\${data.startPage-1}">[이전]</a>`
					}
					
					for(let i=data.startPage; i<=data.endPage; i++){
						el += `<a href="#" class="page-link" p="\${i}">[\${i}]</a>`
					}
					
					if(data.endPage<data.totalPage){ // 현재 끝페이지보다 뒷 페이지가 남아있으면
						el += `<a href="#" class="page-link" p="\${data.endPage+1}">[다음]</a>`
					}
					
					$('table').after(el);
				},
				error:function(){
					console.log("ajax error! server can't response");
				}
			})
		}
		
		getBoards();
		
		$(function(){
// 			$('.page-link').click()
			$(document).on('click','.page-link',function(){
				currPage = $(this).attr('p');
				getBoards();
			})
		})
	</script>
</body>
</html>






