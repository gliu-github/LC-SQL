USE LeetCode;

DROP TABLE IF EXISTS Queue;
CREATE TABLE Queue (person_id INT,
                    person_name VARCHAR(255),
                    weight INT,
                    turn INT);
INSERT INTO Queue VALUES (5, 'George Washington', 250, 1),
                         (3, 'John Adams', 350, 2),
                         (6, 'Thomas Jefferson', 400, 3),
                         (2, 'Will Johnliams', 200, 4),
                         (4, 'Thomas Jefferson', 175, 5),
                         (1, 'James Elephant', 500, 6);
/*
SELECT person_name
    FROM
    (SELECT a.person_name,
        SUM(b.weight) AS groupedsum
        FROM Queue a JOIN Queue b ON a.turn >= b.turn
    GROUP BY a.person_id
    HAVING groupedsum <= 1000
    ORDER BY groupedsum DESC) AS s
  LIMIT 1;
  */

SELECT person_name FROM
    (SELECT person_name, SUM(weight) OVER(ORDER BY turn) AS sumval FROM Queue) s
  ORDER BY s.sumval DESC
  LIMIT 1;
