package com.vti.entity;

import java.util.ArrayList;
import java.util.List;

public class TaiLieu {
	private String maTaiLieu;
	private String tenNhaXuatBan;
	private int soBanPhatHanh;

	public TaiLieu(String maTaiLieu, String tenNhaXuatBan, int soBanPhatHanh) {
		this.maTaiLieu = maTaiLieu;
		this.tenNhaXuatBan = tenNhaXuatBan;
		this.soBanPhatHanh=soBanPhatHanh;
	}

	public String getmaTaiLieu() {
		return maTaiLieu;
	}

	public void setmaTaiLieu(String maTaiLieu) {
		this.maTaiLieu = maTaiLieu;
	}

	public String gettenNhaXuatBan() {
		return tenNhaXuatBan;
	}

	public void settenNhaXuatBan(String tenNhaXuatBan) {
		this.tenNhaXuatBan = tenNhaXuatBan;
	}

	public int getsoBanPhatHanh() {
		return getSoBanPhatHanh();
	}

	public void setsoBanPhatHanh(int soBanPhatHanh) {
		this.setSoBanPhatHanh(soBanPhatHanh);
	}

	

	@Override
	public String toString() {
		return "TaiLieu [maTaiLieu=" + maTaiLieu + ", tenNhaXuatBan=" + tenNhaXuatBan + ", soBanPhatHanh="
				+ soBanPhatHanh + "]\n";
	}

	public int getSoBanPhatHanh() {
		return soBanPhatHanh;
	}

	public void setSoBanPhatHanh(int soBanPhatHanh) {
		this.soBanPhatHanh = soBanPhatHanh;
	}

}
