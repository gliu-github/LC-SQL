USE LeetCode;
DROP TABLE IF EXISTS Students;
DROP TABLE IF EXISTS Subjects;
DROP TABLE IF EXISTS Examinations;
CREATE TABLE Students (student_id INT,
                       student_name VARCHAR(255));
CREATE TABLE Subjects (subject_name VARCHAR(255));
CREATE TABLE Examinations (student_id INT,
                           subject_name VARCHAR(255));
INSERT INTO Students (student_id, student_name) VALUES (1, 'Alice'),
                                                       (2, 'Bob'),
                                                       (13, 'John'),
                                                       (6, 'Alex');
INSERT INTO Subjects (subject_name) VALUES ('Math'), ('Physics'), ('Programming');
INSERT INTO Examinations (student_id, subject_name) VALUES (1, 'Math'),
                                                           (1, 'Physics' ),
                                                           (1, 'Programming'),
                                                           (2, 'Programming'),
                                                           (1, 'Physics'),
                                                           (1, 'Math'),
                                                           (13, 'Math'),
                                                           (13, 'Programming'),
                                                           (13, 'Physics'),
                                                           (2, 'Math'),
                                                           (1, 'Math');
-- MY CODE
SELECT a.student_id, 
       a.student_name, 
       b.subject_name,
       COUNT(c.subject_name) AS attended_exams
    FROM Students a
  JOIN Subjects b LEFT JOIN Examinations c 
  ON a.student_id = c.student_id AND b.subject_name = c.subject_name
  GROUP BY a.student_id, b.subject_name;