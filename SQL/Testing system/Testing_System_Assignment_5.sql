USE testing_system;

-- Question 5: Viết lệnh để lấy ra danh sách câu hỏi được sử dụng trong đề thi nhiều nhất
select * from exam_question;
select * from question;

WITH dem_cau_hoi_trong_de_thi AS( 
	SELECT q.content,q.question_id, COUNT(eq.exam_id) AS dem_bai_thi
    FROM question q
    JOIN exam_question eq ON q.question_id = eq.question_id
    GROUP BY q.question_id)
		 SELECT *
		 FROM dem_cau_hoi_trong_de_thi
		 WHERE dem_bai_thi=(SELECT max(dem_bai_thi) 
			FROM dem_cau_hoi_trong_de_thi);
 -- Question 1: Tạo view có chứa danh sách nhân viên thuộc phòng ban sale
 CREATE OR REPLACE VIEW v_nhan_vien_phong_sale AS
 SELECT a.full_name
	FROM department d 
	JOIN `account` a ON d.department_id=a.department_id
	WHERE department_name='sale';

-- Question 2: Tạo view có chứa thông tin các account tham gia vào nhiều group nhất
CREATE OR REPLACE VIEW v_nhan_vien_phong_sale AS
	SELECT a.full_name,count(ga.group_id) 'nv tham gia nhieu nhom nhat'
    FROM group_account ga
    JOIN `account` a ON ga.account_id=a.account_id
    GROUP BY a.account_id
    HAVING count(ga.group_id)= 
		(SELECT max(so_nhom) AS so_nhom_nhieu_nhat
			FROM(SELECT ga.group_id,account_id,count(ga.group_id) AS so_nhom
				FROM group_account ga
					GROUP BY ga.account_id)AS nhom);

-- Question 3: Tạo view có chứa câu hỏi có những content quá dài (content quá 300 từ được coi là quá dài) và xóa nó đi
CREATE OR REPLACE VIEW v_cau_hoi_noi_dung_dai AS
	SELECT content,(LENGTH(content) - LENGTH(REPLACE(content, ' ', '')) + 1) AS word_count
	FROM question 
		WHERE LENGTH(content) - LENGTH(REPLACE(content, ' ', '')) + 1 > 300;

SELECT * FROM  v_cau_hoi_noi_dung_dai;

DELETE FROM v_cau_hoi_noi_dung_dai
	WHERE word_count > 300;


SELECT *
from question
where length(content) >length(300);

-- Question 4: Tạo view có chứa danh sách các phòng ban có nhiều nhân viên nhất
CREATE OR REPLACE VIEW v_phong_nhieu_nv AS
 SELECT d.department_name,count(a.account_id)'phong co nhieu nhan vien'
 FROM department d
 JOIN `account`  a ON d.department_id=a.department_id
 GROUP BY d.department_id
 HAVING count(a.account_id) =
	(SELECT max(so_nhan_vien) AS so_nhan_vien_nhieu_nhat
		FROM(SELECT d.department_id,count(account_id) AS so_nhan_vien
			FROM department d JOIN `account`  a ON d.department_id=a.department_id
				GROUP BY a.department_id) AS nhom);
                
                
-- Question 5: Tạo view có chứa tất các các câu hỏi do user họ Nguyễn tạo
CREATE OR REPLACE VIEW v_user_ho_nguyen AS
	SELECT q.content,a.full_name
	FROM question q JOIN `account`  a ON q.creator_id = a.account_id
	WHERE a.full_name IN (
		SELECT full_name
			FROM `account` 
				WHERE full_name LIKE 'Nguyễn%'
		);
