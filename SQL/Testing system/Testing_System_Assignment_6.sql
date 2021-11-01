USE testing_system;
-- Exercise 1: Tiếp tục với Database Testing System
-- Question 1: Tạo store để người dùng nhập vào tên phòng ban và in ra tất cả các
-- account thuộc phòng ban đó
ALTER DATABASE testing_system CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
DROP PROCEDURE IF EXISTS sp_lay_nhan_vien_phong_ban;
DELIMITER $$
CREATE PROCEDURE sp_lay_nhan_vien_phong_ban(IN departmentName VARCHAR(30) CHAR SET utf8mb4)
	BEGIN 
	DECLARE ten_nhan_vien VARCHAR(30) CHAR SET utf8mb4;
		SELECT a.full_name INTO ten_nhan_vien 
			FROM `account` a LEFT JOIN department d ON a.department_id = d.department_id
            WHERE d.department_name = departmentName
            GROUP BY d.department_id;
        SELECT ten_nhan_vien ;
	END$$
DELIMITER ;
CALL sp_lay_nhan_vien_phong_ban('sale');


-- Question 2: Tạo store để in ra số lượng account trong mỗi group
DROP PROCEDURE IF EXISTS sp_so_nv_trong_group;
DELIMITER $$
CREATE PROCEDURE sp_so_nv_trong_group()
	BEGIN 
		DECLARE so_nv SMALLINT;
			SELECT g.group_name,COUNT(ga.account_id) 'so nhan vien'
				FROM `group` g 
					LEFT JOIN group_account ga ON g.group_id = ga.group_id
						GROUP BY ga.group_id;
	END$$
	DELIMITER ;
CALL sp_so_nv_trong_group;


-- Question 3: Tạo store để thống kê mỗi type question có bao nhiêu question được tạo
-- trong tháng hiện tại
DROP PROCEDURE IF EXISTS sp_thong_ke_loai_cau_hoi;
-- DESCRIBE type_question;
DELIMITER $$
CREATE PROCEDURE sp_thong_ke_loai_cau_hoi()
	BEGIN
		SELECT tq.type_name,COUNT(q.question_id)
        FROM type_question tq LEFT JOIN question q ON tq.type_id = q.type_id
        WHERE MONTH(q.create_date) = MONTH(curdate()) AND YEAR(q.create_date) = YEAR(curdate())
        GROUP BY tq.type_id;
	END$$
DELIMITER ;
CALL sp_thong_ke_loai_cau_hoi();


-- Question 4: Tạo store để trả ra id của type question có nhiều câu hỏi nhất

DROP PROCEDURE IF EXISTS sp_loai_co_nhieu_cau_hoi;
DELIMITER $$
CREATE PROCEDURE  sp_loai_co_nhieu_cau_hoi(OUT typeID TINYINT)
	BEGIN 
		SELECT tq.type_id INTO typeID
			FROM type_question tq JOIN question q ON tq.type_id = q.type_id
				GROUP BY tq.type_id
				HAVING COUNT(q.question_id) = (SELECT MAX(dem_cau_hoi)
					FROM (SELECT COUNT(q.question_id) AS dem_cau_hoi
							FROM question q
								GROUP BY q.type_id) AS temt);
	END$$
DELIMITER ;
SET @typeID='';
CALL  sp_loai_co_nhieu_cau_hoi(@typeID);
SELECT @typeID;

-- Question 5: Sử dụng store ở question 4 để tìm ra tên của type question
drop procedure if exists sp_ten_loai_cau_hoi;
delimiter $$
CREATE procedure sp_ten_loai_cau_hoi()
	begin 
		declare typeID tinyint;
		set typeID = 0;
		call sp_loai_co_nhieu_cau_hoi(typeID);
		select type_name from type_question where type_id = typeID;
    end $$;
delimiter ;
call sp_ten_loai_cau_hoi;

