<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% 
		String root = request.getContextPath();	
	%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입 화면 샘플 - Bootstrap</title>

    <!-- Bootstrap CSS -->
    <!-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous"> -->
    <link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="../css/regist.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&family=Roboto:wght@100&display=swap"
        rel="stylesheet">
    
    <script src="https://kit.fontawesome.com/b65e009655.js" crossorigin="anonymous"></script>
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script type="module" src="../static/js/regist.js"></script>
</head>

<body>
    <div class="container">
        <div class="input-form-backgroud row">
            <div class="input-form col-md-12 mx-auto fw-bold">
                
                <div class="logo">
                    <a href="<%=request.getContextPath()%>/"><i class="text-primary fa-solid fa-apartment" style="font-size: 30px;"> <span
                        style="font-size: 20px;">happy house</span> </i></a>
                </div>
                <h4 class="mb-3 fw-bold">회원가입</h4>
                <form class="validation-form" action="<%=request.getContextPath()%>/member/regist"  method="post" novalidate>
                    <div class="mb-3">
                        <label for="name">이름</label>
                        <input type="text" class="form-control" id="name" placeholder="이름을 입력해주세요." name ="name" value="" required>
                        <div class="invalid-feedback">
                            이름을 입력해주세요.
                        </div>
                    </div>

                    <div class="mb-3">
                        <label for="nickname">닉네임</label>
                        <input type="text" class="form-control" id="nickname" placeholder="닉네임을 입력해주세요." value=""
                            required>
                        <div class="invalid-feedback">
                            닉네임을 입력해주세요.
                        </div>
                    </div>

                    <div class="mb-3">
                        <label for="id">아이디</label>
                        <input type="text" class="form-control" id="id" placeholder="ID를 입력해주세요." name ="id" required>
                        <div class="invalid-feedback">
                            ID를 입력해주세요.
                        </div>
                    </div>

                    <div class="mb-3">
                        <label for="address">비밀번호</label>
                        <input type="password" class="form-control" id="password" placeholder="영문 숫자 포함 6자리 이상" name ="password" required>
                        <div class="invalid-feedback">
                            PW를 입력해주세요.
                        </div>
                    </div>

                    <div class="mb-3">
                        <label for="address">이메일</label>
                        <input type="text" class="form-control" id="address" placeholder="이메일을 입력해주세요." name ="email" required>
                        <div class="invalid-feedback">
                            주소를 입력해주세요.
                        </div>
                    </div>

                    <div class="mb-3">
                        <label for="address">전화번호</label>
                        <input type="text" class="form-control" id="phone" placeholder="010-xxxx-xxxx" required>
                        <div class="invalid-feedback">
                            전화번호를 입력해주세요.
                        </div>
                    </div>

                    <div class="custom-control custom-checkbox">
                        <input type="checkbox" class="custom-control-input" id="aggrement" required>
                        <label class="custom-control-label fw-normal text-muted" for="aggrement">개인정보 수집 및 이용에
                            동의합니다.</label>
                    </div>
                    <div class="mb-4"></div>
                    <div class="d-grid gap-2">
                        <button class="btn btn-primary" id="submit">가입 완료</button>
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