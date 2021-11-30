package com.vti.entity;

public  class Employee extends User{

	public Employee(String name, double salaryRatio) {
		super(name, salaryRatio);

	}

	@Override
	public double calculatePay() {
		return salaryRatio*420;
	}
public static void main(String[] args) {
	Employee em1 = new Employee("Nguyen", 0.5);
	
	em1.displayInfor();
}
}
