package com.vti.backend;

import java.util.ArrayList;
import java.util.ConcurrentModificationException;
import java.util.Scanner;
import com.vti.entity.Bao;
import com.vti.entity.Sach;
import com.vti.entity.TaiLieu;
import com.vti.entity.TapChi;

public class Exercise5_Inheritance {
	private ArrayList<TaiLieu> taiLieuArr;
	private Scanner scanner;
	private TaiLieu tailieu;

	public Exercise5_Inheritance() {
		taiLieuArr = new ArrayList<TaiLieu>();
		scanner = new Scanner(System.in);
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

	public void question4() {
		QuanLySach();
	}

	public void QuanLySach() {
		boolean isOk = false;
		while (!isOk) {
			System.out.println("Chào mừng bạn đến với chương trình quản lý tài liệu!!!!");
			System.out.println("Mời bạn chọn chức năng ");
			System.out.println("1. Thêm mới tài liêu: Sách, tạp chí, báo");
			System.out.println("2. Xoá tài liệu theo mã tài liệu");
			System.out.println("3. Hiện thị thông tin về tài liệu");
			System.out.println("4. Tìm kiếm tài liệu theo loại: Sách, tạp chí, báo");
			System.out.println("5. Thoát khỏi chương trình");
			int i = scanner.nextInt();
			switch (i) {
			case 1:
				addTaiLieu();
				break;
			case 2:
				deleteTaiLieu();
				break;
			case 3:
				thongtinTaiLieu();
				break;
			case 4:
				timTaiLieu();
				break;
			case 5:
				System.out.println("Thoát khỏi chương trình");
				return;
			default:
				System.out.println("Mời bạn nhập lại số 1~5");
				break;
			}
		}
		scanner.close();
	}

	private void addTaiLieu() {
		System.out.println("Nhập mã tài liệu");
		String ma = scanner.nextLine();
		scanner.nextLine();
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

	private void deleteTaiLieu() {
//		System.out.println("Nhập mã tài liệu bạn muốn xóa ");
//		String inputma = scanner.next();
//		boolean isCheck = false;
//		for (int i = 0; i < taiLieuArr.size(); i++) {
//			{
//				Iterator<TaiLieu> it = taiLieuArr.iterator();
//				while (it.hasNext()) {
//				if (taiLieuArr.removeIf(TaiLieu -> TaiLieu.getmaTaiLieu().equals(inputma))) 
//					//if(((TaiLieu) tailieu).getmaTaiLieu().equals(inputma))
//					//if(inputma.maTaiLieuEqualTo((TaiLieu) it).getmaTaiLieu())	
//					it.remove();
//					
//				}
//				System.out.println("Đã xóa thành công " + inputma );
//				System.out.println("Tài liệu còn lại là: " + taiLieuArr.toString());
//				isCheck = true;
//			}
//		}
//		if (isCheck == false) {
//			System.out.println("Không tìm thấy tài liệu " + inputma);
//		}
		// scanner.close();
		System.out.println("Nhập mã tài liệu bạn muốn xóa ");
		String inputma = scanner.next();
		boolean isCheck = false;
		for (int i = 0; i < taiLieuArr.size(); i++) {
			if (taiLieuArr.removeIf(TaiLieu -> TaiLieu.getmaTaiLieu().equals(inputma))) {
				if (tailieu != tailieu)
					throw new ConcurrentModificationException();
				System.out.println("Đã xóa thành công " + inputma);
				System.out.println("Tài liệu còn lại là: " + taiLieuArr.toString());
				isCheck = true;
			}
		}
		if (isCheck == false) {
			System.out.println("Không tìm thấy tài liệu " + inputma);
		}
	}

	private void thongtinTaiLieu() {
		System.out.println("Nhập mã tài liệu để tìm thông tin tài liệu ");
		String searchId = scanner.next();
		boolean isCheck = false;
		for (TaiLieu tailieu : taiLieuArr) {
			if (tailieu.getmaTaiLieu().equalsIgnoreCase(searchId)) {
				System.out.println("Thông tin tài liệu : " + tailieu.toString());
				isCheck = true;
			}
		}
		if (isCheck == false) {
			System.out.println("Không tìm thấy tài liệu " + searchId);
		}
	}

	private void timTaiLieu() {
		System.out.println("Nhập vào loại tài liệu cần tìm kiếm \n1.Sách\n2.Báo\n3.Tạp chí ");
		int number = scanner.nextInt();
		boolean isExists = false;
		switch (number) {
		case 1:

			for (TaiLieu tailieu : taiLieuArr) {
				if (tailieu instanceof Sach)
					// thongtinTaiLieu();
					System.out.println(tailieu.toString());
				isExists = true;

			}
			if (!isExists) {
				System.out.println("Không tìm thấy tài liệu!");
				
			}

			break;

		case 2:

			for (TaiLieu tailieu : taiLieuArr) {
				if (tailieu instanceof Bao)
					// thongtinTaiLieu(scanner, taiLieuArr);
					System.out.println(tailieu.toString());
				isExists = true;
			}
			if (!isExists) {
				System.out.println("Không tìm thấy tài liệu!");
				
			}
			break;

		case 3:
			for (TaiLieu tailieu : taiLieuArr) {
				if (tailieu instanceof TapChi)
					// thongtinTaiLieu(scanner, taiLieuArr);
					System.out.println(tailieu.toString());
				isExists = true;
			}
			if (!isExists) {
				System.out.println("Không tìm thấy tài liệu!");
				
			}
			break;
		default:
			System.out.println("Số bạn nhập không đúng, mời bạn nhập lại từ đầu");
			break;
		}
		
	}

}
