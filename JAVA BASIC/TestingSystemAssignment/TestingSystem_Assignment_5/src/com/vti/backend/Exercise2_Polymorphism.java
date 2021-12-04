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
		Student student = new Student("Nguyen Van A", 1);
		Student student1 = new Student("Nguyen Van B", 1);
		Student student2 = new Student("Nguyen Van C", 1);
		Student student3 = new Student("Nguyen Van D", 2);
		Student student4 = new Student("Nguyen Van E", 2);
		Student student5 = new Student("Nguyen Van A", 2);
		Student student6 = new Student("Nguyen Van B", 3);
		listStudent.add(student6);
		listStudent.add(student5);
		listStudent.add(student4);
		listStudent.add(student3);
		listStudent.add(student2);
		listStudent.add(student1);
		listStudent.add(student);
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
				for (int i = 1; i <= 10; i++) {
					Random random = new Random();
					int select = random.nextInt(3) + 1;
					scanner.nextLine();
					System.out.println("Nhập tên sinh viên thứ " + i);
					String ten = scanner.nextLine();
					Student st = new Student(i, ten, select);
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
				System.out.println("Gọi nhóm 1 đi học bài ");
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

		}
		scanner.close();
	}

	public void question3() {
		System.out.println("Chào mừng bạn đến thế giới hình học ");
		System.out.println("Tính S và P của hình chữ nhật nhập a khác b");
		System.out.println("Tính S và P của hình chữ nhật nhập a bằng b ");
		System.out.println("Nhập vào cạnh a:");
		float a = scanner.nextFloat();
		System.out.println("Nhập vào cạnh b:");
		float b = scanner.nextFloat();
		HinhChuNhat canh = new HinhChuNhat(a, b);
		if ( a == b) {
			System.out.println(canh.tinhChuVi(a, b));
			System.out.println(canh.tinhDienTich(a, b));
		} else {
			System.out.println(canh.tinhChuVi(a, b));
			System.out.println(canh.tinhDienTich(a, b));
		}
	}
}