-- Question 6: Viết 1 store cho phép người dùng nhập vào 1 chuỗi và trả về group có tên chứa chuỗi của người dùng nhập vào
-- hoặc trả về user có username chứa chuỗi của người dùng nhập vào
DROP PROCEDURE IF EXISTS sp_ten_thanh_vien_hoac_nhom;
DELIMITER $$
CREATE PROCEDURE sp_ten_thanh_vien_hoac_nhom (IN nhap_ky_tu VARCHAR(20) CHAR SET utf8mb4)
BEGIN
			SELECT group_name 'kết quả chứa chuỗi'
				FROM `group` 
					WHERE group_name LIKE CONCAT('%',nhap_ky_tu,'%') COLLATE utf8mb4_general_ci
		UNION ALL
			SELECT full_name
				FROM `account` 
					WHERE full_name LIKE CONCAT('%',nhap_ky_tu,'%') COLLATE utf8mb4_general_ci;
END$$
DELIMITER ;
CALL sp_ten_thanh_vien_hoac_nhom('a');
-- c2
DROP PROCEDURE IF EXISTS sp_chuoi;
DELIMITER $$
CREATE PROCEDURE sp_chuoi(IN nhap_ky_tu VARCHAR(20) CHAR SET utf8mb4)
BEGIN
SELECT group_name 'kết quả chứa chuỗi'
				FROM `group` 
					WHERE group_name LIKE CONCAT('%',nhap_ky_tu,'%') COLLATE utf8mb4_unicode_ci 
		UNION ALL
			SELECT user_name COLLATE utf8mb4_unicode_ci 
				FROM `account` 
					WHERE user_name LIKE CONCAT('%',nhap_ky_tu,'%') COLLATE utf8mb4_unicode_ci;
END$$
DELIMITER ;
CALL sp_chuoi('a');
-- cach cua Tuoi
-- From Tươi Nguyễn to Everyone 12:36 AM
drop procedure if exists sp_lay_group_or_user;
DELIMITER $$
create procedure sp_lay_group_or_user(in inputString varchar(50) char set utf8mb4)
	begin
		declare groupName varchar(50); 
        declare userFullName varchar(50);
		set @conditionStr = concat('%', inputString, '%');
        -- lấy group
        select group_name into groupName
			from `group`
			where group_name like @conditionStr collate utf8mb4_general_ci
            limit 1;
		-- lấy account
		select full_name into userFullName
			from `account`
			where user_name like @conditionStr collate utf8mb4_general_ci
            limit 1;
            
		if groupName is not null and userFullName is null
        then select group_name
			from `group`
			where group_name like @conditionStr collate utf8mb4_general_ci;
		elseif groupName is null and userFullName is not null
        then select full_name
			from `account`
			where user_name like @conditionStr collate utf8mb4_general_ci;
        elseif groupName is not null and userFullName is not null
        then select concat('group chứa chuỗi: ', group_name) 'group, account chứa chuỗi'
			from `group`
			where group_name like @conditionStr collate utf8mb4_general_ci 
            union all 
            select concat('user chứa chuỗi: ', full_name) 'group, account chứa chuỗi'
			from `account`
			where user_name like @conditionStr collate utf8mb4_general_ci;
        else select 'không có giá trị chứa chuỗi';
		end if;
    end$$
DELIMITER ;
-- gọi thủ tục
call sp_lay_group_or_user('a');

