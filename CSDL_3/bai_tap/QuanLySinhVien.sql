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
 
 INSERT INTO Class (ClassName,StartDate)
 values ('c1121g1',"2025-11-10"), ('c1221g1',"2025-10-10"),('a0821i1',"2025-12-19"),('a0921i1',"2025-12-20");
 
 
INSERT INTO Student (StudentName,Address,Phone,ClassId)
 values ("nguyen ngoc cu","kontum","000000022929","1"), ("le quang chung","danang","000001022929","2"),
 ("nguyen minh hai","daklak","010000022929","2"),("vo minh hieu","hanoi","000002022929","1");
 INSERT INTO Student (StudentName,Address,Phone,ClassId)
 values ("tran van Hung","vungtau","2313123222","1");
 SET SQL_SAFE_UPDATES = 0;
 DELETE FROM Student;
 INSERT INTO Subject (SubName,Credit)
 values ("Toan","10"), ("Van","6"),("Anh","3"),("Hoa","7");
 
 INSERT INTO Mark (SubId,StudentId,Mark,ExamTimes)
 values ("1","1","100","1"), ("1","2","50","1"),("1","3","70","1"),("1","4","30","1"),
 ("2","1","60","2"), ("2","2","70","2"),("2","3","90","2"),("2","4","99","2"),
 ("3","1","63","2"), ("3","2","44","2"),("3","3","42","2"),("3","4","39","2"),
 ("4","1","77","2"), ("4","2","32","2"),("4","3","88","2"),("4","4","69","2");
 
 SELECT * FROM Mark;
-- Hiển thị tất cả các sinh viên có tên bắt đầu bảng ký tự ‘h’
SELECT * FROM Student
where StudentName like "h%";
-- Hiển thị các thông tin lớp học có thời gian bắt đầu vào tháng 12.
SELECT * FROM class
WHERE MONTH(startDate) = 12;
-- Hiển thị tất cả các thông tin môn học có credit trong khoảng từ 3-5.
SELECT * FROM Subject
WHERE credit BETWEEN 3 AND 5;

-- Thay đổi mã lớp(ClassID) của sinh viên có tên ‘Hung’ là 2.
UPDATE student
SET ClassID = 2
WHERE StudentName = 'Hung';

-- Hiển thị các thông tin: StudentName, SubName, Mark. Dữ liệu sắp xếp theo điểm thi (mark) giảm dần. nếu trùng sắp theo tên tăng dần.
SELECT s.StudentName AS StudentName, sub.SubName AS SubName, m.Mark AS Mark
FROM Student s
JOIN Mark m ON s.StudentId = m.StudentId
JOIN Subject sub ON m.SubId = sub.SubId
ORDER BY m.Mark DESC, s.StudentName ASC;



 
 
 

