<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>requestPro1.jsp - 요청 파라미터 처리</h1>
	<%
	/*
	requestForm1.jsp 페이지에서 submit 버튼 클릭 시
	form 태그 내의 데이터(= 폼 파라미터)가 request 객체에 모두 저장되고
	action 속성에 지정된 페이지로 이동(= 페이지를 요청)하면서 데이터 전달함
	=> 요청 관련 모든 정보는 request 객체가 관리(= JSP가 자동으로 생성하는 객체 = 내장 객체)
	   따라서, request.메서드명() 형태로 request 객체의 메서드를 호출하여 객체 다루기 가능
	=> 요청받은 request 객체에 저장된 폼 파라미터 데이터를 가져오는 방법
	   1) request.getParameter("파라미터명"); // 단일 파라미터
	   2) request.getPrarmeterValues("파라미터명"); // 복수 데이터 가져오기 = String 리턴
	      = String[] 리턴(주로, checkbox 처럼 하나의 이름으로 복수개의 파라미터를 전달할 경우 사용)
	=> 주의! 지정된 파라미터가 존재하지 않을 경우(지정한 이름이 없을 경우) null 값이 리턴되고,
	   파라미터는 있으나 데이터가 없는 경우에는 널스트링("") 값이 리턴됨
	*/
	
	// -----------------------------------------------------------------------------------
	// POST 방식으로 파라미터가 전달될 경우 한글 파라미터에 대한 처리 방법
	// => GET 방식일 경우 JSP page 디렉티브(또는 meta 태그)에 UTF-8 지정하면 되지만
	//    POST 방식일 경우 request 객체에 대해 한글 인코딩 처리를 별도로 수행해야 한다!
	// => 반드시 응답 데이터 생성 페이지(request 객체를 통해 데이터를 가져오는 페이지)에서
	//    한글 인코딩 방식을 변경해야 한다!
	// => request 객체의 setCharacterEncoding() 메서드를 호출하여 "UTF-8" 전달
	
	// 1. 폼 파라미터 중 파라미터(name 속성값)이 "name" 인 값을 가져와서
	//    String 타입 변수 strName 에 저장
	String strName = request.getParameter("name");
	// 스클립틀릿 내에서 브라우저에 데이터 출력 시 out.print() 메서드 사용
// 	out.print("이름 : " + strName + "<br>");
	
	// 2. 파라미터 중 파라미터명이 "age" 인 값 가져와서 String 타입 strAge에 저장
	String strAge = request.getParameter("age");
// 	out.print("나이 : " + strAge + "<br>");
	
	// 3. 파라미터 중 파라미터명이 "gender" 인 값 가져와서 String 타입 strGender 에 저장
	String strGender = request.getParameter("gender");
// 	out.print("성별 : " + strGender + "<br>");
	
	// 4. 파라미터 중 파라미터명이 "hobby" 인 값 가져와서 String 타입 strHobby 에 저장
// 	String strHobby = request.getParameter("hobby");
// 	out.print("취미 : " + strHobby + "<br>");
	// 주의! 복수개의 데이터가 하나의 파라미터명으로 전달되는 경우(ex. 체크박스)
	// getParameter() 메서드 사용 시 하나의 데이터(첫번째 데이터)만 리턴함
	// 따라서, getParameter() 메서드 대신 getParameterValues() 메서드를 호출하여
	// 복수개의 동일한 이름의 파라미터를 String[] 타입으로 리턴받아 처리해야 함
	String[] arrHobbies = request.getParameterValues("hobby");
// 	out.print("취미 : " + arrHobbies + "<br>");
// 	out.print("취미 : " + Arrays.toString(arrHobbies) + "<br>");
	// => 주의! 체크박스의 경우 항목을 하나도 체크하지 않으면 "hobby" 파라미터가 없게되므로
	//    배열에 아무것도 전달하지 못하게 되어 null 값이 저장됨 = 배열이 존재하지 않음
	//    (일반적인 입력항목 미입력 시 파라미터 자체는 전달되고 값이 없으므로 "" 전달됨)
	%>
	<table border="1">
		<tr>
			<th>이름</th>
			<td><%=strName %></td>
		</tr>
		<tr>
			<th>나이</th>
			<td><%=strAge %></td>
		</tr>
		<tr>
			<th>성별</th>
			<td><%=strGender %></td>
		</tr>
		<tr>
			<th>취미</th>
<%-- 			<td><%=Arrays.toString(arrHobbies) %></td> --%>
			<td>
				<%-- arrHobbies 배열에 직접 접근 시 최대 3개의 배열 항목 접근 가능 --%>
<%-- 				<%=arrHobbies[0] %> <%=arrHobbies[1] %> <%=arrHobbies[2] %> --%>
				<%-- 
				주의! 배열 크기(체크 항목)가 3개 미만일 경우
				배열 인덱스 직접 지정 시 오류 발생 가능성 있음
				(java.lang.ArrayIndexOutOfBoundsException: Index 2 out of bounds for length 2)
				=> 반드시, 배열 접근 시 for문을 사용하여 배열 크기만큼 반복 접근해야함
				=> hobby 파라미터 없을 경우(= 체크박스 미체크 시) 배열이 존재하지 않으므로
				   NullPointerException 이라는 오류(예외) 발생함
				--%>
				<% 
// 				for(int i = 0; i < arrHobbies.length; i++) {
// 					out.print(arrHobbies[i] + " ");
// 				}
				%>
				
				<%-- 배열이 null 이 아닐 경우에만 for문 사용 --%>
				<% 
				if(arrHobbies != null) {
					for(int i = 0; i < arrHobbies.length; i++) {
	 					out.print(arrHobbies[i] + " ");
	 				}
				} else {
					// 체크 항목이 하나도 없을 경우 "없음" 출력
// 					out.print("없음");
					
					%>
					<%-- 자바스크립트를 사용하여 "취미 선택 필수!" 출력 후 이전페이지로 돌아가기 --%>
					<script type="text/javascript">
						alert("취미 선택 필수!");
						hisotry.back();
					</script>
					<% 
				}
				%>
			</td>
		</tr>
	</table>	
</body>
</html>