-- GPA Calculation
-- Calculate Semester GPA for each student
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