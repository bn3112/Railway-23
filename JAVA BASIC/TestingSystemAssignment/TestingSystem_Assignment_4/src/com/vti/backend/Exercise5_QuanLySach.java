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
		System.out.println("Nhập mã tài liệu");
		String ma = scanner.nextLine();
		System.out.println("Nhập tên nhà xuất bản");
		String ten = scanner.nextLine();
		System.out.println("Nhập số bản phát hành");
		int soban = scanner.nextInt();
		boolean isOK = false;
		while (!isOK) {
			System.out.println("Bạn muốn thêm tài liệu này vào đâu: \n1.Sách \n2.Tạp chí \n3.Báo");
			int input = scanner.nextInt();
			if (input <= 3 && input >= 0) {
				switch (input) {
				case 1:
					System.out.println("Nhập số trang");
					int sotrang = scanner.nextInt();
					scanner.nextLine();
					System.out.println("Nhập tên tác giả");
					String tentacgia = scanner.nextLine();
					Sach sachmoi = new Sach(ma, ten, soban, tentacgia, sotrang);
					System.out.println("Đã thêm thành công");
					System.out.println(sachmoi.toString());
					isOK = true;
					break;
				case 2:
					System.out.println("Nhập số phát hành");
					int sophathanh = scanner.nextInt();
					System.out.println("Nhập tháng phát hành");
					int thang = scanner.nextInt();
					System.out.println("Nhập ngày phát hành");
					int ngay = scanner.nextInt();
					TapChi tapchimoi = new TapChi(ma, ten, soban, sophathanh, thang, ngay);
					System.out.println("Đã thêm thành công");
					System.out.println(tapchimoi.toString());
					isOK = true;
					break;
				case 3:
					System.out.println("Nhập ngày phát hành");
					int ngay1 = scanner.nextInt();
					Bao baomoi = new Bao(ma, ten, soban, ngay1);
					System.out.println("Đã thêm thành công");
					System.out.println(baomoi.toString());
					isOK = true;
					break;
				}
				return;
			} else {
				System.out.println("Mời bạn nhập lại số 1 hoặc 2 hoặc 3");
			}
		}
	}

	public static void deleteTaiLieu(Scanner scanner, ArrayList<TaiLieu> taiLieuArr) {
		System.out.println("Nhập mã tài liệu bạn muốn xóa ");
		String inputma = scanner.nextLine();
		boolean isCheck = false;
		for (TaiLieu tailieu : taiLieuArr) {
			if (taiLieuArr.removeIf(TaiLieu -> TaiLieu.getmaTaiLieu().equals(inputma))) {
				System.out.println("Đã xóa thành công "+ inputma);
				isCheck = true;
			}
		}
		if (isCheck == false) {
			System.out.println("Không tìm thấy tài liệu "+inputma);
		}
	}

	public static void thongtinTaiLieu(Scanner scanner, ArrayList<TaiLieu> taiLieuArr) {
		System.out.println("Nhập mã tài liệu để tìm thông tin tài liệu ");
		String searchId = scanner.next();
		boolean isCheck = false;
		for (TaiLieu tailieu : taiLieuArr) {
			if (tailieu.getmaTaiLieu().equalsIgnoreCase(searchId)) {
				System.out.println("Thông tin tài liệu : "+ tailieu.toString());
				isCheck = true;
			}
		}
		if (isCheck == false) {
			System.out.println("Không tìm thấy tài liệu "+searchId);
		}
	}

	public static void timTaiLieu(Scanner scanner, ArrayList<TaiLieu> taiLieuArr) {
		System.out.println("Nhập vào loại tài liệu cần tìm kiếm \n1.Sách\n2.Báo\n3.Tạp chí ");
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
			System.out.println("Không tìm thấy");
			break;
		}
	}

}

