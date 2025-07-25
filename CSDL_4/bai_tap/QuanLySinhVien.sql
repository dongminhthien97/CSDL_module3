CREATE DATABASE QuanLySinhVien;
USE QuanLySinhVien;

CREATE TABLE Class(

         ClassID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,

          ClassName VARCHAR(60) NOT NULL,

          StartDate DATETIME NOT NULL,

          Status BIT

);

CREATE TABLE Student(

          StudentId INT NOT NULL AUTO_INCREMENT PRIMARY KEY,

          StudentName VARCHAR(30) NOT NULL,

          Address VARCHAR(50),

          Phone VARCHAR(20),

          Status BIT,

          ClassId INT NOT NULL,

          FOREIGN KEY (ClassId) REFERENCES Class (ClassID)

);

CREATE TABLE Subject(

         SubId INT NOT NULL AUTO_INCREMENT PRIMARY KEY,

         SubName VARCHAR(30) NOT NULL,

         Credit TINYINT NOT NULL DEFAULT 1 CHECK ( Credit >= 1 ),

         Status BIT DEFAULT 1

);

CREATE TABLE Mark(

        MarkId INT NOT NULL AUTO_INCREMENT PRIMARY KEY,

        SubId INT NOT NULL,

        StudentId INT NOT NULL,

        Mark FLOAT DEFAULT 0 CHECK ( Mark BETWEEN 0 AND 100),

        ExamTimes TINYINT DEFAULT 1,

        UNIQUE (SubId, StudentId),

        FOREIGN KEY (SubId) REFERENCES Subject (SubId),

        FOREIGN KEY (StudentId) REFERENCES Student (StudentId)

 );

 INSERT INTO Class (ClassName, StartDate, Status)
VALUES 
('C1121G1', '2025-11-10', 1),
('C1221G1', '2025-10-10', 1),
('A0821I1', '2025-12-19', 1),
('A0921I1', '2025-12-20', 1);

SELECT * FROM Class;
 
INSERT INTO Student (StudentName, Address, Phone, Status, ClassId)
VALUES 
('Nguyen Ngoc Cu', 'Kon Tum', '0900000001', 1, 5),
('Le Quang Chung', 'Da Nang', '0900000002', 1, 6),
('Nguyen Minh Hai', 'Dak Lak', '0900000003', 1, 7),
('Vo Minh Hieu', 'Ha Noi', '0900000004', 1, 8),
('Tran Van Hung', 'Vung Tau', '0900000005', 1, 5);

 DELETE FROM Subject;
 INSERT INTO Subject (SubName, Credit, Status)
VALUES 
('Toan', 10, 1),
('Van', 6, 1),
('Anh', 3, 1),
('Hoa', 7, 1);

 
 INSERT INTO Mark (SubId, StudentId, Mark, ExamTimes)
VALUES 
(5, 11, 85, 1),
(5, 12, 78, 1),
(5, 13, 92, 1),
(5, 14, 67, 1),
(6, 11, 88, 1),
(6, 12, 74, 1),
(6, 13, 91, 1),
(6, 14, 70, 1),
(7, 11, 80, 1),
(7, 12, 76, 1),
(7, 13, 65, 1),
(7, 14, 72, 1),
(8, 11, 90, 1),
(8, 12, 69, 1),
(8, 13, 85, 1),
(8, 14, 78, 1);


 
 SELECT * FROM Mark;
 SELECT * FROM Student;
 SELECT * FROM Subject;
 
 -- Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.
 SELECT *
FROM Subject
WHERE Credit = (SELECT MAX(Credit) FROM Subject);

-- Hiển thị các thông tin môn học có điểm thi lớn nhất.
SELECT sub.*
FROM Subject sub
JOIN Mark m ON sub.SubId = m.SubId
WHERE m.Mark = (SELECT MAX(Mark) FROM Mark);

-- Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần
SELECT 
    s.StudentId,
    s.StudentName,
    AVG(m.Mark) AS AverageMark
FROM Student s
JOIN Mark m ON s.StudentId = m.StudentId
GROUP BY s.StudentId, s.StudentName
ORDER BY AverageMark DESC;






 
 
 

