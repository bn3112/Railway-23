package com.vti.academy;

public class Position2 {
private byte id;
private String name;
public byte getId() {
	return id;
}
public Position2(byte id,String name) {
	this.id=id;
	this.name=name;
}
public void setId (byte id) {
	this.id=id;
}
public String getPositionName() {
	return name;
}
public void setPositionName(String name) {
	this.name=name;
}
}