-- Question 7: Viết 1 store cho phép người dùng nhập vào thông tin fullName, email và
-- trong store sẽ tự động gán:
-- username sẽ giống email nhưng bỏ phần @..mail đi
-- positionID: sẽ có default là developer
-- departmentID: sẽ được cho vào 1 phòng chờ
-- Sau đó in ra kết quả tạo thành công
DROP PROCEDURE IF EXISTS sp_thong_tin;
DELIMITER $$
CREATE PROCEDURE sp_thong_tin(IN ten VARCHAR(20) CHAR SET utf8mb4,thu_dien_tu VARCHAR(50))
	BEGIN  -- SELECT reverse(substring(REVERSE('nguyenhoaithuong@gmail.com'),11,100)) as doi_ten_tu_email;
		INSERT INTO `account`(email,user_name, full_name,department_id,position_id,create_date)
		VALUES (thu_dien_tu,concat((SELECT REVERSE(substring(REVERSE (thu_dien_tu),11,100)))),concat(ten),11,1,curdate());
			SELECT * FROM  `account`
			WHERE full_name = ten AND email = thu_dien_tu;
END$$
DELIMITER ;
CALL sp_thong_tin('Khong Hoai','hoaithu@gmail.com');
ALTER TABLE `account` AUTO_INCREMENT = 1;

DROP PROCEDURE IF EXISTS sp_update_user;
DELIMITER $$
CREATE PROCEDURE sp_update_user(IN ten VARCHAR(20) CHAR SET utf8mb4,thu_dien_tu VARCHAR(50))
	BEGIN  
		declare username  varchar(50) default substring_index (email,'@',1);
        declare departmentID tinyint unsigned default 11;
        declare positionID tinyint unsigned default 1;
        declare createdate date default curdate;
		INSERT INTO `account`(email,user_name, full_name,department_id,position_id,create_date)
		VALUES (thu_dien_tu,username,ten,departmentID,positionID,createdate);
			SELECT * FROM  `account`
			order by account_id desc limit 1;
END$$
DELIMITER ;
CALL sp_update_user('Huynh Tam An','taman@gmail.com');
ALTER TABLE `account` AUTO_INCREMENT = 1;
-- Question 8: Viết 1 store cho phép người dùng nhập vào Essay hoặc Multiple-Choice
-- để thống kê câu hỏi essay hoặc multiple-choice nào có content dài nhất 

DROP PROCEDURE IF EXISTS sp_thong_ke_loai_cau_hoi;
DELIMITER $$
CREATE PROCEDURE sp_thong_ke_loai_cau_hoi(IN nhap_loai_cau_hoi ENUM('essay','multiple-choice'))
BEGIN 
		SELECT tq.type_name,q.question_id,q.content
			FROM question q JOIN type_question tq ON q.type_id = tq.type_id
				WHERE length(q.content) = 
					(SELECT max(length_content) AS max_length_content
						FROM (SELECT q.content,q.question_id,tq.type_name,(length(content)) AS length_content
							FROM question q JOIN type_question tq ON q.type_id = tq.type_id
								WHERE tq.type_name = nhap_loai_cau_hoi) AS tem)
					AND tq.type_name = nhap_loai_cau_hoi;
END$$;
DELIMITER ;
CALL sp_thong_ke_loai_cau_hoi('essay');
CALL sp_thong_ke_loai_cau_hoi('multiple-choice');

-- cach 2 k phan biet dc type id
drop procedure if exists sp_get_question_have_max_length_content;
delimiter $$
create procedure sp_get_question_have_max_length_content (IN typename ENUM('essay','multiple-choice'))
begin declare typeID tinyint;
		select type_id into typeID from type_question 
			where type_name = typename;
			select * from question 
				where type_id = typeID and length(content) = 
					(select max(length(content)) from question);
end $$;	
delimiter ;
call sp_get_question_have_max_length_content('essay');
call sp_get_question_have_max_length_content('multiple-choice');

-- Question 9: Viết 1 store cho phép người dùng xóa exam dựa vào ID
DROP PROCEDURE IF EXISTS sp_xoa_exam;
DELIMITER $$
CREATE PROCEDURE sp_xoa_exam(IN nhap_examID TINYINT)
BEGIN 
	DELETE FROM exam
    WHERE exam_id = nhap_examID;
    select * from exam;
    END$$;
DELIMITER ;
CALL sp_xoa_exam(1);

