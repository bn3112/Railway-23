DROP DATABASE IF EXISTS	testing_system;
CREATE DATABASE	testing_system;
USE testing_system;
ALTER DATABASE testing_system CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
-- tạo bảng phòng ban--
DROP TABLE IF EXISTS department;
CREATE TABLE department(
	department_id	TINYINT PRIMARY KEY AUTO_INCREMENT,
    department_name	VARCHAR(30) CHAR SET utf8mb4 UNIQUE DEFAULT(11)
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
            ('quản lý'	),
            ('waiting room');
            
-- tạo bảng vị trí--
DROP TABLE IF EXISTS `position`;
CREATE TABLE `position`(
	position_id		TINYINT PRIMARY KEY AUTO_INCREMENT,
    position_name	ENUM('Dev','Test','Scrum Master','PM') DEFAULT(1)
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
    user_name		VARCHAR(20) UNIQUE ,
    full_name		VARCHAR(30) CHAR SET utf8mb4 NOT NULL,
    department_id	TINYINT NOT NULL,
    position_id		TINYINT NOT NULL,
	create_date		DATE,
FOREIGN KEY (department_id) REFERENCES department(department_id) ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY (position_id) REFERENCES `position`(position_id) ON UPDATE CASCADE ON DELETE CASCADE
);	

-- thêm dữ liệu vào bảng 3 - bảng tài khoản-- 
INSERT INTO `account`(email,user_name, full_name,department_id,position_id,create_date)
VALUES				('hoangthiynhi@gmail.com',		'hoangnhi',		'Hoàng Thị Ý Nhi',		7,3,'2019/10/19'),
					('nguythanhhang@gmail.com', 	'thanhhang',	'Ngụy Thanh Hằng',		8,2,'2021/10/12'),
                    ('caoanhtuyet@gmail.com', 		'anhtuyet',		'Cao Ánh Tuyết',		5,1,'2021/10/13'),
                    ('nguyenquocsang@gmail.com',	'quocsang',		'Nguyễn Quốc Sang',		4,4,'2021/10/14'),
                    ('nguyenvanton@gmail.com', 		'nguyenton',	'Nguyễn Văn Tôn',		6,3,'2021/10/15'),
                    ('phamgiabao@gmail.com', 		'giabao',		'Phạm Gia Bảo',			9,1,'2021/10/16'),
					('Lehoangyen@gmail.com', 		'leyen',		'Lê Hoàng Yến',			3,3,'2019/10/19'),
                    ('lyquocnghi@gmail.com', 		'quocnghi',		'Lý Quốc Nghị',			2,1,'2021/10/17'),
                    ('nguyenhuyentrang@gmail.com', 	'huyentrang',	'Nguyễn Huyền Trang',	3,1,'2021/10/17'),
                    ('nguyenduyanh@gmail.com', 		'duyanh',		'Nguyễn Duy Anh',		3,4,'2021/10/17'),	
					('duonghoangbao@gmail.com', 	'hoangbao',		 'Dương Hoàng Bảo',		3, 2, '2021-10-19');
                    
-- tạo bảng nhóm--
DROP TABLE IF EXISTS `group`;
CREATE TABLE		`group`(
	group_id		TINYINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    group_name		VARCHAR(20) CHAR SET utf8mb4 NOT NULL,
    creator_id		SMALLINT NOT NULL,
    create_date		DATE,
FOREIGN KEY (creator_id) REFERENCES `account`(account_id) ON UPDATE CASCADE ON DELETE CASCADE
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
FOREIGN KEY (group_id) REFERENCES `group`(group_id) ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY (account_id) REFERENCES `account`(account_id) ON UPDATE CASCADE ON DELETE CASCADE
);	

-- thêm dữ liệu vào bảng 5 - bảng các nhóm tài khoản--
INSERT INTO group_account(group_id,account_id,join_date)
VALUES				(1,1,'2019/10/19'),
					(1,2,'2020/10/19'),
                    (1,10,'2021/10/11'),
                    (1,4,'2021/10/12'),
					(1,5,'2021/10/14'),
                    (1,6,'2021/10/15'),
                    (1,7,'2021/10/16'),
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
    content			VARCHAR(3000) CHAR SET utf8mb4 NOT NULL,
    category_id		TINYINT NOT NULL,
    type_id			TINYINT NOT NULL,
    creator_id		SMALLINT NOT NULL,
	create_date		DATE,
FOREIGN KEY (category_id) REFERENCES category_question(category_id) ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY (type_id) REFERENCES type_question(type_id) ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY (creator_id) REFERENCES `account`(account_id) ON UPDATE CASCADE ON DELETE CASCADE  
);	

