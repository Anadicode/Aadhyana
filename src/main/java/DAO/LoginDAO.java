package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import Model.User;
import util.DBconnection;

public class LoginDAO {
   
	public User isLogin(String userId,String password) {
		 
		
		String queryString  = """
				select * from USER
				Where userId=? AND password=?;
				""";
		
		try {
			Connection con=DBconnection.getDBConnection();
			PreparedStatement ps = con.prepareStatement(queryString);
			
			ps.setString(1, userId);
			ps.setString(2, password);
			
			ResultSet rs = ps.executeQuery();
			
			User user = new User();
			
			if(rs.next()) {
				user.setUserId(rs.getString("userId"));
				user.setPasswordString(rs.getString("password"));
				
				return user;
			}
			
			
				
			
			
			
			
		}catch (Exception e) {
			System.out.println("Err occure at isLogin():"+e);
		}
		
		return null;
	}
}
