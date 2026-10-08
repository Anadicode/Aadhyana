package servlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import Model.Student;
import Service.studentService;


@WebServlet("/AdminDashBoard")
public class AdminDashBoard extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		studentService service = new studentService();
		
		 List<Student> activeStudents =   service.getAllActiveStudents();
		 System.out.println(activeStudents.size());
		 
		 List<Student> deactiveStudents =   service.getAllInActiveStudents();
		 System.out.println(deactiveStudents.size());
		
		RequestDispatcher rd = request.getRequestDispatcher("/AdminDashBoard.jsp");
		rd.forward(request, response);
	}


}
