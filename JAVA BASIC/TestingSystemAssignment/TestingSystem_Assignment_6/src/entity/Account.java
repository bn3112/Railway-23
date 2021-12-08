package entity;

import java.time.LocalDate;

public class Account {
private int id;
private  String name;
private Department departmentName;
private Position posistionName;
private LocalDate createDate;
public Account(int id, String name,Department departmentName,Position posistionName,LocalDate createDate) {
	this.id=id;
	this.name=name;
	this.departmentName= departmentName;
	this.posistionName = posistionName;
	this.createDate = createDate;
}
@Override
public String toString() {
	return "Account [id=" + id + ", name=" + name + ", departmentName=" + departmentName + ", posistionName="
			+ posistionName + ", createDate=" + createDate + "]";
}
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public Department getDepartmentName() {
	return departmentName;
}
public void setDepartmentName(Department departmentName) {
	this.departmentName = departmentName;
}
public Position getPosistionName() {
	return posistionName;
}
public void setPosistionName(Position posistionName) {
	this.posistionName = posistionName;
}
public LocalDate getCreateDate() {
	return createDate;
}
public void setCreateDate(LocalDate createDate) {
	this.createDate = createDate;
}

}
