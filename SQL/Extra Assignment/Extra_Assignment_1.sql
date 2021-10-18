DROP DATABASE IF EXISTS	fresher_training_management;
CREATE	DATABASE		fresher_training_management;
USE						fresher_training_management;
-- tạo bảng Traniee
DROP TABLE IF EXISTS	traniee;
CREATE TABLE			traniee(
	trainee_id			SMALLINT PRIMARY KEY AUTO_INCREMENT,
    full_name			VARCHAR(50) NOT NULL,
    birth_date			DATE NOT NULL,
    gender				ENUM('male','female','unknown'),
    et_iq				TINYINT UNSIGNED NOT NULL CHECK (0<=et_iq AND et_iq<=20),
    et_gmath			TINYINT UNSIGNED NOT NULL CHECK (0<=et_gmath AND et_gmath<=20),
    et_english			TINYINT UNSIGNED NOT NULL CHECK (0<=et_english AND et_english <=50),
    training_class		VARCHAR(20) NOT NULL,
    evaluation_notes	VARCHAR(100)
);
-- question 2 : add VTI Acount 
ALTER TABLE traniee ADD vti_acount VARCHAR(50) NOT NULL UNIQUE;
