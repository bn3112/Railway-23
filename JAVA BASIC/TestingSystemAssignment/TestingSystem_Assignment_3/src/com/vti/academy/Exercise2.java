package com.vti.academy;

import java.util.Date;

public class Exercise2 {

public static void main(String[] args) {
	/*Exercise 2 (Optional): Default value
Question 1:
Không sử dụng data đã insert từ bài trước, tạo 1 array Account và khởi
tạo 5 phần tử theo cú pháp (sử dụng vòng for để khởi tạo):
 Email: "Email 1"
 Username: "User name 1"
 FullName: "Full name 1"
 CreateDate: now */
			Account[] accounts = new Account[5];
	for (int i =0; i<accounts.length;i++) {
		accounts[i]= new Account();
		accounts[i].email = "Email "+i;
		accounts[i].fullName = "Full name "+i;
		accounts[i].createDate = new Date();
	}
	for (Account account:accounts) {
		System.out.println("Email "+ account.email);
		System.out.println("Full name "+ account.fullName);
		System.out.println("CreateDate "+ account.createDate);
	}
}
}
