package entity;

import java.util.Scanner;

public class ScannerUtils {
 private Scanner scanner;
 public  ScannerUtils(Scanner scanner) {
	 this.scanner = scanner;
 }
 public int inputInt(String errorMessage) {
	int output = 0;
	boolean isOK = false;
	while(isOK==false) {
		try {
			String input = scanner.nextLine();
			output = Integer.valueOf(input);
			isOK = true;
			} catch (NumberFormatException e) {
			System.out.println(errorMessage);
			isOK = false;
		}
	}
	return output;
	 
 }
 public float inputFloat(String errorMessage) {
	float output =  0;
	 boolean isOK = false;
	 while(isOK==false) {
		 try {
			 String input = scanner.nextLine();
			 output = Float.valueOf(input);
			 isOK = true;
		 } catch (NumberFormatException e) {
			 System.out.println(errorMessage);
			 isOK = false;
		 }
	 }
	 return output;
	 
 }
 public double inputDouble(String errorMessage) {
	 double output =  0;
	 boolean isOK = false;
	 while(isOK==false) {
		 try {
			 String input = scanner.nextLine();
			 output = Double.valueOf(input);
			 isOK = true;
		 } catch (NumberFormatException e) {
			 System.out.println(errorMessage);
			 isOK = false;
		 }
	 }
	 return output;
	 
 }
 public String inputString() {
	 return scanner.nextLine(); }
}
