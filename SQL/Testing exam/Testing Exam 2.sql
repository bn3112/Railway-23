DROP DATABASE IF EXISTS salary_management;
CREATE DATABASE salary_management;
USE salary_management;
DROP TABLE IF EXISTS department;
CREATE TABLE department(
department_id	INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
department_name	VARCHAR(30),
`description`	TEXT,
create_at		DATETIME DEFAULT NOW(),
update_at		DATETIME DEFAULT NOW()
);
INSERT INTO department(department_name,`description`,create_at)
VALUES		('Admin','management','2021/1/10'),
			('HR','search','2021/1/10'),
			('IT','technology','2021/1/10'),
			('Delivery','tranfer','2021/1/10');
DROP TABLE IF EXISTS users;
CREATE TABLE users(
user_id			INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
first_name		VARCHAR(30),
last_name		VARCHAR(30),
email			VARCHAR(100),
phone			CHAR(11),
employee_id		VARCHAR(10),
avatar			TEXT,
department_id	INT,
gender			ENUM('Female','Male','Unknown'),
age				INT(3),
created_at		DATETIME DEFAULT NOW(),
updated_at		DATETIME DEFAULT NOW()
);
INSERT INTO users(first_name,last_name,email,phone,employee_id,avatar,department_id,gender,age,created_at)
VALUES		('Nguyen','Hoai Anh','hoaianh@gmail.com',	'07042679542',1,'conan',2,'Female',30,'2021/4/14'),
			('Tran','Trong Hieu','tronghieu@gmail.com','08045254541',2,'ran',3,'Male',35,'2021/5/14'),
			('Dinh','Thu Huyen','thuhuyen@gmail.com','	0123417895',3,'ai',3,'Female',25,'2021/5/10'),
			('Vo','Huynh Tam','huynhtam@gmail.com','08045254781',4,'ran',3,'Male',35,'2021/6/14'),
			('Duong','Anh Tuyet','anhtuyet@gmail.com','08971254541',5,'ran',3,'Female',35,'2021/7/14'),
			('Khong','Thu Trang','thutrang@gmail.com','09755254541',6,'ran',3,'Female',35,'2021/6/16'),
			('Truong','Bao Ngoc','tronghieuh@gmail.com','08045254541',7,'ran',2,'Female',35,'2021/8/9'),
			('Cao','Minh Trang','minhtrang@gmail.com','014554541',8,'ran',2,'Female',35,'2021/9/19'),
			('Mai','Thanh Trung','thanhtrung@gmail.com','012254541',9,'ran',2,'Male',35,'2021/10/4'),
			('Khong','Quang Huy','quanghuy@gmail.com','074954541',10,'ran',1,'Male',35,'2021/11/8'),
			('Lam','Nhi Khang','lamkhang@gmail.com','024854541',11,'ran',1,'Male',35,'2021/1/7'),
			('Bao','Ho Thien','thienho@gmail.com','03482541',12,'ran',1,'Male',35,'2021/2/26'),
			('Ho','Quang Hieu','hieuho@gmail.com','045672541',13,'ran',4,'Male',35,'2021/3/13'),
			('Nguy','Kieu Loan','kieuloan@gmail.com','067454541',14,'ran',4,'Female',35,'2021/2/5'),
			('Quynh','Cao Thu','caothu@gmail.com','011452541',15,'ran',4,'Male',35,'2021/5/24');

-- 5 user thuoc 2 phong ban, 3 user co 2 role khac nhau trong 1 phong
DROP TABLE IF EXISTS user_department;
CREATE TABLE user_department(
user_department_id	INT AUTO_INCREMENT NOT NULL,
user_id			INT,
department_id	INT,
start_date		DATE,
end_date		DATE,
created_at		DATETIME DEFAULT NOW(),
updated_at		DATETIME DEFAULT NOW(),
PRIMARY KEY(user_department_id,user_id,department_id),
FOREIGN KEY (user_id) REFERENCES users(user_id) ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY (department_id) REFERENCES department(department_id) ON UPDATE CASCADE ON DELETE CASCADE 
);
INSERT INTO user_department(user_id,department_id,start_date,end_date,created_at)
VALUES		(1,1,'2021/04/12','2021/05/12','2021/06/12'),
			(1,2,'2021/04/12','2021/06/12','2021/07/12'),
			(2,1,'2021/04/12','2021/05/12','2021/04/12'),
			(2,2,'2021/04/12','2021/06/12','2021/07/12'),
			(3,1,'2021/04/12','2021/05/12','2021/06/12'),
			(3,2,'2021/04/12','2021/07/12','2021/08/12'),
			(4,1,'2021/04/12','2021/05/12','2021/06/12'),
			(4,2,'2021/04/12','2021/07/12','2021/08/12'),
			(5,3,'2021/04/12','2021/05/12','2021/06/12'),
			(5,4,'2021/04/12','2021/08/12','2021/09/12'),
			(6,3,'2021/04/12','2021/05/12','2021/06/12'),
			(6,4,'2021/04/12','2021/08/12','2021/09/12'),
			(7,1,'2021/04/12','2021/05/12','2021/6/12'),
			(7,2,'2021/04/12','2021/08/12','2021/09/12'),
			(8,4,'2021/04/12','2021/05/12','2021/06/12');
