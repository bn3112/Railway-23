package com.vti.entity;

public class CongNhan extends CanBo{
public CongNhan(String ten, int tuoi, String gioiTinh, String diaChi,byte bac) {
		super(ten, tuoi, gioiTinh, diaChi);
		this.bac=bac;
	}

private byte bac;

	@Override
	public String toString() {
		return "CongNhan [bac=" + bac + "]";
	}

	public byte getBac(int i) {
		if(i>=1&&i<=10) {
			System.out.println("Bậc của nhân viên đó là: ");
			return bac;
		}
		else 
			return 0;
	}

	public void setBac(byte bac) {
		this.bac = bac;
	}


}
