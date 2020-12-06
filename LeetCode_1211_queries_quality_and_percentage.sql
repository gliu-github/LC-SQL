USE LeetCode;
DROP TABLE IF EXISTS Queries;
CREATE TABLE Queries (query_name VARCHAR(255),
                      result VARCHAR(255),
                      position INT,
                      rating INT);
INSERT INTO Queries (query_name, result, position, rating) VALUES 
                    ('Dog', 'Golden Retriever', 1, 5),
                    ('Dog', 'German Shepherd', 2, 5),
                    ('Dog', 'Mule', 200, 1),
                    ('Cat', 'Shirazi', 5, 2),
                    ('Cat', 'Siamese', 3, 3),
                    ('Cat', 'Sphynx', 7, 4);

-- MY CODE
SELECT query_name,
       ROUND(AVG(rating / position), 2) AS quality,
       ROUND(AVG(CASE WHEN rating < 3 THEN 1 ELSE 0 END) * 100, 2) AS poor_query_percentage
    FROM Queries
  GROUP BY query_name;