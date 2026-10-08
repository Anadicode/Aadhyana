package DAO;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import Model.Teacher;
import util.DBconnection;

public class TeacherDAO {
  
	// get all teacher
	public List<Teacher> getAllTeachers(){
		List<Teacher> teachers = new ArrayList<Teacher>();
		String query = """
				Select * from teacher;
				""";
		try {
			Connection con = DBconnection.getDBConnection();
			PreparedStatement ps = con.prepareStatement(query);
			
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				Teacher teacher = new Teacher(
						rs.getInt("T_ID"),
						rs.getString("NAME"),
						rs.getInt("S_ID")
						);
				teachers.add(teacher);
			}
			
		} catch (Exception e) {
			System.out.println("Error at TeacherDAO:"+e);
		}
		
		return teachers;
	}
}
