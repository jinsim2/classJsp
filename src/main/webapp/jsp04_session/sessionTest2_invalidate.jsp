<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>sessionTest2_invalidate.jsp</h1>
	<%
	// session 객체 초기화
	// => session.invalidate();
	// => 특정 속성이 아닌 세션 객체 자체를 무효화(제거)
	session.invalidate();
	%>
	<h1>세션 초기화 완료!</h1>
	<%-- "세션값 확인" 버튼 -> sessionTest2_get.jsp --%>
	<input type="button" value="세션값 확인" onclick="location.href='sessionTest2_get.jsp'">
	<!-- <h3><a href="sessionTest2_get.jsp">세션값 확인</a></h3> -->
</body>
</html>