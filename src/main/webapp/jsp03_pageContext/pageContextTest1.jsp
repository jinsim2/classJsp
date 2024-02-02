<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
// 내장객체 response 를 사용하여 pageContextTest2.jsp 페이지로 이동(= 리다이렉트)
// response.sendRedirect("pageContextTest2.jsp");
// => pageContextTest2.jsp 페이지로 새로운 요청(= 리다이렉트)이 발생하며
//    지정된 페이지로 포워딩 시 웹브라우저 주소표시줄 URL이 pageContextTest2.jsp 로 변경됨
//    (리다이렉트 후 주소 : http://localhost:8088/ClassJsp/jsp03_pagecontext/pageContextTest2.jsp)
// => 이처럼, 새로운 요청에 의해 새 페이지로 이동 시 주소표시줄의 URL 이 변경되는 방식을 
//	  리다이렉트(Redirect) 라고 한다.
// -----------------------------------------------------------------------------------------------
// 또 다른 내장객체 pageContext 객체의 forward() 메서드를 호출하여 동일한 페이지로 이동
pageContext.forward("pageContextTest2.jsp");
// => pageContextTest1.jsp 페이지에서 pageContextTest2.jsp 페이지로 포워딩 요청이 발생하여
//    지정된 페이지로 이동 시 주소표시줄의 URL 이 pageContextTest2.jsp 로 변경되지 않고
//    기존 요청 주소인 pageContextTest1.jsp 주소가 그대로 유지됨
//    (포워딩 후 주소 : http://localhost:8088/ClassJsp/jsp03_pagecontext/pageContextTest1.jsp)
//    (단, 웹 브라우저 화면에 표시되는 실제 내용은 요청된 pageContextTest2.jsp 가 표시됨)
// => 이 처럼, 새로운 주소 요청 시 기존 요청 주소가 그대로 유지되는(= 변경되지 않는)
//    방식을 디스패치 방식의 포워딩이라고 한다!

%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 윗쪽의 페이지 이동 코드로 인해 제어권이 넘어가서 실행되지 못하는 코드들... -->
	<h1>pagecontextTest1.jsp</h1>
	<script type="text/javascript">
		alert("확인!");
	</script>
</body>
</html>