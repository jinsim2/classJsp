package jsp09_jdbc;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class JdbcConnect3Insert
 */
@WebServlet("/JdbcConnect3_INSERT")
public class JdbcConnect3Insert extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("JdbcConnect3Insert");
		
		/*
		 * < 3단계 - SQL 구문 작성 및 전달 >
		 * - 앞의 1단계, 2단계 과정을 통해 DB 에 접속된 상태에서
		 *   접속 정보를 담고 있는 Connection 객체를 통해 데이터베이스 관련 작업 수행 가능
		 *   (반드시 2단계 과정에서 java.sql.Connection 타입 변수에 객체를 리턴받아 저장되어 있어야 함)
		 * - Connection 객체의 prepareStatement() 메서드를 호출하여 실행할 SQL 구문을 문자열로 전달 후
		 *   리턴되는 java.sql.PreparedStatement 객체를 변수에 저장
		 * - 기본 문법
		 *   PreparedStatement pstmt = con.prepareStatement("SQL구문");
		 * - 추가사항)
		 *   PreparedStatement 객체를 통해 SQL 구문 전달 시 데이터 부분을 만능문자 ? 기호로 미리 표시해두고
		 *   SQL 구문 전달하는 메서드 prepareStatement() 호출 한 후
		 *   PreparedStatement 객체의 setXXX() 메서드를 호출하여 만능문자(?) 부분 데이터 교체
		 *   => 이 때, setXXX() 메서드의 XXX 부분은 실제 전달되어야 하는 데이터의
		 *      자바 데이터타입 이름을 사용하며, 파라미터로 만능문자(?) 순서번호와 실제 데이터 전달
		 *      ex) 문자열 데이터를 교체하는 메서드 이름 : setString()
		 *          정수 데이터를 교체하는 메서드 이름 : setInt()
		 *          실수 데이터를 교체하는 메서드 이름 : setDouble()
		 */
		
		try {
			// 0단계. JDBC 연결에 필요한 문자열을 각각의 변수에 저장
			String driver = "com.mysql.cj.jdbc.Driver";
			String url="jdbc:mysql://localhost:3306/study_jsp7";
			String user="root";
			String password="1234";
			
			// 1단계. JDBC 드라이버 로드
			Class.forName(driver);
			System.out.println("드라이버 로드 성공!");
			
			// 2단계. DB 연결
			// => DB 연결 성공 시 java.sql.Connection 타입 객체 리턴됨
			// => Connection 객체는 DB 접속 정보를 관리하는 객체
			Connection con = DriverManager.getConnection(url, user, password);
			System.out.println("DB 연결 성공!");
			
			/*
			 * -----------------------------------------------------------------------------
			 * 2단계까지는 DB 제품(MySQL, Oracle 등) 별로 정보(문자열) 가 달라지는 부분이며
			 * 3단계부터는 실제 DB 내의 SQL 구문을 실행하므로 공통 작업에 해당함
			 *  => 즉, 제품과 상관없이 공통된 SQL 구문이 같다면 코드가 동일함
			 * -----------------------------------------------------------------------------
			 * <테스트 위한 테이블 생성>
			 * 테이블명 : study_jsp7.jsp09_student
			 * 컬럼 : 번호(idx, 정수), 이름(name, 문자 16자)
			 * CREATE TABLE jsp09_student (
			 * 		idx INT,
			 * 		name VARCHAR(16)
			 * );
			 */
		
			// -------------------------------------------------------------------------------
			// 3단계. SQL 구문 작성 및 전달
			// - jsp09_student 테이블에 번호(idx)와 이름(name)을 추가하는 INSERT 구문 작성
			//   (임의의 데이터 : 번호 - 1, 이름 - '홍길동')
//			String sql = "INSERT INTO jsp09_student VALUES(1, '홍길동')";
//			String sql = "INSERT INTO jsp09_student VALUES(2, '이순신')";
			// - Connection 객체(con)의 prepareStatement() 메서드를 호출하여 SQL 구문 전달
			//   => 파라미터 : SQL 구문 문자열  리턴타입 : java.sql.PrepareStatement
//			PreparedStatement pstmt = con.prepareStatement(sql);
			// => 리턴받은 PrepareStatement 객체는 SQL 문장을 관리하는 객체
			// -------------------------------------------------------------------------------
			// 추가할 레코드의 데이터를 외부로부터 입력받아 변수에 저장했다고 가정
			int idx = 4; // int idx = Integer.parseInt(request.getParameter("idx"));
			String name = "김태리"; // String name = request.getParameter("name");
			
			// [ SQL 구문 작성 시 변수값을 SQL 구문에 포함시키는 방법 2가지 ]
			// 1) SQL 구문 작성 시 문자열 결합을 통해 변수값을 포함(권장하지는 않음)
			// => CREATE 구문 등을 사용할 경우 간혹 사용하는 방법이지만 데이터 추가 시 사용X
			// => 다른 데이터타입을 제외하고 문자열의 경우 작은따옴표로 둘러싸서 표현하므로
			//    변수 결합 시에도 작은따옴표 형태는 그대로 유지해야함(불편함)
			// => 구문이 외부로 노출 시 해킹 기법 중의 SQL 삽입 공격(SQL Injection Attack) 대상이 됨
			//    ex) 로그인 시 패스워드가 일치하지 않아도 무조건 로그인 되도록 수행 가능
//			String sql = "INSERT INTO jsp09_student VALUES(" + idx + ", '" + name + "')";
//			PreparedStatement pstmt = con.prepareStatement(sql);
			
			// 2) SQL 구문 작성 시 데이터가 위치해야할 부분을
			//    만능문자(wildcard) 에 해당하는 파라미터인 ? 기호로 먼저 채워놓고
			//    문장 전달 후 해당 만능문자 부분을 실제 데이터로 교체(추천하는 방법)
			// 2-1) SQL 구문 작성 시 문장 내의 데이터 부분을 만능문자(?)로 표기
			//      => 문자열을 별도로 구별할 필요없이 무조건 ? 기호로 표시만 함
			String sql = "INSERT INTO jsp09_student VALUES(?, ?)";
			PreparedStatement pstmt = con.prepareStatement(sql);
			// 2-2) SQL 문장을 전달받아 관리하는 PreparedStatement 객체의
			//      setXXX() 메서드를 호출하여 만능문자(?) 부분을 실제 데이터로 교체
			//      => setXXX(index, data) 메서드의 XXX 은 교체할 데이터의 자바 데이터타입명
			//         ex) 정수형 데이터 전달 시 : setInt()
			//			   문자열형 데이터 전달 시 : setString()
			//      => 첫번째 파라미터(index) : 만능문자 순서번호
			//      => 두번째 파라미터(data) : 만능문자 부분에 교체될 실제 데이터
			//      => 주의! 모든 만능문자를 실제 데이터로 교체해야 한다!
			//         만약, 빠진 데이터가 있을 경우 예외(오류) 발생
			//      => 주의! 반드시 PreparedStatement 객체를 리턴받은 다음,
			//         SQL 구문 실행(4단계) 전 교체 작업 수행
			pstmt.setInt(1, idx); // 첫번째 만능문자를 int 타입 변수 idx 로 교체
			pstmt.setString(2, name); // 두번째 만능문자를 String 타입 변수 name 으로 교체
			// => 주의! 2개의 만능문자 중 1개의 만능문자만 데이터 교체를 수행한 경우
			//    (만능문자 중 데이터 교체가 수행되지 않은 파라미터가 있을 경우)
			//    "java.sql.SQLException: No value specified for parameter 2" 예외 발생함
			// => 2번째 파라미터의 값이 정의되지 않았다(데이터 없음)는 의미
			
			// 주의! 존재하는 만능문자 인덱스 번호가 아닌 다른 번호를 지정한 경우
			// "java.sql.SQLException: Parameter index out of range (3 > number of parameters, which is 2)" 예외 발생함
			// => 현재 파라미터 최대값(2)보다 더 큰 번호(3)가 지정되어 범위를 벗어났다는 의미
//			pstmt.setString(3, name); // 두 번째 만능문자를 String 타입 변수 name으로 교체
			
			// 만약, 실행될 SQL 문장을 확인하려면 PreparedStatement 객체 출력
			System.out.println(pstmt);
			
			// 4단계. SQL 구문 실행 및 결과 관리
			// - INSERT 구문이므로 PrepareStatement 객체의 executeUpdate() 메서드 호출
			//   => 파라미터 : 없음		리턴타입 : int
			int insertCount = pstmt.executeUpdate();
			System.out.println("회원 추가(INSERT) 성공 - " + insertCount + "개 레코드");
			
			
			
		} catch (ClassNotFoundException e) {			
			System.out.println("드라이버 로드 실패!");
			e.printStackTrace();
		} catch (SQLException e) {
			System.out.println("DB 연결 실패!");
			e.printStackTrace();
		}
		
		
		
	}

}
