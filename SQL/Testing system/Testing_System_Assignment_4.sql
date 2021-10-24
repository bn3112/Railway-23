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
                    ('nguyenquocsang@gmail.com',	'quocsang',		'Nguyễn Quốc Sang',		4,1,'2021/10/14'),
                    ('nguyenvanton@gmail.com', 		'nguyenton',	'NGuyễn Văn Tôn',		6,3,'2021/10/15'),
                    ('phamgiabao@gmail.com', 		'giabao',		'Phạm Gia Bảo',			9,1,'2021/10/16'),
					('Lehoangyen@gmail.com', 		'leyen',		'Lê Hoàng Yến',			3,3,'2019/10/19'),
                    ('lyquocnghi@gmail.com', 		'quocnghi',		'Lý Quốc Nghị',			2,1,'2021/10/17'),
                    ('nguyenhuyentrang@gmail.com', 	'huyentrang',	'Nguyễn Huyền Trang',	3,1,'2021/10/17'),
                    ('nguyenduyanh@gmail.com', 		'duyanh',		'Nguyễn Duy Anh',		3,1,'2021/10/17'),	
					('duonghoangbao@gmail.com', 	'hoangbao',		 'Dương Hoàng Bảo',		3, 2, '2021-10-19');
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
VALUES				('Câu hỏi 1: Java là gì?',	1,1,5,'2019/10/19'),
					('SQL là gì?',				1,2,5,'2020/10/19'),
                    ('Postman là gì?',			1,1,5,'2021/10/10'),
                    ('Ruby là gì?',				1,1,5,'2021/10/11'),
                    ('.NET là gì?',				1,1,8,'2021/10/12'),
                    ('C++ là gì?',				1,1,8,'2021/10/13'),
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
FOREIGN KEY (question_id) REFERENCES question(question_id)  ON DELETE CASCADE 
);
-- thêm dữ liệu vào bảng 9- bảng câu trả lời--
INSERT INTO answer(content,question_id,is_correct)
VALUES				('Java là một ngôn ngữ lập trình',				1,1),
					('SQL là một ngôn ngữ lập trình',				1,0),
                    ('Postman là công cụ cho phép thao tác với API',3,1),
                    ('Ruby là một ngôn ngữ lập trình',				4,1),
                    ('.NET là nền tảng để phát triển website',		5,1),
                    ('C++ là nền tảng ứng dụng',					6,1),
					('Android là hệ điều hành ứng dụng',			7,1),
					('Fibonacci là dãy vô hạn tuân theo quy luật',	8,1),
                    ('Enjoy my life',								9,1),
                    ('Tâm lý học là nắm bắt cảm xúc của người khác',10,1);
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
PRIMARY KEY (exam_id,question_id),
FOREIGN KEY (exam_id) REFERENCES exam(exam_id) ON DELETE CASCADE,
FOREIGN KEY (question_id) REFERENCES question(question_id) ON DELETE CASCADE 
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
USE testing_system;
-- Exercise 1: Join
-- Question 1: Viết lệnh để lấy ra danh sách nhân viên và thông tin phòng ban của họ
SELECT a.full_name,d.*
FROM `account` a 
JOIN department d  ON a.department_id = d.department_id;

-- Question 2: Viết lệnh để lấy ra thông tin các account được tạo sau ngày 20/12/2010
SELECT *
FROM `account`
WHERE create_date > '2010/12/20';

-- Question 3: Viết lệnh để lấy ra tất cả các developer
SELECT a.full_name
FROM `account` a 
JOIN `position` p ON a.position_id = p.position_id
WHERE p.position_name = 'Dev';

-- Question 4: Viết lệnh để lấy ra danh sách các phòng ban có >3 nhân viên
SELECT d.department_name,COUNT(a.account_id) 'so luong nv'
FROM department d 
JOIN `account` a ON a.department_id = d.department_id
GROUP BY a.department_id
HAVING COUNT(a.account_id)> 3;

-- Question 5: Viết lệnh để lấy ra danh sách câu hỏi được sử dụng trong đề thi nhiều nhất
SELECT q.question_id,q.content,COUNT(q.question_id) 'so luong cau hoi nhieu nhat'
FROM question q 
JOIN exam_question eq ON q.question_id = eq.question_id
GROUP BY q.question_id
HAVING COUNT(q.question_id) = 
	(SELECT MAX(nhom.dem_cau_hoi) AS so_cau_hoi_nhieu_nhat
		FROM (SELECT eq.question_id,COUNT(eq.question_id) AS dem_cau_hoi
			FROM exam_question eq
			GROUP BY eq.question_id) AS nhom);
select *
from question;
select *
from exam_question;
-- Question 6: Thông kê mỗi category Question được sử dụng trong bao nhiêu Question
SELECT cq.category_name,q.content,COUNT(q.question_id) 'so luong danh muc'
FROM category_question cq 
LEFT JOIN question q ON cq.category_id = q.category_id
GROUP BY cq.category_id;

-- Question 7: Thông kê mỗi Question được sử dụng trong bao nhiêu Exam
SELECT q.question_id, q.content,COUNT(eq.exam_id) 'so luong ca hoi'
FROM question q
LEFT JOIN exam_question eq ON q.question_id = eq.question_id
GROUP BY q.question_id;

