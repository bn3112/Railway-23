DROP DATABASE IF EXISTS	testing_system;
CREATE DATABASE	testing_system;
USE testing_system;
ALTER DATABASE testing_system CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
-- tạo bảng phòng ban--
DROP TABLE IF EXISTS department;
CREATE TABLE		department(
	department_id	TINYINT PRIMARY KEY AUTO_INCREMENT,
    department_name	VARCHAR(50) CHAR SET utf8mb4 NOT NULL
);
-- tạo bảng vị trí--
DROP TABLE IF EXISTS `position`;
CREATE TABLE		`position`(
	position_id		TINYINT PRIMARY KEY AUTO_INCREMENT,
    position_name	ENUM('dev','test','scrum master','pm')
);
-- tạo bảng tài khoản--
DROP TABLE IF EXISTS `account`;
CREATE TABLE		`account`(
	account_id		SMALLINT PRIMARY KEY AUTO_INCREMENT,
    email			VARCHAR(50) UNIQUE NOT NULL,
    user_name		VARCHAR(50) UNIQUE NOT NULL,
    full_name		VARCHAR(50) CHAR SET utf8mb4 NOT NULL,
    department_id	TINYINT NOT NULL,
    position_id		TINYINT NOT NULL,
	create_date		DATE,
FOREIGN KEY (department_id) REFERENCES department(department_id),
FOREIGN KEY (position_id) REFERENCES `position`(position_id)
);	
-- tạo bảng nhóm--
DROP TABLE IF EXISTS `group`;
CREATE TABLE		`group`(
	group_id		TINYINT PRIMARY KEY AUTO_INCREMENT,
    group_name		VARCHAR(20) NOT NULL,
    creator_id		SMALLINT NOT NULL,
    create_date		DATE,
FOREIGN KEY (creator_id) REFERENCES `account`(account_id)
);	
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
-- tạo bảng loại câu hỏi--
DROP TABLE IF EXISTS 	type_question;
CREATE TABLE			type_question(
	type_id			TINYINT PRIMARY KEY AUTO_INCREMENT,
    type_name		VARCHAR(50) CHAR SET utf8mb4 NOT NULL
);
-- tạo bảng danh mục câu hỏi--
DROP TABLE IF EXISTS 	category_question;
CREATE TABLE			category_question(
	category_id		TINYINT PRIMARY KEY AUTO_INCREMENT,
    category_name	VARCHAR(50) CHAR SET utf8mb4 NOT NULL
);
-- tạo bảng câu hỏi--
DROP TABLE IF EXISTS question;
CREATE TABLE		question(
	question_id		TINYINT PRIMARY KEY AUTO_INCREMENT,
    content			VARCHAR(200) CHAR SET utf8mb4 NOT NULL,
    category_id		TINYINT NOT NULL,
    type_id			TINYINT NOT NULL,
    creator_id		SMALLINT NOT NULL,
	create_date		DATE,
FOREIGN KEY (category_id) REFERENCES category_question(category_id),
FOREIGN KEY (type_id) REFERENCES type_question(type_id),
FOREIGN KEY (creator_id) REFERENCES `account`(account_id)  
);	
-- tạo bảng câu trả lời--
DROP TABLE IF EXISTS answer;
CREATE TABLE		answer(
	answer_id		TINYINT PRIMARY KEY AUTO_INCREMENT,
    content			VARCHAR(200) CHAR SET utf8mb4 NOT NULL,
    question_id		TINYINT NOT NULL,
    is_correct		BOOLEAN,  -- Yes-1 or no-0 
FOREIGN KEY (question_id) REFERENCES question(question_id)  
);
-- tạo bảng kiểm tra--
DROP TABLE IF EXISTS exam;
CREATE TABLE		exam(
	exam_id			TINYINT PRIMARY KEY AUTO_INCREMENT,
    `code`			VARCHAR(20) NOT NULL,
    title			VARCHAR(50) CHAR SET utf8mb4 NOT NULL,
    category_id		TINYINT NOT NULL,
    duration		ENUM('15m','30m','45m','60m','90m','120m'),	
    creator_id		SMALLINT NOT NULL,		
	create_date		DATE,
FOREIGN KEY (category_id) REFERENCES category_question(category_id),
FOREIGN KEY (creator_id) REFERENCES `account`(account_id)
);	
-- tạo bảng câu hỏi kiểm tra--
DROP TABLE IF EXISTS exam_question;
CREATE TABLE		exam_question(
	exam_id			TINYINT NOT NULL,
    question_id		TINYINT NOT NULL,
FOREIGN KEY (exam_id) REFERENCES exam(exam_id),
FOREIGN KEY (question_id) REFERENCES question(question_id) 
);
-- thêm dữ liệu vào bảng 1 - bảng phòng ban--
INSERT INTO department(department_name)
VALUES		('marketing'),	
			('sale'		),
            ('nhân sự'	),
            ('kỹ thuật'	),	
            ('đào tạo'	),
            ('kế hoạch'	),
            ('kế toán'	),
            ('tài chính'),
            ('tài vụ'	),
            ('quản lý'	);
