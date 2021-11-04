DROP DATABASE IF EXISTS testing_exam;
CREATE DATABASE testing_exam;
USE testing_exam;
DROP TABLE IF EXISTS CUSTOMER;
CREATE TABLE CUSTOMER(
	CustomerID	MEDIUMINT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    `Name`		VARCHAR(30) NOT NULL,
    Phone		CHAR(11) UNIQUE NOT NULL,
    Email		VARCHAR(50) UNIQUE,
    Address		VARCHAR(50) NOT NULL,
    Note		VARCHAR(100)
);
INSERT INTO CUSTOMER(`Name`,Phone,Email,Address,Note)
VALUES				('Kudo Shinnichi',	'07012345678','kudo@japan.com','Tokyo,Japan','Potential customer'),
					('Ran Mori',		'08012345678','ranmori@japan.com','Saitama,Japan','Potential customer'),
					('Sherry',			'09012345678','sheery@japan.com','Gifu,Japan','Potential customer'),
					('Kaito Kid',		'07045874168','kaito@japan.com','Gunma,Japan','Potential customer'),
					('Haibara Ai',		'08098742675','haibara@japan.com','Shiga,Japan','Non potential customer'),
					('Hattori',			'07098457165','hattori@japan.com','Osaka,Japan','Non potential customer'),
					('Megure',			'07535757165','megure@japan.com','Nara,Japan','Non potential customer'),
					('Kogoro Mori',		'07596481544','kogoro@japan.com','Mie,Japan','Potential customer');
DROP TABLE IF EXISTS CAR;
CREATE TABLE CAR(
	CarID	MEDIUMINT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    Maker	ENUM('HONDA','TOYOTA','NISSAN'),
	Model	VARCHAR(30),
    `YEAR`	YEAR,
    COLOR	VARCHAR(20),
    NOTE	VARCHAR(300)
);
INSERT INTO CAR(Maker,Model,`YEAR`,COLOR,NOTE)
VALUES			('HONDA','Civic Type R','2021','Black','Turbocharged Engine'),
				('HONDA','Limited Edition','2021','Yellow','Aluminum Wheels'),
				('TOYOTA','Toyota Camry','2020','Silver','Safety Sense System'),
				('TOYOTA','Toyota Vios','2021','White','Luxurious'),
				('NISSAN','Ariya','2020','White','Global'),
				('NISSAN','Leaf','2010','Gray','Global');
DROP TABLE IF EXISTS `ORDER`;
CREATE TABLE `ORDER`(
	OrderID			MEDIUMINT PRIMARY KEY AUTO_INCREMENT NOT NULL,
	CustomerID		MEDIUMINT NOT NULL,
    CarID			MEDIUMINT NOT NULL,
    Amount			TINYINT DEFAULT(1),
    SalePrice		CHAR(20),
    OrderDate		DATE,
    DeliveryDate	DATE,
    DeliveriAddress	VARCHAR(100),
    `Status`		ENUM('0','1','2') DEFAULT ('0'),
    NOTE			VARCHAR(300),
    FOREIGN KEY (CustomerID) REFERENCES CUSTOMER(CustomerID) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (CarID) REFERENCES CAR(CarID) ON DELETE CASCADE ON UPDATE CASCADE
);
INSERT INTO `ORDER`(CustomerID,CarID,Amount,SalePrice,OrderDate,DeliveryDate,DeliveriAddress,`Status`,NOTE)
VALUES	(1,1,1,'$25,530','2021/1/3','2021/2/3','Tokyo Japan','1','done'),
		(2,1,1,'$30,530','2021/12/31','2021/2/14','Osaka Japan','1','done'),			
		(3,3,2,'$54,610','2021/10/2','2021/12/24','Mie Japan','0','orderd'),			
		(4,4,3,'$130,530','2020/9/28','2021/12/31','Nara Japan','1','orderd'),			
		(2,2,4,'$330,000','2021/11/30','2022/2/14','Gifu Japan','2','canceled');
-- Questions
-- 1. Tạo table với các ràng buộc và kiểu dữ liệu
-- Thêm ít nhất 5 bản ghi vào table.
-- 2. Viết lệnh lấy ra thông tin của khách hàng: tên, số lượng oto khách hàng đã
-- mua và sắp sếp tăng dần theo số lượng oto đã mua.
SELECT c.`Name`,o.Amount
FROM `ORDER` o
	JOIN CUSTOMER c ON o.CustomerID = c.CustomerID
    WHERE o.`status` = '0'
    ORDER BY o.Amount;
    
