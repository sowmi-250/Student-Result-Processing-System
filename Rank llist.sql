-- Rank Lists using Window Functions
-- Semester-wise Rank List
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

-- Department-wise Rank List (Overall GPA)
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
   