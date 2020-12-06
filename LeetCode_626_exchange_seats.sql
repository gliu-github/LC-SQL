USE LeetCode;
DROP TABLE IF EXISTS seat;
CREATE TABLE seat (id INT,
                   student VARCHAR(255));

INSERT INTO seat (id, student) VALUES 
                     (1, 'Abbot'),
                     (2, 'Doris'),
                     (3, 'Emerson'),
                     (4, 'Green'),
                     (5, 'Jeames');

-- MY CODE
SELECT (CASE
          WHEN MOD(id, 2) != 0 AND counts != id THEN id + 1
          WHEN MOD(id, 2) != 0 AND counts = id THEN id
          ELSE id - 1
          END
        ) AS id,
       student
    FROM seat, (SELECT COUNT(*) AS counts FROM seat) size
  ORDER BY id;