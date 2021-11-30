package com.vti.entity;

public class TapChi extends TaiLieu {
	private int soPhatHanh;
	private int thangPhatHanh;
	private int ngayPhatHanh;

	public TapChi(String maTaiLieu, String tenNhaXuatBan, int soBanPhatHanh, int soPhatHanh,
			 int thang,  int ngay) {
		super(maTaiLieu, tenNhaXuatBan, soBanPhatHanh);
		this.soPhatHanh = soPhatHanh;
		this.ngayPhatHanh = ngay;
		this.thangPhatHanh = thang;
	}

	@Override
	public String toString() {
		return "TapChi \nsoPhatHanh=" + soPhatHanh + ", \nthangPhatHanh=" + thangPhatHanh + ", \nngayPhatHanh="
				+ ngayPhatHanh + super.toString();
	}

	public int getSoPhatHanh() {
		return soPhatHanh;
	}

	public void setSoPhatHanh(int soPhatHanh) {
		this.soPhatHanh = soPhatHanh;
	}

	public int getThangPhatHanh() {
		return thangPhatHanh;
	}

	public void setThangPhatHanh(int thangPhatHanh) {
		this.thangPhatHanh = thangPhatHanh;
	}

	public int getNgayPhatHanh() {
		return ngayPhatHanh;
	}

	public void setNgayPhatHanh(int ngayPhatHanh) {
		this.ngayPhatHanh = ngayPhatHanh;
	}
	
}
