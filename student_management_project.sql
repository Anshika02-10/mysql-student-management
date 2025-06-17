-- Create Data base and use it

CREATE DATABASE project;

USE project;

-- Create tables students, marks and marks_log

CREATE TABLE students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    age INT
);

CREATE TABLE marks (
    mark_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    subject VARCHAR(50),
    marks INT,
    FOREIGN KEY (student_id) REFERENCES students(student_id)
);

CREATE TABLE marks_log (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    subject VARCHAR(50),
    marks INT,
    log_time DATETIME
);

-- Show tables and table structure

SHOW TABLES;

DESC students;
DESC marks;
DESC marks_log;


-- insert some data

INSERT INTO students (name, age) VALUES
('Rahila', 20),
('Shanky', 21),
('Anshika', 22);

INSERT INTO marks (student_id, subject, marks) VALUES
(1, 'Math', 88),
(1, 'Science', 90),
(2, 'Math', 77),
(3, 'English', 65);


-- Create indext to fast search
CREATE INDEX idx_student_name ON students(name);


-- Create a Trigger: Trigger to log marks whenever inserted.

DELIMITER //

CREATE TRIGGER after_marks_insert
AFTER INSERT ON marks
FOR EACH ROW
BEGIN
    INSERT INTO marks_log(student_id, subject, marks, log_time)
    VALUES (NEW.student_id, NEW.subject, NEW.marks, NOW());
END //

DELIMITER ;


-- Create Stored Procedure: To add a student and marks together.

DELIMITER //

CREATE PROCEDURE AddStudentWithMarks(
    IN s_name VARCHAR(50),
    IN s_age INT,
    IN s_subject VARCHAR(50),
    IN s_marks INT
)
BEGIN
    DECLARE sid INT;

    INSERT INTO students(name, age) VALUES (s_name, s_age);
    SET sid = LAST_INSERT_ID();

    INSERT INTO marks(student_id, subject, marks) VALUES (sid, s_subject, s_marks);
END //

DELIMITER ;


-- Create Cursor to Print All Marks

DELIMITER //

CREATE PROCEDURE ListAllMarks()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE s_name VARCHAR(50);
    DECLARE s_subject VARCHAR(50);
    DECLARE s_marks INT;

    DECLARE cur CURSOR FOR
        SELECT students.name, marks.subject, marks.marks
        FROM students
        JOIN marks ON students.student_id = marks.student_id;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN cur;

    read_loop: LOOP
        FETCH cur INTO s_name, s_subject, s_marks;
        IF done THEN
            LEAVE read_loop;
        END IF;
        SELECT CONCAT('Student: ', s_name, ', Subject: ', s_subject, ', Marks: ', s_marks);
    END LOOP;

    CLOSE cur;
END //

DELIMITER ;

