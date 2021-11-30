package com.vti.entity;

public class Student {
	private int id;
	private String name;
	private String hometown;
	private float score;

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

	public String getHometown() {
		return hometown;
	}

	public void setHometown(String hometown) {
		this.hometown = hometown;
	}

	public float getScore() {
		return score;
	}

// Tạo constructor cho phép khi khởi tạo mỗi student thì người
//dùng sẽ nhập vào tên, hometown và có điểm học lực = 0
	public Student(String name, String hometown) {
		this.id = id;
		this.name = name;
		this.hometown = hometown;
		this.score = 0;
	}

// Tạo 1 method cho phép set điểm vào
	public void setScore(float Score) {
		this.score = Score;
	}

// Tạo 1 method cho phép cộng thêm điểm
	public void addScore(float Score) {
		this.score += Score;
	}

	/*
	 * Tạo 1 method để in ra thông tin của sinh viên bao gồm có tên, điểm học lực (
	 * nếu điểm <4.0 thì sẽ in ra là Yếu, nếu điểm > 4.0 và < 6.0 thì sẽ in ra là
	 * trung bình, nếu điểm > 6.0 và < 8.0 thì sẽ in ra là khá, nếu > 8.0 thì in ra
	 * là Giỏi)
	 */
	public Student(String name, float score) {
		this.name = name;
		this.score = score;
		if (score <= 4.0f) {
			System.out.println("Thông tin của sinh viên: " + name + " có điểm học lực " + "Yếu");
		} else if (score > 4.0 && score <= 6.0) {
			System.out.println("Thông tin của sinh viên: " + name + " có điểm học lực " + "Trung bình");
		} else if (score > 6.0 && score <= 8) {
			System.out.println("Thông tin của sinh viên: " + name + " có điểm học lực " + "Khá");
		} else {
			System.out.println("Thông tin của sinh viên: " + name + " có điểm học lực " + "Giỏi");
		}
	}
}
