package DAO;

import util.DBconnection;
import Model.Subject;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;



public class SubjectDAO {
   
	//Adding a new subject
	
	public void addSubject(Subject subject) {
		
		String query = """
	            INSERT INTO subject
	            (S_ID, SUB_NAME)
	            VALUES (?, ?);
	            """;

		
		try {
			Connection con = DBconnection.getDBConnection();
			PreparedStatement ps = con.prepareStatement(query);
			
			
			
			 ps.setInt(1, subject.getSubjectId());
			 ps.setString(2, subject.getSubjectName());
			 
			 int row = ps.executeUpdate();
			 
			 if(row>0) {
				 System.out.println("subject add successfully");
			 }
			 
			 ps.close();
			 con.close();
			    
			   
			    
			
			
		}catch (Exception e) {
			System.out.println("error occure at SubjectDAO"+e);
		}
		
	}
	
	
	//deleting a subject
	
     public void deleteSubject(Subject subject) {
		
		String query = """
	               DELETE from subject where S_ID = ?;
	            """;

		
		try {
			Connection con = DBconnection.getDBConnection();
			PreparedStatement ps = con.prepareStatement(query);
			
			
			
			 ps.setInt(1, subject.getSubjectId());
			 
			 
			 int row = ps.executeUpdate();
			 
			 if(row>0) {
				 System.out.println("subject deleted successfully");
			 }
			 
			 ps.close();
			 con.close();
			    
			   
			    
			
			
		}catch (Exception e) {
			System.out.println("error occure at SubjectDAO"+e);
		}
		
	}
	
	
	//getting all subject
	
	public List<Subject> getAllSubject() {
		Subject subject1 = null; 
		String queryString = "select * from subject;";
		
		List<Subject> subjects = new ArrayList<Subject>();
		
		try {
			Connection con = DBconnection.getDBConnection();
			PreparedStatement ps = con.prepareStatement(queryString);
			
			
			
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				 subject1 = new Subject(
						rs.getInt("S_ID"),
						rs.getString("SUB_NAME")
						);
				 subjects.add(subject1);
			}
			
			    rs.close();
			    ps.close();
			    con.close();
			    
			    return subjects;
			    
			
			
		}catch (Exception e) {
			System.out.println("error occure at SubjectDAO"+e);
		}
		
		return null;
	}
}
