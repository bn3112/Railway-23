package com.vti.backend;

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

import com.vti.academy.Account;
import com.vti.academy.Group;
import com.vti.entity.Bao;
import com.vti.entity.Sach;
import com.vti.entity.TaiLieu;
import com.vti.entity.TapChi;

public class Exercise5_QuanLySach {
	private static ArrayList<TaiLieu> taiLieuArr;
	private static ArrayList<TapChi> tapChiArr;
	private static ArrayList<Bao> baoArr;
	private static ArrayList<Sach> sachArr;

	public Exercise5_QuanLySach() {
		this.sachArr = new ArrayList<Sach>();
		this.taiLieuArr = new ArrayList<TaiLieu>();
		this.tapChiArr = new ArrayList<TapChi>();
		this.baoArr = new ArrayList<Bao>();
	}

	public void addSach(Sach tl) {
		this.sachArr.add(tl);
	}

	public void addTaiLieu(TaiLieu tl) {
		this.taiLieuArr.add(tl);
	}

	public void addTapChi(TapChi tl) {
		this.tapChiArr.add(tl);
	}

	public void addBao(Bao tl) {
		this.baoArr.add(tl);
	}

	public ArrayList<TapChi> getTapChiArr() {
		return tapChiArr;
	}

	public void setTapChiArr(ArrayList<TapChi> tapChiArr) {
		this.tapChiArr = tapChiArr;
	}

	public ArrayList<Bao> getBaoArr() {
		return baoArr;
	}

	public void setBaoArr(ArrayList<Bao> baoArr) {
		this.baoArr = baoArr;
	}

	public ArrayList<Sach> getSachArr() {
		return sachArr;
	}

	public void setSachArr(ArrayList<Sach> sachArr) {
		this.sachArr = sachArr;
	}

	public ArrayList<TaiLieu> getTaiLieuArr() {
		return taiLieuArr;
	}

	public void setTaiLieuArr(ArrayList<TaiLieu> taiLieuArr) {
		this.taiLieuArr = taiLieuArr;
	}

	@Override
	public String toString() {
		String result = "QuanLySach: ";
		for (TaiLieu taiLieu : taiLieuArr) {
			result += taiLieu;
		}
		for (Sach sach : sachArr) {
			result += sach;
		}
		for (Sach sach : sachArr) {
			result += sach;
		}
		for (Bao baoob : baoArr) {
			result += baoob;
		}
		for (TapChi tapchi : tapChiArr) {
			result += tapchi;
		}
		return result;
	}

	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		Sach a = new Sach("S1", "Giao duc", 2, "Nguyen Ngoc Anh", 100);
		Sach a2 = new Sach("S2", "Giao duc", 3, "Nguyen Ngoc Anh", 100);
		TapChi b = new TapChi("TC1", "Giao duc", 2, 10, 10, 10);

		Exercise5_QuanLySach quanly = new Exercise5_QuanLySach();
		quanly.addTaiLieu(a);
		quanly.addTaiLieu(a2);
		quanly.addTaiLieu(b);
		quanly.setTaiLieuArr(taiLieuArr);
		
