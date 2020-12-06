USE LeetCode;

DROP TABLE IF EXISTS Logs;
CREATE TABLE Logs (Id INT,
                   Num Int);
INSERT INTO Logs VALUES (1, 1),
                        (2, 1),
                        (3, 1),
                        (4, 2),
                        (5, 1),
                        (6, 2),
                        (7, 2);

-- MY CODE

SELECT DISTINCT l1.Num AS ConsecutiveNums
    FROM Logs l1, Logs l2, Logs l3
  WHERE l1.Id = l2.Id - 1 AND l2.Id = l3.Id - 1
    AND l1.Num = l2.Num AND l2.Num = l3.Num;