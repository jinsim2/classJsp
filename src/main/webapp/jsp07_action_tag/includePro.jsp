<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h1>includePro.jsp</h1>
<h3>jsp:include 액션태그에 의해 포함되는 페이지입니다.</h3>
<%
// 현재 페이지(includePro.jsp)는 includeForm.jsp 페이지에 포함(삽입)될 페이지이며
// jsp:include 액션태그 사용 시 jsp:param 액션태그로 전달한 파라미터에 접근이 가능하다!
// 또한, 원래의 페이지에 기본 태그들(HTML, HEAD, BODY 등)이 선언되어 있으므로
// 포함될 페이지에는 기본 태그를 작성할 필요가 없다!
String paramValue = request.getParameter("paramValue");
%>
<h3>전달받은 파라미터값 : <%=paramValue %></h3>