		//addTaiLieu(scanner);
		//deleteTaiLieu(scanner, taiLieuArr);
		thongtinTaiLieu(scanner, taiLieuArr);
		timTaiLieu(scanner, taiLieuArr);
		scanner.close();
	}
	public static void addTaiLieu(Scanner scanner) {
		System.out.println("Nh???p m?? t??i li???u");
		String ma = scanner.nextLine();
		System.out.println("Nh???p t??n nh?? xu???t b???n");
		String ten = scanner.nextLine();
		System.out.println("Nh???p s??? b???n ph??t h??nh");
		int soban = scanner.nextInt();
		boolean isOK = false;
		while (!isOK) {
			System.out.println("B???n mu???n th??m t??i li???u n??y v??o ????u: \n1.S??ch \n2.T???p ch?? \n3.B??o");
			int input = scanner.nextInt();
			if (input <= 3 && input >= 0) {
				switch (input) {
				case 1:
					System.out.println("Nh???p s??? trang");
					int sotrang = scanner.nextInt();
					scanner.nextLine();
					System.out.println("Nh???p t??n t??c gi???");
					String tentacgia = scanner.nextLine();
					Sach sachmoi = new Sach(ma, ten, soban, tentacgia, sotrang);
					System.out.println("???? th??m th??nh c??ng");
					System.out.println(sachmoi.toString());
					isOK = true;
					break;
				case 2:
					System.out.println("Nh???p s??? ph??t h??nh");
					int sophathanh = scanner.nextInt();
					System.out.println("Nh???p th??ng ph??t h??nh");
					int thang = scanner.nextInt();
					System.out.println("Nh???p ng??y ph??t h??nh");
					int ngay = scanner.nextInt();
					TapChi tapchimoi = new TapChi(ma, ten, soban, sophathanh, thang, ngay);
					System.out.println("???? th??m th??nh c??ng");
					System.out.println(tapchimoi.toString());
					isOK = true;
					break;
				case 3:
					System.out.println("Nh???p ng??y ph??t h??nh");
					int ngay1 = scanner.nextInt();
					Bao baomoi = new Bao(ma, ten, soban, ngay1);
					System.out.println("???? th??m th??nh c??ng");
					System.out.println(baomoi.toString());
					isOK = true;
					break;
				}
				return;
			} else {
				System.out.println("M???i b???n nh???p l???i s??? 1 ho???c 2 ho???c 3");
			}
		}
	}

	public static void deleteTaiLieu(Scanner scanner, ArrayList<TaiLieu> taiLieuArr) {
		System.out.println("Nh???p m?? t??i li???u b???n mu???n x??a ");
		String inputma = scanner.nextLine();
		boolean isCheck = false;
		for (TaiLieu tailieu : taiLieuArr) {
			if (taiLieuArr.removeIf(TaiLieu -> TaiLieu.getmaTaiLieu().equals(inputma))) {
				System.out.println("???? x??a th??nh c??ng "+ inputma);
				isCheck = true;
			}
		}
		if (isCheck == false) {
			System.out.println("Kh??ng t??m th???y t??i li???u "+inputma);
		}
	}

	public static void thongtinTaiLieu(Scanner scanner, ArrayList<TaiLieu> taiLieuArr) {
		System.out.println("Nh???p m?? t??i li???u ????? t??m th??ng tin t??i li???u ");
		String searchId = scanner.next();
		boolean isCheck = false;
		for (TaiLieu tailieu : taiLieuArr) {
			if (tailieu.getmaTaiLieu().equalsIgnoreCase(searchId)) {
				System.out.println("Th??ng tin t??i li???u : "+ tailieu.toString());
				isCheck = true;
			}
		}
		if (isCheck == false) {
			System.out.println("Kh??ng t??m th???y t??i li???u "+searchId);
		}
	}

	public static void timTaiLieu(Scanner scanner, ArrayList<TaiLieu> taiLieuArr) {
		System.out.println("Nh???p v??o lo???i t??i li???u c???n t??m ki???m \n1.S??ch\n2.B??o\n3.T???p ch?? ");
		int number = scanner.nextInt();
		switch (number) {
		case 1:
			for (TaiLieu tailieu : taiLieuArr) {
				if (tailieu instanceof Sach)
					//thongtinTaiLieu(scanner, taiLieuArr);
					System.out.println(tailieu);
			}
			break;

		case 2:
			for (TaiLieu tailieu : taiLieuArr) {
				if (tailieu instanceof Bao)
					//thongtinTaiLieu(scanner, taiLieuArr);
					System.out.println(tailieu);
			}
			break;

		case 3:
			for (TaiLieu tailieu : taiLieuArr) {
				if (tailieu instanceof TapChi)
					//thongtinTaiLieu(scanner, taiLieuArr);
					System.out.println(tailieu);
			}
			break;
		default:
			System.out.println("Kh??ng t??m th???y");
			break;
		}
	}

}

