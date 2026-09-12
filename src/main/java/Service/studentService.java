package Service;

import java.util.List;

import DAO.StudentDAO;
import Model.Student;

public class studentService {
   private StudentDAO  studentDAO = new StudentDAO();
   
   public List<Student> getAllStudents(){
	  
	   return studentDAO.findAllStudents();
   }
   
   public void deleteAstudentById(int id) {
	    studentDAO.deleteStudent(id);
   }
   
   public void addStudent(Student student) {
	   studentDAO.registerStudent(student);
	   System.out.println("done");
   }
   
   public Student getStudentById(int id) {
	   return studentDAO.findStudentBYId(id);
   }
   
   public void ediStudent(Student student) {
	   studentDAO.editStudentDetails(student);
   }
}
