package Service;

import java.util.List;

import DAO.TeacherDAO;
import Model.Teacher;

public class TeacherService {
	
   private TeacherDAO teacherDAO	 = new TeacherDAO();
   
   public List<Teacher> getAllTeacher(){
	   return teacherDAO.getAllTeachers();
   }
}
