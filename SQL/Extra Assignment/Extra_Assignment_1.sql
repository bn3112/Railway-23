DROP DATABASE IF EXISTS	fresher_training_management;
CREATE	DATABASE		fresher_training_management;
USE						fresher_training_management;
-- tạo bảng Traniee
DROP TABLE IF EXISTS trainee;
CREATE TABLE trainee(
	trainee_id			SMALLINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    full_name			VARCHAR(20) NOT NULL,
    birth_date			DATE NOT NULL,
    gender				ENUM('male','female','unknown'),
    et_iq				TINYINT UNSIGNED NOT NULL, CHECK(et_iq<=20),
    et_gmath			TINYINT UNSIGNED NOT NULL,CHECK(et_gmath<=20),
    et_english			TINYINT UNSIGNED NOT NULL,CHECK(et_english<=50),
    training_class		VARCHAR(20) NOT NULL,
    evaluation_notes	TEXT
);
-- question 2 : add VTI Acount 
ALTER TABLE trainee 
ADD COLUMN vti_acount VARCHAR(50) UNIQUE NOT NULL;
