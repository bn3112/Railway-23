package com.vti.entity;
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
Account(){};
Account(short id,String email,String userName,String firstName,String lastName){
	this.id = id;
	this.email=email;
	this.fullName=firstName+lastName;
}
Account(short id,String email,String userName,String firstName,String lastName,Position position){
	this.id = id;
	this.email=email;
	this.fullName=firstName+lastName;
	this.position=position;
	this.createDate= LocalDate.now();
	}
Account(short id,String email,String userName,String firstName,String lastName,Position position,LocalDate createDate){
	this.id = id;
	this.email=email;
	this.fullName=firstName+lastName;
	this.position=position;
	this.createDate= createDate ;
	}
}
