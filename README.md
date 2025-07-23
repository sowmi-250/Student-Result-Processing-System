# 📈 Student-Result-Processing-System

## 📌 Project Overview
The Student Result Processing System is a database-driven application designed to manage and process academic records for students in a university setting. This system allows for efficient handling of student information, course enrollment, grading, GPA calculation, and statistical reporting.

## 🛠️ Technologies Used
- **Database:** SQL
- **Tool:** MySQL Workbench

## 📁 Database Structure
- Students Table: Stores student information, including names, emails, enrollment dates, and departments.
- Semesters Table: Contains details about academic semesters, including names, years, start dates, and end dates.
- Courses Table: Maintains a list of courses, including course codes, names, credit hours, and associated departments.
- Grades Table: Records grades for students in specific courses during particular semesters, including grade points and letter grades.

## ⚙️ Core Features
- Data Insertion: The system allows for the insertion of sample data for students, courses, semesters, and grades, facilitating testing and demonstration.
- GPA Calculation: The system calculates semester GPAs for students based on their grades and credit hours, providing a clear view of academic performance.
- Pass/Fail Statistics: Queries are available to assess the pass/fail rates for each course, helping identify areas for academic improvement.
- Rank Lists: The system generates rank lists for students based on their GPAs, both semester-wise and department-wise, using window functions.
- Triggers for GPA Updates: Triggers automatically recalculate GPAs when grades are inserted or updated, ensuring that student records are always current.
- Trigger for lowercase conversion: Shows how email addresses are converted to lowercase
- Trigger for title case conversion: Demonstrates title case conversion for semester names & title case conversion for course names
- Result Summary View: A view is created to summarize semester results, including average GPAs, minimum and maximum GPAs, and honors/failing student counts.

## 🔐 Database Constraints
- Primary Key constraints for student_id,course_id,semester_id and grade_id
- Foreign Key constraints for relationship between student,semester,course and grade
- Unique constraint for grade record
- Check constraint for grade points to be between 0.0 to 4.0
- Default constraint for enrollement_date to optionally set current date if not provided

## ⚡ Triggers
- before_insert_students: This trigger ensures that the email is always in lowercase when a new student is inserted
- before_insert_semesters: This trigger will ensure that the semester name is always in title case when a new semester is inserted.
- before_insert_courses: This trigger will ensure that the course name is always in title case when a new course is inserted.
- after_insert_grades: This trigger will automatically calculate the GPA for a student when a new grade is inserted.

# 📦 Deliverables 
## 1.  📐 Schema Design
### Database Schema Creation
### CREATE DATABASE Student_Result_System;
### USE Student_Result_System;

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







