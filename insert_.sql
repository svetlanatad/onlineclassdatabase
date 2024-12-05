--USE OnlineClasses;
-- ..........^ uncomment this if there are any errors though there shouldnt be 
INSERT INTO Students (FirstName, LastName, Email, Status)
VALUES 
('John', 'Doe', 'john.doe@duck.com', 'Active'),
('Jane', 'Smith', 'jane.smith@duck.com', 'Active'),
('Taro', 'Yamada', 'taro.yamada@hakucho.jp', 'Active'),
('Emi', 'Tanaka', 'emi.tanaka@hakucho.jp', 'Active'),
('Vartan', 'Hovhannisyan', 'vartan.hovhannisyan@gmail.com', 'Active'),
('Nina', 'Harutyunyan', 'nina.harutyunyan@gmail.com', 'Inactive');

INSERT INTO Teachers (FirstName, LastName, Email)
VALUES 
('Alan', 'Turing', 'alan.turing@duck.com'),
('Ada', 'Lovelace', 'ada.lovelace@duck.com'),
('Yuki', 'Nakamura', 'yuki.nakamura@hakucho.jp'),
('Mika', 'Sato', 'mika.sato@hakucho.jp'),
('Sergey', 'Petrosyan', 'sergey.petrosyan@gmail.com'),
('Lilit', 'Movsisyan', 'lilit.movsisyan@gmail.com');

INSERT INTO Classes (Teacher_ID, Class_Name, Description)
VALUES 
(1, 'Computer Science 101', 'Introduction to Computer Science'),
(2, 'Mathematics 101', 'Fundamentals of Mathematics'),
(3, 'Japanese Language 101', 'Learn basic Japanese for beginners'),
(4, 'Algorithms and Data Structures', 'Study of algorithms and their applications'),
(5, 'Armenian History', 'Explore the rich history of Armenia'),
(6, 'Advanced Calculus', 'In-depth study of calculus concepts');

INSERT INTO Enrollments (Student_ID, Class_ID, Enrollment_Date)
VALUES 
(1, 1, '2024-12-01'),
(2, 2, '2024-12-01'),
(3, 3, '2024-12-01'),
(4, 4, '2024-12-01'),
(5, 5, '2024-12-01'),
(6, 6, '2024-12-01');

INSERT INTO Assignments (Class_ID, Due_Date, Assignment_Title, Description)
VALUES 
(1, '2024-12-10', 'Assignment 1', 'Introduction to Algorithms'),
(2, '2024-12-15', 'Assignment 2', 'Basic Math Problems'),
(3, '2024-12-20', 'Assignment 1', 'Japanese Culture and Language Basics'),
(4, '2024-12-20', 'Assignment 2', 'Data Structures in Action'),
(5, '2024-12-25', 'Assignment 1', 'Read and analyze Armenian historical texts'),
(6, '2024-12-25', 'Assignment 2', 'Solve complex calculus problems');

INSERT INTO Address (StreetAddress, ZIPCode, State, Prefecture, City)
VALUES 
('123 Elm Street', '12345', 'California', 'Los Angeles', 'LA'),
('456 Oak Avenue', '67890', 'New York', 'Manhattan', 'NYC'),
('789 Shibuya Street', '150-0002', 'Tokyo', 'Shibuya', 'Tokyo'),
('100 Roppongi Asakusa', '106-0032', 'Tokyo', 'Minato', 'Tokyo'),
('2 Marshal Baghramyan Street', '0001', 'Yerevan', 'Yerevan', 'Armenia'),
('54 Republic Avenue', '0025', 'Yerevan', 'Yerevan', 'Armenia'),
('3 Kanda 2-choume', '101-0047', 'Tokyo', 'Chiyoda', 'Tokyo'),
('11 Tbilisi Street', '0175', 'Yerevan', 'Yerevan', 'Armenia'),
('23 Nishiazabu Street', '106-0031', 'Tokyo', 'Minato', 'Tokyo'),
('5 Mashtots Avenue', '0003', 'Yerevan', 'Yerevan', 'Armenia');
