<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>servlet2_redirect_result.jsp</h1>
	<%-- 이전 요청에서 전달받은 파라미터(이름, 나이) 출력하기 --%>
	<h3>이름 : <%=request.getParameter("name") %></h3>
	<h3>나이 : <%=request.getParameter("age") %></h3>
</body>
</html>