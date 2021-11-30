package com.vti.backend;

import java.time.LocalDate;

import com.vti.academy.Account;
import com.vti.academy.Department;
import com.vti.academy.Position;
import com.vti.academy.PositionName;

//import enums.PositionName;

public class Exercise1_Contructor {
	public static void main(String[] args) {
	}

	/*
	 * Question 1: Tạo constructor cho department: a) không có parameters b) Có 1
	 * parameter là nameDepartment và default id của Department = 0 Khởi tạo 1
	 * Object với mỗi constructor ở trên
	 */
	public static void question1() {
		Department department0 = new Department();
		Department department1 = new Department(0, "Sale");
		Department department2 = new Department(0, "Marketing");
		Department department3 = new Department(0, "Finance");
		Department[] departments = { department0, department1, department2, department3 };
		for (Department departmentob : departments) {
			System.out.println("Id: " + departmentob.id + "\nName: " + departmentob.name);
		}
	}

	/*
	 * Question 2: Tạo constructor cho Account: a) Không có parameters b) Có các
	 * parameter là id, Email, Username, FirstName, LastName (với FullName =
	 * FirstName + LastName) c) Có các parameter là id, Email, Username, FirstName,
	 * LastName (với FullName = FirstName + LastName) và Position của User, default
	 * createDate = now d) Có các parameter là id, Email, Username, FirstName,
	 * LastName (với FullName = FirstName + LastName) và Position của User,
	 * createDate Khởi tạo 1 Object với mỗi constructor ở trên
	 */
	public static void question2() {
		Account acc = new Account();	
		Account acc2 = new Account((short) 2, "huyentrang2@gmail.com", "huyentrang", "Nguyen", "Trang");
		System.out.println("b)  có parameters: " 
				+ "\nEmail: " + acc2.email
				+ "\nUsername: " +acc2.userName
				+"\nFirst name: "+acc2.firstName
				+"\nLast name"+ acc2.lastName
				);
		Position position1 = new Position();
		position1.id = 1;
		position1.name = PositionName.POSITION_DEV.getPositionName();
		Position position2 = new Position();
		position2.id = 2;
		position2.name = PositionName.POSITION_TEST.getPositionName();
		Account acc3 = new Account((short) 3, "huyentrang@gmail.com", "huyentrang", "Nguyen", "Trang", position1);
		System.out.println("c)  có parameters: " 
				+ "\nEmail: " + acc3.email
				+ "\nUsername: " +acc3.userName
				+"\nFirst name: "+acc3.firstName
				+"\nLast name"+ acc3.lastName
				+"\nFullName "+acc3.fullName
				+"\nPosition: "+ acc3.position.name
				+"\nCreate Date: "+acc3.createDate
				);
		Account acc4 = new Account((short) 4, "anhtuyet@gmail.com", "anhtuyet", "Cao", "Tuyet", position2,
				LocalDate.of(2021, 11, 26));
		System.out.println("d)  có parameters: " 
				+ "\nEmail: " + acc4.email
				+ "\nUsername: " +acc4.userName
				+"\nFirst name: "+acc4.firstName
				+"\nLast name"+ acc4.lastName
				+"\nFullName "+acc4.fullName
				+"\nPosition: "+ acc4.position.name
				+"\nCreate Date: "+acc4.createDate
				);
	}
}