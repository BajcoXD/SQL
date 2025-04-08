CREATE DATABASE SEDC_ACADEMY_HOMEWORK;
GO

USE SEDC_ACADEMY_HOMEWORK;
GO

-- 1. Student
CREATE TABLE Student (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    FirstName NVARCHAR(100) NULL,
    LastName NVARCHAR(100) NULL,
    DateOfBirth DATE NULL,
    EnrolledDate DATE NULL,
    Gender NCHAR(1) NULL,
    NationalIdNumber BIGINT NULL,
    StudentCardNumber NVARCHAR(100) NULL
);

-- 2. Teacher
CREATE TABLE Teacher (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    FirstName NVARCHAR(100) NULL,
    LastName NVARCHAR(100) NULL,
    DateOfBirth DATE NULL,
    AcademicRank NVARCHAR(100) NULL,
    HireDate DATE NULL
);

-- 3. Course
CREATE TABLE Course (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    Name NVARCHAR(MAX) NULL,
    Credit TINYINT NULL,
    AcademicYear TINYINT NULL,
    Semester TINYINT NULL
);

-- 4. Grade
CREATE TABLE Grade (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    StudentID INT NULL,
    CourseID INT NULL,
    TeacherID INT NULL,
    Grade TINYINT NULL,
    Comment NVARCHAR(MAX) NULL,
    CreatedDate DATETIME NULL,
    FOREIGN KEY (StudentID) REFERENCES Student(ID),
    FOREIGN KEY (CourseID) REFERENCES Course(ID),
    FOREIGN KEY (TeacherID) REFERENCES Teacher(ID)
);

-- 5. AchievementType
CREATE TABLE AchievementType (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    Name NVARCHAR(150) NULL,
    Description NVARCHAR(MAX) NULL,
    ParticipationRate INT NULL
);

-- 6. GradeDetails
CREATE TABLE GradeDetails (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    GradeID INT NULL,
    AchievementTypeID INT NULL,
    AchievementPoints SMALLINT NULL,
    AchievementMaxPoints SMALLINT NULL,
    AchievementDate DATE NULL,
    FOREIGN KEY (GradeID) REFERENCES Grade(ID),
    FOREIGN KEY (AchievementTypeID) REFERENCES AchievementType(ID)
);
