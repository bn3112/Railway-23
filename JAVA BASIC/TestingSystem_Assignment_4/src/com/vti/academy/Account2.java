package com.vti.academy;
import java.time.LocalDate;
public class Account2 {
private short id;
private String email;
private String userName;
private String fullName;
private String firstName;
private String lastName;
private Department department;
private Position position;
private LocalDate createDate;
public  Account2(){};
public Account2(short id,String email,String userName,String firstName,String lastName){
	this.id = id;
	this.email=email;
	this.fullName=firstName+lastName;
}
public Account2(short id,String email,String userName,String firstName,String lastName,Position position){
	this.id = id;
	this.email=email;
	this.userName=userName;
	this.fullName=firstName+lastName;
	this.position=position;
	this.createDate= LocalDate.now();
	}
public Account2(short id,String email,String userName,String firstName,String lastName,Position position,LocalDate createDate){
	this.id = id;
	this.email=email;
	this.fullName=firstName+lastName;
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
}
