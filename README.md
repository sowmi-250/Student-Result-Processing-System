# 📈 Student-Result-Processing-System

## 📌 Project Overview
The Student Result Processing System is a database-driven application designed to manage and process academic records for students in a university setting. This system allows for efficient handling of student information, course enrollment, grading, GPA calculation, and statistical reporting.

## 🛠️ Technologies Used
- **Database:** SQL
- **Tool:** MySQL Workbench

## 📁 Database Structure
- **Students Table:** Stores student information, including names, emails, enrollment dates, and departments.
- **Semesters Table:** Contains details about academic semesters, including names, years, start dates, and end dates.
- **Courses Table:** Maintains a list of courses, including course codes, names, credit hours, and associated departments.
- **Grades Table:** Records grades for students in specific courses during particular semesters, including grade points and letter grades.

## ⚙️ Core Features
- **Data Insertion:** The system allows for the insertion of sample data for students, courses, semesters, and grades, facilitating testing and demonstration.
- **GPA Calculation:** The system calculates semester GPAs for students based on their grades and credit hours, providing a clear view of academic performance.
- **Pass/Fail Statistics:** Queries are available to assess the pass/fail rates for each course, helping identify areas for academic improvement.
- **Rank Lists:** The system generates rank lists for students based on their GPAs, both semester-wise and department-wise, using window functions.
- **Triggers for GPA Updates:** Triggers automatically recalculate GPAs when grades are inserted or updated, ensuring that student records are always current.
- **Trigger for lowercase conversion:** Shows how email addresses are converted to lowercase
- **Trigger for title case conversion:** Demonstrates title case conversion for semester names & title case conversion for course names
- **Result Summary View:** A view is created to summarize semester results, including average GPAs, minimum and maximum GPAs, and honors/failing student counts.

## 🔐 Database Constraints
- Primary Key constraints for student_id,course_id,semester_id and grade_id
- Foreign Key constraints for relationship between student,semester,course and grade
- Unique constraint for grade record
- Check constraint for grade points to be between 0.0 to 4.0
- Default constraint for enrollement_date to optionally set current date if not provided

## ⚡ Triggers
- **before_insert_students:** This trigger ensures that the email is always in lowercase when a new student is inserted
- **before_insert_semesters:** This trigger will ensure that the semester name is always in title case when a new semester is inserted.
- **before_insert_courses:** This trigger will ensure that the course name is always in title case when a new course is inserted.
- **after_insert_grades:** This trigger will automatically calculate the GPA for a student when a new grade is inserted.

# 📦 Deliverables 
## 1.  📐 Schema Design

### Database Schema Creation
```bash
CREATE DATABASE Student_Result_System;
USE Student_Result_System;
```

### Student Table
```bash
CREATE TABLE Students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    enrollment_date DATE,
    department VARCHAR(50)
);
Select *from Students;
```

### Semester Table
```bash
CREATE TABLE Semesters (
    semester_id INT AUTO_INCREMENT PRIMARY KEY,
    semester_name VARCHAR(20) NOT NULL,
    academic_year VARCHAR(20) NOT NULL,
    start_date DATE,
    end_date DATE
);
Select *from Semesters;
```
### Courses Table
```bash
CREATE TABLE Courses (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    course_code VARCHAR(20) NOT NULL UNIQUE,
    course_name VARCHAR(100) NOT NULL,
    credit_hours DECIMAL(3,1) NOT NULL,
    department VARCHAR(50)
);
Select *from Courses;
```

### Grades Table
```bash
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
Select *from Grades;
```

### OUTPUT:
![WhatsApp Image 2025-07-24 at 13 53 48_3d5fa9af](https://github.com/user-attachments/assets/ef59aaf7-e134-4d56-943b-88bcd94b7302)


## 2. 🧾 Insert Sample Data 

### 2.1 Insert Students 
```bash
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
select *from Students;
```

### 2.2 Insert Semesters
```bash
INSERT INTO Semesters (semester_name, academic_year, start_date, end_date) VALUES
('Odd', '2022-2023', '2022-09-05', '2022-12-20'),
('Even', '2022-2023', '2023-01-16', '2023-05-05'),
('Odd', '2023-2024', '2023-09-04', '2023-12-19');
select *from semesters;
```

### 2.3 Insert Courses
```bash
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
select *from Courses;
```

### 2.4 Insert Grades (sample data for Odd 2022-2023)
```bash
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
select *from Grades;
```





