	
-- *********************** Tạo một Cơ sở dữ liệu là Quản lý sinh viên và thực hiện truy vấn ************************************


-- kiểm tra nếu đã tồn tại Database quan_ly_sinh_vien thì xóa đi
DROP DATABASE IF EXISTS quan_ly_sinh_vien;

-- Kiểm tra nếu chưa tồn tại Database quan_ly_sinh_vien thì tạo mới 
CREATE DATABASE IF NOT EXISTS quan_ly_sinh_vien;

-- Sử dụng quan_ly_sinh_vien
USE quan_ly_sinh_vien;

-- Thiết lập hỗ trợ gõ tiếng việt cho Database quan_ly_sinh_vien
ALTER DATABASE quan_ly_sinh_vien CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- Kiểm tra nếu đã tồn tại bảng sinh_vien thì xóa đi
DROP TABLE IF EXISTS sinh_vien;

-- Kiểm tra nếu đã tồn tại bảng khoa thì xóa đi
DROP TABLE IF EXISTS khoa;

-- Kiểm tra nếu chưa tồn tại bảng khoa thì tạo mới bảng khoa
CREATE TABLE IF NOT EXISTS khoa(
	ma_khoa SMALLINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    ten_khoa VARCHAR(30) CHARACTER SET utf8mb4 NOT NULL UNIQUE
);
-- Thiết lập lại AUTO_INCREMENT cho bảng khoa
ALTER TABLE khoa AUTO_INCREMENT = 1;

-- Thêm mới dữ liệu cho bảng khoa
INSERT INTO khoa(ten_khoa) 
VALUES 
	('Công Nghệ Thông Tin'), 
	('Tiếng Nhật'),
	('waiting major'),
	('Điện');

-- -- Kiểm tra nếu đã tồn tại bảng sinh_vien thì xóa đi
DROP TABLE IF EXISTS sinh_vien;

-- Kiểm tra nếu chưa tồn tại bảng sinh_vien thì tạo mới bảng sinh_vien
CREATE TABLE IF NOT EXISTS sinh_vien(
	ma_sv SMALLINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    ma_khoa SMALLINT,
    ho_ten  VARCHAR(30) CHARACTER SET utf8mb4,
    ngay_sinh DATE,
	que_quan VARCHAR(50) CHARACTER SET utf8mb4,
	so_mon SMALLINT,
    ngay_tao DATE,
    FOREIGN KEY(ma_khoa) REFERENCES khoa(ma_khoa)
);

-- Thiết lập lại AUTO_INCREMENT cho bảng sinh_vien
ALTER TABLE sinh_vien AUTO_INCREMENT = 1;

-- Thêm mới dữ liệu cho bảng sinh_vien
INSERT INTO sinh_vien(ma_khoa,ho_ten,ngay_sinh,que_quan, so_mon,ngay_tao) 
VALUES 
	(1,'Nguyễn Văn Vinh','1993-01-01','Hà Nội',2,'2021-01-01'),
	(1,'Pha Hà Giang','1992-01-02','HCM',2,'2021-01-01'),
	(1,'Nguyễn Văn Nam','1995-01-03','Cao Bằng',2,'2021-01-01'),
	(1,'Phan Linh','1997-01-04','Lạng Sơn',2,'2021-01-01'), 
	(2,'Nguyễn Duy Tuấn','1999-01-01','Bắc Giang',2,'2021-01-01'),
	(2,'Trình Thanh Bình','1998-01-02','Thái Nguyên',2,'2021-01-01'),
	(2,'Hoàng Văn Thế','1993-01-03','Ninh Bình',2,'2021-01-01');

-- 1. Viết Trigger kiểm tra khi thêm mới một sinh viên, nếu ngày tạo là ngày tương lai thì lấy ngày tạo là ngày hiện tại.

drop trigger if exists trigger_ngay_tao;
delimiter $$
create trigger	trigger_ngay_tao
	before insert on sinh_vien
		for each row
			begin 
				if new.ngay_tao > curdate() then 
					set new.ngay_tao = curdate();
				end if;
			end $$;
delimiter ;
INSERT INTO sinh_vien(ma_khoa,ho_ten,ngay_sinh,que_quan, so_mon,ngay_tao) 
VALUES 
	(1,'Nguyễn ','1993-01-01','Hà Nội',2,'2023-01-01');
select * from sinh_vien;	
-- delete from trigger
drop trigger if exists trigger_ngay_tao;
delimiter $$
create trigger	trigger_ngay_tao
	before delete on khoa
		for each row
			begin 
					delete from sinh_vien where ma_khoa = old.ma_khoa;
			end $$;
delimiter ;
select * from sinh_vien;	
show triggers;
delete from khoa where ma_khoa = 2;
select * from khoa;
select * ,case when que_quan = 'Hà Nội' then 'cappital' else que_quan end 
from sinh_vien