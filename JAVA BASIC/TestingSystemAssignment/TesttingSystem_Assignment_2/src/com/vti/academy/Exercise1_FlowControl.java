package com.vti.academy;

import java.util.Date;
import enums.PositionName;

public class Exercise1_FlowControl {
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

		// create group account
		GroupAccount nhomSQL = new GroupAccount();
		Account arr1[] = { account1, account2 };
		nhomSQL.accounts = arr1;
		nhomSQL.group = group1;
		nhomSQL.joinDate = new Date();
		GroupAccount nhomJavaBasic = new GroupAccount();
		Account arr2[] = { account2 };
		nhomJavaBasic.accounts = arr2;
		nhomJavaBasic.group = group2;
		nhomJavaBasic.joinDate = new Date();
		GroupAccount nhomPython = new GroupAccount();
		Account arr3[] = { account1, account2, account3 };
		nhomPython.accounts = arr3;
		nhomPython.group = group5;
		nhomPython.joinDate = new Date();
		/*
		 * Exercise 1 (Optional): Flow Control IF Question 1: Kiểm tra account thứ 2 Nếu
		 * không có phòng ban (tức là department == null) thì sẽ in ra text
		 * "Nhân viên này chưa có phòng ban" Nếu không thì sẽ in ra text
		 * "Phòng ban của nhân viên này là ..."
		 */
		if (account2.department == null) {
			System.out.println("Nhân viên này chưa có phòng ban: ");
		} else {
			System.out.println("Phòng ban của nhân viên này l: " + account2.department.name);
		}
		/*
		 * Question 2: Kiểm tra account thứ 2 Nếu không có group thì sẽ in ra text
		 * "Nhân viên này chưa có group" Nếu có mặt trong 1 hoặc 2 group thì sẽ in ra
		 * text "Group của nhân viên này là Java Fresher, C# Fresher" Nếu có mặt trong 3
		 * Group thì sẽ in ra text "Nhân viên này là người quan trọng, tham gia nhiều
		 * group" Nếu có mặt trong 4 group trở lên thì sẽ in ra text "Nhân viên này là
		 * người hóng chuyện, tham gia tất cả các group"
		 */
// add group for account 2
		account2.groups = new Group[] {group1,group2,group3};
		int countGroup = account2.groups.length;
		if(countGroup==0) {
			System.out.println("Nhân viên này chưa có group");
		} else if(countGroup==1){
			System.out.println("Group của nhân viên này là Java Fresher, C# Fresher");
			} else if(countGroup==2){
				System.out.println("Group của nhân viên này là Java Fresher, C# Fresher");
			}else if(countGroup==3) {
				System.out.println("Nhân viên này là người quan trọng, tham gia nhiều group");
			} else {
					System.out.println("Nhân viên này là người hóng chuyện, tham gia tất cả các group");
			}
		/*
		 * Question 3: Sử dụng toán tử ternary để làm Question 1*/
		  System.out.println(account2.department == null ? "Nhân viên này chưa có phòng ban: "
							: "Phòng ban của nhân viên này là: " + account2.department.name);
		 /*Question 4: Sử dụng toán tử ternary để làm yêu cầu sau: Kiểm tra Position
		 * của account thứ 1 Nếu Position = Dev thì in ra text "Đây là Developer" Nếu
		 * không phải thì in ra text "Người này không phải là Developer"
		 */
			System.out.println(account1.position.name == "Dev"? "Đây là Developer"
					:"Người này không phải là Developer" );
		/*
		 * SWITCH CASE Question 5: Lấy ra số lượng account trong nhóm thứ 1 và in ra
		 * theo format sau: Nếu số lượng account = 1 thì in ra "Nhóm có một thành viên"
		 * Nếu số lượng account = 2 thì in ra "Nhóm có hai thành viên" Nếu số lượng
		 * account = 3 thì in ra "Nhóm có ba thành viên" Còn lại in ra
		 * "Nhóm có nhiều thành viên"
		 add account to group*/
		group1.accounts = new Account[] { account1, account2, account3 };
		// kiem tra truoc khi chay neu trong nhom k co thanh vien cung se hien default
		int countAccount = group1.accounts == null ? 0 : group1.accounts.length;

		switch (countAccount) {
		case 1:
			System.out.println("Nhom co mot thanh vien");
			break;
		case 2:
			System.out.println("Nhom co hai thanh vien");
			break;
		case 3:
			System.out.println("Nhom co ba thanh vien");
			break;
		default:
			System.out.println("Nhom co nhieu thanh vien");
			break;
		}
		// tim account trong group account
		int countAccountInGroup = nhomSQL.accounts == null ? 0 : nhomSQL.accounts.length;
		switch (countAccountInGroup) {
		case 1:
			System.out.println("Nhom co mot thanh vien");
			break;
		case 2:
			System.out.println("Nhom co hai thanh vien");
			break;
		case 3:
			System.out.println("Nhom co ba thanh vien");
			break;
		default:
			System.out.println("Nhom co nhieu hoac khon co thanh vien");
			break;
		}

		/*
		 * Question 6: Sử dụng switch case để làm lại Question 2
		 */
		account2.groups = new Group[] {};
		int countGroupInAccount= account2.groups.length;
		if (countGroupInAccount==0) {
			System.out.println("Nhân viên này chưa có group "); 
		}else
			countGroupInAccount = account2.groups.length;
		switch(countGroupInAccount) {
			case 1:
			System.out.println("Group của nhân viên này là Java Fresher, C# Fresher");
			break;
			case 2:
				System.out.println("Group của nhân viên này là Java Fresher, C# Fresher");
				break;
			case 3:
				System.out.println("Nhân viên này là người quan trọng, tham gia nhiều group");
				break;
			case 4:
					System.out.println("Nhân viên này là người hóng chuyện, tham gia tất cả các group");
			break;
			}
		/*
		/*
		 * Question 7: Sử dụng switch case để làm lại Question 4
		 */
			
