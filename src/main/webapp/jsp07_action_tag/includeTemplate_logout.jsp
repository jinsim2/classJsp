<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
// 세션 초기화 후 메인페이지(includeTemplate.jsp)로 리다이렉트
session.invalidate();
response.sendRedirect("includeTemplate.jsp");
%>