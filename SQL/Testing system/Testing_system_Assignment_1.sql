DROP DATABASE IF EXISTS	Testing_system;
CREATE DATABASE	Testing_system;
USE Testing_system;
CREATE TABLE	Department(
	DepartmentID	 INT,
    DepartmentName	VARCHAR(50)
);
CREATE TABLE		`Position`(
	PositionID		INT,
    PositionName	VARCHAR(50)
);
CREATE TABLE		Acount(
	AcountID		INT,
    Email			VARCHAR(50),
    Username		VARCHAR(50),
    Fullname		VARCHAR(50),
    DepartmentID	INT,
    PositionID		INT,
	CreateDate		DATE
);	
CREATE TABLE		`Group`(
	GroupID			INT,
    GroupName		VARCHAR(50),
    CreatorID		INT,
    CreateDate		DATE
);	
CREATE TABLE		GroupAcount(
	GroupID			INT,
    AcountID		INT,
    JointDate		DATE
);	
CREATE TABLE		TypeQuestion(
	TypeID		INT,
    TypeName	VARCHAR(50)
);
CREATE TABLE		CategoryQuestion(
	CategoryID		INT,
    CategoryName	VARCHAR(50)
);
CREATE TABLE		Question(
	QuestionID		INT,
    Content			VARCHAR(50),
    CategoryID		INT,
    TypeID			INT,
    CreatorID		INT,
	CreateDate		DATE
);	
CREATE TABLE		Answer(
	AnswerID		INT,
    Content			VARCHAR(50),
    QuestionID		INT,
    Iscorrect		VARCHAR(50)
);
CREATE TABLE		Exam(
	ExamID			INT,
    `Code`			VARCHAR(20),
    Title			VARCHAR(50),
    CategoryID		INT,
    Duration		TIME,
    CreatorID		INT,			
	CreateDate		DATE
);		
CREATE TABLE		ExamQuestion(
	ExamID			INT,
    QuestionID		INT
);