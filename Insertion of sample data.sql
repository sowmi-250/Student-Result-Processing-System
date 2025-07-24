-- Insert Sample Data
-- Insert Students
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

-- Insert Semesters
INSERT INTO Semesters (semester_name, academic_year, start_date, end_date) VALUES
('Odd', '2022-2023', '2022-09-05', '2022-12-20'),
('Even', '2022-2023', '2023-01-16', '2023-05-05'),
('Odd', '2023-2024', '2023-09-04', '2023-12-19');

-- Insert Courses
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

-- Insert Grades (sample data for Fall 2022-2023)
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
