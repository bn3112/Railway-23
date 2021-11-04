-- Question 1: Tạo trigger không cho phép người dùng nhập vào Group có ngày tạo
-- trước 1 năm trước
use testing_system;
drop trigger if exists trigger_ngay_tao_group;
delimiter $$
create trigger	trigger_ngay_tao_group
	before insert on `group`
		for each row
			begin if new.create_date < (subdate(curdate(), interval 1 year)) 
				then signal sqlstate '12345'
                set message_text = 'cannot add group';
				end if;
			end $$;
delimiter ;
INSERT INTO `group`(group_name,creator_id,create_date)
VALUES				('sale 12', 8,'2020/10/19');
select * from `group`;
-- Question 2: Tạo trigger Không cho phép người dùng thêm bất kỳ user nào vào
-- department "Sale" nữa, khi thêm thì hiện ra thông báo "Department
-- "Sale" cannot add more user"

drop trigger if exists trigger_add_data_department;
delimiter $$
create trigger	trigger_add_data_department
	before insert on `account`
		for each row
        begin
			declare idsale tinyint;
            select department_id into idsale
            from department where department_name = 'sale';
			if new.department_id = idsale
				then signal sqlstate '12345'
                set message_text = 'Department "Sale" cannot add more user';
				end if;
			end $$;
delimiter ;
INSERT INTO `account`(email,user_name, full_name,department_id,position_id,create_date)
VALUES				('hoangynhi@gmail.com',		'nhi',		'Hoàng Thị Ý Nhi',		7,3,'2019/10/19');
-- Question 3: Cấu hình 1 group có nhiều nhất là 5 user
DROP TRIGGER IF EXISTS trigger_check_user_of_group;
DELIMITER $$;
CREATE TRIGGER trigger_check_user_of_group
	BEFORE INSERT ON group_account
	FOR EACH ROW 
		BEGIN 
			DECLARE dem_account TINYINT;
				SELECT COUNT(account_id) INTO dem_account
                FROM group_account
                WHERE group_id = new.group_id 
					GROUP BY group_id;
                    IF dem_account >= 5 THEN 
						SIGNAL SQLSTATE'12345'
                        SET MESSAGE_TEXT = 'over 5 member';
					END IF;
		END $$;
DELIMITER ;
INSERT INTO group_account(group_id,account_id,join_date)
VALUES (1,2,'2021-11-20');
-- Question 4: Cấu hình 1 bài thi có nhiều nhất là 10 Question
DROP TRIGGER IF EXISTS trigger_cau_truc_de;
DELIMITER $$
CREATE TRIGGER trigger_cau_truc_de
BEFORE INSERT ON exam_question
FOR EACH ROW 
	BEGIN 
		DECLARE count_question TINYINT;
        SELECT exam_id, COUNT(question_id) INTO count_question
			FROM exam_question
          WHERE exam_id = new.exam_id
				GROUP BY exam_id;
			IF count_question >= 10 THEN
				SIGNAL SQLSTATE '12345'
				SET MESSAGE_TEXT = 'over 10 question';
			END IF;
	END $$;
DELIMITER ;
INSERT INTO exam_question(exam_id,question_id)
VALUES 	(1,14),
		(1,9),
		(1,12),
		(1,10);
        
        
-- Question 5: Tạo trigger không cho phép người dùng xóa tài khoản có email là
-- admin@gmail.com (đây là tài khoản admin, không cho phép user xóa),
-- còn lại các tài khoản khác thì sẽ cho phép xóa và sẽ xóa tất cả các thông
-- tin liên quan tới user đó
use testing_system;
DROP TRIGGER IF EXISTS trigger_delete_account;
DELIMITER $$
CREATE TRIGGER trigger_delete_account
BEFORE DELETE ON `account`
FOR EACH ROW
	BEGIN
		IF OLD.email = 'admin@gmail.com' THEN
        SIGNAL SQLSTATE '12345'
        SET MESSAGE_TEXT = 'You cannot delete this account';
        END IF;
