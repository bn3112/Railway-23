package backend;

import java.util.Scanner;

import entity.AccountQ11;
import entity.Department;
import entity.Group;
import entity.InvalidAgeInputingException;
import entity.Position;
import entity.ScannerUtils;

public class Exercise2 {
	public void question1() {
		try {
			float result = devide(7, 2);
			System.out.println(result);
		} catch (ArithmeticException e) {
			System.out.println("cannot divide 0");
		} finally {
			System.out.println("divide completed!");
		}
	}

	private float devide(int a, int b) {
		if (b == 0) {
			throw new ArithmeticException();
		} else {
			return (float) a / b;
		}

	}

	public void question3() {
		try {
			int[] numbers = { 1, 2, 3 };
			System.out.println(numbers[10]);
		} catch (ArrayIndexOutOfBoundsException e) {
			System.out.println("Cannot find index");
		}
	}

	public void question4() {
		getIndex(3);
	}

	private void getIndex(int i) {
		Department dp1 = new Department(1, "Sale");
		Department dp2 = new Department(1, "Marketing");
		Department dp3 = new Department(1, "HR");
		Department[] depArr = { dp1, dp2, dp3 };
		try {
			System.out.println(depArr[i]);
		} catch (ArrayIndexOutOfBoundsException e) {
			System.out.println("Cannot find department.");
		}

	}

	public void question5(Scanner sc) {
		inputAge(sc);

	}

	private int inputAge(Scanner sc) {
		while (true) {
			System.out.println("Input your age");
			String age = sc.nextLine();
			try {
				int inputAge = Integer.parseInt(age);
				if (inputAge > 0) {
					System.out.println("Your age is " + inputAge);
					return inputAge;
				} else {
					System.out.println("Wrong inputing! The age must be greater than 0, please input again.");
				}

			} catch (Exception e) {
				System.out.println("Wrong inputing! Please input an age as int, input again.");
			}

		}
	}
	public void question7(Scanner sc) {
		ScannerUtils scU = new ScannerUtils(sc);
		System.out.println("Input an integer");
		int num = scU.inputInt("Is it an integer?\nTry again");
		System.out.println("You have entered an integer is " + num);
	}
	public void question8(Scanner sc) {
		ScannerUtils scU = new ScannerUtils(sc);
		
		System.out.println("Input a float");
		float numf = scU.inputFloat("Is it a float?\nTry again");
		System.out.println("You have entered a float is " + numf);	
		
		System.out.println("Input a double");
		double numd = scU.inputDouble("Is it a double?\nTry again");
		System.out.println("You have entered a double is " + numd);	
		
		System.out.println("Input a string");
		String str = scU.inputString();
		System.out.println("You have entered a string \n"+str);
	}
	public void question9(Scanner sc) {
		System.out.println("Create department");
		Department dp = new Department();
		System.out.println(dp);
	
		System.out.println("Create position");
		Position position = new Position();
		System.out.println(position);
	}
	public void question10(Scanner sc) {
		System.out.println("Create group");
		Group group = new Group();
		System.out.println(group);
		
	}
	public void question12(Scanner sc) throws InvalidAgeInputingException {
	AccountQ11 ac = new AccountQ11();
	System.out.println(ac);
	}
}