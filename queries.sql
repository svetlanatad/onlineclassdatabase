
-- query 1Select all students WORKS 
SELECT * FROM Students;

-- query 2 Find all teachers teaching a class WORKS 
SELECT T.FirstName, T.LastName, C.Class_Name 
FROM Teachers T 
JOIN Classes C ON T.TeacherID = C.Teacher_ID;

-- query 3 : Count enrollments per class WORKS
SELECT Class_ID, COUNT(Student_ID) AS Total_Enrollments 
FROM Enrollments 
GROUP BY Class_ID;

-- Query 4 : View students with assignments WORKS
SELECT S.FirstName, S.LastName, A.Assignment_Title 
FROM Students S 
JOIN Enrollments E ON S.StudentID = E.Student_ID 
JOIN Assignments A ON E.Class_ID = A.Class_ID;

-- Query 5 : Create an index on email in Students table, indexing, WORKS
CREATE INDEX idx_student_email ON Students(Email);

-- Query6: View students enrolled in a specific class WORKS 
CREATE VIEW StudentsInClass AS 
SELECT S.FirstName, S.LastName, C.Class_Name 
FROM Students S 
JOIN Enrollments E ON S.StudentID = E.Student_ID 
JOIN Classes C ON E.Class_ID = C.Class_ID;

-- Query 7 : Use the view WORKS 
SELECT * FROM StudentsInClass;

-- Query 8: Count the number of assignments per class WORKS 
SELECT Class_ID, COUNT(Assignment_ID) AS Total_Assignments 
FROM Assignments 
GROUP BY Class_ID;

-- Query 9: Create a function to get total enrollments
DELIMITER //
CREATE FUNCTION TotalEnrollments()
RETURNS INT
DETERMINISTIC
BEGIN
   DECLARE total INT;
   SELECT COUNT(*) INTO total FROM Enrollments;
   RETURN total;
END;
//
DELIMITER ; --works but i cant display it in my console 

-- Query 10: Use the function WORKS but i cant display it in console 
SELECT TotalEnrollments() AS Total_Enrollments;

-- Trigger 1: Update class enrollment count on new enrollment
DELIMITER //
CREATE TRIGGER UpdateEnrollmentCount 
AFTER INSERT ON Enrollments
FOR EACH ROW 
BEGIN
    UPDATE Classes
    SET Description = CONCAT(Description, ' (Enrolled Students: ', 
        (SELECT COUNT(*) FROM Enrollments WHERE Class_ID = NEW.Class_ID), ')')
    WHERE Class_ID = NEW.Class_ID;
END;
//
DELIMITER ;


--WORKS query 6 Find Students Enrolled in More Than One Class

SELECT S.StudentID, CONCAT(S.FirstName, ' ', S.LastName) AS Student_Name
FROM Students S
JOIN Enrollments E ON S.StudentID = E.Student_ID
GROUP BY S.StudentID
HAVING COUNT(E.Class_ID) > 1;

--Show assignments due in the next 7 days  query 7 
SELECT A.Assignment_Title, A.Due_Date, C.Class_Name
FROM Assignments A
JOIN Classes C ON A.Class_ID = C.Class_ID
WHERE A.Due_Date BETWEEN CURDATE() AND DATE_ADD(CURDATE(), INTERVAL 7 DAY);

--Student enrolled in a specific course like class id is 101 , works, query 8

SELECT S.StudentID, CONCAT(S.FirstName, ' ', S.LastName) AS Student_Name
FROM Students S
JOIN Enrollments E ON S.StudentID = E.Student_ID
WHERE E.Class_ID = 101;

--update the status of a student like they graduated , query 9, works 
UPDATE Students
SET Status = 'Graduated'
WHERE StudentID = 2;

--find the total number of enrollments for each teacher including class name and enrollment date , works, query 10 

SELECT 
    CONCAT(T.FirstName, ' ', T.LastName) AS Teacher_Name,
    C.Class_Name,
    COUNT(E.EnrollmentID) AS Total_Enrollments,
    MIN(E.Enrollment_Date) AS First_Enrollment_Date
FROM Teachers T
JOIN Classes C ON T.TeacherID = C.Teacher_ID
JOIN Enrollments E ON C.Class_ID = E.Class_ID
GROUP BY T.TeacherID, C.Class_ID
ORDER BY Total_Enrollments DESC;

--trigger to update enrolment date when a new enrollment date is added 
DELIMITER $$

CREATE TRIGGER Set_Enrollment_Date
BEFORE INSERT ON Enrollments
FOR EACH ROW
BEGIN
    SET NEW.Enrollment_Date = IFNULL(NEW.Enrollment_Date, NOW());
END $$

DELIMITER ; --works, but i cant display it in my console 

--trigger to prevent deletion of classes with active enrollments 

DELIMITER $$

CREATE TRIGGER Prevent_Class_Deletion
BEFORE DELETE ON Classes
FOR EACH ROW
BEGIN
    DECLARE enrollments_count INT;
    SELECT COUNT(*) INTO enrollments_count FROM Enrollments WHERE Class_ID = OLD.Class_ID;
    IF enrollments_count > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Cannot delete class with active enrollments';
    END IF;
END $$

DELIMITER ; --works, but i cant display it in my console 

--Thank you!! :) 


