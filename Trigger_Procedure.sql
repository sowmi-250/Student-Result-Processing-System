-- Trigger_Procedure
-- Trigger for Students Table
DELIMITER //
CREATE TRIGGER before_insert_students
BEFORE INSERT ON Students
FOR EACH ROW
BEGIN
    SET NEW.email = LOWER(NEW.email);
END //
DELIMITER ;

-- Trigger for Semesters
DELIMITER //
CREATE TRIGGER before_insert_semesters
BEFORE INSERT ON Semesters
FOR EACH ROW
BEGIN
    SET NEW.semester_name = CONCAT(UPPER(LEFT(NEW.semester_name, 1)), LOWER(SUBSTRING(NEW.semester_name, 2)));
END //
DELIMITER ;

-- Trigger for Courses
DELIMITER //
CREATE TRIGGER before_insert_courses
BEFORE INSERT ON Courses
FOR EACH ROW
BEGIN
    SET NEW.course_name = CONCAT(UPPER(LEFT(NEW.course_name, 1)), LOWER(SUBSTRING(NEW.course_name, 2)));
END //
DELIMITER ;

-- Trigger for Grades
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

