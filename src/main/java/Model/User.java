package Model;

public class User {
     private String userId;
     private String passwordString;
     
     public User(){
    	 
     }
     
	 public String getUserId() {
		 return userId;
	 }
	 public String getPasswordString() {
		 return passwordString;
	 }
	 
	 
	 public void setUserId(String userId) {
		 this.userId = userId;
	 }
	 
	 public void setPasswordString(String passwordString) {
		 this.passwordString = passwordString;
	 }
     
     
}
