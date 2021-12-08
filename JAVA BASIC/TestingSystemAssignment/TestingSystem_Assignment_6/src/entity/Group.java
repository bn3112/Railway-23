package entity;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Scanner;

public class Group {
private int id;
private String name;
private Account creator;
private Scanner scanner;
private LocalDate createDate;
private ArrayList<Account> accounts;
public Group() {
	scanner = new Scanner(System.in);
	ScannerUtils scannerUtils = new ScannerUtils(scanner);
	System.out.println("Input ID");
	this.id = scannerUtils.inputInt("Try again with an integer");
	System.out.println("Input group name");
	this.name = scannerUtils.inputString();
	System.out.println("Input information of creator");
	this.creator = new Account(0, scannerUtils.inputString(), null, null, createDate);
	this.createDate = LocalDate.now();
	this.accounts = new ArrayList<Account>();
	boolean isOK = false;
	while (!isOK) {
		System.out.println("Do you want to create a new account \n1.Yes\n2.No");
		int num = scannerUtils.inputInt("You must to input an integer");
		switch (num) {	
		case 1:
			System.out.println("Inputs information of creator");
			Account newAcc = new Account(0, scannerUtils.inputString(), null, null, createDate);
		//	this.accounts = ArrayUtils.add(this.accounts,newAcc);

			System.out.println("Created  \n"+ newAcc.getName());
			isOK = true;
			break;
		case 2: 
			return;
		}
	}
}
public Group(int id,String name,Account creator,LocalDate createDate,ArrayList<Account> accounts) {
	this.id = id;
	this.name = name;
	this.accounts = accounts;
	this.creator = creator;
	this.createDate = createDate;
	this.accounts= accounts;
}
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public Account getCreator() {
	return creator;
}
public void setCreator(Account creator) {
	this.creator = creator;
}
public LocalDate getCreateDate() {
	return createDate;
}
public void setCreateDate(LocalDate createDate) {
	this.createDate = createDate;
}
public ArrayList<Account> getAccounts() {
	return accounts;
}
public void setAccounts(ArrayList<Account> accounts) {
	this.accounts = accounts;
}
@Override
public String toString() {
	return "Group [id=" + id + ", name=" + name + ", creator=" + creator + ", createDate=" + createDate + ", accounts="
			+ accounts + "]";
}

}
