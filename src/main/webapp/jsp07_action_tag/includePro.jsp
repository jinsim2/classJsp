<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>includePro.jsp</h1>
	<h3>jsp:include 액션태그에 의해 포함되는 페이지입니다.</h3>
	<%
	// 현재 페이지(includePro.jsp)는 includeForm.jsp 페이지에 포함(삽입)될 페이지이며
	// jsp:include 액션태그 사용 시 jsp:param 액션태그로 전달한 파라미터에 접근이 가능하다!
	String paramValue = request.getParameter("paramValue");
	%>
	<h3>전달받은 파라미터값 : <%=paramValue %></h3>
</body>
</html>