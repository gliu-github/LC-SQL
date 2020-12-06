USE LeetCode;

DROP TABLE IF EXISTS my_numbers;
CREATE TABLE my_numbers (num INT);
INSERT INTO my_numbers(num) VALUES (8), (8), (3), (3), (1), (4), (5), (6);

-- MY CODE
SELECT MAX(num) AS num 
    FROM (SELECT num 
              FROM my_numbers 
            GROUP BY num 
            HAVING count(num) = 1) s;