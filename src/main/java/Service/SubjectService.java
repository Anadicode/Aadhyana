package Service;

import java.util.List;

import DAO.SubjectDAO;
import Model.Subject;

public class SubjectService {
   private SubjectDAO subjectDAO = new SubjectDAO();
	
   public List<Subject> getAllSubject(){
	   return subjectDAO.getAllSubject();
   }
}
