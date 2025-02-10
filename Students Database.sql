CREATE DATABASE students_Db;
USE db_students;
CREATE TABLE students(
id INT AUTO_INCREMENT PRIMARY KEY,
student_id VARCHAR(15) NOT NULL,
student_name VARCHAR(50) NOT NULL,
student_dept VARCHAR(15) NOT NULL,
student_course VARCHAR(100) NOT NULL
);
SELECT * FROM students;
SELECT * FROM students LIMIT 3;

DROP DATABASE db_students;
DROP TABLE students;

ALTER TABLE student_info RENAME TO students;
ALTER TABLE students ADD COLUMN grade VARCHAR(15);
ALTER TABLE students DROP COLUMN grade;
ALTER TABLE students CHANGE COLUMN grade cgpa VARCHAR(5);

INSERT INTO students(student_id, student_name, student_dept, student_course) VALUES
('1504079','Farshid','CSE','SW, Computer Graphics, Digital System Design'),
('1504093','Rumman','CSE','SW, Computer Graphics, Digital System Design'),
('1504100','Angkon','CSE','SW, Computer Graphics, Digital System Design'),
('1504104','Sampod','CSE','SW, Computer Graphics, Digital System Design'),
('1504112','Junayed','CSE','SW, Computer Graphics, Digital System Design'),
('1504113','Arifin','CSE','SW, Computer Graphics, Digital System Design'),
('1504114','Zabed','CSE','SW, Computer Graphics, Digital System Design')
;

SELECT * FROM students;
DELETE FROM students WHERE id IN (5,19);
SELECT * FROM students;
TRUNCATE TABLE students;

INSERT INTO students(student_id,student_name, student_dept, student_course) VALUES
('1501051','Jarjis','CE','SM, English, Physics'),
('1501117','Sabeer','CE','SM, English, Physics')
;
 SELECT * FROM students;

SELECT * FROM students WHERE student_dept = 'CSE';
SELECT * FROM students WHERE student_dept = 'CE';

-- getting specific column data/record
SELECT student_id, student_name FROM students WHERE student_dept = 'CE';
-- counting total number of students
SELECT COUNT(student_id) FROM students;
SELECT COUNT(student_id) AS 'Total Number of Students' FROM students;
-- using BETWEEN for getting data between two data/record
-- using and
SELECT * FROM students WHERE student_id BETWEEN '150493' AND '150112'; 
SELECT * FROM students WHERE student_dept = 'CSE' AND student_id BETWEEN '150493' AND '150412';

-- using AND & OR
SELECT * FROM students WHERE student_dept = 'CSE' AND student_dept = 'CE';
SELECT * FROM students WHERE student_dept = 'EEE' OR student_dept = 'ME';

-- using ORDER By for (ASC) or (DESC) order
SELECT * FROM students ORDER BY student_name 
WHERE student_id BETWEEN '150493' AND '150412' ORDER BY student_name ASC;

-- using GROUP By for goruping data into single group
SELECT student_dept, COUNT(student_name) FROM students GROUP BY student_dept;

-- removing duplicates
SELECT DISTINCT student_dept FROM students;
SELECT student_dept FROM students 
-- counting distinct values
SELECT COUNT(DISTINCT student_dept) FROM students;
SELECT COUNT(DISTINCT student_dept) AS 'Total Department' FROM students;

-- total student numbers department wise
SELECT student_dept, COUNT(student_name) FROM students GROUP BY student_dept;

-- using like with %

SELECT * FROM students WHERE student_name LIKE '%m';
SELECT * FROM students WHERE student_name LIKE 'a%';
SELECT * FROM students WHERE student_name NOT LIKE 'a%';
SELECT * FROM students WHERE student_name LIKE '%a%';
SELECT * FROM students WHERE student_name LIKE '_a%';
SELECT * FROM students WHERE student_name LIKE '__m%';
SELECT * FROM students WHERE student_name LIKE '__a__%';

-- using regular expression

SELECT * FROM students WHERE student_name REGEXP 'arifin';
SELECT * FROM students WHERE student_name REGEXP '^arifin';
SELECT * FROM students WHERE student_name REGEXP 'arfin$';
SELECT * FROM students WHERE student_name REGEXP 'arifun|zabed|farshid';
SELECT * FROM students WHERE student_name REGEXP '^.a';
SELECT * FROM students WHERE student_name REGEXP 'a.$';
SELECT * FROM students WHERE student_name REGEXP 'a[elb]';
SELECT * FROM students WHERE student_name REGEXP '[elb]a';
SELECT * FROM students WHERE student_name REGEXP 'a[e-w]';

-- Like & regxp 

SELECT * FROM students WHERE 
student_name LIKE '__a%' OR 
student_name LIKE '__b%' OR 
student_name LIKE '__c%' OR 
student_name LIKE '__d%' OR 
student_name LIKE '__e%';

-- Regexp
SELECT * FROM students WHERE student_name REGEXP '^..[a-e]';

