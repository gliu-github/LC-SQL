USE LeetCode;
DROP TABLE IF EXISTS Scores;
CREATE TABLE Scores (Id INT, Score DECIMAL (3, 2));
INSERT INTO Scores (Id, Score)
VALUES
    (1, 3.50),
    (2, 3.65),
    (3, 4.00),
    (4, 3.85),
    (5, 4.00),
    (6, 3.65);

-- MY CODE
SELECT Score, 
       DENSE_RANK() OVER (ORDER BY Score DESC) AS 'Rank'
    FROM Scores; 
