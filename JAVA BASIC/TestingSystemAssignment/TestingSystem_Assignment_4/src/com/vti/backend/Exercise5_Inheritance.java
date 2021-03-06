package com.vti.backend;

import java.util.ArrayList;
import java.util.ConcurrentModificationException;
import java.util.Iterator;
import java.util.Scanner;

import org.apache.commons.lang3.ArrayUtils;

import com.vti.entity.Bao;
import com.vti.entity.CanBo;
import com.vti.entity.CongNhan;
import com.vti.entity.KySu;
import com.vti.entity.NhanVien;
import com.vti.entity.Sach;
import com.vti.entity.TaiLieu;
import com.vti.entity.TapChi;

public class Exercise5_Inheritance {
	private ArrayList<TaiLieu> taiLieuArr;
	private ArrayList<Sach> sachArr;
	private ArrayList<Bao> baoArr;
	private ArrayList<TapChi> tapChiArr;
//	private ArrayList<CongNhan> congNhanArr;
//	private ArrayList<KySu> kySuArr;
//	private ArrayList<NhanVien>nhanVienArr;
	private TaiLieu tailieu;
	private ArrayList<CanBo> canBoArr;
	private CanBo canbo;

	public Exercise5_Inheritance() {
		taiLieuArr = new ArrayList<TaiLieu>();

		canBoArr = new ArrayList<CanBo>();
		sachArr = new ArrayList<Sach>();
		baoArr = new ArrayList<Bao>();
		tapChiArr = new ArrayList<TapChi>();
	}
//	public void addKySu(KySu ks){
//		this.kySuArr.add(ks);
//	}
//	public void addCongNhan(CongNhan cn){
//		this.congNhanArr.add(cn);
//	}
//	public void addNhanVien(NhanVien nv){
//		this.nhanVienArr.add(nv);
//	}
//
//	public ArrayList<CongNhan> getCongNhanArr() {
//		return congNhanArr;
//	}
//
//	public void setCongNhanArr(ArrayList<CongNhan> congNhanArr) {
//		this.congNhanArr = congNhanArr;
//	}
//
//	public ArrayList<KySu> getKySuArr() {
//		return kySuArr;
//	}
//
//	public void setKySuArr(ArrayList<KySu> kySuArr) {
//		this.kySuArr = kySuArr;
//	}
//
//	public ArrayList<NhanVien> getNhanVienArr() {
//		return nhanVienArr;
//	}
//
//	public void setNhanVienArr(ArrayList<NhanVien> nhanVienArr) {
//		this.nhanVienArr = nhanVienArr;
//	}

	public ArrayList<Sach> getSachArr() {
		return sachArr;
	}

	public void setSachArr(ArrayList<Sach> sachArr) {
		this.sachArr = sachArr;
	}

	public ArrayList<Bao> getBaoArr() {
		return baoArr;
	}

	public void setBaoArr(ArrayList<Bao> baoArr) {
		this.baoArr = baoArr;
	}

	public ArrayList<TapChi> getTapChiArr() {
		return tapChiArr;
	}

	public void setTapChiArr(ArrayList<TapChi> tapChiArr) {
		this.tapChiArr = tapChiArr;
	}

	public void addSach(Sach sach) {
		this.sachArr.add(sach);
	}

	public void addBao(Bao bao) {
		this.baoArr.add(bao);
	}

	public void addTapChi(TapChi tc) {
		this.tapChiArr.add(tc);
	}

	public void addCanBo(CanBo canbo) {
		this.canBoArr.add(canbo);
	}

	public ArrayList<CanBo> getCanBoArr() {
		return canBoArr;
	}

	public void setCanBoArr(ArrayList<CanBo> canBoArr) {
		this.canBoArr = canBoArr;
	}

	public ArrayList<TaiLieu> getTaiLieuArr() {
		return taiLieuArr;
	}

	public void setTaiLieuArr(ArrayList<TaiLieu> taiLieuArr) {
		this.taiLieuArr = taiLieuArr;
	}

	public void addTaiLieu(TaiLieu tl) {
		this.taiLieuArr.add(tl);
	}

	public void question1() {
		quanLyCanBo();
	}