-- Question 8: Lấy ra Question có nhiều câu trả lời nhất
SELECT q.content,COUNT(a.answer_id)'so cau hoi co cau tra loi nhieu nhat'
FROM question q
LEFT JOIN answer a ON q.question_id=a.question_id
GROUP BY a.question_id
HAVING COUNT(a.answer_id)=
	(SELECT MAX(dem_cau_tra_loi)
    FROM (SELECT COUNT(a.answer_id) AS dem_cau_tra_loi
			FROM answer a
			GROUP BY a.answer_id) AS nhom);
-- Question 9: Thống kê số lượng account trong mỗi group
SELECT ga.account_id,g.group_name,COUNT(ga.account_id)'so luong tai khoan'
FROM group_account ga
RIGHT JOIN `group` g ON ga.group_id=g.group_id
GROUP BY ga.group_id;
-- Question 10: Tìm chức vụ có ít người nhất
SELECT *
FROM `account`;
SELECT *
FROM `position`;
SELECT p.position_name,COUNT(a.account_id)'so luong nv'
FROM `position` p
LEFT JOIN `account` a ON p.position_id=a.position_id
GROUP BY p.position_id
HAVING COUNT(a.account_id)=
	(SELECT MIN(so_luong_nv) AS so_luong_nv_it_nhat
		FROM (SELECT p.position_id, COUNT(a.account_id) AS so_luong_nv
			FROM `account` a
				RIGHT JOIN `position` p ON a.position_id = p.position_id
				GROUP BY p.position_id) AS nhom);
		
-- Question 11: Thống kê mỗi phòng ban có bao nhiêu dev, test, scrum master, PM
SELECT d.department_name,p.position_name,COUNT(a.account_id)'so luong nv'
FROM department d
LEFT JOIN `account` a ON d.department_id=a.department_id
LEFT JOIN `position` p ON a.position_id=p.position_id
GROUP BY p.position_id,d.department_id;
SELECT *
FROM `account`;
SELECT *
FROM`position`;
SELECT *
FROM department;
-- Question 12: Lấy thông tin chi tiết của câu hỏi bao gồm: thông tin cơ bản của question, loại câu hỏi, ai là người tạo ra câu hỏi, câu trả lời là gì, ...
SELECT q.question_id,q.content,cq.category_name,a.full_name,tq.type_name,an.content,an.is_correct,q.create_date
FROM question q
LEFT JOIN category_question cq ON cq.category_id=q.category_id
LEFT JOIN `account` a ON q.creator_id=a.account_id
LEFT JOIN type_question tq ON q.type_id=tq.type_id
LEFT JOIN answer an ON q.question_id=an.question_id;

-- Question 13: Lấy ra số lượng câu hỏi của mỗi loại tự luận hay trắc nghiệm
SELECT tq.type_id,tq.type_name,COUNT(q.type_id)'so luong loai cau hoi'
FROM type_question tq 
LEFT JOIN question q ON q.type_id=tq.type_id
GROUP BY q.type_id;

-- Question 14:Lấy ra group không có account nào
SELECT g.group_name
FROM `group` g
LEFT JOIN group_account ga ON g.group_id=ga.group_id
WHERE ga.group_id IS NULL;
SELECT *
FROM group_account;
-- Question 15: Lấy ra group không có account nào
SELECT *
FROM `group`
WHERE group_id NOT IN 
	(SELECT group_id
    FROM group_account);
-- Question 16: Lấy ra question không có answer nào
SELECT *
FROM question
WHERE question_id NOT IN
	(SELECT question_id
    FROM answer);
-- Question 17:a) Lấy các account thuộc nhóm thứ 1
SELECT a.account_id,a.full_name
FROM `account` a
JOIN group_account ga ON a.account_id=ga.account_id
WHERE ga.group_id=1;
-- Question 17:b) Lấy các account thuộc nhóm thứ 2
SELECT a.account_id,a.full_name
FROM `account` a
JOIN group_account ga ON a.account_id=ga.account_id
WHERE ga.group_id=2;
-- Question 17:c) Ghép 2 kết quả từ câu a) và câu b) sao cho không có record nào trùng nhau
SELECT a.account_id,a.full_name
FROM `account` a
JOIN group_account ga ON a.account_id=ga.account_id
WHERE ga.group_id=1
	UNION 
SELECT a.account_id,a.full_name
FROM `account` a
JOIN group_account ga ON a.account_id=ga.account_id
WHERE ga.group_id=2;
-- Question 18:a) Lấy các group có lớn hơn 5 thành viên
SELECT g.group_id,g.group_name,COUNT(ga.account_id)'so thanh vien'
FROM `group` g
JOIN group_account ga ON g.group_id=ga.group_id
GROUP BY g.group_id
HAVING COUNT(ga.account_id)>5;
-- Question 18:b) Lấy các group có nhỏ hơn 7 thành viên
SELECT g.group_id,g.group_name,COUNT(ga.group_id)'so thanh vien'
FROM `group` g
RIGHT JOIN group_account ga ON g.group_id=ga.group_id
GROUP BY g.group_id
HAVING COUNT(ga.account_id)<7;
-- Question 18:c) Ghép 2 kết quả từ câu a) và câu b)
SELECT g.group_id,g.group_name,COUNT(ga.account_id)'so thanh vien'
FROM `group` g
JOIN group_account ga ON g.group_id=ga.group_id
GROUP BY g.group_id
HAVING COUNT(ga.account_id)>5
	UNION ALL
SELECT g.group_id,g.group_name,COUNT(ga.group_id)'so thanh vien'
FROM `group` g
RIGHT JOIN group_account ga ON g.group_id=ga.group_id
GROUP BY g.group_id
HAVING COUNT(ga.account_id)<7;