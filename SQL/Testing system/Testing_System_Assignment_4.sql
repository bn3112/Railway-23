
USE testing_system;
-- Exercise 1: Join
-- Question 1: Viết lệnh để lấy ra danh sách nhân viên và thông tin phòng ban của họ
SELECT a.full_name,d.*
FROM `account` a JOIN department d  ON a.department_id = d.department_id;

-- Question 2: Viết lệnh để lấy ra thông tin các account được tạo sau ngày 20/12/2010
SELECT *
FROM `account`
WHERE create_date > '2010/12/20';

-- Question 3: Viết lệnh để lấy ra tất cả các developer
SELECT a.full_name
FROM `account` a JOIN `position` p ON a.position_id = p.position_id
WHERE p.position_name = 'Dev';

-- Question 4: Viết lệnh để lấy ra danh sách các phòng ban có >3 nhân viên
SELECT d.department_name,COUNT(a.account_id) 'so luong nv'
FROM department d JOIN `account` a ON a.department_id = d.department_id
GROUP BY a.department_id
HAVING COUNT(a.account_id)> 3;

-- Question 5: Viết lệnh để lấy ra danh sách câu hỏi được sử dụng trong đề thi nhiều nhất
SELECT q.question_id,q.content,COUNT(eq.exam_id) 'so luong cau hoi nhieu nhat'
FROM question q JOIN exam_question eq ON q.question_id = eq.question_id
GROUP BY eq.question_id
HAVING COUNT(eq.exam_id) = 
	(SELECT MAX(nhom.dem_de_thi) AS so_cau_hoi_nhieu_nhat
		FROM (SELECT eq.question_id,COUNT(eq.exam_id) AS dem_de_thi
			FROM exam_question eq
			GROUP BY eq.question_id) AS nhom);
            
select * from question;
select * from exam_question;

-- Question 6: Thông kê mỗi category Question được sử dụng trong bao nhiêu Question
SELECT cq.category_name,q.content,COUNT(q.question_id) 'so luong danh muc'
FROM category_question cq LEFT JOIN question q ON cq.category_id = q.category_id
	GROUP BY q.category_id;

-- Question 7: Thông kê mỗi Question được sử dụng trong bao nhiêu Exam
SELECT q.question_id, q.content,COUNT(eq.exam_id) 'so luong cau hoi'
FROM question q LEFT JOIN exam_question eq ON q.question_id = eq.question_id
GROUP BY eq.question_id;

-- Question 8: Lấy ra Question có nhiều câu trả lời nhất
SELECT q.content,COUNT(a.answer_id)'so cau hoi co cau tra loi nhieu nhat'
FROM question q JOIN answer a ON q.question_id = a.question_id
GROUP BY a.question_id
HAVING COUNT(a.answer_id) =
	(SELECT MAX(dem_cau_tra_loi)
    FROM (SELECT COUNT(a.answer_id) AS dem_cau_tra_loi
			FROM answer a
			GROUP BY a.question_id) AS nhom);
            
            
-- Question 9: Thống kê số lượng account trong mỗi group
SELECT ga.account_id,g.group_name,COUNT(ga.account_id)'so luong tai khoan'
FROM `group` g LEFT JOIN group_account ga ON g.group_id = ga.group_id
GROUP BY ga.group_id;

-- Question 10: Tìm chức vụ có ít người nhất
SELECT * FROM `account`;
SELECT * FROM `position`;
                
SELECT p.position_name,COUNT(a.account_id)'so luong nv'
FROM `position` p LEFT JOIN `account` a ON p.position_id = a.position_id
GROUP BY p.position_id
HAVING COUNT(a.account_id) =
	(SELECT MIN(so_luong_nv) AS so_luong_nv_it_nhat
		FROM (SELECT a.position_id, COUNT(a.account_id) AS so_luong_nv
			FROM `position` p LEFT JOIN `account` a ON p.position_id = a.position_id
				GROUP BY a.position_id) AS nhom);                
                
			
-- Question 11: Thống kê mỗi phòng ban có bao nhiêu dev, test, scrum master, PM
SELECT d.department_name,p.position_name,COUNT(a.account_id)'so luong nv'
FROM department d
LEFT JOIN `account` a ON d.department_id = a.department_id
LEFT JOIN `position` p ON a.position_id = p.position_id
GROUP BY p.position_id,d.department_id;


SELECT * FROM `account`;
SELECT * FROM`position`;
SELECT * FROM department;


-- Question 12: Lấy thông tin chi tiết của câu hỏi bao gồm: thông tin cơ bản của question, loại câu hỏi, ai là người tạo ra câu hỏi, câu trả lời là gì, ...
SELECT q.question_id,q.content,cq.category_name,a.full_name,tq.type_name,an.content,an.is_correct,q.create_date
FROM question q
LEFT JOIN category_question cq ON cq.category_id = q.category_id
LEFT JOIN `account` a ON q.creator_id = a.account_id
LEFT JOIN type_question tq ON q.type_id = tq.type_id
LEFT JOIN answer an ON q.question_id = an.question_id;

-- Question 13: Lấy ra số lượng câu hỏi của mỗi loại tự luận hay trắc nghiệm
SELECT tq.type_id,tq.type_name,COUNT(q.type_id)'so luong loai cau hoi'
FROM type_question tq LEFT JOIN question q ON q.type_id = tq.type_id
GROUP BY q.type_id;

-- Question 14:Lấy ra group không có account nào
SELECT g.group_name
FROM `group` g LEFT JOIN group_account ga ON g.group_id = ga.group_id
WHERE ga.group_id IS NULL;

SELECT * FROM group_account;


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
JOIN group_account ga ON a.account_id = ga.account_id
WHERE ga.group_id = 1;

-- Question 17:b) Lấy các account thuộc nhóm thứ 2
SELECT a.account_id,a.full_name
FROM `account` a
JOIN group_account ga ON a.account_id = ga.account_id
WHERE ga.group_id = 2;

-- Question 17:c) Ghép 2 kết quả từ câu a) và câu b) sao cho không có record nào trùng nhau
SELECT a.account_id,a.full_name
FROM `account` a
JOIN group_account ga ON a.account_id = ga.account_id
WHERE ga.group_id = 1
	UNION 
SELECT a.account_id,a.full_name
FROM `account` a
JOIN group_account ga ON a.account_id = ga.account_id
WHERE ga.group_id = 2;


-- Question 18:a) Lấy các group có lớn hơn 5 thành viên
SELECT g.group_id,g.group_name,COUNT(ga.account_id)'so thanh vien'
FROM `group` g JOIN group_account ga ON g.group_id = ga.group_id
GROUP BY ga.group_id
HAVING COUNT(ga.account_id) > 5;

-- Question 18:b) Lấy các group có nhỏ hơn 7 thành viên
SELECT g.group_id,g.group_name,COUNT(ga.group_id)'so thanh vien'
FROM `group` g RIGHT JOIN group_account ga ON g.group_id = ga.group_id
GROUP BY ga.group_id
HAVING COUNT(ga.account_id) < 7;


-- Question 18:c) Ghép 2 kết quả từ câu a) và câu b)
SELECT g.group_id,g.group_name,COUNT(ga.account_id)'so thanh vien'
FROM `group` g JOIN group_account ga ON g.group_id=ga.group_id
GROUP BY ga.group_id
HAVING COUNT(ga.account_id) > 5
	UNION ALL
SELECT g.group_id,g.group_name,COUNT(ga.group_id)'so thanh vien'
FROM `group` g RIGHT JOIN group_account ga ON g.group_id=ga.group_id
GROUP BY ga.group_id
HAVING COUNT(ga.account_id) < 7;


