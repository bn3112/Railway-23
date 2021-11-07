DROP DATABASE IF EXISTS ThucTap;
CREATE DATABASE ThucTap;
USE ThucTap;
DROP TABLE IF EXISTS GiangVien;
CREATE TABLE GiangVien(
	magv	SMALLINT AUTO_INCREMENT PRIMARY KEY NOT NULL UNIQUE,
    hoten	VARCHAR(30) NOT NULL,
    luong	DECIMAL(12,2)
);
INSERT INTO GiangVien(hoten,luong)
VALUES	('Nguyen Thu Huong',10000000),
		('Nguyen Hoai Thu',10000000),
		('Trinh Quoc Cuong',10000000),
		('Cao Tuan Anh',10000000),
		('Truong Viet Tuan',10000000);
DROP TABLE IF EXISTS SinhVien;
CREATE TABLE SinhVien(
	masv	SMALLINT AUTO_INCREMENT PRIMARY KEY NOT NULL UNIQUE,
    hoten	VARCHAR(30) NOT NULL,
    namsinh	YEAR NOT NULL,
    quequan	VARCHAR(30) NOT NULL
);
INSERT INTO SinhVien(hoten,namsinh,quequan)
VALUES		('Cao Anh Tuyet',	'1996',	'Ha Noi'),
			('Nguyen Minh Trang','1995','Bac Giang'),
			('Trinh Thu Hien',	'1992',	'Ha Noi'),
			('Vu Thi Van',		'1993',	'Thanh Hoa'),
			('Pham Anh Ngoc',	'1991',	'Bac Giang');
DROP TABLE IF EXISTS DeTai;
CREATE TABLE DeTai(
	madt		SMALLINT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    tendt		VARCHAR(100) NOT NULL UNIQUE,
    kinhphi		DECIMAL(12,2),
    NoiThucTap	VARCHAR(50)
);
INSERT INTO DeTai(tendt,kinhphi,NoiThucTap)
VALUES		('CHUNG CAT RUOU',100000000,'Ha Noi'),
			('PHAN TICH KHANG SINH TRONG NUOC',300000000,'Ha Noi'),
			('CONG NGHE SINH HOC',300000000,'Ninh Binh');
DROP TABLE IF EXISTS HuongDan;
CREATE TABLE HuongDan(
	id		TINYINT AUTO_INCREMENT NOT NULL,
    masv	SMALLINT UNIQUE NOT NULL,
    madt	SMALLINT NOT NULL,
    magv	SMALLINT UNIQUE NOT NULL,
    ketqua	CHAR(2),
PRIMARY KEY(id,masv,magv),
FOREIGN KEY (masv) REFERENCES SinhVien(masv) ON DELETE CASCADE,
FOREIGN KEY (madt) REFERENCES DeTai(madt) ON DELETE CASCADE,
FOREIGN KEY (magv) REFERENCES GiangVien(magv) ON DELETE CASCADE
);
INSERT INTO HuongDan (masv,madt,magv,ketqua)
VALUES		(1,1,1,9),
			(2,2,2,9),
			(3,3,3,10),
			(5,3,5,9);
-- Questions 1. Tạo table với các ràng buộc và kiểu dữ liệu
-- Thêm ít nhất 3 bản ghi vào table
-- Questions 2. Viết lệnh để
-- a) Lấy tất cả các sinh viên chưa có đề tài hướng dẫn
SELECT sv.masv,hd.madt
FROM SinhVien sv
	LEFT JOIN HuongDan hd ON sv.masv = hd.masv
    WHERE hd.masv IS NULL
	GROUP BY hd.madt;
-- b) Lấy ra số sinh viên làm đề tài ‘CONG NGHE SINH HOC’
SELECT d.tendt, COUNT(hd.masv) 'so sinh vien'
FROM DeTai d JOIN HuongDan hd ON d.madt = hd.madt
WHERE d.madt = 3
GROUP BY (hd.madt);
-- Questions 3. Tạo view có tên là "SinhVienInfo" lấy các thông tin về học sinh bao gồm:
-- mã số, họ tên và tên đề tài
-- (Nếu sinh viên chưa có đề tài thì column tên đề tài sẽ in ra "Chưa có")
 CREATE OR REPLACE VIEW v_SinhVienInfo AS
 SELECT sv.masv,sv.hoten,
 CASE WHEN dt.tendt IS NULL
    THEN 'Chưa có' ELSE dt.tendt END AS tendt
	FROM SinhVien sv
	LEFT JOIN HuongDan hd ON sv.masv = hd.masv
    LEFT JOIN DeTai dt ON hd.madt = dt.madt
	GROUP BY hd.madt;
-- Questions 4. Tạo trigger cho table SinhVien khi insert sinh viên có năm sinh <= 1900
-- thì hiện ra thông báo "năm sinh phải > 1900"
DROP TRIGGER IF EXISTS trigger_nam_sinh;
DELIMITER $$
CREATE TRIGGER trigger_nam_sinh
BEFORE INSERT ON SinhVien
FOR EACH ROW 
BEGIN 
	IF NEW.namsinh <='1990' THEN
		SIGNAL SQLSTATE '12345'
		SET MESSAGE_TEXT = 'năm sinh phải > 1900';
    END IF;
END$$
DELIMITER ;
INSERT INTO SinhVien(hoten,namsinh,quequan)
VALUES		('Cao Anh Tuyet','1989','Ha Noi');
-- Questions 5. Hãy cấu hình table sao cho khi xóa 1 sinh viên nào đó thì sẽ tất cả thông
-- tin trong table HuongDan liên quan tới sinh viên đó sẽ bị xóa đi
-- Sử dụng ON DELETE CASCADE vào khóa ngoại khi tạo bảng sẽ xóa dữ liệu từ các bảng liên quan