END $$;
DELIMITER ;
delete from `account`
where email = 'admin@gmail.com';
-- Question 6: Không sử dụng cấu hình default cho field DepartmentID của table
-- Account, hãy tạo trigger cho phép người dùng khi tạo account không điền
-- vào departmentID thì sẽ được phân vào phòng ban "waiting Department"
DROP TRIGGER IF EXISTS trigger_auto_move_account_if_null_department;
DELIMITER $$
CREATE TRIGGER trigger_auto_move_account_if_null_department
BEFORE INSERT ON `account`
FOR EACH ROW 	
	BEGIN
		IF NEW.department_id IS NULL THEN 
			SET NEW.department_id = 
				(SELECT department_id
					FROM department
					WHERE department_id = 11);
		END IF;
	END $$
DELIMITER ;
INSERT INTO `account`(email,user_name, full_name,position_id,create_date)
VALUES				('abc@gmail.com','abc','nguyen van a',1,'2021/11/2');
select * from `account`;
-- Question 7: Cấu hình 1 bài thi chỉ cho phép user tạo tối đa 4 answers cho mỗi
-- question, trong đó có tối đa 2 đáp án đúng.
use testing_system;
DROP TRIGGER IF EXISTS trigger_max_answer_question;
DELIMITER $$
CREATE TRIGGER trigger_max_answer_question
BEFORE INSERT ON answer
FOR EACH ROW
	BEGIN
    DECLARE count_answer TINYINT;
    DECLARE count_is_correct TINYINT;
		SELECT COUNT(question_id) INTO count_answer
        FROM answer
        WHERE question_id = NEW.question_id;
        SELECT count(is_correct) INTO count_is_correct 
        FROM answer
        WHERE question_id = NEW.question_id
        AND is_correct = 1;
			IF count_answer >=4 OR count_is_correct <=2 
				AND NEW.is_correct = 1
				THEN SIGNAL SQLSTATE '12345'
					SET MESSAGE_TEXT = 'answer is over 4 sentences or true answer is over 2 sentences';
			END IF;
	END $$
DELIMITER ;
select answer_id,question_id,is_correct from answer;
INSERT INTO answer(content,question_id,is_correct)
VALUES 
		('abc',1,1),
		('abc',1,1),
		('abc',1,0);
		
-- Question 8: Viết trigger sửa lại dữ liệu cho đúng:
-- Nếu người dùng nhập vào gender của account là nam, nữ, chưa xác định
-- Thì sẽ đổi lại thành M, F, U cho giống với cấu hình ở database
DROP TRIGGER IF EXISTS trigger_check_gender;
DELIMITER $$
CREATE TRIGGER trigger_check_gender
BEFORE INSERT ON `account`
FOR EACH ROW
BEGIN
	IF NEW.gender = 'nam' THEN
		SET NEW.gender = 'M';
	ELSEIF NEW.gender = 'nu' THEN
		SET NEW.gender = 'F';
    ELSEIF NEW.gender = 'chua xac dinh' THEN
		SET NEW.gender = 'U';
	END IF;
END $$
DELIMITER ;
INSERT INTO `account`(email,user_name, full_name,department_id,position_id,gender,create_date)
VALUES				('nhi@gmail.com',		'baonhi',		'Hoàng Nhi',1,1,'nu','2019/10/19');
select * from `account`;

-- Question 9: Viết trigger không cho phép người dùng xóa bài thi mới tạo được 2 ngày
DROP TRIGGER IF EXISTS trigger_check_delete_exam;
DELIMITER $$
CREATE TRIGGER trigger_check_delete_exam
BEFORE DELETE ON exam
FOR EACH ROW
BEGIN
	DECLARE two_days_ago DATE;
    SELECT DATE_SUB(CURDATE(), INTERVAL 2 DAY) INTO two_days_ago;
    IF OLD.create_date >= two_days_ago THEN 
		SIGNAL SQLSTATE '12345'
        SET MESSAGE_TEXT = 'cannot delete this exam';
        END IF;
