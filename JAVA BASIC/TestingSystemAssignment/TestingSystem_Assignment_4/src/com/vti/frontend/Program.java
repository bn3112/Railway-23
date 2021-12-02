package com.vti.frontend;

import java.util.ArrayList;

import java.util.Scanner;

import com.vti.backend.Exercise1_Contructor;
import com.vti.backend.Exercise3_Access_Modifier;
import com.vti.backend.Exercise4_Encapsulation;
import com.vti.backend.Exercise5_Inheritance;
import com.vti.entity.Bao;
import com.vti.entity.Sach;
import com.vti.entity.TaiLieu;
import com.vti.entity.TapChi;

public class Program {
	private static ArrayList<TaiLieu> taiLieuArr;

	public static void main(String[] args) {
		Exercise1_Contructor ex1 = new Exercise1_Contructor();
		 Exercise1_Contructor.question1(); //Tạo constructor cho department:
		 Exercise1_Contructor.question2(); //Tạo constructor cho Account:
		Exercise3_Access_Modifier ex3 = new Exercise3_Access_Modifier();
		 Exercise3_Access_Modifier.question1(); //private access modifier
		Exercise4_Encapsulation ex4 = new Exercise4_Encapsulation();
		ex4.question1b(); 
							/* b) Tạo constructor cho phép khi khởi tạo mỗi student thì người dùng sẽ nhập
							 * vào tên, hometown và có điểm học lực = 0
							 */
		ex4.question1c(); // Tạo 1 method cho phép set điểm vào
		ex4.question1d(); // Tạo 1 method cho phép cộng thêm điểm
		ex4.question1e();// Tạo 1 method để in ra thông tin của sinh viên
		Exercise5_Inheritance ex5 = new Exercise5_Inheritance();
		Sach a = new Sach("Sach1", "Giao duc", 2, "Nguyen Ngoc Anh", 100);
		Sach a2 = new Sach("Sach2", "Giao duc", 3, "Nguyen Ngoc Anh", 100);
		TapChi b = new TapChi("TC1", "Giao duc", 2, 10, 10, 10);
		ex5.addTaiLieu(b);
		ex5.addTaiLieu(a2);
		ex5.addTaiLieu(a);
		ex5.question4();
	}

}