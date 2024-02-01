<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div align="center">
		<h1>로그인</h1>
		<form action="requestPro2.jsp" method="get">
			<input type="text" placeholder="아이디" name="id"><br>
			<input type="password" placeholder="패스워드" name="passwd"><br>
			<!-- 체크박스에 value 속성 미 지정 시 체크하면 "on" 값 전달됨 -->
			<input type="checkbox" name="rememberLogin">로그인 상태 유지<br>			
			<input type="submit" value="로그인">
		</form>
	</div>
</body>
</html>