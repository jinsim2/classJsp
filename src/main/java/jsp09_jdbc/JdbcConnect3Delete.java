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

@WebServlet("/JdbcConnect3_DELETE")
public class JdbcConnect3Delete extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("JdbcConnect3Delete");
		
		// DB 자원을 관리하는 Connection, PreparedStatement 등의 타입 변수 선언
		// => finally 블록에서 접근하기 위함
		Connection con = null;
		PreparedStatement pstmt = null;
		
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
			con = DriverManager.getConnection(url, user, password);
			System.out.println("DB 연결 성공!");
			
			/*
			 * 2단계까지는 DB 제품(MySQL, Oracle 등) 별로 정보(문자열) 가 달라지는 부분이며
			 * 3단계부터는 실제 DB 내의 SQL 구문을 실행하므로 공통 작업에 해당함
			 *  => 즉, 제품과 상관없이 공통된 SQL 구문이 같다면 코드가 동일함
			 */
		
			// 3단계. SQL 구문 작성 및 전달
			// 번호가 1번인 레코드를 삭제하는 DELETE 구문 작성
//			String sql = "DELETE FROM jsp09_student WHERE idx= 1";
			
			// 번호가 4, 이름이 '김태리' 인 레코드 삭제
			int idx = 4;
			String name = "김태리";
			
			String sql = "DELETE FROM jsp09_student WHERE idx = ? AND name = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, idx); // 첫번째 파라미터 값을 idx 변수값으로 교체
			pstmt.setString(2, name); // 두번째 파라미터 값을 name 변수값으로 교체
			System.out.println(pstmt);
			
			// 4단계. SQL 구문 실행 및 결과 처리
			int deleteCount = pstmt.executeUpdate();
			System.out.println("DELETE 구문 실행 성공! - " + deleteCount + "개 레코드");
			
		} catch (ClassNotFoundException e) {			
			System.out.println("드라이버 로드 실패!");
			e.printStackTrace();
		} catch (SQLException e) {
			System.out.println("DB 연결 실패!");
			e.printStackTrace();
		} finally {
			try {
				// finally 블록 : try 블록 내에서 예외(Exception) 발생 여부와 관계없이
				//				  항상 마지막에 실행되는 블록(무조건 실행됨)
				// 따라서, DB 자원 사용 후 반납하는 close() 메서드를 finally 블록에서
				// 호출 시 예외 발생하더라도 무조건 자원 반환이 가능하다.
				// finally 블록에서 호출 시 예외 발생하더라도 무조건 자원 반환이 가능하다!
				// 이 때, 자원 반환 순서는 자원 생성 순서의 역순으로 반환
				pstmt.close(); // PreparedStatement 객체 반납
				con.close(); // Connection 객체 반납(닫기 = 자원 해제)
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

	}

}
