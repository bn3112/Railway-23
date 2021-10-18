DROP DATABASE IF EXISTS	testing_system;
CREATE DATABASE	testing_system;
USE testing_system;
-- tạo bảng phòng ban--
DROP TABLE IF EXISTS department;
CREATE TABLE		department(
	department_id	TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    department_name	VARCHAR(50) NOT NULL
);
-- tạo bảng vị trí--
DROP TABLE IF EXISTS `position`;
CREATE TABLE		`position`(
	position_id		TINYINT PRIMARY KEY AUTO_INCREMENT,
    position_name	VARCHAR(50)
);
-- tạo bảng tài khoản--
DROP TABLE IF EXISTS `account`;
CREATE TABLE		`account`(
	account_id		INT,
    email			VARCHAR(50),
    user_name		VARCHAR(50),
    full_name		VARCHAR(50),
    department_id	INT,
    position_id		INT,
	create_date		DATE
);	
-- tạo bảng nhóm--
DROP TABLE IF EXISTS `group`;
CREATE TABLE		`group`(
	group_id		INT,
    group_name		VARCHAR(50),
    creator_id		INT,
    create_date		DATE
);	
-- tạo bảng nhóm tài khoản-- 
DROP TABLE IF EXISTS group_account;
CREATE TABLE		group_account(
	group_id		INT,
    account_id		INT,
    joint_date		DATE
);	
-- tạo bảng loại câu hỏi--
DROP TABLE IF EXISTS 	type_question;
CREATE TABLE			type_question(
	type_id			INT,
    typeName		VARCHAR(50)
);
-- tạo bảng danh mục câu hỏi--
DROP TABLE IF EXISTS 	category_question;
CREATE TABLE			category_question(
	category_id		INT,
    category_name	VARCHAR(50)
);
CREATE TABLE		question(
	question_id		INT,
    content			VARCHAR(50),
    category_id		INT,
    typeID			INT,
    creator_id		INT,
	creat_date		DATE
);	
-- tạo bảng câu trả lời--
DROP TABLE IF EXISTS answer;
CREATE TABLE		answer(
	answer_id		INT,
    content			VARCHAR(50),
    question_id		INT,
    is_correct		BOOLEAN -- Yes or no 
);
-- tạo bảng kiểm tra--
DROP TABLE IF EXISTS exam;
CREATE TABLE		exam(
	exam_id			INT,
    `code`			VARCHAR(20),
    title			VARCHAR(50),
    category_id		INT,
    duration		INT,
    creator_id		INT,			
	create_date		DATE
);	
-- tạo bảng câu hỏi kiểm tra--
DROP TABLE IF EXISTS exam_question;
CREATE TABLE		exam_question(
	exam_id			INT,
    question_id		INT
);