			switch(account1.position.name) {
			case "Dev" : System.out.println("Đây là Developer");
			break;
			default:
				System.out.println("Người này không phải là Developer");
				break;
			}
			
		/*
		 * FOREACH Question 8: In ra thông tin các account bao gồm: Email, FullName và
		 * tên phòng ban của họ
		 */
		// Question 8: in thong tin account gom email, fullname, department name
			System.out.println("In ra thong tin cac account dung for each");
		Account[] accounts = new Account[] { account1, account2, account3, account4, account5 };
		for (Account accountob : accounts) {
			System.out.println("Email: " + accountob.email + "\nFull name: " + accountob.fullName
					+ "\nPhòng ban: " + accountob.department.name);
		}
		// use for
		System.out.println("In ra thong tin cac account dung for");
		for (int i = 0; i < accounts.length; i++) {
			System.out.println("Email: " + accounts[i].email + "\nFull name: " + accounts[i].fullName
					+ "\nPhòng ban: " + accounts[i].department.name);
		}
		/*
		 * Question 9: In ra thông tin các phòng ban bao gồm: id và name
		 */
		System.out.println("In ra thông tin các phòng ban dung for each");
		Department[] departments = new Department[] {department1,department2,department3,department4,department5};
		for (Department departmentob : departments) {
			System.out.println("Id: "+ departmentob.id+ "\nName: "+departmentob.name);
		}
		// FOR
		/*
		 * Question 10: In ra thông tin các account bao gồm: Email, FullName và tên
		 * phòng ban của họ theo định dạng như sau: 
		 * Thông tin account thứ 1 là: 
		 * Email:NguyenVanA@gmail.com 
		 * Full name: Nguyễn Văn A 
		 * Phòng ban: Sale Thông tin
		 * Thông tin account thứ 2 là: 
		 * Email: NguyenVanB@gmail.com
		 * Full name: Nguyễn Văn B
		 *  Phòng ban: Marketting
		 */
		System.out.println("In ra thong tin cac account ");
		for (int i = 0; i < accounts.length; i++) {
			System.out.println("Thông tin account thứ " +(1+i) +"\nEmail: " + accounts[i].email + "\nFull name: " + accounts[i].fullName
					+ "\nPhòng ban: " + accounts[i].department.name);
		}
		/*
		 * Question 11: In ra thông tin các phòng ban bao gồm: id và name theo định dạng
		 * sau: 
		 * Thông tin department thứ 1 là: 
		 * Id: 1 
		 * Name: Sale 
		 * Thông tin department thứ 2 là: 
		 * Id: 2 
		 * Name: Marketing
		 */
		System.out.println("In ra thông tin các phòng ban dung for ");
		for (int i=0; i< departments.length; i++) {
			System.out.println("Thông tin phòng ban thứ " +(1+i)+ "\nId: "+ departments[i].id+ "\nName: "+departments[i].name);
		}
		/*
		 * Question 12: Chỉ in ra thông tin 2 department đầu tiên theo định dạng như Question 10
		 */
		/*System.out.println("In ra thông tin 2 phòng ban đầu tiên ");
		for (int i=1; i< departments.length; i--) {
			System.out.println("Thông tin phòng ban thứ " +(1+i)+ "\nId: "+ departments[i].id+ "\nName: "+departments[i].name);
		}*/
		System.out.println("In ra thông tin 2 phòng ban đầu tiên ");
		for (int i=0;i<=1; i++) {
			System.out.println("Thông tin phòng ban thứ " +(1+i)+ "\nId: "+ departments[i].id+ "\nName: "+departments[i].name);
		}
		/*
		 * Question 13: In ra thông tin tất cả các account ngoại trừ account thứ 2
		 */
		System.out.println("In ra thong tin cac account ngoại trừ account thứ 2");
		for (int i = 0; i < accounts.length; i++) {
			if ((i+1) !=2)
			System.out.println("Thông tin account thứ " +(1+i) +"\nEmail: " + accounts[i].email + "\nFull name: " + accounts[i].fullName
					+ "\nPhòng ban: " + accounts[i].department.name);
		}
		/*
		 * Question 14: In ra thông tin tất cả các account có id < 4
		 */
		System.out.println("In ra thong tin account có id < 4");
		for (int i = 0; i < accounts.length; i++) {
			if (i<4) 
			System.out.println("Thông tin account thứ " +(1+i) 
					+"\nID: " +accounts[i].id
					+"\nEmail: " + accounts[i].email 
					+"\nUser name: "+ accounts[i].userName
					+ "\nFull name: " + accounts[i].fullName
					+ "\nPhòng ban: " + accounts[i].department.name 
					+ "\nVị trí: " + accounts[i].position.name
					+ "\nNgày tạo tài khoản: " + accounts[i].createDate);
			}
		/*
		 * Question 15: In ra các số chẵn nhỏ hơn hoặc bằng 20
		 */
		int number = 20;
		System.out.println("Số chẵn nhỏ hơn hoặc bằng 20: " );
		for (int i = 0;i<=number;i++) {
			//logic to check if the number is even or not  
			//if i%2 is equal to zero, the number is even  
			if (i%2==0)   
			{  
			System.out.print(i + " "); 
		}}
		
		/*
		 * WHILE Question 16: Làm lại các Question ở phần FOR bằng cách sử dụng WHILE
		 * kết hợp với lệnh break, continue DO-WHILE
		 */

		/*
		 * Question 17: Làm lại các Question ở phần FOR bằng cách sử dụng DO-WHILE kết
		 * hợp với lệnh break, continue
		 */

//
	}
}
