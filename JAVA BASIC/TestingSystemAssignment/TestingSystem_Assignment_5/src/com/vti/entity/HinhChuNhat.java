package com.vti.entity;

public class HinhChuNhat {
	protected float a;
	protected float b;

	public HinhChuNhat(float a, float b) {
		this.a = a;
		this.b = b;
	}

	public float tinhDienTich(float a, float b) {
		if (a != b) {
			// return a*b;
			System.out.println("Diện tích của hình chữ nhật là: ");
			return a * b;
		} else
			System.out.println("Diện tích của hình vuông là: ");
		return a * a;
	}

	public float tinhChuVi(float a, float b) {
		if (a != b) {
			System.out.println("Chu vi của hình chữ nhật là: ");
			return 2 * (a + b);
		} else
			System.out.println("Chu vi của hình vuông là: ");
		return a * 4;
	}
}
