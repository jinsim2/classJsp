package jsp09_jdbc;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/JdbcConnect3_INSERT2_Form")
public class JdbcConnect3Insert2Form extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("JdbcConnect3Insert2Form");
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("jsp09_jdbc/jdbc_connect3_insert2_form.jsp");
		dispatcher.forward(request, response);
	}

}