-- Question 10: Tìm ra các exam được tạo từ 3 năm trước và xóa các exam đó đi (sử
-- dụng store ở câu 9 để xóa)
-- Sau đó in số lượng record đã remove từ các table liên quan trong khi
-- removing
SELECT exam_id
FROM exam
WHERE create_date <= '2018';
CALL sp_xoa_exam(10);
 select * from exam;
-- Question 10: Tìm ra các exam được tạo từ 3 năm trước và xóa các exam đó đi (sử dụng store ở câu 9 để xóa)
-- Sau đó in số lượng record đã remove từ các table liên quan trong khi removing
-- SELECT ROW_COUNT();
INSERT INTO exam(`code`, title, category_id, duration, creator_id, create_date) 
VALUES 
	('RB1'	, 'title ruby1'		, 5		, 50	, 1		, '2018-05-05'),
	('VB1'	, 'title vb 11'		, 6		, 120	, 3		, '2017-06-15'),
	('VB61'	, 'title vb6 11'	, 6		, 120	, 3		, '2016-06-15');

drop procedure if exists sp_delete_exam_and_select_count_record;
DELIMITER $$
create procedure sp_delete_exam_and_select_count_record()
begin
	declare examId tinyint;
    declare delRowCntExam tinyint;
    declare delRowCntExamQuestion tinyint;

    -- biến để xem cursor đã đến dòng cuối chưa
	declare done boolean default false;
    -- tạo cursor các exam được tạo từ 3 năm trước
	declare myCursor cursor for
    select exam_id from exam where year(create_date) <= year(date_add(curdate(), interval -3 year));
    
    -- điều khiển hoạt động của cursor khi đến dòng cuối(set là true)
	declare continue handler for not found set done = true;  
    
    -- đếm số dòng sẽ xóa của bảng exam, exam_question
    select count(e.exam_id) cnt_ex into delRowCntExam
	from exam e
	where year(create_date) <= year(date_add(curdate(), interval -3 year));
    
    select count(eq.exam_id) cnt_ex_ques into delRowCntExamQuestion
	from exam e
	left join exam_question eq on e.exam_id = eq.exam_id
	where year(create_date) <= year(date_add(curdate(), interval -3 year));
    
    -- sử dụng store ở câu 9 để xóa
	-- mở cursor
	open myCursor;
		-- lặp từng dòng
		read_loop: loop
			-- đọc từng dòng của cursor
			fetch myCursor into examId;
			
			-- xóa dlieu
			call sp_delete_exam_by_id(examId);

			-- đến dòng cuối thì thoát đọc loop
			if done then
			  leave read_loop;
			end if;
		end loop;
	  
	-- đóng cursor
	close myCursor;	
    select concat('exam table ', delRowCntExam, ' record', ', exam_question table ', delRowCntExamQuestion, ' record') as 'số lượng record đã remove';
end$$
DELIMITER ;
-- gọi thủ tục
call sp_delete_exam_and_select_count_record();

-- Question 11: Viết store cho phép người dùng xóa phòng ban bằng cách người dùng
-- nhập vào tên phòng ban và các account thuộc phòng ban đó sẽ được
-- chuyển về phòng ban default là phòng ban chờ việc
DROP PROCEDURE IF EXISTS sp_xoa_phong_ban;
DELIMITER $$
CREATE PROCEDURE sp_xoa_phong_ban(IN DepartmentName VARCHAR(30) CHAR SET utf8mb4)
	BEGIN
           UPDATE `account`
			   SET department_id = (SELECT department_id
									   FROM department
									   WHERE department_name = 'waiting room')
			   WHERE department_id = (SELECT department_id 
										FROM department
										WHERE department_name = DepartmentName);
           DELETE FROM department
				WHERE department_name = DepartmentName;
	END$$
DELIMITER ;	
CALL sp_xoa_phong_ban('tài vụ');
 SELECT d.department_name,a.full_name 
 FROM department d JOIN `account` a ON d.department_id = a.department_id;  