	private void quanLyCanBo() {
		Scanner scanner = new Scanner(System.in);
		boolean isOk = false;
		while (!isOk) {
			System.out.println("Ch??o m???ng b???n ?????n v???i ch????ng tr??nh qu???n l?? c??n b???!!!!");
			System.out.println("M???i b???n ch???n ch???c n??ng ");
			System.out.println("1. Th??m m???i c??n b???");
			System.out.println("2. T??m ki???m theo h??? t??n");
			System.out.println("3. Hi???n th??? th??ng tin v??? danh s??ch c??c c??n b???");
			System.out.println("4. Nh???p v??o t??n c???a c??n b??? v?? delete c??n b??? ????");
			System.out.println("5. Tho??t kh???i ch????ng tr??nh");
			int i = scanner.nextInt();
			switch (i) {
			case 1:
				themCanBo(scanner);
				break;
			case 2:
				timCanBo(scanner);
				break;
			case 3:
				thongTinCanBo();
				break;
			case 4:
				xoaCanBoTheoTen(scanner);
				break;
			case 5:
				System.out.println("Tho??t kh???i ch????ng tr??nh");
				return;
			default:
				System.out.println("M???i b???n nh???p l???i s??? 1~5");
				break;
			}
		}
		scanner.close();
	}

	private void themCanBo(Scanner scanner) {
		System.out.println("Nh???p tu???i ");
		int tuoi = scanner.nextInt();
		scanner.nextLine();
		System.out.println("Nh???p t??n");
		String ten = scanner.nextLine();
		System.out.println("Nh???p gi???i t??nh ");
		String gioitinh = scanner.nextLine();
		System.out.println("Nh???p ?????a ch??? ");
		String diachi = scanner.nextLine();
		boolean isOK = false;
		while (!isOK) {
			System.out.println("B???n mu???n th??m c??n b??? n??y v??o v??? tr?? n??o ");
			System.out.println("\n1. Nh??n vi??n ");
			System.out.println("\n2. K??? s?? ");
			System.out.println("\n3. C??ng nh??n ");
			System.out.println("\n4. Tho??t th??m c??n b??? ");
			int i = scanner.nextInt();
			scanner.nextLine();
			if (i >= 0 && i <= 4) {
				switch (i) {
				case 1:
					System.out.println("Nh???p c??ng vi???c");
					String congviec = scanner.nextLine();
					NhanVien addnhanvien = new NhanVien(ten, tuoi, gioitinh, diachi, congviec);
					System.out.println("???? th??m c??n b??? m???i");
					System.out.println(addnhanvien.getTen());
					canBoArr.add(addnhanvien);
					break;
				case 2:
					System.out.println("Nh???p ng??nh ?????o t???o");
					String nganh = scanner.nextLine();
					KySu addkysu = new KySu(ten, tuoi, gioitinh, diachi, nganh);
					System.out.println("???? th??m c??n b??? m???i");
					System.out.println(addkysu.getTen());
					canBoArr.add(addkysu);
					break;
				case 3:
					System.out.println("Nh???p c???p b???c c??ng nh??n t??? 1->10");
					byte bac = scanner.nextByte();
					CongNhan addcongnhan = new CongNhan(ten, tuoi, gioitinh, diachi, bac);
					System.out.println("???? th??m c??n b??? m???i");
					System.out.println(addcongnhan.getTen());
					canBoArr.add(addcongnhan);
					break;
				case 4:
					System.out.println("Tho??t");
					break;
				}
				return;
			} else {
				System.out.println("M???i b???n nh???p s??? t??? 1~4");
			}

		}

	}

	private void timCanBo(Scanner scanner) {
		System.out.println("Nh???p v??o t??n b???n mu???n t??m ki???m: ");
		String ten = scanner.nextLine();
		scanner.nextLine();
		boolean isExists = false;
		for (CanBo cb : canBoArr) {
			if (cb.getTen().equalsIgnoreCase(ten)) {
				System.out.println(cb.toString());
				isExists = true;
			}
		}
//		if (!isExists) {
//			System.out.println("Kh??ng t??m th???y  !!!");
//		}

	}

