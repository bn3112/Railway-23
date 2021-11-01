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