-- Question 12: Viết store để in ra mỗi tháng có bao nhiêu câu hỏi được tạo trong năm nay

DROP PROCEDURE IF EXISTS cau_hoi_theo_thang;
DELIMITER $$
CREATE PROCEDURe cau_hoi_theo_thang()
BEGIN
-- lay so cau hoi trong thang 1
	SELECT MONTH(create_date)'thang',COUNT(question_id)'so cau hoi'
    FROM question 
	WHERE MONTH(create_date) =
    (SELECT EXTRACT(MONTH FROM(SELECT SUBDATE(CURDATE(),INTERVAL 10 YEAR_MONTH ))))
    AND YEAR(create_date) = YEAR(CURDATE())
-- lay so cau hoi trong thang 2
    UNION
    SELECT MONTH(create_date)'thang',COUNT(question_id)'so cau hoi'
    FROM question 
	WHERE MONTH(create_date) =
    (SELECT EXTRACT(MONTH FROM(SELECT SUBDATE(CURDATE(),INTERVAL 9 YEAR_MONTH ))))
    AND YEAR(create_date) = YEAR(CURDATE())
    -- lay so cau hoi trong thang 3
    UNION
    SELECT MONTH(create_date)'thang',COUNT(question_id)'so cau hoi'
    FROM question 
	WHERE MONTH(create_date) =
    (SELECT EXTRACT(MONTH FROM(SELECT SUBDATE(CURDATE(),INTERVAL 8 YEAR_MONTH ))))
    AND YEAR(create_date) = YEAR(CURDATE())
    -- lay so cau hoi trong thang 4
    UNION
    SELECT MONTH(create_date)'thang',COUNT(question_id)'so cau hoi'
    FROM question 
	WHERE MONTH(create_date) =
    (SELECT EXTRACT(MONTH FROM(SELECT SUBDATE(CURDATE(),INTERVAL 7 YEAR_MONTH ))))
    AND YEAR(create_date) = YEAR(CURDATE())
    -- lay so cau hoi trong thang 5
    UNION
    SELECT MONTH(create_date)'thang',COUNT(question_id)'so cau hoi'
    FROM question 
	WHERE MONTH(create_date) =
    (SELECT EXTRACT(MONTH FROM(SELECT SUBDATE(CURDATE(),INTERVAL 6 YEAR_MONTH ))))
    AND YEAR(create_date) = YEAR(CURDATE())
    -- lay so cau hoi trong thang 6
    UNION
    SELECT MONTH(create_date)'thang',COUNT(question_id)'so cau hoi'
    FROM question 
	WHERE MONTH(create_date) =
    (SELECT EXTRACT(MONTH FROM(SELECT SUBDATE(CURDATE(),INTERVAL 5 YEAR_MONTH ))))
    AND YEAR(create_date) = YEAR(CURDATE())
    -- lay so cau hoi trong thang 7
	 UNION
    SELECT MONTH(create_date)'thang',COUNT(question_id)'so cau hoi'
    FROM question 
	WHERE MONTH(create_date) =
    (SELECT EXTRACT(MONTH FROM(SELECT SUBDATE(CURDATE(),INTERVAL 4 YEAR_MONTH ))))
    AND YEAR(create_date) = YEAR(CURDATE())
    -- lay so cau hoi trong thang 8
     UNION
    SELECT MONTH(create_date)'thang',COUNT(question_id)'so cau hoi'
    FROM question 
	WHERE MONTH(create_date) =
    (SELECT EXTRACT(MONTH FROM(SELECT SUBDATE(CURDATE(),INTERVAL 3 YEAR_MONTH ))))
    AND YEAR(create_date) = YEAR(CURDATE())
    -- lay so cau hoi trong thang 9
     UNION
    SELECT MONTH(create_date)'thang',COUNT(question_id)'so cau hoi'
    FROM question 
	WHERE MONTH(create_date) =
    (SELECT EXTRACT(MONTH FROM(SELECT SUBDATE(CURDATE(),INTERVAL 2 YEAR_MONTH ))))
    AND YEAR(create_date) = YEAR(CURDATE())
    -- lay so cau hoi trong thang 10
     UNION
    SELECT MONTH(create_date)'thang',COUNT(question_id)'so cau hoi'
    FROM question 
	WHERE MONTH(create_date) =
    (SELECT EXTRACT(MONTH FROM(SELECT SUBDATE(CURDATE(),INTERVAL 1 YEAR_MONTH ))))
    AND YEAR(create_date) = YEAR(CURDATE())
    -- lay so cau hoi trong thang 11
     UNION
     SELECT MONTH(create_date)'thang',COUNT(question_id)'so cau hoi'
    FROM question 
	WHERE MONTH(create_date) = MONTH(CURDATE())
    AND YEAR(create_date) = YEAR(CURDATE())
    -- lay so cau hoi trong thang 12
      UNION
    SELECT MONTH(create_date)'thang',COUNT(question_id)'so cau hoi'
    FROM question 
	WHERE MONTH(create_date) =
    (SELECT EXTRACT(MONTH FROM(SELECT ADDDATE(CURDATE(),INTERVAL 1 YEAR_MONTH ))))
    AND YEAR(create_date) = YEAR(CURDATE())
    ;
