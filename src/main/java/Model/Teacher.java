package Model;

import Model.Subject;

public class Teacher {
  private int Tid;
  private String nameString;
  private int Sub_ID; 
  
  
  public Teacher(int tid, String nameString, int sub_ID) {
	super();
	this.Tid = tid;
	this.nameString = nameString;
	this.Sub_ID = sub_ID;
  }

  public Teacher() {
	
  }
  
  public int getTeacherId() {
	  return this.Tid;
  }
  
  public String getTeacherName() {
	  return this.nameString;
  }
  
  public int getSubjectId() {
	  return this.Sub_ID;
  }
  

  
  
  
  
  
}
