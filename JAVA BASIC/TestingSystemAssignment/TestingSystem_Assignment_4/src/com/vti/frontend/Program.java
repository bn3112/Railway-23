package com.vti.frontend;

import java.util.ArrayList;
import java.util.Scanner;

import com.vti.backend.Exercise1_Contructor;
import com.vti.backend.Exercise3_Access_Modifier;
import com.vti.backend.Exercise4_Encapsulation;
import com.vti.backend.Exercise5_QuanLySach;
import com.vti.entity.Bao;
import com.vti.entity.Sach;
import com.vti.entity.TaiLieu;
import com.vti.entity.TapChi;

public class Program {
	private static ArrayList<TaiLieu> taiLieuArr;

	public static void main(String[] args) {
		Exercise1_Contructor ex1 = new Exercise1_Contructor();
		 ex1.question1(); //Tạo constructor cho department:
		 ex1.question2(); //Tạo constructor cho Account:
		Exercise3_Access_Modifier ex3 = new Exercise3_Access_Modifier();
		 ex3.question1(); //private access modifier
		Exercise4_Encapsulation ex4 = new Exercise4_Encapsulation();
		ex4.question1b(); 
							/* b) Tạo constructor cho phép khi khởi tạo mỗi student thì người dùng sẽ nhập
							 * vào tên, hometown và có điểm học lực = 0
							 */
		ex4.question1c(); // Tạo 1 method cho phép set điểm vào
		ex4.question1d(); // Tạo 1 method cho phép cộng thêm điểm
		ex4.question1e();// Tạo 1 method để in ra thông tin của sinh viên
		
	}

}