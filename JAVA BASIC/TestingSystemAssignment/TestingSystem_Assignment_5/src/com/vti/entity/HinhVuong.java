package com.vti.entity;

public class HinhVuong extends HinhChuNhat {

	public HinhVuong(float a, float b) {
		super(a, b);
	}
	public float tinhChuVi() {
	return a*4;
	}
	public float tinhDienTich() {
		return a*a;
	}
}
