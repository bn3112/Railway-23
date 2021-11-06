DROP DATABASE IF EXISTS quan_ly_dat_phong_karaoke;
CREATE DATABASE quan_ly_dat_phong_karaoke;
USE quan_ly_dat_phong_karaoke;
DROP TABLE IF EXISTS PHONG;
ALTER DATABASE testing_system CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE TABLE PHONG(
	MaPhong			TINYINT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    LoaiPhong		VARCHAR(20) CHAR SET utf8mb4 UNIQUE,
    SoKhachToiDa	TINYINT,
    GiaPhong		DECIMAL(10,2),
    MoTa			VARCHAR(100) CHAR SET utf8mb4
);
INSERT INTO PHONG(LoaiPhong,SoKhachToiDa,GiaPhong,MoTa)
VALUES	('Loại 1',4,400000,'Phòng dành cho 4 người'),
		('Loại 2',5,400000,'Phòng dành cho 5 người'),
		('Loại 3',6,800000,'Phòng dành cho 6 người'),
		('Loại 4',8,800000,'Phòng dành cho 8 người'),
		('Loại 5',15,700000,'Phòng dành cho 10 người trở lên'),
		('Loại 6',20,1500000,'Phòng VIP 1'),
		('Loại 7',20,1500000,'Phòng VIP 2');
DROP TABLE IF EXISTS KHACH_HANG;
CREATE TABLE KHACH_HANG(
	MaKH	INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    TenKH	VARCHAR(30) CHAR SET utf8mb4,
    DiaChi	VARCHAR(50) CHAR SET utf8mb4,
    SoDT	CHAR(13) UNIQUE
);
INSERT INTO KHACH_HANG(TenKH,DiaChi,SoDT)
VALUES 		('Nguyễn Khánh Linh',	'Hà Nội',	0907421458),
			('Trần Hoài Thu',		'Hà Nội',	0901234568),
			('Đinh Tuyết Bảo',		'Hà Nam',	0801234568),
            ('Vương Kiều Nhi',		'Ninh Bình',0906485458),
            ('Phạm Anh Ngọc',		'Bắc Giang',0909547442),
            ('Cao Thu Huyền',		'Sài Gòn',	0906542542);
DROP TABLE IF EXISTS DAT_PHONG;
CREATE TABLE DAT_PHONG(
	MaDatPhong		TINYINT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    MaPhong			TINYINT NOT NULL,
    MaKH			INT NOT NULL,
	NgayDat			DATE,
    TienDatCoc		DECIMAL(10,2),
    GhiChu			VARCHAR(100) CHAR SET utf8mb4,
    TrangThatDat	ENUM('Đã đặt','Đã hủy'),
FOREIGN KEY (MaPhong) REFERENCES PHONG(MaPhong) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (MaKH) REFERENCES KHACH_HANG(MaKH) ON DELETE CASCADE ON UPDATE CASCADE
);
INSERT INTO DAT_PHONG(MaPhong,MaKH,NgayDat,TienDatCoc,GhiChu,TrangThatDat)
VALUES	(1,1,'2020/12/31',200000,'đã đặt cọc','Đã đặt'),
		(2,1,'2020/10/30',100000,'đã đặt cọc','Đã hủy'),
		(1,2,'2020/09/25',100000,'đã đặt cọc','Đã đặt'),
		(3,3,'2021/03/27',100000,'đã đặt cọc','Đã đặt'),
		(4,4,'2021/05/26',300000,'đã đặt cọc','Đã hủy'),
		(5,5,'2021/10/31',300000,'đã đặt cọc','Đã hủy'),
		(6,1,'2021/11/1',300000,'đã đặt cọc','Đã hủy');
DROP TABLE IF EXISTS DICH_VU_DI_KEM;
CREATE TABLE DICH_VU_DI_KEM(
	MaDV		TINYINT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    TenDV		VARCHAR(30) CHAR SET utf8mb4 UNIQUE NOT NULL,
	DonViTinh	VARCHAR(20) CHAR SET utf8mb4,
    DonGia		DECIMAL(10,2)
);
INSERT INTO DICH_VU_DI_KEM(TenDV,DonViTinh,DonGia)
VALUES		('Bia','Lon',	'25000'),
			('Trái cây','Đĩa','100000'),
			('Nước ngọt','Lon','25000'),
			('Bánh sinh nhật','Chiếc','250000'),
			('Đồ ăn','Đĩa','50000');
DROP TABLE IF EXISTS CHI_TIET_SU_DUNG_DV;
CREATE TABLE CHI_TIET_SU_DUNG_DV(
	MaDatPhong	TINYINT NOT NULL,
    MaDV		TINYINT NOT NULL,
    SoLuong		TINYINT,
PRIMARY KEY(MaDatPhong, MaDV),
FOREIGN KEY (MaDatPhong) REFERENCES DAT_PHONG(MaDatPhong) ON DELETE CASCADE ON UPDATE CASCADE,   
FOREIGN KEY (MaDV) REFERENCES DICH_VU_DI_KEM(MaDV) ON DELETE CASCADE ON UPDATE CASCADE
);
INSERT INTO CHI_TIET_SU_DUNG_DV(MaDatPhong,MaDV,SoLuong)
VALUES		(1,1,10),
			(1,2,5),
			(2,3,10),
			(3,1,10),
			(4,1,10),
			(5,1,10);
