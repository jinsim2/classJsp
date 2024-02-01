<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>requestPro2.jsp - 로그인 처리</h1>
	<% 
	// 폼 파라미터(아이디, 패스워드, 로그인 상태 유지) 가져와서 변수에 저장 및 출력
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	String rememberLogin = request.getParameter("rememberLogin");
	
// 	out.print("<h3>아이디 : " + id + "</h3>");
// 	out.print("<h3>패스워드 : " + passwd + "</h3>");
// 	out.print("<h3>로그인 상태 유지 : " + rememberLogin + "</h3>");
	%>
	<h3>아이디 : <%=id %></h3>
	<h3>패스워드 : <%=passwd %></h3>
	<h3>로그인 상태 유지 : <%=rememberLogin %></h3>
	
	<% 
	/*
	[ 자바 코드를 사용하여 아이디와 패스워드 판별 ]
	- 데이터베이스에 저장된 아이디를 "admin" 이라고 가정하고, 패스워드를 "1234" 라고 가정
	- 자바 코드를 통해 입력받은 아이디와 패스워드를 각각 데이터베이스 데이터와 비교하여
	  모두 같을 경우 "로그인 성공!", 아니면 "로그인 실패!" 출력
	  => "로그인 실패!" 는 자바스크립트를 사용하여 경고창에 출력 후 이전페이지로 돌아가기
	--------------------------------------------------------------------------------------
	주의! 자바 코드 내에서 문자열 데이터 비교 시
	동등비교연산자(==) 대신 String 객체의 equals() 메서드를 호출하여 비교해야함
	
	< 기본 문법 >
	if(문자열.equals(비교할문자열)) { // 문자열이 일치할 경우
		
	} else { // 문자열이 일치하지 않을 경우
		
	}
	=> 문자열 일치 여부를 판별하여 boolean 타입 결과 리턴(true : 일치, false : 불일치)
	*/
	
	// 동등비교연산자 사용할 경우
// 	if(id == "admin" && passwd == "1234") {}
	// => 문자열 비교가 정확하게 이루어지지 않으므로 제대로 된 판별이 어렵다!
	
	// equals() 메서드 사용할 경우
// 	if(id.equals("admin") && passwd.equals("1234")) {}
	
	// 임시로 변수에 데이터베이스 아이디와 패스워드를 저장했다고 가정
	String dbId = "admin";
	String dbPasswd = "1234";
	if(id.equals(dbId) && passwd.equals(dbPasswd)) {
		// 브라우저에 로그인 성공 메세지 출력
		out.print("<h1>로그인 성공!</h1>");
	} else {
		// 자바스크립트로 "로그인 실패!" 출력 후 이전페이지로 돌아가기
		%>
		<script type="text/javascript">
			alert("로그인 실패!");
			history.back();
		</script>
		<% 
	}
	
	%>
</body>
</html>