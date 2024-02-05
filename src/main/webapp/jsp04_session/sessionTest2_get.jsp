<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>sessionTest2_get.jsp</h1>
	<h3>세션값 1 : <%=session.getAttribute("sessionValue1") %></h3>
	<h3>세션값 2 : <%=session.getAttribute("sessionValue2") %></h3>
	<%-- "돌아가기" 버튼 클릭 시 이전 페이지로 돌아가기 --%>
<!-- 	<input type="button" value="돌아가기" onclick="history.back()"> -->
	<%-- "처음으로" 버튼 클릭 시 "sessionTest2.jsp" 페이지로 돌아가기 --%>
	<input type="button" value="처음으로" onclick="location.href='sessionTest2.jsp'">
	<hr>
	<%
// 	String str1 = session.getAttribute("sessionValue1"); // 컴파일 에러 발생
	// => Type mismatch: cannot convert from Object to String
	// session.getAttribute() 메서드의 리턴타입은 Object 이므로
	// 리턴값을 변수에 저장 시에는 타입에 맞는 형변환 연산자를 사용하여 다운캐스팅이 필요
	String str1 = (String)session.getAttribute("sessionValue1"); // Object -> String 변환
	String str2 = (String)session.getAttribute("sessionValue2"); // Object -> String 변환
	%>
	<h3>세션값 1 : <%=str1 %></h3>
	<h3>세션값 2 : <%=str2 %></h3>
</body>
</html>