-- 1. Tạo Bảng và thêm tối thiểu 5 bản ghi cho mỗi Bảng 
-- 2. Hiển thị loại phòng đã thuê, tên dịch vụ đã sử dụng của khách hàng có tên là “Nguyễn Khánh Linh” 
SELECT p.Loaiphong,dv.TenDV
FROM KHACH_HANG kh
LEFT JOIN DAT_PHONG dp  ON dp.MaKH = kh.MaKH
LEFT JOIN PHONG p ON dp.MaPhong = p.Maphong
LEFT JOIN CHI_TIET_SU_DUNG_DV ct ON dp.MaDatPhong = ct.MaDatPhong
LEFT JOIN DICH_VU_DI_KEM dv ON ct.MaDV = dv.MaDV
WHERE TenKH = 'Nguyễn Khánh Linh';
-- 3. Viết Function để trả về Số điện thoại của Khách hàng thuê nhiều phòng nhất trong năm 2020 
-- k dùng dc hàm khi só người cùng thuê bằng nhau
DROP FUNCTION IF EXISTS f_so_dien_thoai_khach_hang;
DELIMITER $$
CREATE FUNCTION f_so_dien_thoai_khach_hang() RETURNS INT
BEGIN 
	DECLARE so_dien_thoai INT;
		SELECT SoDT INTO so_dien_thoai
        FROM KHACH_HANG kh LEFT JOIN DAT_PHONG dp ON kh.MaKH = dp.MaKH
        WHERE YEAR(NgayDat) = '2020'
        GROUP BY kh.MaKH
        HAVING COUNT(dp.MaPhong) = (SELECT MAX(dem_phong)
									FROM (SELECT kh.MaKH,COUNT(dp.MaPhong) AS dem_phong
											FROM KHACH_HANG kh LEFT JOIN DAT_PHONG dp ON kh.MaKH = dp.MaKH
                                            WHERE YEAR(NgayDat) = '2020'
                                            GROUP BY kh.MaKH) AS TEMP);
		RETURN  so_dien_thoai;
	END $$
DELIMITER ;
SELECT f_so_dien_thoai_khach_hang();
-- 4. Viết thủ tục tăng giá phòng thêm 10,000 VNĐ so với giá phòng hiện tại cho những phòng có số khách 
-- tối đa lớn hơn 5. 
DROP PROCEDURE IF EXISTS sp_update_gia_phong;
DELIMITER $$
CREATE PROCEDURE sp_update_gia_phong()
BEGIN 
	UPDATE PHONG
    SET GiaPhong = GiaPhong + 10000
    WHERE SoKhachToiDa > 5;
END $$
DELIMITER ;
SELECT * FROM PHONG;

-- 5. Viết thủ tục thống kê khách hàng và số lần thuê phòng tương ứng của từng khách hàng trong năm 
-- nay. 
DROP PROCEDURE IF EXISTS sp_khach_hang_thue;
DELIMITER $$
CREATE PROCEDURE sp_khach_hang_thue()
BEGIN 
	SELECT kh.TenKh,COUNT(dp.MaDatPhong) AS so_lan_thue
    FROM KHACH_HANG kh LEFT JOIN DAT_PHONG dp ON kh.MaKH = dp.MaKH
    WHERE YEAR(NgayDat) = YEAR(CURDATE())
    GROUP BY kh.Makh;
END$$
DELIMITER ;
CALL sp_khach_hang_thue();
-- 6. Viết thủ tục hiển thị 5 đơn đặt phòng gần nhất bao gồm có các thông tin: Mã đặt phòng, tên khách 
-- hàng, loại phòng, giá phòng. 
DROP PROCEDURE IF EXISTS sp_don_dat_hang;
DELIMITER $$
CREATE PROCEDURE sp_don_dat_hang()
BEGIN 
	SELECT dp.MaDatPhong,kh.TenKh,p.LoaiPhong,p.GiaPhong
    FROM DAT_PHONG dp 
	JOIN KHACH_HANG kh ON dp.MaKH = kh.MaKH
	JOIN PHONG p ON dp.MaPhong = p.Maphong
    ORDER BY NgayDat DESC
	LIMIT 5;
END $$
DELIMITER ;
CALL sp_don_dat_hang();
SELECT * FROM DAT_PHONG ORDER BY Ngaydat DESC;
-- 7. Viết Trigger kiểm tra khi thêm phòng mới có Số khách tối đa vượt quá 10 người thì không cho thêm 
-- mới và hiển thị thông báo “Vượt quá số người cho phép”. 
DROP TRIGGER IF EXISTS trgigger_so_khach_toi_da;
DELIMITER $$
CREATE TRIGGER trgigger_so_khach_toi_da
BEFORE INSERT ON PHONG
FOR EACH ROW 
BEGIN 
	IF NEW.SoKhachToiDa > 10 THEN
		SIGNAL SQLSTATE '12345'
		SET MESSAGE_TEXT = 'Vượt quá số người cho phép';
    END IF;
END$$
DELIMITER ;
INSERT INTO PHONG(LoaiPhong,SoKhachToiDa,GiaPhong,MoTa)
VALUES	('Loại 1',11,400000,'Phòng dành cho 4 người');