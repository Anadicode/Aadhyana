package Model;

public class User {
     private String userId;
     private String passwordString;
     private String role;
     
     public User(){
    	 
     }
      

	 public String getUserId() {
		 return userId;
	 }
	 public String getPasswordString() {
		 return passwordString;
	 }
	 
	 public String getRole() {
			return role;
	  }
	 
	 
	 
	 public void setUserId(String userId) {
		 this.userId = userId;
	 }
	 
	 public void setPasswordString(String passwordString) {
		 this.passwordString = passwordString;
	 }
	 
	 public void setRole(String role) {
		 this.role = role;
	 }
     
     
}
