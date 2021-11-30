package com.vti.academy;

public class Exercise3 {
public static void main(String[] args) {
	//question1();
	//question2();
question3();
}
/*Exercise 3(Optional): Boxing & Unboxing
Question 1:Khởi tạo lương có datatype là Integer có giá trị bằng 5000.
Sau đó convert lương ra float và hiển thị lương lên màn hình (với số
float có 2 số sau dấu thập phân)*/
private static void question1() {
	Integer salary = 5000;
	System.out.printf("%.2f",(float) salary);	
}
/*Question 2:
Khai báo 1 String có value = "1234567"
Hãy convert String đó ra số int*/
private static void question2() {
	String number = "1234567";
	int i = Integer.parseInt(number);
	System.out.println(i);
}
/*Question 3:
Khởi tạo 1 số Integer có value là chữ "1234567"
Sau đó convert số trên thành datatype int */
private static void question3() {
	Integer a = 1234567;
	int i = a.intValue();
	System.out.println(i);
	}
}