	private void thongTinCanBo() {
		if (canBoArr.size() > 0)
			for (CanBo canbo : canBoArr) {
				System.out.println(canbo);
			}
		else {
			System.out.println("Kh??ng c?? c??n b??? ????? hi???n th???");
		}

	}

	private void xoaCanBoTheoTen(Scanner scanner) {
		System.out.println("Nh???p v??o t??n b???n mu???n xo??: ");
		String ten = scanner.nextLine();
		scanner.nextLine();
		boolean isCheck = false;
		for (int i = 0; i < canBoArr.size(); i++) {
			if (canBoArr.removeIf(CanBo -> CanBo.getTen().equalsIgnoreCase(ten))) {
				if (canbo != canbo)
					throw new ConcurrentModificationException();
				System.out.println("???? x??a th??nh c??ng " + ten);
				System.out.println("T??i li???u c??n l???i l??: " + canBoArr.toString());
				isCheck = true;
			}
		}
		if (!isCheck) {
			System.out.println("Kh??ng t??m th???y " + ten);
		}

	}

//		int [] indexArr = new int[] {};
//		boolean isExists = false;
//		if(canBoArr.size()>0) {	
//			
//			for (CanBo canbo1 : canBoArr) {
//				if (canbo1.getTen().equalsIgnoreCase(ten)) {
//			indexArr = ArrayUtils.add(indexArr, index);
//					isExists = true;
//				}
//				index++;
//			}
//			if(indexArr.length>0) {
//				canBoArr=ArrayUtils.(canBoArr,indexArr);
//			}
//		}if (!isExists) {
//				System.out.println("Kh??ng t??m th???y !");
//			}
////	
//	}

	public void question4() {
		QuanLySach();
	}

	private void QuanLySach() {
		Scanner scanner = new Scanner(System.in);
		boolean isOk = false;
		while (!isOk) {
			System.out.println("Ch??o m???ng b???n ?????n v???i ch????ng tr??nh qu???n l?? t??i li???u!!!!");
			System.out.println("M???i b???n ch???n ch???c n??ng ");
			System.out.println("1. Th??m m???i t??i li??u: S??ch, t???p ch??, b??o");
			System.out.println("2. Xo?? t??i li???u theo m?? t??i li???u");
			System.out.println("3. Hi???n th??? th??ng tin v??? t??i li???u");
			System.out.println("4. T??m ki???m t??i li???u theo lo???i: S??ch, t???p ch??, b??o");
			System.out.println("5. Tho??t kh???i ch????ng tr??nh");
			int i = scanner.nextInt();
			switch (i) {
			case 1:
				addTaiLieu(scanner);
				break;
			case 2:
				deleteTaiLieu(scanner);
				break;
			case 3:
				thongtinTaiLieu();
				break;
			case 4:
				timTaiLieu(scanner);
				break;
			case 5:
				System.out.println("Tho??t kh???i ch????ng tr??nh");
				return;
			default:
				System.out.println("M???i b???n nh???p l???i s??? 1~5");
				break;
			}
		}
		scanner.close();
	}

