package com.vti.academy;

import java.util.Date;
import java.util.Scanner;
import java.util.regex.Pattern;

import enums.PositionName;

public class Exercise4 {
	public static void main(String[] args) {
		// create department
		Department department1 = new Department();
		department1.id = 1;
		department1.name = "Sale";
		Department department2 = new Department();
		department2.id = 2;
		department2.name = "Marketing";
		Department department3 = new Department();
		department3.id = 3;
		department3.name = "Human and Resources";
		Department department4 = new Department();
		department4.id = 4;
		department4.name = "Accounting and Finaneces";
		Department department5 = new Department();
		department5.id = 5;
		department5.name = "Technology";

		// create position
		Position position1 = new Position();
		position1.id = 1;
		position1.name = PositionName.POSITION_DEV.getPositionName();
		Position position2 = new Position();
		position2.id = 2;
		position2.name = PositionName.POSITION_TEST.getPositionName();
		Position position3 = new Position();
		position3.id = 3;
		position3.name = PositionName.POSITION_SCRUM_MASTER.getPositionName();
		Position position4 = new Position();
		position4.id = 4;
		position4.name = PositionName.POSITION_PM.getPositionName();

		// create account
		Account account1 = new Account();
		account1.id = 1;
		account1.email = "nguyenhuyentrang@gamil.com";
		account1.userName = "huyen trang";
		account1.fullName = "Nguyen Huyen Trang";
		account1.department = department1;
		account1.position = position1;
		account1.createDate = new Date();

		Account account2 = new Account();
		account2.id = 2;
		account2.email = "anhtuyet@gamil.com";
		account2.userName = "anh tuyet";
		account2.fullName = "Duong Anh Tuyet";
		account2.department = department2;
		account2.position = position2;
		account2.createDate = new Date();
		Account account3 = new Account();
		account3.id = 3;
		account3.email = "thuquynh@gamil.com";
		account3.userName = "Thu Quynh";
		account3.fullName = "Truong Thu Quynh";
		account3.department = department3;
		account3.position = position3;
		account3.createDate = new Date();
		Account account4 = new Account();
		account4.id = 4;
		account4.email = "ngohuong@gamil.com";
		account4.userName = "ngo huong";
		account4.fullName = "Ngo Minh Huong";
		account4.department = department4;
		account4.position = position4;
		account4.createDate = new Date();
		Account account5 = new Account();
		account5.id = 5;
		account5.email = "hongha@gamil.com";
		account5.userName = "hong ha";
		account5.fullName = "Nguyen Hong Ha";
		account5.department = department5;
		account5.position = position3;
		account5.createDate = new Date();

		// create group
		Group group1 = new Group();
		group1.id = 1;
		group1.name = "SQL Basic";
		group1.creator = account3;
		group1.createDate = new Date();
		Group group2 = new Group();
		group2.id = 2;
		group2.name = "Java Basic";
		group2.creator = account3;
		group2.createDate = new Date();
		Group group3 = new Group();
		group3.id = 3;
		group3.name = "SQL Advanced";
		group3.creator = account3;
		group3.createDate = new Date();
		Group group4 = new Group();
		group4.id = 4;
		group4.name = "Java Advanced";
		group4.creator = account3;
		group4.createDate = new Date();
		Group group5 = new Group();
		group5.id = 5;
		group5.name = "Python";
		group5.creator = account3;
		group5.createDate = new Date();
		account1.groups = new Group[] { group1, group2 };
		account2.groups = new Group[] { group1 };
		account3.groups = new Group[] { group1, group2, group3 };
		account4.groups = new Group[] {};
		account5.groups = new Group[] {};
		Account[] accArr = new Account[] { account1, account2, account3, account4, account5 };
		Department[] departments = new Department[] { department1, department2, department3, department4, department5 };
		Group[] grArr = new Group[] { group1, group2, group3, group4, group5 };
		Scanner scanner = new Scanner(System.in);
//question1(scanner);
		// question1_2(scanner);
		// question2(scanner);
		// question3(scanner);
		// question3_2(scanner);
		// question4(scanner);
		// question5(scanner);
		// question6(scanner);
		// question7(scanner);
		// question7_2(scanner);
		// question8(scanner,grArr);
		// question9(scanner);
		// question10(scanner);
		// question11(scanner);
		// question12(scanner);
		/// question13(scanner);
		// question14(scanner);
		// question15(scanner);
		// question16(scanner);

		scanner.close();
	}
	/*
	 * Exercise 4: String
	 * 
	 * 
	 * 
	 * Question 14 (Optional): Replace character Cho một chuỗi str, chuyển các ký tự
	 * được chỉ định sang một ký tự khác cho trước. Ví dụ: "VTI Academy" chuyển ký
	 * tự 'e' sang '*' kết quả " VTI Acad*my" Question 15 (Optional): Revert string
	 * by word Đảo ngược các ký tự của chuỗi cách nhau bởi dấu cách mà không dùng
	 * thư viện. Ví dụ: " I am developer " => "developer am I". Các ký tự bên trong
	 * chỉ cách nhau đúng một dấu khoảng cách. Gợi ý: Các bạn cần loại bỏ dấu cách ở
	 * đầu và cuối câu, thao tác cắt chuỗi theo dấu cách Question 16 (Optional): Cho
	 * một chuỗi str và số nguyên n >= 0. Chia chuỗi str ra làm các phần bằng nhau
	 * với n ký tự. Nếu chuỗi không chia được thì xuất ra màn hình “KO”.
	 */

