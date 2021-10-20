DROP DATABASE IF EXISTS	testing_system;
CREATE DATABASE	testing_system;
USE testing_system;
ALTER DATABASE testing_system CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
-- tạo bảng phòng ban--
DROP TABLE IF EXISTS department;
CREATE TABLE department(
	department_id	TINYINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    department_name	VARCHAR(30) CHAR SET utf8mb4 UNIQUE NOT NULL
);
-- thêm dữ liệu vào bảng 1 - bảng phòng ban--
INSERT INTO department(department_name)
VALUES		('marketing'),	
			('sale'		),
            ('nhân sự'	),
            ('kỹ thuật'	),	
            ('tài vụ'	),
            ('kế hoạch'	),
            ('kế toán'	),
            ('tài chính'),
            ('giao lưu'	),
            ('quản lý'	);
-- tạo bảng vị trí--
DROP TABLE IF EXISTS `position`;
CREATE TABLE `position`(
	position_id		TINYINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    position_name	ENUM('Dev','Test','Scrum Master','PM')
);
-- thêm dữ liệu vào bảng 2 - bảng vị trí--
INSERT INTO `position`(position_name)
VALUES				('Dev'			),
                    ('Test'			),
                    ('Scrum Master'	),
                    ('PM'			);
-- tạo bảng tài khoản--
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account`(
	account_id		SMALLINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    email			VARCHAR(50) UNIQUE NOT NULL,
    user_name		VARCHAR(20) UNIQUE NOT NULL,
    full_name		VARCHAR(30) CHAR SET utf8mb4 NOT NULL,
    department_id	TINYINT NOT NULL,
    position_id		TINYINT NOT NULL,
	create_date		DATE,
FOREIGN KEY (department_id) REFERENCES department(department_id),
FOREIGN KEY (position_id) REFERENCES `position`(position_id)
);	
-- thêm dữ liệu vào bảng 3 - bảng tài khoản-- 
INSERT INTO `account`(email,user_name, full_name,department_id,position_id,create_date)
VALUES				('hoangthiynhi@gmail.com',		'hoangnhi',		'Hoàng Thị Ý Nhi',		7,3,'2019/10/19'),
					('nguythanhhang@gmail.com', 	'thanhhang',	'Ngụy Thanh Hằng',		8,2,'2021/10/12'),
                    ('caoanhtuyet@gmail.com', 		'anhtuyet',		'Cao Ánh Tuyết',		5,1,'2021/10/13'),
                    ('nguyenquocsang@gmail.com',	'quocsang',		'Nguyễn Quốc Sang',		4,4,'2021/10/14'),
                    ('nguyenvanton@gmail.com', 		'nguyenton',	'NGuyễn Văn Tôn',		6,3,'2021/10/15'),
                    ('phamgiabao@gmail.com', 		'giabao',		'Phạm Gia Bảo',			9,1,'2021/10/16'),
					('Lehoangyen@gmail.com', 		'leyen',		'Lê Hoàng Yến',			3,3,'2019/10/19'),
                    ('lyquocnghi@gmail.com', 		'quocnghi',		'Lý Quốc Nghị',			2,1,'2021/10/17'),
                    ('nguyenhuyentrang@gmail.com', 	'huyentrang',	'Nguyễn Huyền Trang',	3,1,'2021/10/17'),
                    ('nguyenduyanh@gmail.com', 		'duyanh',		'Nguyễn Duy Anh',		10,4,'2021/10/17'),	
					('duonghoangbao@gmail.com', 	'hoangbao',		 'Dương Hoàng Bảo',		1, 2, '2021-10-19');
-- tạo bảng nhóm--
DROP TABLE IF EXISTS `group`;
CREATE TABLE		`group`(
	group_id		TINYINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    group_name		VARCHAR(20) CHAR SET utf8mb4 NOT NULL,
    creator_id		SMALLINT NOT NULL,
    create_date		DATE,
FOREIGN KEY (creator_id) REFERENCES `account`(account_id)
);	
-- thêm dữ liệu vào bảng 4 - bảng các nhóm--
INSERT INTO `group`(group_name,creator_id,create_date)
VALUES				('sale 1', 		8,'2019/10/19'),
					('sale 2', 		8,'2021/10/12'),
					('văn phòng 1', 3,'2021/10/12'),
					('văn phòng 2', 3,'2021/10/12'),
                    ('quản lý 1', 	10,'2021/10/12'),
                    ('quản lý 2 ', 	10,'2021/10/12'),
                    ('hỗ trợ 1', 	4,'2021/10/12'),
                    ('hỗ trợ 2', 	4,'2021/10/12'),
                    ('marketing 1', 1,'2021/10/12'),
                    ('marketing 2', 1,'2021/10/12');
-- tạo bảng nhóm tài khoản-- 
DROP TABLE IF EXISTS group_account;
CREATE TABLE		group_account(
	group_id		TINYINT NOT NULL,
    account_id		SMALLINT NOT NULL,
    join_date		DATE,
PRIMARY KEY(group_id,account_id),
FOREIGN KEY (group_id) REFERENCES `group`(group_id),
FOREIGN KEY (account_id) REFERENCES `account`(account_id)
);	
-- thêm dữ liệu vào bảng 5 - bảng các nhóm tài khoản--
INSERT INTO group_account(group_id,account_id,join_date)
VALUES				(1,1,'2019/10/19'),
					(2,2,'2020/10/19'),
                    (2,10,'2021/10/11'),
                    (3,4,'2021/10/12'),
					(4,5,'2021/10/14'),
                    (3,6,'2021/10/15'),
                    (5,7,'2021/10/16'),
                    (6,8,'2021/10/17'),
                    (2,9,'2021/10/17');
-- tạo bảng loại câu hỏi--
DROP TABLE IF EXISTS 	type_question;
CREATE TABLE			type_question(
	type_id			TINYINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    type_name		ENUM('essay','multiple-choice')
);
-- thêm dữ liệu vào bảng 6 - bảng loại câu hỏi--
INSERT INTO type_question(type_name)
VALUES				('essay'			),
					('multiple-choice'	);
                    
-- tạo bảng danh mục câu hỏi--
DROP TABLE IF EXISTS 	category_question;
CREATE TABLE			category_question(
	category_id		TINYINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    category_name	VARCHAR(50) CHAR SET utf8mb4 NOT NULL UNIQUE
);
-- thêm dữ liệu vào bảng 7 - bảng danh mục câu hỏi--
INSERT INTO category_question(category_name)
VALUES				('tin học'	),
					('toán học'	),
                    ('vật lý'	),
                    ('hóa học'	),
                    ('anh văn'	),
                    ('ngữ văn'	),
					('công nghệ'),
                    ('giáo dục'	),
                    ('tâm lý'	),
					('địa lý'	);
-- tạo bảng câu hỏi--
DROP TABLE IF EXISTS question;
CREATE TABLE		question(
	question_id		TINYINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    content			VARCHAR(250) CHAR SET utf8mb4 NOT NULL,
    category_id		TINYINT NOT NULL,
    type_id			TINYINT NOT NULL,
    creator_id		SMALLINT NOT NULL,
	create_date		DATE,
FOREIGN KEY (category_id) REFERENCES category_question(category_id),
FOREIGN KEY (type_id) REFERENCES type_question(type_id),
FOREIGN KEY (creator_id) REFERENCES `account`(account_id)  
);	
-- thêm dữ liệu vào bảng 8 - bảng câu hỏi--
INSERT INTO question(content,category_id,type_id,creator_id,create_date)
VALUES				('Câu hỏi 1: Java là gì?',	1,2,5,'2019/10/19'),
					('SQL là gì?',				1,2,5,'2020/10/19'),
                    ('Postman là gì?',			1,2,5,'2021/10/10'),
                    ('Ruby là gì?',				1,2,5,'2021/10/11'),
                    ('.NET là gì?',				1,2,8,'2021/10/12'),
                    ('C++ là gì?',				1,2,8,'2021/10/13'),
					('Android là gì?',			1,2,8,'2021/10/14'),
                    ('Fibonacci là gì',			2,2,8,'2021/10/15'),
                    ('What is your goal?',		5,2,8,'2021/10/16'),
                    ('Tâm lý học là gì?',		9,2,8,'2021/10/17');
-- tạo bảng câu trả lời--
DROP TABLE IF EXISTS answer;
CREATE TABLE		answer(
	answer_id		TINYINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    content			VARCHAR(250) CHAR SET utf8mb4 NOT NULL,
    question_id		TINYINT NOT NULL,
    is_correct		BOOLEAN,  -- True-1 or False-0 
FOREIGN KEY (question_id) REFERENCES question(question_id)  
);
-- thêm dữ liệu vào bảng 9- bảng câu trả lời--
INSERT INTO answer(content,question_id,is_correct)
VALUES				('Java là một ngôn ngữ lập trình',				1,1),
					('SQL là một ngôn ngữ lập trình',				1,0),
                    ('Postman là công cụ cho phép thao tác với API',1,1),
                    ('Ruby là một ngôn ngữ lập trình',				1,1),
                    ('.NET là nền tảng để phát triển website',		1,1),
                    ('C++ là nền tảng ứng dụng',					1,0),
					('Android là hệ điều hành ứng dụng',			1,1),
					('Fibonacci là dãy vô hạn tuân theo quy luật',	2,1),
                    ('Enjoy my life',								1,1),
                    ('Tâm lý học là nắm bắt cảm xúc của người khác',1,1);
-- tạo bảng kiểm tra--
DROP TABLE IF EXISTS exam;
CREATE TABLE		exam(
	exam_id			TINYINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `code`			VARCHAR(20) NOT NULL,
    title			VARCHAR(50) CHAR SET utf8mb4 NOT NULL,
    category_id		TINYINT NOT NULL,
    duration		SMALLINT,	
    creator_id		SMALLINT NOT NULL,		
	create_date		DATE,
FOREIGN KEY (category_id) REFERENCES category_question(category_id),
FOREIGN KEY (creator_id) REFERENCES `account`(account_id)
);	
-- thêm dữ liệu vào bảng 10 - bảng đề thi--
INSERT INTO exam(`code`,title,category_id,duration,creator_id,create_date)
VALUES				('MS1','Tin học cơ bản 1',	1,'90',5,'2019/10/19'),
					('MS2','Tin học cơ bản',	1,'30',5,'2020/10/19'),
					('MS3','Toán học',			2,'30',5,'2021/10/11'),
					('MS4','Vật lý',			3,'60',5,'2021/10/12'),
					('MS5','Hóa học',			4,'15',5,'2021/10/13'),
                    ('MS6','Anh văn',			5,'30',5,'2021/10/14'),
                    ('MS7','Tin học 2',			1,'60',5,'2021/10/15'),
                    ('MS8','Tin học đại cương 1',	1,'15',5,'2021/10/16'),
                    ('MS9','Tin học đại cương 2',	1,'30',5,'2021/10/17'),
                    ('MS11','Tin học đại cương 3',	1,'30',5,'2018/10/17'),
                    ('MS10','Tâm lý học',		1,'60',5,'2021/10/17');
-- tạo bảng câu hỏi kiểm tra--
DROP TABLE IF EXISTS exam_question;
CREATE TABLE		exam_question(
	exam_id			TINYINT NOT NULL,
    question_id		TINYINT NOT NULL,
FOREIGN KEY (exam_id) REFERENCES exam(exam_id),
FOREIGN KEY (question_id) REFERENCES question(question_id) 
);
-- thêm dữ liệu vào bảng 11 - bảng câu hỏi đề thi--
INSERT INTO exam_question(exam_id,question_id)
VALUES				(1,6),
					(2,1),
					(3,8),
                    (5,9),
                    (10,10),
                    (8,2),
					(9,1),
					(4,1),
                    (6,2),
                    (7,7);
-- Question 1: Thêm ít nhất 10 record vào mỗi table
-- done
-- Question 2: lấy ra tất cả các phòng ban
SELECT*
FROM department;
-- Question 3: lấy ra id của phòng ban "Sale"
SELECT department_id
FROM department
WHERE department_name='sale';
-- Question 4: lấy ra thông tin account có full name dài nhất
SELECT *
FROM `account`
WHERE LENGTH(full_name)= 
	(SELECT MAX(LENGTH(full_name)) 
    FROM `account`);
-- Question 5: Lấy ra thông tin account có full name dài nhất và thuộc phòng ban có id= 3
SELECT *
FROM `account`
WHERE LENGTH(full_name)= 
		(SELECT MAX(LENGTH(full_name))
		FROM `account`) AND department_id = 3;
-- Question 6: Lấy ra tên group đã tham gia trước ngày 20/12/2019
SELECT group_name
FROM `group`
WHERE create_date < '2019/12/20';
-- Question 7: Lấy ra ID của question có >= 4 câu trả lời
SELECT question_id, COUNT(answer_id) 'tổng câu trả lời)'
FROM answer
GROUP BY question_id
HAVING COUNT(answer_id)>=4;
-- Question 8: Lấy ra các mã đề thi có thời gian thi >= 60 phút và được tạo trước ngày 20/12/2019
SELECT `code`
FROM exam
WHERE duration > 60 AND create_date < '2019-12-20';
-- Question 9: Lấy ra 5 group được tạo gần đây nhất
SELECT *
FROM `group`
ORDER BY create_date  DESC
LIMIT 5;
-- select distinct (coulumn table) from table: dùng loại bỏ những người trùng tên trong một cột--
-- sắp xếp name nhân viên theo thứ tự abc
SELECT *
FROM `account`
ORDER BY user_name ASC;
-- Question 10: Đếm số nhân viên thuộc department có id = 2--
SELECT COUNT(user_name) 'số lượng nhân viên'
FROM `account`
GROUP BY department_id
HAVING  department_id = 2;
-- Question 11: Lấy ra nhân viên có tên bắt đầu bằng chữ "D" và kết thúc bằng chữ "o"
SELECT *
FROM `account`
WHERE full_name LIKE 'D%o';
-- Question 12: Xóa tất cả các exam được tạo trước ngày 20/12/2019
-- tạo khóa ngoại với ràng buộc xóa bằng lệnh alter
ALTER TABLE exam_question
ADD CONSTRAINT exam_id
 FOREIGN KEY (exam_id)
 REFERENCES exam (exam_id)
 ON DELETE CASCADE;
DELETE FROM exam
WHERE create_date < '2019/12/20';
-- Question 13: Xóa tất cả các question có nội dung bắt đầu bằng từ "câu hỏi"
SELECT *
FROM question;
select *
from answer;
-- tạo khóa ngoại với ràng buộc xóa bằng lệnh alter
ALTER TABLE answer
ADD CONSTRAINT question_id
FOREIGN KEY (question_id) 
REFERENCES question (question_id)  
ON DELETE CASCADE;
DELETE FROM question
WHERE content LIKE 'Câu hỏi%';
-- k xoa dc??????--
-- Question 14: Update thông tin của account có id = 5 thành tên "Nguyễn Bá Lộc" và email thành loc.nguyenba@vti.com.vn
UPDATE `account`
SET full_name = 'Nguyễn Bá Lộc', email = 'loc.nguyenba@vti.com.vn'
WHERE account_id = 5;
-- Question 15: update account có id = 5 sẽ thuộc group có id = 4
UPDATE group_account
SET group_id = 4
WHERE account_id = 5;
