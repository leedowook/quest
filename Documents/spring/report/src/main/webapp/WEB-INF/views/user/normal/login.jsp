<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<form action="/pro/User/login" method="post">
	<input type="text" name="loginid" >
	<input type="password" name="loginpwd">
	<input type="hidden" value="${_csrf.token }" name="${_csrf.parameterName }">
	<input type="submit" value="로그인 얍"> 
	</form>
	
</body>
</html>