-- 3. Viết hàm (không có parameter) trả về tên hãng sản xuất đã bán được nhiều
-- oto nhất trong năm nay.7
SET GLOBAL log_bin_trust_function_creators = 1;
DROP FUNCTION IF EXISTS f_best_sold_maker;
DELIMITER $$
CREATE FUNCTION f_best_sold_maker() RETURNS ENUM('HONDA','TOYOTA','NISSAN') 
BEGIN 
		DECLARE sold_maker ENUM('HONDA','TOYOTA','NISSAN');
			SELECT  c.Maker INTO sold_maker
			FROM CAR c LEFT JOIN `ORDER` o ON c.CarID = o.CarID
			GROUP BY o.CarID
			HAVING COUNT(o.Amount) = (SELECT MAX(Count_amount) FROM
				(SELECT CarID,(COUNT(Amount)) AS Count_amount
					FROM `ORDER` 
					WHERE `Status` = '1'
                    AND (YEAR(OrderDate) = YEAR(CURDATE()))
					GROUP BY CarID) AS TEMT);
		RETURN sold_maker; 
	END$$
DELIMITER ;
SELECT f_best_sold_maker();
-- 4. Viết 1 thủ tục (không có parameter) để xóa các đơn hàng đã bị hủy của
-- những năm trước. In ra số lượng bản ghi đã bị xóa.

DROP PROCEDURE IF EXISTS sp_xoa_don_huy_1_nam_truoc;
DELIMITER $$
CREATE PROCEDURE sp_xoa_don_huy_1_nam_truoc(OUT SL_ban_ghi_bi_xoa INT)
BEGIN 
	SELECT COUNT(`Status`) INTO SL_ban_ghi_bi_xoa 
		FROM `ORDER` 
			WHERE `Status` = '2' AND YEAR(OrderDate) < YEAR(CURDATE());
	DELETE FROM `ORDER` 
			WHERE `Status` = '2' AND YEAR(OrderDate) < YEAR(CURDATE());
END$$
DELIMITER ;
SET @so_ban_ghi_bi_xoa =0;
CALL sp_xoa_don_huy_1_nam_truoc(@so_ban_ghi_bi_xoa);
SELECT @so_ban_ghi_bi_xoa;
INSERT INTO `ORDER`(CustomerID,CarID,Amount,SalePrice,OrderDate,DeliveryDate,DeliveriAddress,`Status`,NOTE)
VALUES	(1,1,1,'$25,530','2020/1/3','2021/2/3','Tokyo Japan','2','canceled'),
		(2,1,1,'$30,530','2019/12/31','2021/2/14','Osaka Japan','2','canceled'),		
		(2,2,4,'$330,000','2028/11/30','2022/2/14','Gifu Japan','2','canceled');
      
-- 5. Viết 1 thủ tục (có CustomerID parameter) để in ra thông tin của các đơn
-- hàng đã đặt hàng bao gồm: tên của khách hàng, mã đơn hàng, số lượng oto
-- và tên hãng sản xuất.
DROP PROCEDURE IF EXISTS sp_order_information;
DELIMITER $$
CREATE PROCEDURE sp_order_information (IN customer_id MEDIUMINT)
BEGIN 
	SELECT c.`Name`,o.OrderID,o.Amount,car.Maker
    FROM `ORDER` o 
    JOIN CAR car ON o.CarID = car.CarID
	jOIN CUSTOMER c ON o.CustomerID = c.CustomerID
    WHERE o.CustomerID = customer_id AND o.`Status` = '1' OR '0';
END $$
DELIMITER ;
CALL sp_order_information(3);

-- 6. Viết trigger để tránh trường hợp người dụng nhập thông tin không hợp lệ
-- vào database (DeliveryDate < OrderDate + 15).
		
DROP TRIGGER IF EXISTS trigger_invalid_information;
DELIMITER $$
CREATE TRIGGER trigger_invalid_information
BEFORE INSERT ON `ORDER`
FOR EACH ROW 
BEGIN 
	IF NEW.DeliveryDate < ADDDATE(NEW.OrderDate, INTERVAL 15 DAY)
		THEN SIGNAL SQLSTATE '12345'
        SET MESSAGE_TEXT = 'invalid';
	END IF;
END $$
DELIMITER ;
INSERT INTO `ORDER`(CustomerID,CarID,Amount,SalePrice,OrderDate,DeliveryDate,DeliveriAddress,`Status`,NOTE)
VALUES	(1,1,1,'$25,530','2021/1/3','2021/1/5','Tokyo Japan','2','canceled');