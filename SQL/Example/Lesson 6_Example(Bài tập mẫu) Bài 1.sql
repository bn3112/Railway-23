USE testing_system;

-- ví dụ 1: taọ thủ tục lấy tên phòng ban theo mã phòng ban
-- xem khai báo ràng buộc bàng describe
DESCRIBE department;
-- tạo thủ tục have parameter co tham so
 -- sp: store procedure tên trong In phải khác tên trong bảng chính
DROP PROCEDURE IF EXISTS sp_lay_ten_phong_theo_ma_phong;
DELIMITER $$
CREATE PROCEDURE  sp_lay_ten_phong_theo_ma_phong (IN departmentID TINYINT, OUT departmentName VARCHAR(30))
	BEGIN 
		SELECT department_name INTO departmentName
        FROM department 
			WHERE department_id = departmentID;
	END$$
DELIMITER ;
-- cài đặt biến
SET @ten_phong_ban = '';
CALL sp_lay_ten_phong_theo_ma_phong(1,@ten_phong_ban);
SELECT @ten_phong_ban;
-- ví dụ 2: viết thủ tục lấy thông tin câu hỏi của tác giá co tên là 'Nguyễn Văn Thế' hoặc địa chỉ email là 'nguyenvanthe@gmail.com'
DROP PROCEDURE IF EXISTS sp_lay_thong_tin_tac_gia;
-- khai bao thu tuc
DELIMITER $$
CREATE PROCEDURE sp_lay_thong_tin_tac_gia (IN author VARCHAR(50) CHAR SET utf8mb4, thudientu VARCHAR (50))
BEGIN  
	SELECT q.* 
    FROM `account` a JOIN question q ON a.account_id = q.creator_id
       WHERE a.full_name = author OR a.email = thudientu ;
	END$$
DELIMITER ;
-- use procrdure
CALL sp_lay_thong_tin_tac_gia ('Lý Quốc Nghị','');
-- ví dụ 1.2: taọ thủ tục lấy tên phòng ban theo mã phòng ban
 DROP PROCEDURE IF EXISTS sp_lay_ten_phong;
 -- tạo thủ tục co bien
 DELIMITER $$
 CREATE PROCEDURE sp_lay_ten_phong(IN departmentID TINYINT)
	BEGIN 
		DECLARE departmentName VARCHAR(30);
		SELECT department_name INTO departmentName 
        FROM department 
			WHERE department_id = departmentID;
            -- in bien ra
            SELECT departmentName;
	END$$
DELIMITER ;
 -- use
 CALL sp_lay_ten_phong('1');
 -- viet ham lay chuc vu cua nhan vien co ma la 1
 describe `position`;
SET GLOBAL log_bin_trust_function_creators = 1;
 DROP FUNCTION IF EXISTS f_lay_chuc_vu_nhan_vien;
 DELIMITER $$
 CREATE FUNCTION f_lay_chuc_vu_nhan_vien(ma_nhan_vien SMALLINT) 
 RETURNs ENUM('Dev','Test','Scrum Master','PM')
 BEGIN 
 DECLARE ten_chuc_vu ENUM('Dev','Test','Scrum Master','PM');
 SELECT p.position_name INTO ten_chuc_vu
 FROM `position` p JOIN `account` a ON p.position_id = a.position_id
 WHERE a.account_id = ma_nhan_vien;
 RETURN ten_chuc_vu;
END$$
delimiter ;
SELECT f_lay_chuc_vu_nhan_vien(1); 
