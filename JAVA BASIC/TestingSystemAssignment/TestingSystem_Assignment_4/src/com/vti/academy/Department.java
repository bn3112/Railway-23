package com.vti.academy;

public class Department {
public int id;
public String name;
public Department departments;

public String getDepartmentName() {
	return name;
}
public void setDepartmentName(String name) {
	this.name=name;
}
public Department(int id, String name) {
	this.id=id;
	this.name=name;
}
public Department() {
}
}
