package com.vti.entity;

public class NhanVien extends CanBo {
public NhanVien(String ten, int tuoi, String gioiTinh, String diaChi,String congViec) {
		super(ten, tuoi, gioiTinh, diaChi);
		this.congViec=congViec;
	}

private String congViec;

@Override
public String toString() {
	return "NhanVien [congViec=" + congViec + "]";
}

public String getCongViec() {
	return congViec;
}

public void setCongViec(String congViec) {
	this.congViec = congViec;
}
}
