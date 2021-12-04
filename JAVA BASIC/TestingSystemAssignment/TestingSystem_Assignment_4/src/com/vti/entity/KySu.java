package com.vti.entity;

public class KySu extends CanBo {
public KySu(String ten, int tuoi, String gioiTinh, String diaChi,String nganhDaoTao) {
		super(ten, tuoi, gioiTinh, diaChi);
		this.nganhDaoTao=nganhDaoTao;
	}

private String nganhDaoTao;

@Override
public String toString() {
	return "KySu [nganhDaoTao=" + nganhDaoTao + "]";
}

public String getNganhDaoTao() {
	return nganhDaoTao;
}

public void setNganhDaoTao(String nganhDaoTao) {
	this.nganhDaoTao = nganhDaoTao;
}
}
