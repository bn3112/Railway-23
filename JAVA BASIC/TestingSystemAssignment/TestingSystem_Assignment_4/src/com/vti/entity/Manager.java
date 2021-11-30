package com.vti.entity;

public class Manager extends User {
	public Manager(String name, double salaryRatio) {
		super(name, salaryRatio);

	}

	@Override
	public double calculatePay() {
		// TODO Auto-generated method stub
		return salaryRatio * 520;
	}
}
