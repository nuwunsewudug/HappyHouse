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
    <title>회원 정보 페이지 </title>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/regist.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script type="module" src="./static/js/loginfo.js"></script>

</head>

<body>
    <div class="container">
        <div class="input-form-backgroud row">
            <div class="input-form col-md-12 mx-auto">
                <h4 class="mb-3">회원 삭제</h4>
                
                <form class="validation-form" action="<%=request.getContextPath()%>/member/delete"  method="post" novalidate>          

                    <div class="mb-3">
                        <label for="id">ID</label>
                        <input type="text" class="form-control" id="id" name="id" value="${loginInfo.id}" placeholder="${loginInfo.id}" required>
                        <div class="invalid-feedback">
                            
                        </div>
                    </div>

                    <div class="mb-3">
                        <input type="text" class="form-control" id="pw" placeholder="삭제 하실거면 확인 / 아니면 취소를 누르시오" required>
                        <div class="invalid-feedback">
                          
                        </div>
                    </div>

                    <div class="">
                        <div class="d-flex justify-content-between" id="backDiv">
                            <button class="btn btn-primary">확인</button>                            
                            <a href="<%=request.getContextPath()%>/" class="btn btn-primary">취소</a>                   
                        </div>
                    </div>
                    
                    </form>
                </div>
            </div>
        </div>
        <footer class="my-3 text-center text-small">
            <p class="mb-1">&copy; Happy House</p>
        </footer>
    </div>

</body>

</html>