package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.List;

import Model.Attendence;
import util.DBconnection;

public class AttendenceDAO {
	
	//taking Student Attendence
    public void takeAttendence(List<Attendence> attendenceList) {
       	String queryString = """
       			  INSERT INTO ATTENDENCE(ATTENDENCE_DATE,B_ID,ST_ID,STATUS)
       			  VALUES(?,?,?,?);
       			""";
       	try {
			Connection con = DBconnection.getDBConnection();
			PreparedStatement  ps = con.prepareStatement(queryString);
			
			for(var e : attendenceList) {
				ps.setDate(1, e.getAttendeprivatence_date());
				ps.setInt(2, e.getB_Id());
				ps.setInt(3, e.getST_ID());
				ps.setString(4, e.getStatus());
				
				ps.executeUpdate();
			}
			System.out.println("Attendence has takien successfully");
			ps.close();
	       	con.close();
		} catch (Exception e) {
			System.out.println("Error at Attendence taking: "+e);
		}
       	
    }
    
    //calculating percentage of attendence of a batch
    public double batchAttendence(int id) {
    	
    }
    
    
    //calculating attendence of a student
    public double studentAttendence(int id) {
    	
    }
}