DROP TABLE IF EXISTS roles;
CREATE TABLE roles(
role_id		INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
role_name	VARCHAR(30),
created_at	DATETIME DEFAULT NOW(),
updated_at	DATETIME DEFAULT NOW()
);
INSERT INTO roles(role_name,created_at)
VALUES	('Director','2021/04/12'),
		('Manager','2021/04/12'),
		('Vice mManager','2021/04/12'),
		('Staff','2021/04/12'),
		('Collaborator','2021/04/12');
DROP TABLE IF EXISTS user_role;
CREATE TABLE user_role(
user_role_id		INT AUTO_INCREMENT NOT NULL,
user_department_id	INT,
role_id				INT,
start_date			DATE,
end_date			DATE,
created_at	DATETIME DEFAULT NOW(),
updated_at	DATETIME DEFAULT NOW(),
PRIMARY KEY(user_role_id,user_department_id,role_id),
FOREIGN KEY (user_department_id) REFERENCES user_department(user_department_id) ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY (role_id) REFERENCES roles(role_id) ON UPDATE CASCADE ON DELETE CASCADE
);
INSERT INTO user_role(user_department_id,role_id,start_date,end_date,created_at)
VALUES	(1,1,'2021/04/12','2021/05/12','2021/06/12'),
		(2,1,'2021/04/12','2021/06/12','2021/07/12'),
		(3,2,'2021/04/12','2021/05/12','2021/06/12'),
		(4,2,'2021/04/12','2021/06/12','2021/07/12'),
		(5,3,'2021/04/12','2021/05/12','2021/06/12'),
		(6,3,'2021/04/12','2021/06/12','2021/07/12');
DROP TABLE IF EXISTS salary;
CREATE TABLE salary(
salary_id		INT AUTO_INCREMENT NOT NULL,			
user_role_id	INT,
total_salary	DOUBLE(12,2),
`month`			INT(2),
`year`			YEAR,
created_at	DATETIME DEFAULT NOW(),
updated_at	DATETIME DEFAULT NOW(),
PRIMARY KEY(salary_id,user_role_id),
FOREIGN KEY (user_role_id) REFERENCES user_role(user_role_id) ON UPDATE CASCADE ON DELETE CASCADE
);
INSERT INTO salary (user_role_id,total_salary,`month`,`year`)
VALUES 	(1,10000000,4,'2020'),
		(2,20000000,4,'2020'),
		(3,30000000,5,'2020'),
		(4,40000000,5,'2020'),
		(5,50000000,4,'2020'),
		(6,60000000,4,'2020');
DROP TABLE IF EXISTS salary_detail_type;
CREATE TABLE salary_detail_type(
salary_detail_type_id	INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
salary_detail_type_name	ENUM('Luong cung','Phu cap','Thuong','Thue TNCN','BHXH'),
created_at	DATETIME DEFAULT NOW(),
updated_at	DATETIME DEFAULT NOW()
);
INSERT INTO salary_detail_type(salary_detail_type_name)
VALUES		('Luong cung'),
			('Phu cap'),
			('Thuong'),
			('Thue TNCN'),
			('BHXH');
DROP TABLE IF EXISTS salary_detail;
CREATE TABLE salary_detail(
salary_detail_id		INT AUTO_INCREMENT NOT NULL,
amount					DOUBLE(12,2),
salary_id				INT,
salary_detail_type_id	INT,
operation				TINYINT(3),
PRIMARY KEY(salary_detail_id,salary_id,salary_detail_type_id),
FOREIGN KEY (salary_id) REFERENCES salary(salary_id) ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY (salary_detail_type_id) REFERENCES salary_detail_type(salary_detail_type_id) ON UPDATE CASCADE ON DELETE CASCADE
);
INSERT INTO salary_detail(amount,salary_id,salary_detail_type_id,operation)
VALUES		(1000000,1,1,1),
			(500000,2,2,2),
			(300000,3,2,3),
			(200000,4,2,4),
			(100000,5,2,5);
-- 1. Tạo table với các ràng buộc và kiểu dữ liệu
-- Insert 15 user có trong đó có 5 user thuộc 2 phòng ban khác nhau
-- 3 user có 2 role khác nhau trong 1 phòng
-- Insert lương của tháng tất cả các user trong tháng 4,5,6


-- 2. Viết câu lệnh query
-- a) Get lương tháng 5 của 1 user bất kì.
-- b) Get danh sách lương tháng 5 của 1 phòng bất kì sắp xếp theo tổng lương giảm dần
-- c) Get nhưng user bị tính lương sai(total_salary != total detail salary) trong tháng 5/2020
-- d) Get tổng chi phí của các phòng trong tháng 5/2020


-- 3. Viết thủ tục cho phép get chi tiết lương tháng của 1 user bất kì hiển thị thông tin sau:
-- Type, Amount, Operation; sao cho hàng cuối cùng sẽ là cột tổng


-- 4. Viết thủ tục cho phép get lương tháng của 1 user bất kì hiển thị thông tin sau:
-- fullname (first_name + last_name), department, role, salary


-- 5. Viết trigger cho phép khi insert data role của 1 user trong phòng thì
-- khoảng thời gian các role phải khác nhau và nằm trong khoảng thời gian của user nằm trong phòng đó.
-- Ví dụ: user A nằm thuộc phòng Admin từ 1/4/2020 đến 1/8/2020,
-- user A có role Nhân viên từ 1/4/2020-1/6/2020 thì khi user đó lên trưởng phòng Admin
-- thì phải nằm trong khoảng 1/4/2020-1/8/2020 và khác khoảng 1/4/2020 và 1/6/2020.