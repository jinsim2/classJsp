<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<header>
		<%-- servlet1_top.jsp 페이지를 현재 위치에 포함시키기 --%>
		<jsp:include page="servlet1_top.jsp"></jsp:include>
	</header>
	<main>
		<div align="center">
			<h1>로그인</h1>
			<!-- 로그인 버튼 클릭 시 "LoginPro" 서블릿 요청 -->
			<!-- jsp08_servlet/LoginProservlet 클래스 매핑 -->
			<form action="LoginPro" method="post">
				<input type="text" placeholder="아이디" name="id"><br>
				<input type="password" placeholder="패스워드" name="passwd"><br>
				<!-- 체크박스에 value 속성 미 지정 시 체크하면 "on" 값 전달됨 -->
				<input type="checkbox" name="rememberLogin">로그인 상태 유지<br>			
				<input type="submit" value="로그인">
			</form>
		</div>
	</main>
	<footer>
		회사설명...
	</footer>
</body>
</html>