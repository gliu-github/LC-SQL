USE LeetCode;
DROP TABLE IF EXISTS Employee;
DROP TABLE IF EXISTS Bonus;
CREATE TABLE Employee (empId INT,
                      name VARCHAR(255),
                      supervisor INT,
                      salary INT);
CREATE TABLE Bonus (empId INT,
                    bonus INT);
INSERT INTO Employee (empId, name, supervisor, salary) VALUES 
                     (1, 'John', 3, 1000),
                     (2, 'Dan', 3, 2000),
                     (3, 'Brad', NULL, 4000),
                     (4, 'Thomas', 3, 4000);

INSERT INTO Bonus (empId, bonus) VALUES 
                  (2, 500),
                  (4, 2000);

-- MY CODE
SELECT e.name AS name,
       b.bonus AS bonus
    FROM Employee e 
  LEFT JOIN Bonus b ON e.empId = b.empId
  HAVING b.bonus < 1000 OR b.bonus IS NULL;