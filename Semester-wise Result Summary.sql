-- Semester-wise Result Summary (Export View)
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
    