	/*
	 * Question 1: Nhập một xâu kí tự, đếm số lượng các từ trong xâu kí tự đó (các
	 * từ có thể cách nhau bằng nhiều khoảng trắng );
	 */
	public static void question1(Scanner scanner) {
		String chain;
		System.out.println("Nhập một xâu kí tự");
		chain = scanner.nextLine();
		int length = chain.length();

		System.out.println("số lượng các từ trong xâu kí tự " + length);
	}

	public static void question1_2(Scanner scanner) {
		String chain;
		System.out.println("Nhập một xâu kí tự");
		chain = scanner.nextLine().trim();
		if (chain.isEmpty() || chain == null) {
			System.out.println("so tu la 0");
		} else {
			String[] words = chain.split("\\s+");
			// String str ="hom nay toi di hoc, toi khong lam , bai tap";
			// String result = str.replace(",", " ");
			// System.out.println("str");
			System.out.println("số lượng các từ trong xâu kí tự " + words.length);
		}
	}

//Question 2: Nhập hai xâu kí tự s1, s2 nối xâu kí tự s2 vào sau xâu s1;
	public static void question2(Scanner scanner) {
		System.out.println("Nhập xâu kí tự s1");
		String s1 = scanner.next();
		System.out.println("Nhập xâu kí tự s2");
		String s2 = scanner.next();
		s1 = s1.concat(s2);
		System.out.println(s1);
	}

	/*
	 * Question 3: Viết chương trình để người dùng nhập vào tên và kiểm tra, nếu tên
	 * chưa viết hoa chữ cái đầu thì viết hoa lên
	 */
	public static void question3(Scanner scanner) {
		System.out.println("Nhập vào tên");
		String name = scanner.nextLine();
		String firstword = name.substring(0, 1).toUpperCase();
		String lastword = name.substring(1);
		String result = "";
		if (!Pattern.matches("[A-Z]", firstword))// check ky tu thuong
		{
			result = firstword.toUpperCase().concat(lastword);
		} else {
			result = firstword.concat(lastword);
		}
		System.out.println(result);

	}

	/*
	 * Question 4: Viết chương trình để người dùng nhập vào tên in từng ký tự trong
	 * tên của người dùng ra VD: Người dùng nhập vào "Nam", hệ thống sẽ in ra
	 * "Ký tự thứ 1 là: N" "Ký tự thứ 1 là: A" "Ký tự thứ 1 là: M"
	 */
	public static void question4(Scanner scanner) {
		System.out.println("Nhập vào tên");
		String name = scanner.nextLine().replaceAll("\s+", "");
		System.out.println(name);
		name = name.toUpperCase();
		for (int i = 0; i < name.length(); i++) {
			System.out.println("Ký tự thứ " + (i + 1) + " là: " + name.charAt(i));
		}
	}

	/*
	 * Question 5: Viết chương trình để người dùng nhập vào họ, sau đó yêu cầu người
	 * dùng nhập vào tên và hệ thống sẽ in ra họ và tên đầy đủ
	 */
	public static void question5(Scanner scanner) {
		System.out.println("Nhập vào họ");
		String ho = scanner.nextLine();
		System.out.println("Nhập vào tên");
		String ten = scanner.nextLine();
		String hoten = ho + " " + ten;
		System.out.println("Họ và tên " + hoten);
	}

