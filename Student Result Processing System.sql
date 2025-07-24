-- Database Schema Creation
CREATE DATABASE Student_Result_System;
USE Student_Result_System;

-- 1. Create Tables 
CREATE TABLE Students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    enrollment_date DATE,
    department VARCHAR(50)
);

CREATE TABLE Semesters (
    semester_id INT AUTO_INCREMENT PRIMARY KEY,
    semester_name VARCHAR(20) NOT NULL,
    academic_year VARCHAR(20) NOT NULL,
    start_date DATE,
    end_date DATE
);

CREATE TABLE Courses (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    course_code VARCHAR(20) NOT NULL UNIQUE,
    course_name VARCHAR(100) NOT NULL,
    credit_hours DECIMAL(3,1) NOT NULL,
    department VARCHAR(50)
);

CREATE TABLE Grades (
    grade_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    semester_id INT NOT NULL,
    grade_point DECIMAL(3,2) NOT NULL,
    letter_grade CHAR(2) NOT NULL,
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id),
    FOREIGN KEY (semester_id) REFERENCES Semesters(semester_id),
    CONSTRAINT unique_grade_record UNIQUE (student_id, course_id, semester_id)
);

Select *from Students;
Select *from Semesters;
Select *from Courses;
Select *from Grades;

-- 2. Insert Sample Data
-- 2.1 Insert Students
INSERT INTO Students (first_name, last_name, email, enrollment_date, department) VALUES
('Rayan', 'Reddy', 'rayan.r@university.edu', '2022-09-01', 'Computer Science'),
('Abimanyu', 'Vashjith', 'abimanyu.v@university.edu', '2022-09-01', 'Mathematics'),
('Sarina', 'Williams', 'sarina.w@university.edu', '2022-09-01', 'Physics'),
('Abishek', 'Chauhan', 'abishek.c@university.edu', '2022-09-01', 'Engineering'),
('David', 'Jones', 'david.j@university.edu', '2022-09-01', 'Computer Science'),
('Jennifer', 'Garcia', 'jennifer.g@university.edu', '2022-09-01', 'Biology'),
('Robert', 'Miller', 'robert.m@university.edu', '2022-09-01', 'Chemistry'),
('Jessica', 'Davis', 'jessica.d@university.edu', '2022-09-01', 'Mathematics'),
('William', 'Rodriguez', 'william.r@university.edu', '2022-09-01', 'Engineering'),
('Elizabeth', 'Martinez', 'elizabeth.m@university.edu', '2022-09-01', 'Computer Science');

-- 2.2 Insert Semesters
INSERT INTO Semesters (semester_name, academic_year, start_date, end_date) VALUES
('Odd', '2022-2023', '2022-09-05', '2022-12-20'),
('Even', '2022-2023', '2023-01-16', '2023-05-05'),
('Odd', '2023-2024', '2023-09-04', '2023-12-19');

-- 2.3 Insert Courses
INSERT INTO Courses (course_code, course_name, credit_hours, department) VALUES
('CS101', 'Introduction to Programming', 3.0, 'Computer Science'),
('MATH101', 'Calculus I', 4.0, 'Mathematics'),
('PHYS101', 'General Physics', 3.0, 'Physics'),
('ENG101', 'Engineering Fundamentals', 3.0, 'Engineering'),
('BIO101', 'Principles of Biology', 3.0, 'Biology'),
('CHEM101', 'General Chemistry', 3.0, 'Chemistry'),
('CS201', 'Data Structures', 3.0, 'Computer Science'),
('MATH201', 'Linear Algebra', 3.0, 'Mathematics'),
('PHYS201', 'Modern Physics', 3.0, 'Physics'),
('ENG201', 'Thermodynamics', 3.0, 'Engineering');

