package com.vti.backend;

import com.vti.entity.Student;

public class Exercise4_Encapsulation {
	public static void main(String[] args) {
		question1b();
		question1c();
		question1d();
		question1e();

	}
	// Tạo constructor cho phép khi khởi tạo mỗi student thì người
	//dùng sẽ nhập vào tên, hometown và có điểm học lực = 0
	public static void question1b() {
		Student student1 = new Student("Anh", "Ha Noi");
		student1.setScore(3.5f);
		System.out.println("Question1b: "+ "Name: "+student1.getName()+ "Hometown: "+ student1.getHometown()+"score: "+student1.getScore());
	}
	// Tạo 1 method cho phép set điểm vào
	public static void question1c() {
		Student student2 = new Student("Huong", "Ha Noi1");	
		student2.setScore(4.5f);
		System.out.println("question1c: "+ student2.getScore());
	}
	// Tạo 1 method cho phép cộng thêm điểm
	public static void question1d() {
		Student student3 = new Student("Anh1", "Ha Noi2");
		student3.setScore(5.5f);
		student3.addScore(4.5f);
		System.out.println("question1d: " + student3.getScore() );
	}
	/*Tạo 1 method để in ra thông tin của sinh viên bao gồm có tên,
	điểm học lực ( nếu điểm <4.0 thì sẽ in ra là Yếu, nếu điểm >
	4.0 và < 6.0 thì sẽ in ra là trung bình, nếu điểm > 6.0 và < 8.0
	thì sẽ in ra là khá, nếu > 8.0 thì in ra là Giỏi)*/
	public static void question1e() {
		Student student4 = new Student("Anh2", 6.5f);
		//System.out.println("thông tin của sinh viên: "+ student4.getName());
	}
}
