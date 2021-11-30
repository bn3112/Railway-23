package com.vti.academy;

public class Exercise5 {
	public static void main(String[] args) {
		// create department
		Department department1 = new Department();
		department1.id = 1;
		department1.name = "Sale";
		Department department2 = new Department();
		department2.id = 2;
		department2.name = "Marketing";
		Department department3 = new Department();
		department3.id = 3;
		department3.name = "Human and Resources";
		Department department4 = new Department();
		department4.id = 4;
		department4.name = "Accounting and Finaneces";
		Department department5 = new Department();
		department5.id = 5;
		department5.name = "Technology";
		Department[] departments = { department1, department2, department3, department4, department5 };
//question1();
		// question2(departments);
//question3();
//question4(department1);
//question5();
//question6();
		/*
		 * Exercise 5: Object’s Method
		 * 
		 * Question 5: So sánh 2 phòng ban thứ 1 và phòng ban thứ 2 xem có bằng nhau
		 * không (bằng nhau khi tên của 2 phòng ban đó bằng nhau) Question 6: Khởi tạo 1
		 * array phòng ban gồm 5 phòng ban, sau đó in ra danh sách phòng ban theo thứ tự
		 * tăng dần theo tên (sắp xếp theo vần ABCD) VD: Accounting Boss of director
		 * Marketing Sale Waiting room Question 7: Khởi tạo 1 array học sinh gồm 5 Phòng
		 * ban, sau đó in ra danh sách phòng ban được sắp xếp theo tên VD: Accounting
		 * Boss of director Marketing waiting room Sale
		 */
		// question1();
		// question4();

//Question 1:In ra thông tin của phòng ban thứ 1 (sử dụng toString())
	}

	public static void question1() {
		Department department1 = new Department();
		System.out.println("In ra thông tin của phòng ban thứ 1: " + department1);
	}

//Question 2: In ra thông tin của tất cả phòng ban (sử dụng toString())
	public static void question2(Department[] departments) {
		for (Department departmentob : departments) {
			System.out.println("In ra thông tin của phòng ban: " + departmentob);
		}
	}

	// Question 3: In ra địa chỉ của phòng ban thứ 1
	public static void question3() {
		Department department1 = new Department();
		System.out.println("In ra thông tin của phòng ban thứ 1: " + department1.hashCode());
	}

	// Question 4:Kiểm tra xem phòng ban thứ 1 có tên là "Phòng A" không?
	public static void question4(Department department1) {
		System.out.println("Kiểm tra xem phòng ban thứ 1 có tên là \"Phòng A\" không: ");
		System.out.println(department1.isNameEqualTo("Phòng A"));
	}
}
