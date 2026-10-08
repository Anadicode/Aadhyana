package Model;

public class Student {
   private int id;	
   private String name;
   private String phNumber;
   private String addressString;
   private int age;
   private String emailString;
   private String collageNameString;
   private String streamString;
   
   private int T_id;
   private int sub_id;
   private int B_id;// batchId
   
   
   public Student() {
	
   }

   public Student(int id, String name) {	
		this.id = id;
		this.name = name;

	   }

   public Student(int id, String name, String phNumber, String addressString, int age, String emailString,
		String collageNameString, String streamString, int t_id, int sub_id,int B_id) {
	
	this.id = id;
	this.name = name;
	this.phNumber = phNumber;
	this.addressString = addressString;
	this.age = age;
	this.emailString = emailString;
	this.collageNameString = collageNameString;
	this.streamString = streamString;
	this.T_id = t_id;
	this.sub_id = sub_id;
	this.B_id = B_id;
   }
   
   
   // methods
   public int getId() {
	    return id;
	}

	public String getName() {
	    return name;
	}

	public String getPhNumber() {
	    return phNumber;
	}

	public String getAddressString() {
	    return addressString;
	}

	public int getAge() {
	    return age;
	}

	public String getEmailString() {
	    return emailString;
	}

	public String getCollageNameString() {
	    return collageNameString;
	}

	public String getStreamString() {
	    return streamString;
	}

	public int getT_id() {
	    return T_id;
	}

	public int getSub_id() {
	    return sub_id;
	}

	public int getB_id() {
	    return B_id;
	}
   
	
	// set methods
	
	public void setId(int id) {
	    this.id = id;
	}

	public void setName(String name) {
	    this.name = name;
	}

	public void setPhNumber(String phNumber) {
	    this.phNumber = phNumber;
	}

	public void setAddressString(String addressString) {
	    this.addressString = addressString;
	}

	public void setAge(int age) {
	    this.age = age;
	}

	public void setEmailString(String emailString) {
	    this.emailString = emailString;
	}

	public void setCollageNameString(String collageNameString) {
	    this.collageNameString = collageNameString;
	}

	public void setStreamString(String streamString) {
	    this.streamString = streamString;
	}

	public void setT_id(int T_id) {
	    this.T_id = T_id;
	}

	public void setSub_id(int sub_id) {
	    this.sub_id = sub_id;
	}

	public void setB_id(int B_id) {
	    this.B_id = B_id;
	}



	
   
   
   
   
   
}