	/*
	 * Question 6: Viết chương trình yêu cầu người dùng nhập vào họ và tên đầy đủ và
	 * sau đó hệ thống sẽ tách ra họ, tên , tên đệm VD: Người dùng nhập vào
	 * "Nguyễn Văn Nam" Hệ thống sẽ in ra "Họ là: Nguyễn" "Tên đệm là: Văn"
	 * "Tên là: Nam"
	 */
	public static void question6(Scanner scanner) {
		System.out.println("Nhập vào họ và tên");
		String fullname = scanner.nextLine();
		String[] words = fullname.split("\\s+");
		switch (words.length) {
		case 2:
			System.out.println("Họ là: " + words[0]);
			System.out.println("Tên là: " + words[1]);
			break;
		case 3:
			System.out.println("Họ là: " + words[0]);
			System.out.println("Tên đệm là: " + words[1]);
			System.out.println("Tên là: " + words[2]);
			break;
		case 4:
			System.out.println("Họ là: " + words[0]);
			System.out.println("Tên đệm là: " + words[1]);
			System.out.println("Tên là: " + words[2] + " " + words[3]);
		default:
			System.out.println("Tên của bạn quá dài không thể hiển thị");
		}
	}

	/*
	 * Question 7: Viết chương trình yêu cầu người dùng nhập vào họ và tên đầy đủ và
	 * chuẩn hóa họ và tên của họ như sau: a) Xóa dấu cách ở đầu và cuối và giữa của
	 * chuỗi người dùng nhập vào
	 * 
	 * VD: Nếu người dùng nhập vào " nguyễn văn nam " thì sẽ chuẩn hóa thành
	 * "nguyễn văn nam" b) Viết hoa chữ cái mỗi từ của người dùng VD: Nếu người dùng
	 * nhập vào " nguyễn văn nam " thì sẽ chuẩn hóa thành "Nguyễn Văn Nam"
	 */
	public static void question7(Scanner scanner) {
		System.out.println("Nhập vào họ và tên");
		String fullname = scanner.nextLine();
		fullname = fullname.trim();
		String[] fullnames = fullname.split("\s+");
		String result = "";
		for (String fn : fullnames) {
			result += String.valueOf(fullname.charAt(0)).toUpperCase().concat(fn.substring(1)).concat(" ");
		}
		System.out.printf(" họ và tên: '%s' %n'", result.trim());
	}
	/*
	 * public class TestSubstring2 { public static void main(String args[]) { String
	 * s = "Hello I'm Java"; System.out.println(s.substring(5)); //I'm Java
	 * System.out.println(s.substring(0, 5));//Hello } } Output: I'm Java Hello
	 */

	public static void question7_2(Scanner scanner) {
		String output = "";
		boolean isNextUpper = true;
		String input = "";
		for (int i = 0; i < input.length(); i++) {
			String curChar = input.substring(i, 1);
			if (isNextUpper) {
				output += curChar.toUpperCase();
				isNextUpper = false;
			} else {
				output += curChar.toLowerCase();
			}
			if (curChar == " ") {
				isNextUpper = true;
			}
		}
	}

	/*
	 * * Question 8: In ra tất cả các group có chứa chữ "Java" Question 10
	 * (Optional): Kiểm tra 2 chuỗi có là đảo ngược của nhau hay không. Nếu có xuất
	 * ra “OK” ngược lại “KO”. Ví dụ “word” và “drow” là 2 chuỗi đảo ngược nhau.
	 * Question 11 (Optional): Count special Character Tìm số lần xuất hiện ký tự
	 * "a" trong chuỗi Question 12 (Optional): Reverse String Đảo ngược chuỗi sử
	 * dụng vòng lặp Question 13 (Optional): String not contains digit Kiểm tra một
	 * chuỗi có chứa chữ số hay không, nếu có in ra false ngược lại true. Ví dụ:
	 * "abc" => true "1abc", "abc1", "123", "a1bc", null => false
	 */
	public static void question8(Scanner scanner, Group[] grArr) {
		for (Group group : grArr) {
			if (group.name.matches(".*Java.*")) {// group.name.contains("Java")
				System.out.println("group có chứa chữ \"Java\" " + group.name);
			}
		}
	}

	// Question 9: In ra tất cả các group "Java"
	public static void question9(Scanner scanner, Group[] grArr) {
		for (Group group : grArr) {
			if (group.name.equals("Java")) {
				System.out.println("group có chứa chữ \"Java\" " + group.name);
			}
		}
	}
}
