package com.vti.academy;
import java.time.LocalDate;
public class Account {
public short id;
public String email;
public String userName;
public String fullName;
public String firstName;
public String lastName;
public Department department;
public Position position;
public LocalDate createDate;
public  Account(){};
public Account(short id,String email,String userName,String firstName,String lastName){
	this.id = id;
	this.email=email;
	this.fullName=firstName+lastName;
}
public Account(short id,String email,String userName,String firstName,String lastName,Position position){
	this.id = id;
	this.email=email;
	this.userName=userName;
	this.fullName=firstName+lastName;
	this.position=position;
	this.createDate= LocalDate.now();
	}
public Account(short id,String email,String userName,String firstName,String lastName,Position position,LocalDate createDate){
	this.id = id;
	this.email=email;
	this.userName=userName;
	this.firstName=firstName;
	this.lastName=lastName;
	this.fullName=firstName +" "+ lastName;
	this.position=position;
	this.createDate= createDate ;
	}
public short getId() {
	return id;
}
public void setId(short id) {
	this.id=id;
}
public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email=email;
}
public String getUserName() {
	return userName;
}
public void setUserName(String userName) {
	this.userName=userName;
}
public String getFirstName() {
	return firstName;
}
public void setFirstName(String firstName) {
	this.firstName=firstName;
}
public String getLastName() {
	return lastName;
}
public void setLastName(String lastName) {	
	this.lastName=lastName;
}
public String getFullName() {
	return fullName;
}
public void setFullName(String fullName) {
	this.fullName=fullName;
}
public Position getPosition() {
	return position;
}
public void setPosition(Position position) {
	this.position=position;
}
public Department getDepartment () {
	return department;
}
public void setDepartment(Department department) {
	this.department = department;
}
public LocalDate getCreateDate() {
	return createDate;
}
public void setCreateDate(LocalDate createDate) {
	this.createDate=createDate;
}
@Override
public String toString() {
	return "Account [id=" + id + ", email=" + email + ", userName=" + userName + ", fullName=" + fullName
			+ ", firstName=" + firstName + ", lastName=" + lastName + ", department=" + department + ", position="
			+ position + ", createDate=" + createDate + "]";
}

}
