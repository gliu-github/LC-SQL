USE LeetCode;

DROP TABLE IF EXISTS Enrollments;
CREATE TABLE Enrollments (student_id INT,
                          course_id INT,
                          grade INT);
INSERT INTO Enrollments (student_id, course_id, grade) VALUES (2, 2, 95),
                                                              (2, 3, 95),
                                                              (1, 1, 90),
                                                              (1, 2, 99),
                                                              (3, 1, 80),
                                                              (3, 2, 75),
                                                              (3, 3, 82);
SELECT student_id,
       MIN(course_id) AS course_id,
       grade
    FROM Enrollments
  WHERE (student_id, grade) IN (
    SELECT student_id,
           MAX(grade)
        FROM Enrollments
      GROUP BY student_id)
  GROUP BY student_id;   