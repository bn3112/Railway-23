package com.vti.entity;

public class HinhChuNhat {
protected float a;
protected float b;
public float tinhChuVi() {
	return 2*(a+b);
}
public float tinhDienTich() {
	return a*b;
}
public HinhChuNhat(float a,float b) {
	this.a=a;
	this.b=b;
}
}
