package bean;

public class StudentBean {
private String firstName;
private String lastName;
private String major;
private String Email;
public String getEmail() {
	return Email;
}
public void setEmail(String email) {
	Email = email;
}
private String address1;
private String address2;
private String address3;
private String city;
private String state;
private long postal;
private String country;
private String phoneNo;
private String advisor;
private int yearOfGraduation;
private String livesOnCampus;

public String getFirstName() {
	return firstName;
}
public void setFirstName(String firstName) {
	this.firstName = firstName;
}
public String getLastName() {
	return lastName;
}
public void setLastName(String lastName) {
	this.lastName = lastName;
}
public String getMajor() {
	return major;
}
public void setMajor(String major) {
	this.major = major;
}
public String getAddress1() {
	return address1;
}
public void setAddress1(String address1) {
	this.address1 = address1;
}
public String getAddress2() {
	return address2;
}
public void setAddress2(String address2) {
	this.address2 = address2;
}
public String getAddress3() {
	return address3;
}
public void setAddress3(String address3) {
	this.address3 = address3;
}
public String getCity() {
	return city;
}
public void setCity(String city) {
	this.city = city;
}
public String getState() {
	return state;
}
public void setState(String state) {
	this.state = state;
}
public long getPostal() {
	return postal;
}
public void setPostal(long postal) {
	this.postal = postal;
}
public String getCountry() {
	return country;
}
public void setCountry(String country) {
	this.country = country;
}
public String getPhoneNo() {
	return phoneNo;
}
public void setPhoneNo(String phoneNo) {
	this.phoneNo = phoneNo;
}
public String getAdvisor() {
	return advisor;
}
public void setAdvisor(String advisor) {
	this.advisor = advisor;
}
public int getYearOfGraduation() {
	return yearOfGraduation;
}
public void setYearOfGraduation(int yearOfGraduation) {
	this.yearOfGraduation = yearOfGraduation;
}
public String isLivesOnCampus() {
	return livesOnCampus;
}
public void setLivesOnCampus(String livesOnCampus) {
	this.livesOnCampus = livesOnCampus;
}

}
