package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import java.util.ArrayList;
import java.util.List;

import Model.Batch;
import Model.Student;
import util.DBconnection;

public class BatchDAO {
   //add a batch
	
	public void addBatch(Batch batch) {
		String query = """
				INSERT INTO BATCH
				(B_ID,B_NAME,B_START_DATE,T_ID,B_STATUS)
				VALUES(?,?,?,?,?);
				
				""";
		
		
		try {
			Connection con = DBconnection.getDBConnection();
			PreparedStatement ps = con.prepareStatement(query);
			
			ps.setInt(1, batch.getBId());
			ps.setString(2, batch.getBName());
			ps.setDate(3, batch.getBStartDate());
			ps.setInt(4, batch.getTId());
			ps.setString(5, batch.getBStatus());
			
			
			int row = ps.executeUpdate();
			 
			 if(row>0) {
				 System.out.println("Batch added successfully");
			 }
			 
			 ps.close();
			 con.close();
			    
		} catch (Exception e) {
			System.out.println("error occure at BatchDAO while adding:"+e);
		}
	}
	
	
   //Delete a batch
    public void deleteBatchById(int batchId) {
    	String query = """
	               DELETE from BATCH where B_ID = ?;
	            """;

		
		try {
			Connection con = DBconnection.getDBConnection();
			PreparedStatement ps = con.prepareStatement(query);
			
			
			
			 ps.setInt(1, batchId);
			 
			 
			 int row = ps.executeUpdate();
			
			 if(row>0) {
				 System.out.println("batch deleted successfully");
			 }else {
				 System.out.println("batch not deleted");
			 }
			 
			 ps.close();
			 con.close();
			    
			   
			    
			
			
		}catch (Exception e) {
			System.out.println("error occure at BatchDAO while deleting:"+e);
		}
    }
    
    
  // Get all batches
    public List <Batch> getAllBatch() {
    	Batch batch1 = null;
    	List<Batch>batch = new ArrayList<>();
        String queryString = "select * from BATCH ;";
		
		try {
			Connection con = DBconnection.getDBConnection();
			PreparedStatement ps = con.prepareStatement(queryString);
			
			
			
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				 batch1 = new Batch(
						rs.getInt("B_ID"),
						rs.getString("B_NAME"),
						rs.getDate("B_START_DATE"),
						rs.getInt("T_ID"),
						rs.getString("B_STATUS")
						);
				 batch.add(batch1);
			}
			
			    rs.close();
			    ps.close();
			    con.close();
			    
			    
	     
			
			
		}catch (Exception e) {
			System.out.println("error occure at BatchDAO"+e);
		}
		
		return batch;
    }
    
    
    public void changeStatus(int id) {
    	String query = """
	               SELECT B_STATUS from BATCH where B_ID = ?;
	            """;

		
		try {
			Connection con = DBconnection.getDBConnection();
			PreparedStatement ps = con.prepareStatement(query);
			
			 ps.setInt(1, id);
			 
			 ResultSet rs = ps.executeQuery();
			 
			    rs.next();
				String status = rs.getString("B_STATUS");
				
				if(status.equals("ACTIVE")) {
					String query1 = "UPDATE BATCH SET B_STATUS = 'DEACTIVE' WHERE B_ID=?;";
					 ps = con.prepareStatement(query1);
					 ps.setInt(1, id);
					
					 int row = ps.executeUpdate();
					 if(row>0) {
						 System.out.println("updated status to DEACTIVE");
					 }
				}else {
					String query1 = "UPDATE BATCH SET B_STATUS = 'ACTIVE' WHERE B_ID=?;";
					 ps = con.prepareStatement(query1);
					 ps.setInt(1, id);
					
					 int row = ps.executeUpdate();
					 if(row>0) {
						 System.out.println("updated status to ACTIVE");
					 }
				}
				
			
			 ps.close();
			 con.close();
			    
			   
			    
			
			
		}catch (Exception e) {
			System.out.println("error occure at BatchDAO while deleting:"+e);
		}
    }
    
    // get all the student associate with a Batch 
    public List<Student> getAllStudentInaBatch(int id){
    	List<Student> students = new ArrayList<>();

        String query = """
        		 select s.*
             from student s
             left join
             BATCH b
             ON s.B_ID = b.B_ID
             where b.B_ID=?;
        		""";

        try {
        	
            Connection con = DBconnection.getDBConnection();
             
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                Student student = new Student(

                        rs.getInt("ST_ID"),
                        rs.getString("NAME"),
                        rs.getString("PHONE"),
                        rs.getString("ADDRESS"),
                        rs.getInt("AGE"),
                        rs.getString("EMAIL"),
                        rs.getString("COLLEGE_NAME"),
                        rs.getString("STREAM"),
                        rs.getInt("T_ID"),
                        rs.getInt("S_ID"),
                        rs.getInt("B_ID")
                );

                students.add(student);
            }

        } catch (Exception e) {

            System.out.println("Error: " + e);

        }

        return students;
    }
}
