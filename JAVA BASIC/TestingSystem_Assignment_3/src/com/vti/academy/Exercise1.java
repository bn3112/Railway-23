package com.vti.academy;

import java.util.Random;
import java.util.Scanner;

public class Exercise1 {
	public static void main(String[] args) {
		// question1();
		// question2();
		// question3();
		question4();
	}

	/*
	 * Question 1: Khai báo 2 số lương có kiểu dữ liệu là float. Khởi tạo Lương của
	 * Account 1 là 5240.5 $ Khởi tạo Lương của Account 2 là 10970.055$ Khai báo 1
	 * số int để làm tròn Lương của Account 1 và in số int đó ra Khai báo 1 số int
	 * để làm tròn Lương của Account 2 và in số int đó ra
	 */
	private static void question1() {
		float account1 = 5240.5f;
		float account2 = 10970.055f;
		int a = (int) account1;
		int b = (int) account2;
		System.out.println("Lương của Account 1: " + a);
		System.out.println("Lương của Account 2: " + b);
	}

	/*
	 * Question 2: Lấy ngẫu nhiên 1 số có 5 chữ số (những số dưới 5 chữ số thì sẽ
	 * thêm có số 0 ở đầu cho đủ 5 chữ số)
	 */
	public static void question2() {
		// int a = 0;
		Random random = new Random();
		int x = random.nextInt(99999);
		if (x < 10000) {
			System.out.printf("%s0%s", "Lấy ngẫu nhiên 1 số có 5 chữ số: ", x);
		} else
			System.out.println("Lấy ngẫu nhiên 1 số có 5 chữ số: " + x);
//return a;
	}

	/*
	 * Question 3:Lấy 2 số cuối của số ở Question 2 và in ra. Gợi ý: Cách 1: convert
	 * số có 5 chữ số ra String, sau đó lấy 2 số cuối Cách 2: chia lấy dư số đó cho
	 * 100
	 */
	public static void question3() {
		Random random = new Random();
		int x = random.nextInt(99999);
		if (x < 10000) {
			System.out.printf("%s0%s", "Lấy ngẫu nhiên 1 số có 5 chữ số: ", x);
		} else
			System.out.println("Lấy ngẫu nhiên 1 số có 5 chữ số: " + x);

		String a = String.valueOf(x);
		System.out.println("hai so cuoi: " + a.substring(3));
	}

	/*
	 * Exercise 1 (Optional): Datatype Casting Question 4:Viết 1 method nhập vào 2
	 * số nguyên a và b và trả về thương của chúng
	 */
	public static void question4() {
		int a;
		int b;
		
		Scanner scanner = new Scanner(System.in);
		System.out.println("Nhập vàosố nguyên a ");
		a = scanner.nextInt();
		System.out.println("Nhập vàosố nguyên b ");
		b = scanner.nextInt();
		boolean isOk = false;
	if(b==0) {
		System.out.println("Hay nhap mot so khac 0");
			isOk = true;
		}else System.out.println("Thương: "+(float )a/b);
	scanner.close();
	}
	
}
