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
@WebServlet("/JdbcConnect3_INSERT2_Pro")
public class JdbcConnect3Insert2ProServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("JdbcConnect3Insert2ProServlet");
		
		// 폼 파라미터로 전달받은 idx 와 name 값을 사용하여
		// jsp09_student 테이블에 입력받은 번호 및 이름을 추가(INSERT)
		
		request.setCharacterEncoding("UTF-8");
		
		// 외부로부터 추가할 레코드의 데이터를 폼 파라미터로 가져오기
		int idx = Integer.parseInt(request.getParameter("idx"));
		String name = request.getParameter("name");
		
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
		
			// -------------------------------------------------------------------------------
			// 3단계. SQL 구문 작성 및 전달
			String sql = "INSERT INTO jsp09_student VALUES(?, ?)";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, idx); // 첫번째 만능문자를 int 타입 변수 idx 로 교체
			pstmt.setString(2, name); // 두번째 만능문자를 String 타입 변수 name 으로 교체
			System.out.println(pstmt);
			
			// 4단계. SQL 구문 실행 및 결과 관리
			// - INSERT 구문이므로 PrepareStatement 객체의 executeUpdate() 메서드 호출
			//   => 파라미터 : 없음		리턴타입 : int
			int insertCount = pstmt.executeUpdate();
			System.out.println("회원 추가(INSERT) 성공 - " + insertCount + "개 레코드");
			
			// =============================================================================
			// 만약, 추가 작업 성공 후 즉시 조회를 수행하려면
			// 조회 작업 수행을 위한 서블릿 주소(JdbcConnect3_SELECT) 요청 - Redirect
			response.sendRedirect("JdbcConnect3_SELECT");
			
		} catch (ClassNotFoundException e) {			
			System.out.println("드라이버 로드 실패!");
			e.printStackTrace();
		} catch (SQLException e) {
			System.out.println("DB 연결 실패!");
			e.printStackTrace();
		}
		
		
		
	}

}