	private void addTaiLieu(Scanner scanner) {
		boolean isOK = false;
		while (!isOK) {
			System.out.println("B???n mu???n th??m t??i li???u n??y v??o ????u: \n1.S??ch \n2.T???p ch?? \n3.B??o");
			int input = scanner.nextInt();
			if (input <= 3 && input >= 1) {
				switch (input) {
				case 1:
					System.out.println("Nh???p m?? t??i li???u");
					String ma = scanner.nextLine();
					scanner.nextLine();
					System.out.println("Nh???p t??n nh?? xu???t b???n");
					String ten = scanner.nextLine();
					System.out.println("Nh???p s??? b???n ph??t h??nh");
					int soban = scanner.nextInt();
					System.out.println("Nh???p s??? trang");
					int sotrang = scanner.nextInt();
					scanner.nextLine();
					System.out.println("Nh???p t??n t??c gi???");
					String tentacgia = scanner.nextLine();
					Sach sachmoi = new Sach(ma, ten, soban, tentacgia, sotrang);
					taiLieuArr.add(sachmoi);
					System.out.println("???? th??m th??nh c??ng");
					System.out.println(sachmoi.toString());
					
					break;
				case 2:
					System.out.println("Nh???p m?? t??i li???u");
					String ma1 = scanner.nextLine();
					scanner.nextLine();
					System.out.println("Nh???p t??n nh?? xu???t b???n");
					String ten1 = scanner.nextLine();
					System.out.println("Nh???p s??? b???n ph??t h??nh");
					int soban1 = scanner.nextInt();
					System.out.println("Nh???p s??? ph??t h??nh");
					int sophathanh = scanner.nextInt();
					System.out.println("Nh???p th??ng ph??t h??nh");
					int thang = scanner.nextInt();
					System.out.println("Nh???p ng??y ph??t h??nh");
					int ngay = scanner.nextInt();
					TapChi tapchimoi = new TapChi(ma1, ten1, soban1, sophathanh, thang, ngay);
					taiLieuArr.add(tapchimoi);
					System.out.println("???? th??m th??nh c??ng");
					System.out.println(tapchimoi.toString());
					
					break;
				case 3:
					System.out.println("Nh???p m?? t??i li???u");
					String ma2 = scanner.nextLine();
					scanner.nextLine();
					System.out.println("Nh???p t??n nh?? xu???t b???n");
					String ten2 = scanner.nextLine();
					System.out.println("Nh???p s??? b???n ph??t h??nh");
					int soban2 = scanner.nextInt();
					System.out.println("Nh???p ng??y ph??t h??nh");
					int ngay1 = scanner.nextInt();
					Bao baomoi = new Bao(ma2, ten2, soban2, ngay1);
					taiLieuArr.add(baomoi);
					System.out.println("???? th??m th??nh c??ng");
					System.out.println(baomoi.toString());
					
					break;
				}
				return;
			} else {
				System.out.println("S??? b???n nh???p kh??ng ????ng");
				System.out.println("M???i b???n nh???p l???i s??? 1 ho???c 2 ho???c 3");
			}
		}
	}

	private void deleteTaiLieu(Scanner scanner) {

		System.out.println("Nh???p m?? t??i li???u b???n mu???n x??a ");
		String inputma = scanner.next();

		boolean isCheck = false;

		for (int i = 0; i < taiLieuArr.size(); i++) {
			if (taiLieuArr.removeIf(TaiLieu -> TaiLieu.getmaTaiLieu().equals(inputma))) {
				if (tailieu != tailieu)
					throw new ConcurrentModificationException();
				System.out.println("???? x??a th??nh c??ng " + inputma);
				System.out.println("T??i li???u c??n l???i l??: " + taiLieuArr.toString());
				isCheck = true;
			}
		}
		if (!isCheck) {
			System.out.println("Kh??ng t??m th???y t??i li???u " + inputma);
		}
	}

	private void thongtinTaiLieu() {
		for (TaiLieu tailieu : taiLieuArr) {
			System.out.println("Th??ng tin t??i li???u : " + tailieu.toString());
		}

	}

	private void timTaiLieu(Scanner scanner) {
		boolean isOK = false;
		while (!isOK) {
			System.out.println("Nh???p v??o lo???i t??i li???u c???n t??m ki???m \n1.S??ch\n2.B??o\n3.T???p ch?? \n4.Tho??t t??m ki???m ");
			int input = scanner.nextInt();
			for (TaiLieu tailieu : taiLieuArr) {
				if (input >= 1 && input <= 4) {
					switch (input) {
					case 1:

						if (tailieu instanceof Sach) {
							System.out.println("Th??ng tin t??i li???u : " + tailieu.toString());
							isOK = true;
						}
						break;
					case 2:

						if (tailieu instanceof Bao) {
							System.out.println(tailieu.toString());
						}
						isOK = true;
						break;
					case 3:

						if (tailieu instanceof TapChi) {
							System.out.println(tailieu.toString());
						}
						isOK = true;
						break;
					case 4:
						return;
					}

				} else {
					System.out.println("S??? b???n nh???p kh??ng ????ng");
					System.out.println("M???i b???n nh???p l???i s??? 1 ho???c 2 ho???c 3 ????? t??m ki???m");
				}
//				if (!isOK) {
//					System.out.println("Kh??ng t??m th???y t??i li???u");
//
//				}
			}
		}
	}
}
