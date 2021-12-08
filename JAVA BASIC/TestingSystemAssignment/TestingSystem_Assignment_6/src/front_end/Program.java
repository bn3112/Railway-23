package front_end;

import java.util.Scanner;

import backend.Exercise1;
import backend.Exercise2;
import entity.InvalidAgeInputingException;

public class Program {
	public static void main(String[] args) throws InvalidAgeInputingException {
	Scanner sc = new Scanner(System.in);
	Exercise1 ex1 = new Exercise1();
//	ex1.question1();
	Exercise2 ex2 = new Exercise2();
//	ex2.question1();
//	ex2.question3();
//	ex2.question4();
//	ex2.question5(sc);
//	ex2.question7(sc);
//	ex2.question8(sc);
//	ex2.question9(sc);
//	ex2.question10(sc);
	ex2.question12(sc);
	sc.close();
	}


}
