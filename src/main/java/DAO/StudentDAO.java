package DAO;

import util.DBconnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;



//Collections
import java.util.List;
import java.util.ArrayList;

import Model.Student;


public class StudentDAO {
	
	
	//finding student by ID
  public  Student findStudentBYId(int id) {
    	String query="select * from student where  ST_ID=?";
    	  
    	try {
    		Connection con =  DBconnection.getDBConnection();
    		PreparedStatement ps = con.prepareStatement(query);
    		
    		 ps.setInt(1, id);
    		
    		ResultSet rs = ps.executeQuery(); 
    		
    		if(rs.next()) {
    			return new Student(
        				
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
    		}
    		
    		
    		
    	}catch (Exception e) {
			System.out.println("error"+e);
		}
    	
    	return null;
    }
    
    
    
 // Finding all students

    public List<Student> findAllStudents() {

        List<Student> students = new ArrayList<>();

        String query = "SELECT * FROM student";

        try {
        	
            Connection con = DBconnection.getDBConnection();
             
            PreparedStatement ps = con.prepareStatement(query);

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
    
    
    // registerting a stdent
    public void registerStudent(Student student) {

        String query = """
            INSERT INTO student
            (ST_ID, NAME, T_ID, S_ID, PHONE, ADDRESS, AGE, EMAIL,
             B_ID, COLLEGE_NAME, STREAM)
            VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
            """;

        try {

            Connection con = DBconnection.getDBConnection();

            PreparedStatement ps = con.prepareStatement(query);

            ps.setInt(1, student.getId());
            ps.setString(2, student.getName());

            ps.setInt(3, student.getT_id());
            ps.setInt(4, student.getSub_id());

            ps.setString(5, student.getPhNumber());
            ps.setString(6, student.getAddressString());

            ps.setInt(7, student.getAge());
            ps.setString(8, student.getEmailString());

            ps.setInt(9, student.getB_id());

            ps.setString(10, student.getCollageNameString());
            ps.setString(11, student.getStreamString());

            ps.executeUpdate();

            System.out.println("Student registered successfully.");

            ps.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    
    
    // deleting a student
    public void deleteStudent(int id) {
    	  String query = "DELETE from student where ST_ID = ?";
    	  
    	  try {
    		  Connection con = DBconnection.getDBConnection();
    		  PreparedStatement ps = con.prepareStatement(query);
    		  ps.setInt(1, id);
    		  
    		  
    		  int row = ps.executeUpdate();
    		  
    		  if(row>0) {
    			  System.out.println("Deleted successfully");
    		  }else {
    			  System.out.println("not deleted or deta not exists");
    		  }
    				  
    				  
			
		} catch (Exception e) {
			System.out.println("err"+e);
		}
    }
}
