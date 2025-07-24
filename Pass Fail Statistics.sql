-- Pass/Fail Statistics per Course
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