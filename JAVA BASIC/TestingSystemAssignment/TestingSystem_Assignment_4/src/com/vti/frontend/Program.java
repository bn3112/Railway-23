package com.vti.frontend;

import java.util.ArrayList;

import java.util.Scanner;

import com.vti.backend.Exercise1_Contructor;
import com.vti.backend.Exercise3_Access_Modifier;
import com.vti.backend.Exercise4_Encapsulation;
import com.vti.backend.Exercise5_Inheritance;
import com.vti.entity.Bao;
import com.vti.entity.CanBo;
import com.vti.entity.CongNhan;
import com.vti.entity.KySu;
import com.vti.entity.NhanVien;
import com.vti.entity.Sach;
import com.vti.entity.TaiLieu;
import com.vti.entity.TapChi;

public class Program {
	private static ArrayList<TaiLieu> taiLieuArr;
	private static ArrayList<Sach> sachArr;
	private static ArrayList<TapChi> tapChiArr;

	
	public static void main(String[] args) {
//		Exercise1_Contructor ex1 = new Exercise1_Contructor();
//		 Exercise1_Contructor.question1(); //Tạo constructor cho department:
//		 Exercise1_Contructor.question2(); //Tạo constructor cho Account:
//		Exercise3_Access_Modifier ex3 = new Exercise3_Access_Modifier();
//		 Exercise3_Access_Modifier.question1(); //private access modifier
//		Exercise4_Encapsulation ex4 = new Exercise4_Encapsulation();
//		ex4.question1b(); 
//							/* b) Tạo constructor cho phép khi khởi tạo mỗi student thì người dùng sẽ nhập
//							 * vào tên, hometown và có điểm học lực = 0
//							 */
//		ex4.question1c(); // Tạo 1 method cho phép set điểm vào
//		ex4.question1d(); // Tạo 1 method cho phép cộng thêm điểm
//		ex4.question1e();// Tạo 1 method để in ra thông tin của sinh viên
		Exercise5_Inheritance ex5 = new Exercise5_Inheritance();
		CongNhan cb1 = new CongNhan("Nguyen A", 25, "Nam", "Ha Noi", (byte) 5);
		KySu cb2 = new KySu("Nguyen B", 26, "Nu", "Ha Noi", "Ky thuat");
		NhanVien cb3 = new NhanVien("Nguyen C", 17, "Nam", "Ha Noi", "Ke Toan");
		NhanVien cb4 = new NhanVien("Nguyen D", 27, "Nam", "Ha Noi", "Truong Phong");
		CanBo cb = new CanBo("A", 30, "Nu","HN");
		CanBo cb5 = new CanBo("B", 31, "Nu","HN");
		CanBo cb6 = new CanBo("C",31, "Nu","HN");
		ex5.addCanBo(cb);
		ex5.addCanBo(cb1);
		ex5.addCanBo(cb2);
		ex5.addCanBo(cb3);
		ex5.addCanBo(cb4);
		ex5.addCanBo(cb5);
		ex5.addCanBo(cb6);
		
		ex5.question1();
		
		
		Sach a = new Sach("Sach1", "Giao duc", 2, "Nguyen Ngoc Anh", 100);
		Sach a2 = new Sach("Sach2", "Giao duc", 3, "Nguyen Ngoc Anh", 100);
		TapChi b = new TapChi("TC1", "Giao duc", 2, 10, 10, 10);
		ex5.addTaiLieu(b);
		ex5.addTaiLieu(a2);
		ex5.addTaiLieu(a);
		ex5.addSach(a);
		ex5.addSach(a2);
		ex5.addTapChi(b);
		//ex5.question4();
	}

}