END $$;
DELIMITER ;
use testing_system;
select * from exam;
delete from exam where exam_id = 18;
INSERT INTO exam(`code`,title,category_id,duration,creator_id,create_date)
VALUES				('MS1','Tin học cơ bản 1',	1,'90',5,'2021/11/2'),
					('MS2','Tin học cơ bản',	1,'30',5,'2021/11/1');
-- Question 10: Viết trigger chỉ cho phép người dùng chỉ được update, delete các
-- question khi question đó chưa nằm trong exam nào

-- Question 10: Viết trigger chỉ cho phép người dùng chỉ được update, delete các
-- question khi question đó chưa nằm trong exam nào
DROP TRIGGER IF EXISTS trg_delete_question_limit;
DELIMITER $$
CREATE TRIGGER trg_delete_question_limit
BEFORE DELETE ON question                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
FOR EACH ROW
    BEGIN
        DECLARE examCount INT;
        SELECT COUNT(exam_id) INTO examCount -- Đếm số bài thi sử dụng câu hỏi muốn xóa
        FROM exam_question
        WHERE question_id = OLD.question_id;
        IF examCount <> 0 THEN
            SIGNAL SQLSTATE '12345'
            SET MESSAGE_TEXT = 'Không thể delete câu hỏi nằm trong một hoặc nhiều bài thi.';
        END IF;
    END$$
DELIMITER ;

DROP TRIGGER IF EXISTS trg_update_question_limit;
DELIMITER $$
CREATE TRIGGER trg_update_question_limit
BEFORE UPDATE ON question                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
FOR EACH ROW
    BEGIN
        DECLARE examCount INT;
        SELECT COUNT(exam_id) INTO examCount -- Đếm số bài thi sử dụng câu hỏi muốn update
        FROM exam_question
        WHERE question_id = OLD.question_id;
        IF examCount <> 0 THEN
            SIGNAL SQLSTATE '12345'
            SET MESSAGE_TEXT = 'Không thể update câu hỏi nằm trong một hoặc nhiều bài thi.';
        END IF;
    END$$
DELIMITER ;

SELECT * FROM exam_question;
SELECT * FROM question;
DELETE FROM question WHERE question_id = 40;
UPDATE question
SET question_id = 40
WHERE question_id = 4;

-- Question 12: Lấy ra thông tin exam trong đó: 
-- Duration <= 30 thì sẽ đổi thành giá trị "Short time"
-- 30 < Duration <= 60 thì sẽ đổi thành giá trị "Medium time"
-- Duration > 60 thì sẽ đổi thành giá trị "Long time"
DROP TRIGGER IF EXISTS trigger_get_information_of_exam;
DELIMITER $$
CREATE TRIGGER trigger_get_information_of_exam
BEFORE INSERT ON exam
FOR EACH ROW
BEGIN
END $$;
DELIMITER ;
select *,case 
				when duration <=30 then 'Short time'
				when duration between 30 and 60 then 'Medium time'
			   else 'Long time' 
			end as 'time'
from exam;


-- Question 13: Thống kê số account trong mỗi group và in ra thêm 1 column nữa có tên
-- là the_number_user_amount và mang giá trị được quy định như sau:
-- Nếu số lượng user trong group =< 5 thì sẽ có giá trị là few
-- Nếu số lượng user trong group <= 20 và > 5 thì sẽ có giá trị là normal
-- Nếu số lượng user trong group > 20 thì sẽ có giá trị là higher

select * from group_account;
select g.group_name,count(account_id),
	case when count(account_id) <= 5 then 'few'
		when count(account_id) between 5 and 20 then 'normal'
		else 'higer' end as number_user_amount					
from group_account ga left join `group` g on g.group_id = ga.group_id
group by g.group_id;
-- Question 14: Thống kê số mỗi phòng ban có bao nhiêu user, nếu phòng ban nào
-- không có user thì sẽ thay đổi giá trị 0 thành "Không có User"
use testing_system;
select a.department_id, a.account_id,
case when count(a.account_id) = 0
    then 'Không có User' else count(a.account_id)
    end as user_mouth	
from department d  left join `account` a on d.department_id = a.department_id
group by d.department_id;


