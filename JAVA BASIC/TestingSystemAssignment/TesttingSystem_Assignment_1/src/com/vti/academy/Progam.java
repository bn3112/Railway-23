package com.vti.academy;
import java.util.Date;

import enums.PositionName;
import enums.TypeName;
public class Progam {
	private static final boolean True = true;

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

		// create typeQuestion
		TypeQuestion loai1 = new TypeQuestion();
		loai1.id = 1;
		loai1.typeName = TypeName.ESSAY.getTypeName();
		TypeQuestion loai2 = new TypeQuestion();
		loai1.id = 2;
		loai1.typeName = TypeName.MULTIPLE_CHOICE.getTypeName();

		// create CategoryQuestion
		CategoryQuestion categoryQuestion1 = new CategoryQuestion();
		categoryQuestion1.id = 1;
		categoryQuestion1.name = "Java";
		CategoryQuestion categoryQuestion2 = new CategoryQuestion();
		categoryQuestion2.id = 2;
		categoryQuestion2.name = "SQL";
		CategoryQuestion categoryQuestion3 = new CategoryQuestion();
		categoryQuestion3.id = 3;
		categoryQuestion3.name = "Python";

		// create Question
		Question question1 = new Question();
		question1.id = 1;
		question1.content = "What is SQL";
		question1.category = categoryQuestion2;
		question1.typeQuestion = loai2;
		question1.creator = account3;
		question1.createDate = new Date();
		Question question2 = new Question();
		question2.id = 2;
		question2.content = "What is Java";
		question2.category = categoryQuestion2;
		question2.typeQuestion = loai2;
		question2.creator = account3;
		question2.createDate = new Date();
		Question question3 = new Question();
		question3.id = 3;
		question3.content = "What is Python";
		question2.category = categoryQuestion2;
		question2.typeQuestion = loai2;
		question2.creator = account3;
		question2.createDate = new Date();

		// create Answer
		Answer answer1 = new Answer();
		answer1.id = 1;
		answer1.content = "SQL is Structure Query Language";
		answer1.question = question1;
		answer1.isCorrect = True;
		Answer answer2 = new Answer();
		answer2.id = 2;
		answer2.content = "Java is general purpose, class based, object oriented programing language";
		answer2.question = question2;
		answer2.isCorrect = True;
		Answer answer3 = new Answer();
		answer3.id = 3;
		answer3.content = "Python is an interpreted  high level general purpose programing language";
		answer3.question = question3;
		answer3.isCorrect = True;

		// create Exam
		Exam exam1 = new Exam();
		exam1.id = 1;
		exam1.code = "MS1";
		exam1.title = "Final Exam";
		exam1.category = categoryQuestion2;
		exam1.duration = 60;
		exam1.creator = account3;
		exam1.createDate = new Date();
		Question ar1[] = { question1, question3 };
		exam1.questions = ar1;
		Exam exam2 = new Exam();
		exam2.id = 2;
		exam2.code = "MS2";
		exam2.title = "Final Exam";
		exam2.category = categoryQuestion2;
		exam2.duration = 60;
		exam2.creator = account3;
		exam2.createDate = new Date();
		Question ar2[] = { question2, question3 };
		exam2.questions = ar2;
		Exam exam3 = new Exam();
		exam3.id = 3;
		exam3.code = "MS3";
		exam3.title = "Final Exam";
		exam3.category = categoryQuestion3;
		exam3.duration = 60;
		exam3.creator = account3;
		exam3.createDate = new Date();
		Question ar3[] = { question1, question2, question3 };
		exam3.questions = ar3;
		// print class department
		System.out.println("department's data 1");
		System.out.println("id: " + department1.id + "\nName: " + department1.name);
		// print class position
		System.out.println("\n");
		System.out.println("position's data 1");
		System.out.println("id: " + position1.id + "\nName: " + position1.name);
		// print class account
		System.out.println("\n");
		System.out.println("account's data 1");
		System.out.println("id: " + account1.id 
				+ "\nEmail: " + account1.email 
				+ "\nUsername: " + account1.userName
				+ "\nFullname: " + account1.fullName 
				+ "\nDepartment name: " + account1.department.name
				+ "\nPosition name: "+ account1.position.name 
				+ "\nCreateDate: " + account1.createDate);
		// print class group
		System.out.println("\n");
		System.out.println("group's data 1");
		System.out.println("id: " + group1.id + "\nGroup: " + group1.name);
		// print class group account
		System.out.println("\n");
		System.out.println("groupaccount's data 1");
		System.out.println("account: " + nhomJavaBasic.accounts 
				+ "\nGroup: " + nhomJavaBasic.group.name);
		// print class type question
		System.out.println("\n");
		System.out.println("typequestion's data 1");
		System.out.println("id: " + loai1.id + "\nType name: " + loai1.typeName);
		// print class category question
		System.out.println("\n");
		System.out.println("categoryQuestion's data 1");
		System.out.println("id: " + categoryQuestion1.id + "\nType name: " + categoryQuestion1.name);
		// print class question
		System.out.println("\n");
		System.out.println("Question's data 1");
		System.out.println("id: " + question1.id 
				+ "\nContent: " + question1.content 
				+ "\ncategoryQuestion ID "+ question1.category.id
				+ "\nType name " + question1.typeQuestion.typeName 
				+ "\nCreator ID: "+ question1.creator.id 
				+ "\nCreate Date: " + question1.createDate);
		// print class answer
		System.out.println("\n");
		System.out.println("Answer's data 1");
		System.out.println("id: " + answer1.id 
				+ "\nContent: " + answer1.content 
				+ "\nQuestion ID " + question1.id
				+ "\nIs Correct: " + answer1.isCorrect);
		// print class exam
		System.out.println("\n");
		System.out.println("Exam's data 1");
		System.out.println("id: " + exam1.id 
				+ "\nCode: " + exam1.code 
				+ "\nTitle: " + exam1.title
				+ "\ncategoryQuestion ID" + exam1.category.id 
				+ "\nDuration: " + exam1.duration 
				+ "\nCreator ID: "+ exam1.creator.id
				+ "\nCreate Date: "+ exam1.createDate);
	}

}
