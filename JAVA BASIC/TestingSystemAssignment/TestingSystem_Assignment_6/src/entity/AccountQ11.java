package entity;

import java.util.Scanner;

public class AccountQ11 {
	private int id;
	private String name;
	private int age;
	private Scanner scanner;

	public AccountQ11(String name, int age) {
		this.name = name;
		this.age = age;
	}

	@Override
	public String toString() {
		return "AccountQ11 [id=" + id + ", name=" + name + ", age=" + age + "]";
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

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public int inputAge(int age) throws InvalidAgeInputingException {
		if (age <= 0) {
			throw new InvalidAgeInputingException("The age must be greater than 0");
		} else {
			return age;
		}
	}

	public int inputAccountAge() throws InvalidAgeInputingException {
		scanner = new Scanner(System.in);
		ScannerUtils scannerUtils = new ScannerUtils(scanner);
		while (true) {
			int ageInput = scannerUtils.inputInt("Try again with an integer");
			if (ageInput <= 0) {
				try {
					throw new InvalidAgeInputingException("The age must be greater than 0, please input again.");
				} catch (Exception e) {
					try {
						
						if (ageInput > 0) {
							System.out.println("Your age is " + ageInput);
							return ageInput;
						} else {
							System.out.println("Wrong inputing! The age must be greater than 0, please input again.");
						}

					} catch (Exception e1) {
						System.out.println("Wrong inputing! Please input an age as int, input again.");
					}
				} 
				
			} else if (ageInput < 18) {
				System.out.println("Your age must be greater than 18, \nTry again, please!!!! ");
			} else {
				return ageInput;

			}
		}
	}

	public AccountQ11() throws InvalidAgeInputingException {
		try {
			scanner = new Scanner(System.in);
			ScannerUtils scannerUtils = new ScannerUtils(scanner);
			System.out.println("Input name");
			this.name = scannerUtils.inputString();
			System.out.println("Input age");
			this.age= inputAccountAge();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

	}
}
