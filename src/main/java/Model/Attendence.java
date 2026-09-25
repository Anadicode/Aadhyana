package Model;

import java.sql.Date;

public class Attendence {
   private Date attendeprivatence_date;
   private int B_Id;
   private int ST_ID;
   private String status;
   
   // Getters
   public Date getAttendeprivatence_date() {
	return attendeprivatence_date;
   }
   
   public int getB_Id() {
	return B_Id;
   }
   
   public int getST_ID() {
	return ST_ID;
   }
   
   public String getStatus() {
	return status;
   }
   
   
   // setters
   public void setAttendeprivatence_date(Date attendeprivatence_date) {
	this.attendeprivatence_date = attendeprivatence_date;
   }
   
   public void setB_Id(int b_Id) {
	B_Id = b_Id;
   }
   
   public void setST_ID(int sT_ID) {
	ST_ID = sT_ID;
   }
   
   public void setStatus(String status) {
	this.status = status;
   }
   
   
   
   
}