END$$;
DELIMITER ;
CALL cau_hoi_theo_thang();
-- Question 12: Viết store để in ra mỗi tháng có bao nhiêu câu hỏi được tạo trong năm nay
DROP PROCEDURE IF EXISTS sp_so_cau_hoi_moi_thang_trong_nam_nay;
DELIMITER $$
CREATE PROCEDURE sp_so_cau_hoi_moi_thang_trong_nam_nay()
		BEGIN
			WITH cte_12months AS (
				SELECT 1 AS 'thang' UNION 
                SELECT 2 UNION 
                SELECT 3 UNION 
                SELECT 4 UNION 
                SELECT 5 UNION 				
                SELECT 6 UNION 				
                SELECT 7 UNION 				
                SELECT 8 UNION 				
                SELECT 9 UNION 
                SELECT 10 UNION 				
                SELECT 11 UNION 
                SELECT 12),
            cte_nhung_cau_hoi_cua_nam_hien_tai AS(
				SELECT * FROM question WHERE YEAR(create_date) = YEAR(CURDATE())
            )
			SELECT c12.thang, count(cq.question_id) AS so_luong
			FROM cte_12months c12 LEFT JOIN cte_nhung_cau_hoi_cua_nam_hien_tai cq
			ON c12.thang = MONTH(cq.create_date)
			GROUP BY c12.thang;
        END $$
DELIMITER ;        
-- gọi thủ tục
call sp_so_cau_hoi_moi_thang_trong_nam_nay();
-- Question 13: Viết store để in ra mỗi tháng có bao nhiêu câu hỏi được tạo trong 6
-- tháng gần đây nhất
-- (Nếu tháng nào không có thì sẽ in ra là "không có câu hỏi nào trong tháng") 

-- Câu 13
-- Viết store để in ra mỗi tháng có bao nhiêu câu hỏi được tạo trong 6 tháng gần đây nhất
-- (Nếu tháng nào không có thì sẽ in ra là "không có câu hỏi nào trong tháng")