-- 2.4 Insert Grades (sample data for Fall 2022-2023)
INSERT INTO Grades (student_id, course_id, semester_id, grade_point, letter_grade) VALUES
-- Student 1 - Rayan Reddy
(1, 1, 1, 3.67, 'A-'), (1, 2, 1, 3.33, 'B+'), (1, 3, 1, 4.00, 'A'),
-- Student 2 - Abimanyu Vashjith
(2, 2, 1, 3.67, 'A-'), (2, 4, 1, 3.00, 'B'), (2, 5, 1, 3.33, 'B+'),
-- Student 3 - Sarina Williams
(3, 3, 1, 2.67, 'B-'), (3, 6, 1, 2.33, 'C+'), (3, 7, 1, 3.00, 'B'),
-- Student 4 - Abishek Chauhan
(4, 4, 1, 3.00, 'B'), (4, 8, 1, 3.67, 'A-'), (4, 9, 1, 4.00, 'A'),
-- Student 5 - David Jones
(5, 1, 1, 3.33, 'B+'), (5, 5, 1, 2.67, 'B-'), (5, 7, 1, 3.67, 'A-'),
-- Student 6 - Jennifer Garcia
(6, 5, 1, 4.00, 'A'), (6, 6, 1, 3.33, 'B+'), (6, 8, 1, 3.00, 'B'),
-- Student 7 - Robert Miller
(7, 6, 1, 2.00, 'C'), (7, 7, 1, 1.67, 'C-'), (7, 9, 1, 2.33, 'C+'),
-- Student 8 - Jessica Davis
(8, 2, 1, 4.00, 'A'), (8, 4, 1, 3.67, 'A-'), (8, 8, 1, 4.00, 'A'),
-- Student 9 - William Rodriguez
(9, 4, 1, 3.00, 'B'), (9, 9, 1, 2.67, 'B-'), (9, 10, 1, 3.33, 'B+'),
-- Student 10 - Elizabeth Martinez
(10, 1, 1, 3.67, 'A-'), (10, 7, 1, 4.00, 'A'), (10, 10, 1, 3.67, 'A-');

select *from Students;
select *from semesters;
select *from Courses;
select *from Grades;

-- 3. GPA Calculation
-- 3.1 Calculate Semester GPA for each student
SELECT 
    s.student_id,
    CONCAT(s.first_name, ' ', s.last_name) AS student_name,
    sm.semester_name,
    sm.academic_year,
    ROUND(SUM(g.grade_point * c.credit_hours) / SUM(c.credit_hours), 2) AS semester_gpa
FROM 
    Grades g
    JOIN Students s ON g.student_id = s.student_id
    JOIN Semesters sm ON g.semester_id = sm.semester_id
    JOIN Courses c ON g.course_id = c.course_id
GROUP BY 
    s.student_id, sm.semester_id;
    
-- 4. Pass/Fail Statistics per Course
SELECT 
    c.course_code,
    c.course_name,
    COUNT(CASE WHEN g.grade_point >= 2.00 THEN 1 END) AS passed,
    COUNT(CASE WHEN g.grade_point < 2.00 THEN 1 END) AS failed,
    ROUND(COUNT(CASE WHEN g.grade_point >= 2.00 THEN 1 END) * 100.0 / COUNT(*), 2) AS pass_rate
FROM 
    Grades g
    JOIN Courses c ON g.course_id = c.course_id
GROUP BY 
    c.course_id;
    
-- 4. Rank Lists using Window Functions
-- 4.1 Semester-wise Rank List
SELECT 
    s.student_id,
    CONCAT(s.first_name, ' ', s.last_name) AS student_name,
    sm.semester_name,
    sm.academic_year,
    ROUND(SUM(g.grade_point * c.credit_hours) / SUM(c.credit_hours), 2) AS semester_gpa,
    RANK() OVER (PARTITION BY sm.semester_id ORDER BY SUM(g.grade_point * c.credit_hours) / SUM(c.credit_hours) DESC) AS rank_in_semester
