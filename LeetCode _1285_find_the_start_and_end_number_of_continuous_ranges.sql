USE LeetCode;

DROP TABLE IF EXISTS Logs;
CREATE TABLE Logs (log_id INT);
INSERT INTO Logs VALUES (1), (2), (3), (7), (8), (10);


SELECT MIN(a.log_id) as start_id, 
       MAX(a.log_id) as end_id
    FROM (
    SELECT l1.log_id, (SUM(IF(l1.log_id-l2.log_id >= 0, 1, 0)) - l1.log_id) AS label
        FROM Logs l1
        JOIN Logs l2
      GROUP BY l1.log_id) AS a
  GROUP BY a.label
  ORDER BY 1;