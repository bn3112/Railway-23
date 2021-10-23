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
    employee_name	VARCHAR(20) NOT NULL,
    department_number TINYINT 
);
-- Question 2: Thêm ít nhất 10 bản ghi vào table employee
INSERT INTO  employee(employee_name,department_number)
VALUES	('Nguyen Thu Huong',1),
		('Dao Thanh Hoa',1),
		('Tran Minh Khoi',1),
		('Nguyen Thanh Tam',1),
		('Le Hoang Nga',2),
		('Trinh Tuan Anh',3),
		('Pham Minh Trang',4),
		('Ngo Hoai Thanh',5),
		('Truong Ngoc Duy',6),
		('Dinh Cao Kieu',7);
DROP TABLE IF EXISTS employee_skill;
CREATE TABLE employee_skill(
	employee_number SMALLINT,
    skill_code		VARCHAR(50) NOT NULL,
	date_registered DATE
);
-- Question 2: Thêm ít nhất 10 bản ghi vào table employee_skill
INSERT INTO employee_skill(employee_number,skill_code,date_registered)
VALUES	(1,'Java','2020/10/23'),
		(1,'E2','2020/11/23'),
        (2,'E3','2020/12/23'),
        (3,'E4','2021/10/22'),
        (4,'E5','2020/10/24'),
        (5,'E6','2021/09/23'),
        (6,'E7','2020/08/23'),
        (7,'E8','2020/07/23'),
        (8,'E9','2020/06/23'),
        (9,'E10','2020/05/23');
-- Question 3: Viết lệnh để lấy ra danh sách nhân viên (name) có skill Java
SELECT e.employee_name,ek.skill_code
FROM employee e
JOIN employee_skill ek
ON e.employee_number= ek.employee_number
WHERE skill_code='Java';
-- Question 4: Viết lệnh để lấy ra danh sách các phòng ban có >3 nhân viên
SELECT d.department_name,COUNT(e.department_number)'so luong nhan vien'
FROM employee e
JOIN department d
ON e.department_number=d.department_number
GROUP BY e.department_number
HAVING COUNT(e.employee_number)>3;
-- Question 5: Viết lệnh để lấy ra danh sách nhân viên của mỗi văn phòng ban.
SELECT GROUP_CONCAT(e.employee_name ORDER BY e.employee_name ASC),d.department_name 
FROM employee e
JOIN department d
ON	e.department_number=d.department_number
GROUP BY d.department_number;
-- Question 6: Viết lệnh để lấy ra danh sách nhân viên có > 1 skills.
SELECT e.employee_name,COUNT(e.employee_number)'number of skill'
FROM employee e
JOIN employee_skill ek
ON e.employee_number=ek.employee_number
GROUP BY e.employee_number
HAVING COUNT(e.employee_number)>1;
