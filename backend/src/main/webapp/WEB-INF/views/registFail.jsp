<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="<%=request.getContextPath()%>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입실패</title>
</head>
<body>
<script type="text/javascript">
	alert('회원가입 실패');
	location.href="${root}/";
</script>
</body>
</html>