-- thêm dữ liệu vào bảng 2 - bảng vị trí--
INSERT INTO `position`(position_name)
VALUES				('dev'			),
                    ('test'			),
                    ('scrum master'	),
                    ('pm'			);
-- thêm dữ liệu vào bảng 3 - bảng tài khoản-- 
INSERT INTO `account`(email,user_name, full_name,department_id,position_id,create_date)
VALUES				('hoangthiynhi@gmail.com',		'hoangnhi',		'Hoàng Thị Ý Nhi',		7,3,'2019/10/19'),
					('nguythanhhang@gmail.com', 	'thanhhang',	'Ngụy Thanh Hằng',		8,2,'2021/10/12'),
                    ('caoanhtuyet@gmail.com', 		'anhtuyet',		'Cao Ánh Tuyết',		5,1,'2021/10/13'),
                    ('nguyenquocsang@gmail.com',	'quocsang',		'Nguyễn Quốc Sang',		4,4,'2021/10/14'),
                    ('nguyenvanton@gmail.com', 		'nguyenton',	'NGuyễn Văn Tôn',		6,3,'2021/10/15'),
                    ('phamgiabao@gmail.com', 		'giabao',		'Phạm Gia Bảo',			9,1,'2021/10/16'),
					('Lehoangyen@gmail.com', 		'leyen',		'Lê Hoàng Yến',			3,3,'2019/10/19'),
                    ('lyquocnghi@gmail.com', 		'quocnghi',		'Lý Quốc Nghị',			1,1,'2021/10/17'),
                    ('nguyenhuyentrang@gmail.com', 	'huyentrang',	'Nguyễn Huyền Trang',	3,1,'2021/10/17'),
                    ('nguyenduyanh@gmail.com', 		'duyanh',		'Nguyễn Duy Anh',		10,4,'2021/10/17');	
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
-- thêm dữ liệu vào bảng 6 - bảng loại câu hỏi--
INSERT INTO type_question(type_name)
VALUES				('essay'			),
					('multiple-choice'	);
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
-- thêm dữ liệu vào bảng 8 - bảng câu hỏi--
INSERT INTO question(content,category_id,type_id,creator_id,create_date)
VALUES				('Câu hỏi 1: Java là gì?',	1,2,5,'2019/10/19'),
					('SQL là gì?',				1,2,5,'2020/10/19'),
                    ('Postman là gì?',			1,2,5,'2021/10/10'),
                    ('Ruby là gì?',				1,2,5,'2021/10/11'),
                    ('.NET là gì?',				1,2,8,'2021/10/12'),
                    ('C++ là gì?',				1,2,8,'2021/10/13'),
					('Android là gì?',			1,2,8,'2021/10/14'),
                    ('Fibonacy là gì',			2,2,8,'2021/10/15'),
                    ('What is your goal?',		5,2,8,'2021/10/16'),
                    ('Tâm lý học là gì?',		9,2,8,'2021/10/17');
-- thêm dữ liệu vào bảng 9- bảng câu trả lời--
INSERT INTO answer(content,question_id,is_correct)
VALUES				('Java là một ngôn ngữ lập trình',				1,1),
					('SQL là một ngôn ngữ lập trình',				1,0),
                    ('Postman là công cụ cho phép thao tác với API',1,1),
                    ('Ruby là một ngôn ngữ lập trình',				1,1),
                    ('.NET là nền tảng để phát triển website',		1,1),
                    ('C++ là nền tảng ứng dụng',					1,0),
					('Android là hệ điều hành ứng dụng',			1,1),
					('Fibonacy là dayx vô hạn tuân theo quy luật',	2,1),
                    ('Enjoy my life',								1,1),
                    ('Tâm lý học là nắm bắt cảm xúc của người khác',1,1);
-- thêm dữ liệu vào bảng 10 - bảng đề thi--
INSERT INTO exam(`code`,title,category_id,duration,creator_id,create_date)
VALUES				('MS1','Tin học cơ bản',	1,'90m',5,'2019/10/19'),
					('MS2','Tin học cơ bản',	1,'30m',5,'2020/10/19'),
					('MS3','Toán học',			2,'30m',5,'2021/10/11'),
					('MS4','Vật lý',			3,'60m',5,'2021/10/12'),
					('MS5','Hóa học',			4,'15m',5,'2021/10/13'),
                    ('MS6','Anh văn 2',			5,'30m',5,'2021/10/14'),
                    ('MS7','Tin học 2',			1,'60m',5,'2021/10/15'),
                    ('MS8','Tin học đại cương',	1,'15m',5,'2021/10/16'),
                    ('MS9','Tin học đại cương',	1,'30m',5,'2021/10/17'),
                    ('MS10','Tâm lý học',		1,'60m',5,'2021/10/17');
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
-- lấy ra user name của các nhân viên thuộc phòng ban sale bằng lệnh join--
SELECT `account`.user_name
FROM `account`
JOIN department ON `account`.department_id = department.department_id
WHERE department_name = 'sale';
