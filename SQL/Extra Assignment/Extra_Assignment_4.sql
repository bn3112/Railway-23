DROP DATABASE IF EXISTS sale_managment;
CREATE DATABASE sale_managment;
USE sale_managment;
-- Question 1: Tạo table với các ràng buộc và kiểu dữ liệu
DROP TABLE IF EXISTS department;
CREATE TABLE department (
    department_number TINYINT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    department_name VARCHAR(50) NOT NULL
);
-- Question 2: Thêm ít nhất 10 bản ghi vào table department
INSERT INTO  department(department_name)
VALUES	('Human Resources'),
		('Technology'),
		('Accounting and Finances'),
		('Research and Development'),
		('Strategy'),
		('Equipment'),
		('Operations'),
		('Purchase'),
		('Service Department'),
		('Security');
DROP TABLE IF EXISTS employee;
CREATE TABLE employee(
	employee_number SMALLINT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    employee_name	VARCHAR(20) NOT NULL
);
-- Question 2: Thêm ít nhất 10 bản ghi vào table employee
INSERT INTO  employee(employee_name)
VALUES	('Nguyen Thu Huong'),
		('Dao Thanh Hoa'),
		('Tran Minh Khoi'),
		('Nguyen Thanh Tam'),
		('Le Hoang Nga'),
		('Trinh Tuan Anh'),
		('Pjam Minh Trang'),
		('Ngo Hoai Thanh'),
		('Truong Ngoc Duy'),
		('Dinh Cao Kieu');
DROP TABLE IF EXISTS employee_skill;
CREATE TABLE employee_skill(
	employee_number SMALLINT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    skill_code		VARCHAR(50) NOT NULL,
	date_registered DATE
);
-- Question 2: Thêm ít nhất 10 bản ghi vào table employee_skill
INSERT INTO employee_skill(skill_code,date_registered)
VALUES	('Java','2020/10/23'),
		('E2','2020/11/23'),
        ('E3','2020/12/23'),
        ('E4','2021/10/22'),
        ('E5','2020/10/24'),
        ('E6','2021/09/23'),
        ('E7','2020/08/23'),
        ('E8','2020/07/23'),
        ('E9','2020/06/23'),
        ('E10','2020/05/23');
-- Question 3: Viết lệnh để lấy ra danh sách nhân viên (name) có skill Java
SELECT e.employee_name,ek.skill_code
FROM employee e
JOIN employee_skill ek
ON e.employee_number= ek.employee_number
WHERE skill_code='Java';
-- Question 4: Viết lệnh để lấy ra danh sách các phòng ban có >3 nhân viên

-- Question 5: Viết lệnh để lấy ra danh sách nhân viên của mỗi văn phòng ban.

-- Question 6: Viết lệnh để lấy ra danh sách nhân viên có > 1 skills.

