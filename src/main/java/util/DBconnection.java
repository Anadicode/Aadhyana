package util;

import java.sql.*;
//import java.sql.Connection;
//import java.sql.DriverManager;

public class DBconnection {
  private final static String urlString="jdbc:mysql://localhost:3306/Aadhyana";
  private final static String user="root";
  private final static String password="Anadi@20042112";
  
  public static Connection getDBConnection() throws Exception {
	    Class.forName("com.mysql.cj.jdbc.Driver");
	    return DriverManager.getConnection(urlString,user,password);
  }
}
