package entity;

import java.util.Scanner;

public class Department {
private int id;
private String name;
private Scanner scanner;
public Department(int id,String name) {
	this.id=id;
	this.name=name;
}
public Department() {
	scanner = new Scanner(System.in);
	ScannerUtils scannerUtils = new ScannerUtils(scanner);
	System.out.println("Input ID");
	this.id = scannerUtils.inputInt("Try again with an integer");
	System.out.println("Input department name");
	this.name = scannerUtils .inputString();
}
public void closeScanner() {
	scanner.close();
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
@Override
public String toString() {
	return "Department [id=" + id + ", name=" + name + "]";
}

}