FROM 
    Grades g
    JOIN Students s ON g.student_id = s.student_id
    JOIN Semesters sm ON g.semester_id = sm.semester_id
    JOIN Courses c ON g.course_id = c.course_id
GROUP BY 
    s.student_id, sm.semester_id
ORDER BY 
    sm.semester_id, semester_gpa DESC;

-- 4.2 Department-wise Rank List (Overall GPA)
SELECT 
    s.student_id,
    CONCAT(s.first_name, ' ', s.last_name) AS student_name,
    s.department,
    ROUND(AVG(g.grade_point), 2) AS overall_gpa,
    DENSE_RANK() OVER (PARTITION BY s.department ORDER BY AVG(g.grade_point) DESC) AS department_rank
FROM 
    Grades g
    JOIN Students s ON g.student_id = s.student_id
GROUP BY 
    s.student_id
ORDER BY 
    s.department, overall_gpa DESC;    
    
-- 5. Semester-wise Result Summary (Export View)
CREATE VIEW SemesterResultSummary AS
SELECT 
    sm.semester_name,
    sm.academic_year,
    COUNT(DISTINCT g.student_id) AS total_students,
    COUNT(DISTINCT g.course_id) AS total_courses,
    ROUND(AVG(g.grade_point), 2) AS average_gpa,
    MIN(g.grade_point) AS min_gpa,
    MAX(g.grade_point) AS max_gpa,
    COUNT(CASE WHEN g.grade_point >= 3.50 THEN 1 END) AS honors_students,
    COUNT(CASE WHEN g.grade_point < 2.00 THEN 1 END) AS failing_students,
    ROUND(COUNT(CASE WHEN g.grade_point >= 2.00 THEN 1 END) * 100.0 / COUNT(*), 2) AS pass_rate
FROM 
    Grades g
    JOIN Semesters sm ON g.semester_id = sm.semester_id
GROUP BY 
    sm.semester_id;
    
    select *from semesterresultsummary;
    
use student_result_system;

 -- 5. Trigger_Procedure
-- 5.1 Trigger for Students Table
DELIMITER //
CREATE TRIGGER before_insert_students
BEFORE INSERT ON Students
FOR EACH ROW
BEGIN
    SET NEW.email = LOWER(NEW.email);
END //
DELIMITER ;

-- 5.2 Trigger for Semesters
DELIMITER //
CREATE TRIGGER before_insert_semesters
BEFORE INSERT ON Semesters
FOR EACH ROW
BEGIN
    SET NEW.semester_name = CONCAT(UPPER(LEFT(NEW.semester_name, 1)), LOWER(SUBSTRING(NEW.semester_name, 2)));
END //
DELIMITER ;

-- 5.3 Trigger for Courses
DELIMITER //
CREATE TRIGGER before_insert_courses
BEFORE INSERT ON Courses
FOR EACH ROW
BEGIN
    SET NEW.course_name = CONCAT(UPPER(LEFT(NEW.course_name, 1)), LOWER(SUBSTRING(NEW.course_name, 2)));
END //
DELIMITER ;

-- 5.4 Trigger for Grades
DELIMITER //
CREATE TRIGGER after_insert_grades
AFTER INSERT ON Grades
FOR EACH ROW
BEGIN
    DECLARE total_points DECIMAL(10,2);
    DECLARE total_credits DECIMAL(10,2);
    DECLARE calculated_gpa DECIMAL(3,2);
    
    SELECT 
        SUM(g.grade_point * c.credit_hours),
        SUM(c.credit_hours)
    INTO 
        total_points, 
        total_credits
    FROM 
        Grades g
        JOIN Courses c ON g.course_id = c.course_id
    WHERE 
        g.student_id = NEW.student_id 
        AND g.semester_id = NEW.semester_id;
    
    IF total_credits > 0 THEN
        SET calculated_gpa = ROUND(total_points / total_credits, 2);
    END IF;
END //
DELIMITER ;

SHOW TRIGGERS;



