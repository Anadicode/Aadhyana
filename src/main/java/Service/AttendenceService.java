package Service;

import java.util.List;

import DAO.AttendenceDAO;
import Model.Attendence;

public class AttendenceService {
	
   private AttendenceDAO attendence = new AttendenceDAO();
   public void saveAttendance(List<Attendence> list) {
	   attendence.takeAttendence(list);
   }
}
