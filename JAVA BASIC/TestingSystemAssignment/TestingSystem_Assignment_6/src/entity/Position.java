package entity;

import java.util.Scanner;

public class Position {
	private int id;
	private String name;
	public Scanner scanner;
	public Position(int id,String name) {
		this.id=id;
		this.name=name;
	}
	public Position() {
		scanner = new Scanner(System.in);
		ScannerUtils scannerUtils = new ScannerUtils(scanner);
		System.out.println("Input ID");
		this.id = scannerUtils.inputInt("Try again with an integer");
		System.out.println("Input position name");
		this.name = scannerUtils .inputString();
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
	public void closeScanner() {
		scanner.close();
	}
	@Override
	public String toString() {
		return "Position [id=" + id + ", name=" + name + "]";
	}
	
}
