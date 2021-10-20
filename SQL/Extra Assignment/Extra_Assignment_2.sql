DROP DATABASE IF EXISTS	fresher_training_management;
CREATE	DATABASE		fresher_training_management;
USE						fresher_training_management;
-- tạo bảng Traniee
DROP TABLE IF EXISTS trainee;
CREATE TABLE trainee(
	trainee_id			SMALLINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    full_name			VARCHAR(20) NOT NULL,
    birth_date			DATE NOT NULL,
    gender				ENUM('male','female','unknown'),
    et_iq				TINYINT UNSIGNED NOT NULL, CHECK(et_iq<=20),
    et_gmath			TINYINT UNSIGNED NOT NULL,CHECK(et_gmath<=20),
    et_english			TINYINT UNSIGNED NOT NULL,CHECK(et_english<=50),
    training_class		VARCHAR(20) NOT NULL,
    evaluation_notes	TEXT
);
-- question 2 : add VTI Acount 
ALTER TABLE trainee 
ADD COLUMN vti_acount VARCHAR(50) UNIQUE NOT NULL;
-- Question 1: Thêm ít nhất 10 bản ghi vào table
INSERT INTO trainee(full_name,birth_date,gender,et_iq,et_gmath,et_english,training_class,evaluation_notes,vti_acount)
VALUES		('Tran Phuong Linh','1989/12/31','Female',	20,20,50,'CLC1','xuat sac','tranphuonglinh@vti.com.vn'),
			('Khong Manh Tuong','1990/12/30','Male',	18,18,45,'CLC1','xuat sac','khongtuong@vti.com.vn'	),
            ('Tran Bao Bao',	'1991/10/29','Male',	15,15,40,'CLC2','gioi','tranbao@vti.com.vn'			),
            ('Hoang Thuy Linh',	'1992/09/28','Female',	19,19,48,'CLC1','xuat sac','thuylinh@vti.com.vn'	),
            ('Mai Thanh Ngoc',	'1993/08/27','Female',	15,15,40,'CLC2','gioi','thanhngoc@vti.com.vn'		),
            ('Tran Thanh Nam',	'1994/08/26','Male',	10,10,35,'MD1',	'trung binh','thanhnam@vti.com.vn'	),
			('Mai Thanh Niem',	'1995/06/25','Male',	10,10,30,'MD1',	'trung binh','thanhniem@vti.com.vn'	),
			('Khuc Viet Anh',	'1994/06/20','Male',	10,10,30,'MD1',	'trung binh','vietanh@vti.com.vn'	),
            ('Bui Thu Trang',	'1994/03/05','Female',	20,19,45,'CLC1','xuat sac','thutrang@vti.com.vn'	),
            ('Le Hong Yen',		'1994/03/27','Female',	10,10,30,'2',	'trung binh','hongyen@vti.com.vn	');
SELECT 	*
FROM trainee;
-- tạo bảng data types 
DROP TABLE IF EXISTS	`data types`;
CREATE TABLE			`data types`(
	id					MEDIUMINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
   `name`				VARCHAR(50) NOT NULL,
	`Code`				CHAR(5) UNIQUE NOT NULL,
    modified_date		TIMESTAMP
    );
DROP TABLE IF EXISTS	`data types 2`;
CREATE TABLE			`data types 2`(
	id					SMALLINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	`name`				VARCHAR(50) NOT NULL,
	birth_date			DATE NOT NULL,
    gender				BIT NULL,-- 0 = Male, 1 = Female
    is_deleted_flag		BIT-- 1= Active, 0 = Delected
    );
-- Question 2: Viết lệnh để lấy ra tất cả các thực tập sinh đã vượt qua bài test đầu vào, nhóm chúng thành các tháng sinh khác nhau
SELECT GROUP_CONCAT(full_name ORDER BY full_name ASC),MONTH(birth_date) 
FROM trainee
GROUP BY MONTH(birth_date);
-- Question 3: Viết lệnh để lấy ra thực tập sinh có tên dài nhất, lấy ra các thông tin sau:tên, tuổi, các thông tin cơ bản (như đã được định nghĩa trong table)
SELECT full_name, birth_date,gender,et_iq,et_gmath,et_english,training_class,vti_acount
FROM trainee
WHERE LENGTH(full_name) = 
		(SELECT MAX(LENGTH(full_name))
        FROM trainee);
-- Question 4: Viết lệnh để lấy ra tất cả các thực tập sinh là ET, 1 ET thực tập sinh là  những người đã vượt qua bài test đầu vào và thỏa mãn số điểm như sau:
-- ET_IQ + ET_Gmath>=20
-- ET_IQ>=8
-- ET_Gmath>=8
-- ET_English>=18
SELECT *
FROM trainee
WHERE (ET_IQ+ET_Gmath)>=20 AND ET_IQ>=8 AND ET_Gmath>=8 AND ET_English>=18;
-- Question 5: xóa thực tập sinh có TraineeID = 3
DELETE FROM trainee
WHERE trainee_id = 3;
-- Question 6: Thực tập sinh có TraineeID = 5 được chuyển sang lớp "2". Hãy cập nhật thông tin vào database
UPDATE trainee
SET 
            