DROP PROCEDURE IF EXISTS sp_dem_cau_hoi_6thang_gan_nhat;
DELIMITER $$
CREATE PROCEDURE sp_dem_cau_hoi_6thang_gan_nhat()
BEGIN
	-- tạo bảng ảo để lưu tháng, năm
	DROP TEMPORARY TABLE IF EXISTS tbl_6thang_gan_nhat;
	CREATE TEMPORARY TABLE tbl_6thang_gan_nhat(
		thang SMALLINT
	);
	INSERT INTO tbl_6thang_gan_nhat(thang) values
	(MONTH(DATE_SUB(CURDATE(), INTERVAL 5 MONTH))),
	(MONTH(DATE_SUB(CURDATE(), INTERVAL 4 MONTH))),
	(MONTH(DATE_SUB(CURDATE(), INTERVAL 3 MONTH))),
	(MONTH(DATE_SUB(CURDATE(), INTERVAL 2 MONTH))),
	(MONTH(DATE_SUB(CURDATE(), INTERVAL 1 MONTH))),
	(MONTH(NOW())) ;
    select * from tbl_6thang_gan_nhat;
	SELECT tbl_6.thang, CASE WHEN 
		COUNT(question_id) = 0 THEN 'không có câu hỏi nào trong tháng' ELSE COUNT(question_id) END AS so_luong_cau_hoi 
		FROM tbl_6thang_gan_nhat tbl_6 LEFT JOIN (SELECT * FROM question where create_date >= DATE_SUB(NOW(), INTERVAL 6 MONTH) AND create_date <= CURDATE()) 
                    AS sub_question ON tbl_6.thang = MONTH(create_date)
		GROUP BY tbl_6.thang
		ORDER BY tbl_6.thang ASC;
END$$
DELIMITER ;
-- gọi theo cách 1
call sp_dem_cau_hoi_6thang_gan_nhat();



-- Cách 2 dùng CTE 
DROP PROCEDURE IF EXISTS sp_dem_cau_hoi_6thang_gan_nhat_cach2;
DELIMITER $$
CREATE PROCEDURE sp_dem_cau_hoi_6thang_gan_nhat_cach2()
BEGIN
-- sử dụng CTE
WITH cte_6thang_gan_nhat AS (
	SELECT MONTH(DATE_SUB(NOW(), INTERVAL 5 MONTH)) AS 'thang', YEAR(DATE_SUB(NOW(), INTERVAL 5 MONTH)) AS `nam`
	UNION
	SELECT MONTH(DATE_SUB(NOW(), INTERVAL 4 MONTH)) AS 'thang', YEAR(DATE_SUB(NOW(), INTERVAL 4 MONTH)) AS `nam`
	UNION 
    SELECT MONTH(DATE_SUB(NOW(), INTERVAL 3 MONTH)) AS 'thang', YEAR(DATE_SUB(NOW(), INTERVAL 3 MONTH)) AS `nam`
	UNION 
	SELECT MONTH(DATE_SUB(NOW(), INTERVAL 2 MONTH)) AS 'thang', YEAR(DATE_SUB(NOW(), INTERVAL 2 MONTH)) AS `nam`
	UNION
	SELECT MONTH(DATE_SUB(NOW(), INTERVAL 1 MONTH)) AS 'thang', YEAR(DATE_SUB(NOW(), INTERVAL 1 MONTH)) AS `nam`
	UNION
	SELECT MONTH(NOW())AS 'thang', YEAR(NOW()) AS `nam`
), 
cte_cau_hoi_trong_nam_nay AS(
	SELECT * FROM question where create_date >= DATE_SUB(NOW(), INTERVAL 6 MONTH) AND create_date <= CURDATE()
)

SELECT ct6.thang, ct6.nam, CASE WHEN 
		COUNT(question_id) = 0 THEN 'không có câu hỏi nào trong tháng' ELSE COUNT(question_id) END AS so_luong_cau_hoi 
		FROM CTE_6thang_gan_nhat ct6 LEFT JOIN cte_cau_hoi_trong_nam_nay cc ON ct6.thang = MONTH(cc.create_date)
		GROUP BY ct6.thang
		ORDER BY ct6.thang ASC;
END$$
DELIMITER ;

-- gọi theo cách 2
call sp_dem_cau_hoi_6thang_gan_nhat_cach2();
