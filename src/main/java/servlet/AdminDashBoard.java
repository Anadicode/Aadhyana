package servlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import Model.Batch;
import Model.Student;
import Model.Teacher;
import Service.BatchService;
import Service.TeacherService;
import Service.studentService;


@WebServlet("/AdminDashBoard")
public class AdminDashBoard extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		studentService studentService = new studentService();
		TeacherService teacherService = new TeacherService();
		BatchService   batchService  = new BatchService();
		
		 List<Student> activeStudents =   studentService.getAllActiveStudents();
		 System.out.println(activeStudents.size());
		 
		 List<Student> deactiveStudents =   studentService.getAllInActiveStudents();
		 System.out.println(deactiveStudents.size());
		 
		 List<Student> allStudents =   studentService.getAllStudents();
		 System.out.println(allStudents.size());
		 
		 
		 List<Teacher> teachers = teacherService.getAllTeacher();
		 System.out.println(teachers.size());
		 
		 List<Batch> batches = batchService.getAllBatch();
		 System.out.println(batches.size());
		 
		 
		 request.setAttribute("activeStudents", activeStudents);
	     request.setAttribute("deactiveStudents", deactiveStudents);
	     request.setAttribute("allStudents", allStudents);
	     request.setAttribute("teachers", teachers);
	     request.setAttribute("batches", batches);
		 
		
		RequestDispatcher rd = request.getRequestDispatcher("/AdminDashBoard.jsp");
		rd.forward(request, response);
	}


}
