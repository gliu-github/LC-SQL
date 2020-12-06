USE LeetCode;

DROP TABLE IF EXISTS Weather;
CREATE TABLE Weather (Id INT,
                      RecordDate DATE,
                      Temperature INT);
INSERT INTO Weather VALUES (1, '2015-01-01', 10),
                           (2, '2015-01-02', 25),
                           (3, '2015-01-03', 20),
                           (4, '2015-01-04', 30);

SELECT a.Id 
    FROM Weather a JOIN Weather b
    ON DATEDIFF(a.RecordDate, b.RecordDate) = 1
    AND a.Temperature > b.Temperature;