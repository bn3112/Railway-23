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
			System.out.println("Chào mừng bạn đến với chương trình quản lý cán bộ!!!!");
			System.out.println("Mời bạn chọn chức năng ");
			System.out.println("1. Thêm mới cán bộ");
			System.out.println("2. Tìm kiếm theo họ tên");
			System.out.println("3. Hiện thị thông tin về danh sách các cán bộ");
			System.out.println("4. Nhập vào tên của cán bộ và delete cán bộ đó");
			System.out.println("5. Thoát khỏi chương trình");
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
				System.out.println("Thoát khỏi chương trình");
				return;
			default:
				System.out.println("Mời bạn nhập lại số 1~5");
				break;
			}
		}
		scanner.close();
	}

	private void themCanBo(Scanner scanner) {
		System.out.println("Nhập tuổi ");
		int tuoi = scanner.nextInt();
		scanner.nextLine();
		System.out.println("Nhập tên");
		String ten = scanner.nextLine();
		System.out.println("Nhập giới tính ");
		String gioitinh = scanner.nextLine();
		System.out.println("Nhập địa chỉ ");
		String diachi = scanner.nextLine();
		boolean isOK = false;
		while (!isOK) {
			System.out.println("Bạn muốn thêm cán bộ này vào vị trí nào ");
			System.out.println("\n1. Nhân viên ");
			System.out.println("\n2. Kỹ sư ");
			System.out.println("\n3. Công nhân ");
			System.out.println("\n4. Thoát thêm cán bộ ");
			int i = scanner.nextInt();
			scanner.nextLine();
			if (i >= 0 && i <= 4) {
				switch (i) {
				case 1:
					System.out.println("Nhập công việc");
					String congviec = scanner.nextLine();
					NhanVien addnhanvien = new NhanVien(ten, tuoi, gioitinh, diachi, congviec);
					System.out.println("Đã thêm cán bộ mới");
					System.out.println(addnhanvien.getTen());
					canBoArr.add(addnhanvien);
					break;
				case 2:
					System.out.println("Nhập ngành đạo tạo");
					String nganh = scanner.nextLine();
					KySu addkysu = new KySu(ten, tuoi, gioitinh, diachi, nganh);
					System.out.println("Đã thêm cán bộ mới");
					System.out.println(addkysu.getTen());
					canBoArr.add(addkysu);
					break;
				case 3:
					System.out.println("Nhập cấp bậc công nhân từ 1->10");
					byte bac = scanner.nextByte();
					CongNhan addcongnhan = new CongNhan(ten, tuoi, gioitinh, diachi, bac);
					System.out.println("Đã thêm cán bộ mới");
					System.out.println(addcongnhan.getTen());
					canBoArr.add(addcongnhan);
					break;
				case 4:
					System.out.println("Thoát");
					break;
				}
				return;
			} else {
				System.out.println("Mời bạn nhập số từ 1~4");
			}

		}

	}

	private void timCanBo(Scanner scanner) {
		System.out.println("Nhập vào tên bạn muốn tìm kiếm: ");
		String ten = scanner.nextLine();
		scanner.nextLine();
		boolean isExists = false;
		for (CanBo cb : canBoArr) {
			if (canbo.getTen().equalsIgnoreCase(ten)) {
				System.out.println(cb.toString());
				isExists = true;
			}
		}
		if (!isExists) {
			System.out.println("Không tìm thấy  !!!");
		}

	}

	private void thongTinCanBo() {
		if (canBoArr.size() > 0)
			for (CanBo canbo : canBoArr) {
				System.out.println(canbo);
			}
		else {
			System.out.println("Không có cán bộ để hiển thị");
		}

	}

	private void xoaCanBoTheoTen(Scanner scanner) {
		System.out.println("Nhập vào tên bạn muốn xoá: ");
		String ten = scanner.nextLine();
		scanner.nextLine();
		boolean isCheck = false;
		for (int i = 0; i < canBoArr.size(); i++) {
			if (canBoArr.removeIf(CanBo -> CanBo.getTen().equalsIgnoreCase(ten))) {
				if (canbo != canbo)
					throw new ConcurrentModificationException();
				System.out.println("Đã xóa thành công " + ten);
				System.out.println("Tài liệu còn lại là: " + canBoArr.toString());
				isCheck = true;
			}
		}
		if (!isCheck) {
			System.out.println("Không tìm thấy " + ten);
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
//				System.out.println("Không tìm thấy !");
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
				System.out.println("Thoát khỏi chương trình");
				return;
			default:
				System.out.println("Mời bạn nhập lại số 1~5");
				break;
			}
		}
		scanner.close();
	}

	private void addTaiLieu(Scanner scanner) {
		boolean isOK = false;
		while (!isOK) {
			System.out.println("Bạn muốn thêm tài liệu này vào đâu: \n1.Sách \n2.Tạp chí \n3.Báo");
			int input = scanner.nextInt();
			if (input <= 3 && input >= 1) {
				switch (input) {
				case 1:
					System.out.println("Nhập mã tài liệu");
					String ma = scanner.nextLine();
					scanner.nextLine();
					System.out.println("Nhập tên nhà xuất bản");
					String ten = scanner.nextLine();
					System.out.println("Nhập số bản phát hành");
					int soban = scanner.nextInt();
					System.out.println("Nhập số trang");
					int sotrang = scanner.nextInt();
					scanner.nextLine();
					System.out.println("Nhập tên tác giả");
					String tentacgia = scanner.nextLine();
					Sach sachmoi = new Sach(ma, ten, soban, tentacgia, sotrang);
					taiLieuArr.add(sachmoi);
					System.out.println("Đã thêm thành công");
					System.out.println(sachmoi.toString());
					
					break;
				case 2:
					System.out.println("Nhập mã tài liệu");
					String ma1 = scanner.nextLine();
					scanner.nextLine();
					System.out.println("Nhập tên nhà xuất bản");
					String ten1 = scanner.nextLine();
					System.out.println("Nhập số bản phát hành");
					int soban1 = scanner.nextInt();
					System.out.println("Nhập số phát hành");
					int sophathanh = scanner.nextInt();
					System.out.println("Nhập tháng phát hành");
					int thang = scanner.nextInt();
					System.out.println("Nhập ngày phát hành");
					int ngay = scanner.nextInt();
					TapChi tapchimoi = new TapChi(ma1, ten1, soban1, sophathanh, thang, ngay);
					taiLieuArr.add(tapchimoi);
					System.out.println("Đã thêm thành công");
					System.out.println(tapchimoi.toString());
					
					break;
				case 3:
					System.out.println("Nhập mã tài liệu");
					String ma2 = scanner.nextLine();
					scanner.nextLine();
					System.out.println("Nhập tên nhà xuất bản");
					String ten2 = scanner.nextLine();
					System.out.println("Nhập số bản phát hành");
					int soban2 = scanner.nextInt();
					System.out.println("Nhập ngày phát hành");
					int ngay1 = scanner.nextInt();
					Bao baomoi = new Bao(ma2, ten2, soban2, ngay1);
					taiLieuArr.add(baomoi);
					System.out.println("Đã thêm thành công");
					System.out.println(baomoi.toString());
					
					break;
				}
				return;
			} else {
				System.out.println("Số bạn nhập không đúng");
				System.out.println("Mời bạn nhập lại số 1 hoặc 2 hoặc 3");
			}
		}
	}

	private void deleteTaiLieu(Scanner scanner) {

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
		if (!isCheck) {
			System.out.println("Không tìm thấy tài liệu " + inputma);
		}
	}

	private void thongtinTaiLieu() {
		for (TaiLieu tailieu : taiLieuArr) {
			System.out.println("Thông tin tài liệu : " + tailieu.toString());
		}

	}

	private void timTaiLieu(Scanner scanner) {
		boolean isOK = false;
		while (!isOK) {
			System.out.println("Nhập vào loại tài liệu cần tìm kiếm \n1.Sách\n2.Báo\n3.Tạp chí \n4.Thoát tìm kiếm ");
			int input = scanner.nextInt();
			for (TaiLieu tailieu : taiLieuArr) {
				if (input >= 1 && input <= 4) {
					switch (input) {
					case 1:

						if (tailieu instanceof Sach) {
							System.out.println("Thông tin tài liệu : " + tailieu.toString());
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
					System.out.println("Số bạn nhập không đúng");
					System.out.println("Mời bạn nhập lại số 1 hoặc 2 hoặc 3 để tìm kiếm");
				}
//				if (!isOK) {
//					System.out.println("Không tìm thấy tài liệu");
//
//				}
			}
		}
	}
}
