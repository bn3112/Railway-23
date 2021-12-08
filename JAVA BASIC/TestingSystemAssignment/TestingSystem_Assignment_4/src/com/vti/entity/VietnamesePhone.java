package com.vti.entity;

import java.util.ArrayList;
import java.util.ConcurrentModificationException;
import java.util.Scanner;

public class VietnamesePhone extends Phone {
	private ArrayList<Contact> contacts;
	private Contact contact;
	public VietnamesePhone() {
		contacts = new ArrayList<Contact>();
		
	}
	@Override
	public void insertContact(String name, String phone) {
		Contact contact = new Contact(phone, name);
		contacts.add(contact);
//		Contact ct1 = new Contact("Nhung", "08794258224");
//		Contact ct2 = new Contact("Nga", "08794258224");
//		Contact ct3 = new Contact("Nam", "08794258224");
//		contacts.add(ct3);
//		contacts.add(ct2);
//		contacts.add(ct1);
		
	}
	@Override
	public void removeContact(String name) {
		boolean isCheck = false;
		for (int i = 0; i < contacts.size(); i++) {
			if(contact.getName().equals(name))
			contacts.removeIf(contact->contact.getName().equalsIgnoreCase(name));
			{
				if (contact != contact)
					throw new ConcurrentModificationException();
				
				isCheck = true;
			}
	}
	if (!isCheck) {
			System.out.println("Not found " );
		}
	}
		
	@Override
	public void updateContact(String name, String newPhone) {
		for (Contact contact : contacts) {
			if(contact.getName().equals(name)) {
				contact.setNumber(newPhone);
			}
			
		}
	
		
	}
	@Override
	public void searchContact(String name) {
		for (Contact contact : contacts) {
			if(contact.getName().equals(name)) {
				System.out.println(contact);
			}
		
		}
		
	}
	@Override
	public String toString() {
		return "VietnamesePhone [contacts=" + contacts + "]";
	}
	public ArrayList<Contact> getContacts() {
		return contacts;
	}
	public void setContacts(ArrayList<Contact> contacts) {
		this.contacts = contacts;
	}

	
	public void vietnamesePhone() {
		Scanner scanner = new Scanner(System.in);
		boolean isOk = false;
		while (!isOk) {
			System.out.println("Welcome!!!!");
			System.out.println("Mời bạn chọn chức năng ");
			System.out.println("1. Insert Contact");
			System.out.println("2. Remove Contact");
			System.out.println("3. Update Contact");
			System.out.println("4. Search Contact");
			System.out.println("5. Exit !!!");
			int i = scanner.nextInt();
			switch (i) {
			case 1:
				System.out.println("Input name");
				String name = scanner.nextLine();
				scanner.nextLine();
				System.out.println("Input nember");
				String number = scanner.nextLine();
				insertContact(name, number);
				System.out.println("You have added \nName: "+name+"\nNumber: "+number);
				break;
			case 2:
				System.out.println("Input name you want to delete");
				String name1 = scanner.nextLine();
				scanner.nextLine();
				removeContact(name1);
				break;
			case 3:
				System.out.println("Input name you want to update");
				String name2 = scanner.nextLine();
				scanner.nextLine();
				searchContact(name2);
				System.out.println("Information: "+name2);
				break;
			case 4:
				System.out.println("Input name you want to find");
				String name3 = scanner.nextLine();
				scanner.nextLine();
				searchContact(name3);
				System.out.println("Information: "+name3);
				break;
			case 5:
				System.out.println("Bye !!!");
				return;
			default:
				System.out.println("Input 1~5");
				break;
			}
		}
		scanner.close();
	}
}
