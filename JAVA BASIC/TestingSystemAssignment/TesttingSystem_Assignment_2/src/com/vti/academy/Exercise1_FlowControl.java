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
		 * Exercise 1 (Optional): Flow Control IF Question 1: Ki???m tra account th??? 2 N???u
		 * kh??ng c?? ph??ng ban (t???c l?? department == null) th?? s??? in ra text
		 * "Nh??n vi??n n??y ch??a c?? ph??ng ban" N???u kh??ng th?? s??? in ra text
		 * "Ph??ng ban c???a nh??n vi??n n??y l?? ..."
		 */
		if (account2.department == null) {
			System.out.println("Nh??n vi??n n??y ch??a c?? ph??ng ban: ");
		} else {
			System.out.println("Ph??ng ban c???a nh??n vi??n n??y l: " + account2.department.name);
		}
		/*
		 * Question 2: Ki???m tra account th??? 2 N???u kh??ng c?? group th?? s??? in ra text
		 * "Nh??n vi??n n??y ch??a c?? group" N???u c?? m???t trong 1 ho???c 2 group th?? s??? in ra
		 * text "Group c???a nh??n vi??n n??y l?? Java Fresher, C# Fresher" N???u c?? m???t trong 3
		 * Group th?? s??? in ra text "Nh??n vi??n n??y l?? ng?????i quan tr???ng, tham gia nhi???u
		 * group" N???u c?? m???t trong 4 group tr??? l??n th?? s??? in ra text "Nh??n vi??n n??y l??
		 * ng?????i h??ng chuy???n, tham gia t???t c??? c??c group"
		 */
