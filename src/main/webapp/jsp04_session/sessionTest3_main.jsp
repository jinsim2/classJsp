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
		<%-- sessionTest3_top.jsp 페이지를 현재 위치에 포함시키기 --%>
		<%-- pageContext 객체의 include() 메서드 호출 --%>
		<%pageContext.include("sessionTest3_top.jsp"); %>
	</header>
 	<hr>
 	<main>
 		<div align="center">
		<h1>메인화면</h1>
	</div>
 	</main>
 	<hr>
 	<footer>
 		회사 설명...
 	</footer>
 </body>
</html>