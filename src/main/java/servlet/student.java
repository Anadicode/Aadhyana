package servlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import Model.Batch;
import Model.Student;
import Model.Subject;
import Service.BatchService;
import Service.SubjectService;
import Service.studentService;


@WebServlet("/student/*")
public class student extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("in the servlet ");
		String pathString = request.getPathInfo();
		
		if(pathString == null || pathString.equals("/student")){
			
			List<Student> students = new ArrayList<>();
			studentService student = new studentService();
			
			
			students = student.getAllStudents();		
		     for(var e : students) {
				System.out.println(e.getAddressString());
			}
		     
			
			request.setAttribute("students", students);

					
			RequestDispatcher rd = request.getRequestDispatcher("/student.jsp");
			 rd.forward(request, response);
		}else if(pathString.equals("/ragister")) {
			
			List<Batch> batches = new ArrayList<>();
		    BatchService batch1 = new BatchService();
		    
		    List<Subject> subjects = new ArrayList<>();
		    SubjectService subject1 = new SubjectService();
		    
		    batches = batch1.getAllBatch();
		    subjects = subject1.getAllSubject();
		    
		     request.setAttribute("batches", batches);
		     request.setAttribute("subjects", subjects);
			
			 RequestDispatcher rd = request.getRequestDispatcher("/studentRagistration.jsp");
			 rd.forward(request, response);
		}else if (pathString.equals("/edit")) {
			//editing student details
		    int id = Integer.parseInt(request.getParameter("id"));
		    studentService studentService = new studentService();
		    Student student = studentService.getStudentById(id);

		    if (student == null) {
		        response.sendRedirect(request.getContextPath() + "/student");
		        return;
		    }

		    request.setAttribute("student", student);
		    RequestDispatcher rd = request.getRequestDispatcher("/editStudent.jsp");
		    rd.forward(request, response);
		}
		
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  
		  String pathString = request.getPathInfo();
		  
		  if(pathString == null || pathString.equals("/student")) {
			  int id = Integer.parseInt(request.getParameter("delete"));
			  
			  
			  studentService student = new studentService();
			  
			  student.deleteAstudentById(id);
			  response.sendRedirect(request.getContextPath()+"/student");
			  
		  }else if(pathString.equals("/ragister")) {
			  
			  
			  
			  // Get data from form
		        int id = Integer.parseInt(request.getParameter("stId"));

		        String name = request.getParameter("name");

		        String phNumber = request.getParameter("phone");

		        String addressString = request.getParameter("address");

		        int age = Integer.parseInt(request.getParameter("age"));

		        String emailString = request.getParameter("email");

		        String collageNameString = request.getParameter("collegeName");

		        String streamString = request.getParameter("stream");

		        int sub_id = Integer.parseInt(request.getParameter("sId"));

		        int T_id = Integer.parseInt(request.getParameter("tId"));

		        int B_id = Integer.parseInt(request.getParameter("bId"));


		        // Create Student object
		        Student student = new Student();

		        student.setId(id);
		        student.setName(name);
		        student.setPhNumber(phNumber);
		        student.setAddressString(addressString);
		        student.setAge(age);
		        student.setEmailString(emailString);
		        student.setCollageNameString(collageNameString);
		        student.setStreamString(streamString);

		        student.setT_id(T_id);
		        student.setSub_id(sub_id);
		        student.setB_id(B_id);


		        // Call service
		        studentService service = new studentService();
               
		        service.addStudent(student);
               
		        // Redirect after successful insertion
		        response.sendRedirect(request.getContextPath() + "/student");
		        
		        
		  }else if (pathString.equals("/edit")) {
			  
			
			// Get data from form
			  int id = Integer.parseInt(request.getParameter("id")); // or "id" — see note below

			  String name = request.getParameter("name");

			  String phNumber = request.getParameter("phNumber");

			  String addressString = request.getParameter("addressString");

			  int age = Integer.parseInt(request.getParameter("age"));

			  String emailString = request.getParameter("emailString");

			  String collageNameString = request.getParameter("collageNameString");

			  String streamString = request.getParameter("streamString");

			  int sub_id = Integer.parseInt(request.getParameter("sub_id"));

			  int T_id = Integer.parseInt(request.getParameter("T_id"));

			  int B_id = Integer.parseInt(request.getParameter("B_id"));


		        // Create Student object
		        Student student = new Student();

		        student.setId(id);
		        student.setName(name);
		        student.setPhNumber(phNumber);
		        student.setAddressString(addressString);
		        student.setAge(age);
		        student.setEmailString(emailString);
		        student.setCollageNameString(collageNameString);
		        student.setStreamString(streamString);

		        student.setT_id(T_id);
		        student.setSub_id(sub_id);
		        student.setB_id(B_id);


		        // Call service
		        studentService service = new studentService();
             
		        service.ediStudent(student);
		        
             
		        // Redirect after successful insertion
		        response.sendRedirect(request.getContextPath() + "/student");
			}
		   
		  
		  
	}
	
	
	
	

}
