package com.vti.entity;


public class Bao extends TaiLieu {
	private int ngayPhatHanh;

	@Override
	public String toString() {
		return "Bao \nngayPhatHanh=" + ngayPhatHanh +super.toString();
	}

	public Bao(String maTaiLieu, String tenNhaXuatBan, int soBanPhatHanh, int ngayPhatHanh) {
		super(maTaiLieu, tenNhaXuatBan, soBanPhatHanh);
		this.ngayPhatHanh = ngayPhatHanh;
	}

	public int getNgayPhatHanh() {
		return ngayPhatHanh;
	}

	public void setNgayPhatHanh(int ngayPhatHanh) {
		this.ngayPhatHanh = ngayPhatHanh;
	}
	
}
