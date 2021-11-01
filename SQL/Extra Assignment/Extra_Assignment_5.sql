USE `adventureworks`;
-- Exercise 1: Subquery
-- Question 1: Viết 1 query lấy thông tin "Name" từ bảng Production.Product có name
-- của ProductSubcategory là 'Saddles'.
-- Hướng dẫn:
-- Sử dụng Sub Query để lấy ra tất cả các ID của ProductSubcategory có name ='Saddles'.
-- Sau đó trong outer query, sử dụng kết quả từ Sub Query để lấy ra yêu cầu của đề bài.
SELECT p.`Name`
FROM Product p JOIN ProductSubCategory psc ON p.ProductSubcategoryID = psc.ProductSubCategoryID
WHERE p.ProductSubcategoryID = 
	(SELECT ProductSubCategoryID 
		FROM ProductSubCategory 
			WHERE `Name` = 'Saddles');
-- Question 2: Thay đổi câu Query 1 để lấy được kết quả sau.
-- Hướng dẫn:
-- Mệnh đề WHERE trong subquery sẽ sử dụng ký tự wildcard ‘Bo%’ .
-- Kết quả sẽ như sau:
-- Name
-- ----------------------------
-- Water Bottle - 30 oz.
-- Mountain Bottle Cage
-- Road Bottle Cage
-- LL Bottom Bracket
-- ML Bottom Bracket
-- HL Bottom Bracket
-- (6 row(s) affected)
SELECT p.`Name`
FROM Product p JOIN ProductSubCategory psc ON p.ProductSubcategoryID = psc.ProductSubCategoryID 
	WHERE p.ProductSubcategoryID  IN 
		(SELECT ProductSubCategoryID 
			FROM ProductSubCategory 
				WHERE `Name` LIKE 'Bo%');

-- Question 3:
-- Viết câu query trả về tất cả các sản phẩm có giá rẻ nhất (lowest ListPrice) và Touring Bike (nghĩa là ProductSubcategoryID = 3)
-- Hướng dẫn: sử dụng hàm MIN() trong subquery để trả về ListPrice thấp nhất
SELECT ProductID,`Name`,ProductNumber
FROM Product
	WHERE ListPrice = 
		(SELECT MIN(price) as lowest_price
			FROM (SELECT ListPrice AS price
				FROM product
					WHERE ProductSubcategoryID = 3) AS temt); 
                
	
-- Exercise 2: JOIN nhiều bảng
-- Question 1: Viết query lấy danh sách tên country và province được lưu trong
-- AdventureWorks2008sample database.
SELECT DISTINCT  cr.`Name`'Country', ad.City 'Province'
FROM stateprovince sp
JOIN countryregion cr ON sp.CountryRegionCode = cr.CountryRegionCode
JOIN address ad ON sp.StateProvinceID = ad.StateProvinceID;

-- Question 2: Tiếp tục với câu query trước và thêm điều kiện là chỉ lấy country
-- Germany và Canada
-- Chú ý: sủ dụng sort order và column headings

SELECT DISTINCT  cr.`Name`'Country', ad.City 'Province'
FROM stateprovince sp
JOIN countryregion cr ON sp.CountryRegionCode = cr.CountryRegionCode
JOIN address ad ON sp.StateProvinceID = ad.StateProvinceID
WHERE cr.`Name` IN ('Germany','Canada')
ORDER BY cr.`Name` ASC;
-- Question 3:
-- Từ bảng SalesPerson, chúng ta lấy cột BusinessEntityID (là định danh của người sales),
-- Bonus and the SalesYTD (là đã sale được bao nhiêu người trong năm nay)
-- Từ bảng SalesOrderHeader, chúng ta lấy cột SalesOrderID OrderDate
-- Hướng dẫn: Join SalesOrderHeader và SalesPerson để chỉ lấy ra kết quả non-Internet
-- orders (order được xử lý trên Internet có OnlineOrderFlag = 1 và cột SalesPersonID = null)

-- Question 4:
-- Sử dụng câu query ở question 3, thêm cột JobTitle and xóa cột SalesPersonID và
-- BusinessEntityID.
-- Hướng dẫn:
-- Join với bảng HumanResources.Employee