package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import Model.Attendence;
import util.DBconnection;

public class AttendenceDAO {
	
	//taking Student Attendance
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
    
    //calculating percentage of Over All attendence of a batch
    public List<Attendence> batchAttendance(int id) {
    	    String query = """
    	    		    SELECT * from ATTENDENCE 
    	    		    WHERE B_ID = ?;
    	    		""";
    	    List<Attendence> batchAttendences = new ArrayList<>();
    	    try {
				Connection con = DBconnection.getDBConnection();
				PreparedStatement ps = con.prepareStatement(query);
				
				ps.setInt(1, id);
				
				ResultSet rs = ps.executeQuery();
				
				while(rs.next()) {
					Attendence at = new Attendence();
					at.setAttendeprivatence_date(rs.getDate("ATTENDENCE_DATE"));
					at.setB_Id(rs.getInt("B_ID"));
					at.setST_ID(rs.getInt("ST_ID"));
					at.setStatus(rs.getString("STATUS"));
					
					batchAttendences.add(at);
				}
				rs.close();
				ps.close();
				con.close();
				
			} catch (Exception e) {
				System.out.println("Error at Batch Attendence :"+e);
			}
    	    return  batchAttendences;
    	 }
    
   
//    //calculating Overall attendence of a student
    public List<Attendence> studentAttendance(int id) {
    	    String qureyString = """
    	    		SELECT * FROM ATTENDENCE 
    	    		WHERE ST_ID = ?;
    	    		""";
    	    List<Attendence> studentAttendences = new ArrayList<>();
    	    try {
				Connection con = DBconnection.getDBConnection();
				PreparedStatement ps = con.prepareStatement(qureyString);
				ps.setInt(1, id);
				
				ResultSet rs = ps.executeQuery();
				
				while(rs.next()) {
					Attendence at = new Attendence();
					at.setAttendeprivatence_date(rs.getDate("ATTENDENCE_DATE"));
					at.setB_Id(rs.getInt("B_ID"));
					at.setST_ID(rs.getInt("ST_ID"));
					at.setStatus(rs.getString("STATUS"));
					studentAttendences.add(at);
				}
				rs.close();
				ps.close();
				con.close();
				
			} catch (Exception e) { 
				System.out.println("Error at Student A ttendence:"+e);
			}
    	    return studentAttendences;
    }
}
