<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="<%=request.getContextPath()%>" />
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인 페이지</title>

    <link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="../css/login.css">
    <script src="https://kit.fontawesome.com/b65e009655.js" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

	<script type="text/javascript" src="..js/rsa/rsa.js"></script>
	<script type="text/javascript" src="..js/rsa/jsbn.js"></script>
	<script type="text/javascript" src="..js/rsa/prng4.js"></script>
	<script type="text/javascript" src="..js/rsa/rng.js"></script>

</head>

<body>
    <div class="container">
        <div class="input-form-backgroud row">
            <div class="input-form col-md-12 mx-auto">
                <div class="logo">
                    <a href="<%=request.getContextPath()%>/"><i class="text-primary fa-solid fa-apartment" style="font-size: 30px;"> <span
                        style="font-size: 20px;">happy house</span> </i></a>
                </div>
                <h4 class="mb-3 fw-bold">로그인</h4>
                <form action="<%=request.getContextPath()%>/member/login" method ="post" class="validation-form" novalidate>
                    <div class="row fw-bold">
                        <div class="col-md-12 mb-3">
                            <label for="name">아이디</label>
                            <input type="text" class="form-control" id="userid" placeholder="ID" value="" name="userid" required>
                            <div class="invalid-feedback">
                                ID를 입력해주세요.
                            </div>
                        </div>
                        <div class="col-md-12 mb-3">
                            <label for="nickname">비밀번호</label>
                            <input type="password" class="form-control" id="userpw" placeholder="PASSWORD" name="userpw" value=""
                                required>
                            <div class="invalid-feedback">
                                비밀번호를 입력해주세요.
                            </div>
                        </div>
                    </div>
                    <div class="find-regi-box fs-6">
                        <a href="#" class="find-pass text-muted">비밀번호 찾기</a>
                        <a href="/pages/regist.html" class="regist text-muted">회원가입</a>
                    </div>
                    <div class="d-grid gap-2 mt-1">
                        <button id="login-btn" class="btn btn-primary" id="submit">로그인</button>
                    </div>

                </form>
            </div>
        </div>
        <footer class="my-3 text-center text-small">
            <p class="mb-1">&copy; Happy House</p>
        </footer>
    </div>

</body>

</html>