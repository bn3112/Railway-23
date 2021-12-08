package com.vti.entity;

public class Contact {
private String number;
private String name;

public Contact(String number,String name) {
	this.name=name;
	this.number=number;
}
public String getNumber() {
	return number;
}
public void setNumber(String number) {
	this.number = number;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}

@Override
public String toString() {
	return "Contact [number=" + number + ", name=" + name + "]";
}

}
