CREATE DATABASE IF NOT EXISTS OnlineClasses;
USE OnlineClasses;

CREATE TABLE Students (
    StudentID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    Status VARCHAR(20)
);

CREATE TABLE Teachers (
    TeacherID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE Classes (
    Class_ID INT PRIMARY KEY AUTO_INCREMENT,
    Teacher_ID INT,
    Class_Name VARCHAR(100) NOT NULL,
    Description TEXT,
    FOREIGN KEY (Teacher_ID) REFERENCES Teachers(TeacherID)
);

CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY AUTO_INCREMENT,
    Student_ID INT,
    Class_ID INT,
    Enrollment_Date DATE NOT NULL,
    FOREIGN KEY (Student_ID) REFERENCES Students(StudentID),
    FOREIGN KEY (Class_ID) REFERENCES Classes(Class_ID)
);

CREATE TABLE Assignments (
    Assignment_ID INT PRIMARY KEY AUTO_INCREMENT,
    Class_ID INT,
    Due_Date DATE,
    Assignment_Title VARCHAR(100),
    Description TEXT,
    FOREIGN KEY (Class_ID) REFERENCES Classes(Class_ID)
);

CREATE TABLE Address (
    Address_ID INT PRIMARY KEY AUTO_INCREMENT,
    StreetAddress VARCHAR(255) NOT NULL,
    ZIPCode VARCHAR(10),
    State VARCHAR(50),
    Prefecture VARCHAR(50),
    City VARCHAR(50)
);
