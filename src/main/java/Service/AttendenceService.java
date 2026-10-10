package Service;

import java.util.List;

import DAO.AttendenceDAO;
import Model.Attendence;

public class AttendenceService {
	
   private AttendenceDAO attendence = new AttendenceDAO();
   
   public void saveAttendance(List<Attendence> list) {
	   attendence.takeAttendence(list);
   }
   
   // getting overall Attendence of a batch
   public List<Attendence> getEntireBatchAttendences(int id){
	   return  attendence.batchAttendance(id);
   }
   
   // getting overall Attendence of a student
   public List<Attendence> getEntireStudentAttendences(int id){
	   return attendence.studentAttendance(id);
   }
}