// add group for account 2
		account2.groups = new Group[] {group1,group2,group3};
		int countGroup = account2.groups.length;
		if(countGroup==0) {
			System.out.println("Nh??n vi??n n??y ch??a c?? group");
		} else if(countGroup==1){
			System.out.println("Group c???a nh??n vi??n n??y l?? Java Fresher, C# Fresher");
			} else if(countGroup==2){
				System.out.println("Group c???a nh??n vi??n n??y l?? Java Fresher, C# Fresher");
			}else if(countGroup==3) {
				System.out.println("Nh??n vi??n n??y l?? ng?????i quan tr???ng, tham gia nhi???u group");
			} else {
					System.out.println("Nh??n vi??n n??y l?? ng?????i h??ng chuy???n, tham gia t???t c??? c??c group");
			}
		/*
		 * Question 3: S??? d???ng to??n t??? ternary ????? l??m Question 1*/
		  System.out.println(account2.department == null ? "Nh??n vi??n n??y ch??a c?? ph??ng ban: "
							: "Ph??ng ban c???a nh??n vi??n n??y l??: " + account2.department.name);
		 /*Question 4: S??? d???ng to??n t??? ternary ????? l??m y??u c???u sau: Ki???m tra Position
		 * c???a account th??? 1 N???u Position = Dev th?? in ra text "????y l?? Developer" N???u
		 * kh??ng ph???i th?? in ra text "Ng?????i n??y kh??ng ph???i l?? Developer"
		 */
			System.out.println(account1.position.name == "Dev"? "????y l?? Developer"
					:"Ng?????i n??y kh??ng ph???i l?? Developer" );
		/*
		 * SWITCH CASE Question 5: L???y ra s??? l?????ng account trong nh??m th??? 1 v?? in ra
		 * theo format sau: N???u s??? l?????ng account = 1 th?? in ra "Nh??m c?? m???t th??nh vi??n"
		 * N???u s??? l?????ng account = 2 th?? in ra "Nh??m c?? hai th??nh vi??n" N???u s??? l?????ng
		 * account = 3 th?? in ra "Nh??m c?? ba th??nh vi??n" C??n l???i in ra
		 * "Nh??m c?? nhi???u th??nh vi??n"
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
		 * Question 6: S??? d???ng switch case ????? l??m l???i Question 2
		 */
		account2.groups = new Group[] {};
		int countGroupInAccount= account2.groups.length;
		if (countGroupInAccount==0) {
			System.out.println("Nh??n vi??n n??y ch??a c?? group "); 
		}else
			countGroupInAccount = account2.groups.length;
		switch(countGroupInAccount) {
			case 1:
			System.out.println("Group c???a nh??n vi??n n??y l?? Java Fresher, C# Fresher");
			break;
			case 2:
				System.out.println("Group c???a nh??n vi??n n??y l?? Java Fresher, C# Fresher");
				break;
			case 3:
				System.out.println("Nh??n vi??n n??y l?? ng?????i quan tr???ng, tham gia nhi???u group");
				break;
			case 4:
					System.out.println("Nh??n vi??n n??y l?? ng?????i h??ng chuy???n, tham gia t???t c??? c??c group");
			break;
			}
		/*
		/*
		 * Question 7: S??? d???ng switch case ????? l??m l???i Question 4
		 */
			
			switch(account1.position.name) {
			case "Dev" : System.out.println("????y l?? Developer");
			break;
			default:
				System.out.println("Ng?????i n??y kh??ng ph???i l?? Developer");
				break;
			}
			
		/*
		 * FOREACH Question 8: In ra th??ng tin c??c account bao g???m: Email, FullName v??
		 * t??n ph??ng ban c???a h???
		 */
		// Question 8: in thong tin account gom email, fullname, department name
			System.out.println("In ra thong tin cac account dung for each");
		Account[] accounts = new Account[] { account1, account2, account3, account4, account5 };
		for (Account accountob : accounts) {
			System.out.println("Email: " + accountob.email + "\nFull name: " + accountob.fullName
					+ "\nPh??ng ban: " + accountob.department.name);
		}
		// use for
		System.out.println("In ra thong tin cac account dung for");
		for (int i = 0; i < accounts.length; i++) {
			System.out.println("Email: " + accounts[i].email + "\nFull name: " + accounts[i].fullName
					+ "\nPh??ng ban: " + accounts[i].department.name);
		}
		/*
		 * Question 9: In ra th??ng tin c??c ph??ng ban bao g???m: id v?? name
		 */
		System.out.println("In ra th??ng tin c??c ph??ng ban dung for each");
		Department[] departments = new Department[] {department1,department2,department3,department4,department5};
		for (Department departmentob : departments) {
			System.out.println("Id: "+ departmentob.id+ "\nName: "+departmentob.name);
		}
		// FOR
		/*
		 * Question 10: In ra th??ng tin c??c account bao g???m: Email, FullName v?? t??n
		 * ph??ng ban c???a h??? theo ?????nh d???ng nh?? sau: 
		 * Th??ng tin account th??? 1 l??: 
		 * Email:NguyenVanA@gmail.com 
		 * Full name: Nguy???n V??n A 
		 * Ph??ng ban: Sale Th??ng tin
		 * Th??ng tin account th??? 2 l??: 
		 * Email: NguyenVanB@gmail.com
		 * Full name: Nguy???n V??n B
		 *  Ph??ng ban: Marketting
		 */
		System.out.println("In ra thong tin cac account ");
		for (int i = 0; i < accounts.length; i++) {
			System.out.println("Th??ng tin account th??? " +(1+i) +"\nEmail: " + accounts[i].email + "\nFull name: " + accounts[i].fullName
					+ "\nPh??ng ban: " + accounts[i].department.name);
		}
		/*
		 * Question 11: In ra th??ng tin c??c ph??ng ban bao g???m: id v?? name theo ?????nh d???ng
		 * sau: 
		 * Th??ng tin department th??? 1 l??: 
		 * Id: 1 
		 * Name: Sale 
		 * Th??ng tin department th??? 2 l??: 
		 * Id: 2 
		 * Name: Marketing
		 */
		System.out.println("In ra th??ng tin c??c ph??ng ban dung for ");
		for (int i=0; i< departments.length; i++) {
			System.out.println("Th??ng tin ph??ng ban th??? " +(1+i)+ "\nId: "+ departments[i].id+ "\nName: "+departments[i].name);
		}
		/*
		 * Question 12: Ch??? in ra th??ng tin 2 department ?????u ti??n theo ?????nh d???ng nh?? Question 10
		 */
		/*System.out.println("In ra th??ng tin 2 ph??ng ban ?????u ti??n ");
		for (int i=1; i< departments.length; i--) {
			System.out.println("Th??ng tin ph??ng ban th??? " +(1+i)+ "\nId: "+ departments[i].id+ "\nName: "+departments[i].name);
		}*/
		System.out.println("In ra th??ng tin 2 ph??ng ban ?????u ti??n ");
		for (int i=0;i<=1; i++) {
			System.out.println("Th??ng tin ph??ng ban th??? " +(1+i)+ "\nId: "+ departments[i].id+ "\nName: "+departments[i].name);
		}
		/*
		 * Question 13: In ra th??ng tin t???t c??? c??c account ngo???i tr??? account th??? 2
		 */
		System.out.println("In ra thong tin cac account ngo???i tr??? account th??? 2");
		for (int i = 0; i < accounts.length; i++) {
			if ((i+1) !=2)
			System.out.println("Th??ng tin account th??? " +(1+i) +"\nEmail: " + accounts[i].email + "\nFull name: " + accounts[i].fullName
					+ "\nPh??ng ban: " + accounts[i].department.name);
		}
		/*
		 * Question 14: In ra th??ng tin t???t c??? c??c account c?? id < 4
		 */
		System.out.println("In ra thong tin account c?? id < 4");
		for (int i = 0; i < accounts.length; i++) {
			if (i<4) 
			System.out.println("Th??ng tin account th??? " +(1+i) 
					+"\nID: " +accounts[i].id
					+"\nEmail: " + accounts[i].email 
					+"\nUser name: "+ accounts[i].userName
					+ "\nFull name: " + accounts[i].fullName
					+ "\nPh??ng ban: " + accounts[i].department.name 
					+ "\nV??? tr??: " + accounts[i].position.name
					+ "\nNg??y t???o t??i kho???n: " + accounts[i].createDate);
			}
		/*
		 * Question 15: In ra c??c s??? ch???n nh??? h??n ho???c b???ng 20
		 */
		int number = 20;
		System.out.println("S??? ch???n nh??? h??n ho???c b???ng 20: " );
		for (int i = 0;i<=number;i++) {
			//logic to check if the number is even or not  
			//if i%2 is equal to zero, the number is even  
			if (i%2==0)   
			{  
			System.out.print(i + " "); 
		}}
		
		/*
		 * WHILE Question 16: L??m l???i c??c Question ??? ph???n FOR b???ng c??ch s??? d???ng WHILE
		 * k???t h???p v???i l???nh break, continue DO-WHILE
		 */

		/*
		 * Question 17: L??m l???i c??c Question ??? ph???n FOR b???ng c??ch s??? d???ng DO-WHILE k???t
		 * h???p v???i l???nh break, continue
		 */

//
	}
}