-- thêm dữ liệu vào bảng 8 - bảng câu hỏi--
INSERT INTO question(content,category_id,type_id,creator_id,create_date)
VALUES				('Câu hỏi 1: Java là gì?',	1,2,5,'2019/2/19'),
					('SQL là gì?',				1,2,5,'2020/4/19'),
                    ('Postman là gì?',			1,2,5,'2021/3/10'),
                    ('Ruby là gì?',				1,1,5,'2021/2/11'),
                    ('.NET là gì?',				1,2,8,'2021/5/12'),
                    ('C++ là gì?',				1,1,8,'2021/6/13'),
					('Android là gì?',			1,2,8,'2021/7/14'),
					('Android là gì?',			1,2,8,'2021/11/14'),
					('Android là gì?',			1,2,8,'2021/12/14'),
					('Android là gì?',			1,2,8,'2021/1/14'),
                    ('Fibonacci là dãy số tự nhiên vô hạn tuân theo quy luật số trước sau bằng tổng hai số trước',			2,1,8,'2021/8/15'),
                    ('Chiều 27/10, phát biểu tiếp thu ý kiến đại biểu Quốc hội tại hội trường Diên Hồng, Bộ trưởng Bộ Lao động - Thương binh và Xã hội Đào Ngọc Dung cho biết, đây là những ý kiến rất tâm huyết, trí tuệ và thiết thực. Sau kỳ họp này, Bộ trưởng tin tưởng rằng sẽ có bước phát triển mới về nhận thức, về trách nhiệm và hành động trong triển khai và phát triển chính sách bảo hiểm xã hội - một trong những trụ cột quan trọng nhất về chính sách an sinh xã hội.

Theo Bộ trưởng Đào Ngọc Dung, mặc dù bảo hiểm xã hội của chúng ta còn non trẻ (bắt đầu từ năm 1995), đến nay đã có bước phát triển tương đối nhanh, phù hợp với thực tiễn Việt Nam và cơ bản đáp ứng, phù hợp với thông lệ quốc tế. Chúng ta đã triển khai 8 loại hình bảo hiểm xã hội (trên thế giới có 9 loại hình). Đến nay, quỹ bảo hiểm xã hội đã trở thành quỹ tài chính Nhà nước có quy mô lớn nhất.
Apart from counting words and characters, our online editor can help you to improve word choice and writing style, and, optionally, help you to detect grammar mistakes and plagiarism. To check word count, simply place your cursor into the text box above and start typing. Youll see the number of characters and words increase or decrease as you type, delete, and edit them. You can also copy and paste text from another program over into the online editor above. The Auto-Save feature will make sure you wont lose any changes while editing, even if you leave the site and come back later. Tip: Bookmark this page now.

Knowing the word count of a text can be important. For example, if an author has to write a minimum or maximum amount of words for an article, essay, report, story, book, paper, you name it. WordCounter will help to make sure its word count reaches a specific requirement or stays within a certain limit.

In addition, WordCounter shows you the top 10 keywords and keyword density of the article youre writing. This allows you to know which keywords you use how often and at what percentages. This can prevent you from over-using certain words or word combinations and check for best distribution of keywords in your writing.

In the Details overview you can see the average speaking and reading time for your text, while Reading Level is an indicator of the education level a person would need in order to understand the words you’re using.

Disclaimer: We strive to make our tools as accurate as possible but we cannot guarantee it will always be so. ?',		5,2,8,'2021/9/16'),
 ('Chiều 27/10, phát biểu tiếp thu ý kiến đại biểu Quốc hội tại hội trường Diên Hồng, Bộ trưởng Bộ Lao động - Thương binh và Xã hội Đào Ngọc Dung cho biết, đây là những ý kiến rất tâm huyết, trí tuệ và thiết thực. Sau kỳ họp này, Bộ trưởng tin tưởng rằng sẽ có bước phát triển mới về nhận thức, về trách nhiệm và hành động trong triển khai và phát triển chính sách bảo hiểm xã hội - một trong những trụ cột quan trọng nhất về chính sách an sinh xã hội.

Theo Bộ trưởng Đào Ngọc Dung, mặc dù bảo hiểm xã hội của chúng ta còn non trẻ (bắt đầu từ năm 1995), đến nay đã có bước phát triển tương đối nhanh, phù hợp với thực tiễn Việt Nam và cơ bản đáp ứng, phù hợp với thông lệ quốc tế. Chúng ta đã triển khai 8 loại hình bảo hiểm xã hội (trên thế giới có 9 loại hình). Đến nay, quỹ bảo hiểm xã hội đã trở thành quỹ tài chính Nhà nước có quy mô lớn nhất.
Apart from counting words and characters, our online editor can help you to improve word choice and writing style, and, optionally, help you to detect grammar mistakes and plagiarism. To check word count, simply place your cursor into the text box above and start typing. Youll see the number of characters and words increase or decrease as you type, delete, and edit them. You can also copy and paste text from another program over into the online editor above. The Auto-Save feature will make sure you wont lose any changes while editing, even if you leave the site and come back later. Tip: Bookmark this page now.

Knowing the word count of a text can be important. For example, if an author has to write a minimum or maximum amount of words for an article, essay, report, story, book, paper, you name it. WordCounter will help to make sure its word count reaches a specific requirement or stays within a certain limit.

In addition, WordCounter shows you the top 10 keywords and keyword density of the article youre writing. This allows you to know which keywords you use how often and at what percentages. This can prevent you from over-using certain words or word combinations and check for best distribution of keywords in your writing.

In the Details overview you can see the average speaking and reading time for your text, while Reading Level is an indicator of the education level a person would need in order to understand the words you’re using.

Disclaimer: We strive to make our tools as accurate as possible but we cannot guarantee it will always be so. ?',		5,1,8,'2021/10/16'),
                    ('Tâm lý học là gì?',		9,2,8,'2021/10/17');
                    
-- tạo bảng câu trả lời--
DROP TABLE IF EXISTS answer;
CREATE TABLE		answer(
	answer_id		TINYINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    content			VARCHAR(1000) CHAR SET utf8mb4 NOT NULL,
    question_id		TINYINT NOT NULL,
    is_correct		BOOLEAN,  -- True-1 or False-0 
FOREIGN KEY (question_id) REFERENCES question(question_id) ON UPDATE CASCADE ON DELETE CASCADE 
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
FOREIGN KEY (category_id) REFERENCES category_question(category_id) ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY (creator_id) REFERENCES `account`(account_id) ON UPDATE CASCADE ON DELETE CASCADE
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
FOREIGN KEY (exam_id) REFERENCES exam(exam_id) ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY (question_id) REFERENCES question(question_id) ON UPDATE CASCADE ON DELETE CASCADE 
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