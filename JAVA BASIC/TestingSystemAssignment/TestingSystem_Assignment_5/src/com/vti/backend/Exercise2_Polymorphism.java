package com.vti.backend;

import java.util.ArrayList;
import java.util.Random;
import java.util.Scanner;

import com.vti.entity.HinhChuNhat;
import com.vti.entity.HinhVuong;
import com.vti.entity.Student;

public class Exercise2_Polymorphism {
	private ArrayList<Student> listStudent;
	private Scanner scanner;

	public Exercise2_Polymorphism() {
		listStudent = new ArrayList<Student>();
		scanner = new Scanner(System.in);
	}

	public void question1() {
		boolean isOK = false;
		while (!isOK) {
			System.out.println("Mời bạn chọn chương trình");
			System.out.println("1. Tạo danh sách sinh viên");
			System.out.println("2. Kêu gọi cả lớp điểm danh.");
			System.out.println("3. Gọi nhóm 1 đi học bài");
			System.out.println("4. Gọi nhóm 2 đi dọn vệ sinh");
			System.out.println("5.Thoát");
			int num = scanner.nextInt();
			switch (num) {
			case 1:
				for (int i = 0; i <= 10; i++) {
					Random random = new Random();
					int select = random.nextInt(3);
					Student st = new Student(i + 1, "Student " + (i + 1), select);
					listStudent.add(st);
					for (Student student : listStudent) {
						System.out.println(student);
					}
				}
				break;
			case 2:
				System.out.println("Cả lớp điểm danh");
				for (Student student : listStudent) {
					student.diemDanh();
				}
				break;
			case 3:
				System.out.println("Gọi nhóm 1 đi học bài");
				for (Student student : listStudent) {
					if (student.getGroup() == 1) {
						student.hocBai();
					}
				}
				break;
			case 4:
				System.out.println("Gọi nhóm 2 đi dọn vệ sinh");
				for (Student student : listStudent) {
					if (student.getGroup() == 2) {
						student.diDonVeSinh();
					}
				}
				break;
			case 5:
				System.out.println("Thoát!!!!");
				return;
			}
			scanner.close();
		}
	}

	public void question3() {
		tinhChuViHinhVuong();
		tinhDienTichHinhVuong();
		tinhChuViHinhChuNhat();
		tinhDienTichChuNhat();
	}

	private void tinhChuViHinhVuong() {
		System.out.println("Tính chu vi của hình vuông:");
		System.out.println("Nhập vào cạnh a:");
		float a = scanner.nextFloat();
		HinhVuong canh = new HinhVuong(a, a);
		System.out.println("Chu vi của hình vuông là: " + canh.tinhChuVi());
	}

	private void tinhDienTichHinhVuong() {
		System.out.println("Tính diện tích của hình vuông:");
		System.out.println("Nhập vào cạnh của hình vuông:");
		float a = scanner.nextFloat();
		HinhVuong canh = new HinhVuong(a, a);
		System.out.println("Diện tích của hình vuông là: " + canh.tinhDienTich());
	}
	private void tinhChuViHinhChuNhat() {
		System.out.println("\nTính chu vi của hình chữ nhật:");
		System.out.println("Nhập vào cạnh a:");
		float a = scanner.nextFloat();
		System.out.println("Nhập vào cạnh b:");
		float b = scanner.nextFloat();
		HinhChuNhat canh = new HinhChuNhat(a, b);
		System.out.println("Chu vi của hình chữ nhật là: " + canh.tinhChuVi());
	}
	
	private void tinhDienTichChuNhat() {
		System.out.println("\nTính diện tích của hình vuông:");
		System.out.println("Nhập vào cạnh a:");
		float a = scanner.nextFloat();
		System.out.println("Nhập vào cạnh b:");
		float b = scanner.nextFloat();
		HinhChuNhat canh = new HinhChuNhat(a, b);
		System.out.println("Diện tích của hình vuông là: " + canh.tinhDienTich());
	}

}
