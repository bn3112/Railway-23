package com.vti.entity;

public class Sach extends TaiLieu {
	public Sach(String maTaiLieu, String tenNhaXuatBan, int soBanPhatHanh, String tenTacGia, int soTrang) {
		super(maTaiLieu, tenNhaXuatBan, soBanPhatHanh);
		this.tenTacGia = tenTacGia;
		this.soTrang = soTrang;
	}

	private String tenTacGia;
	private int soTrang;
	public Object getTenTacGia;
	@Override
	public String toString() {
		return "Sach \ntenTacGia=" + tenTacGia + ", soTrang=" + soTrang + super.toString();
	}
	public String getTenTacGia() {
		return tenTacGia;
	}
	public void setTenTacGia(String tenTacGia) {
		this.tenTacGia = tenTacGia;
	}
	public int getSoTrang() {
		return soTrang;
	}
	public void setSoTrang(int soTrang) {
		this.soTrang = soTrang;
	}
	
}
