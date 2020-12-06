USE LeetCode;
DROP TABLE IF EXISTS Employee;
CREATE TABLE Employee (Id INT,
                       Salary INT);
INSERT INTO Employee (Id, Salary) VALUES
                     (1, 100),
                     (2, 200),
                     (3, 300);

-- MY CODE
DELIMITER $$
DROP FUNCTION IF EXISTS getNthHighestSalary;
CREATE FUNCTION getNthHighestSalary (N INT) 
       RETURNS INT

BEGIN
SET N = N - 1;
RETURN ( 
    SELECT ( 
        SELECT DISTINCT Salary 
        FROM Employee 
        ORDER BY Salary DESC 
        LIMIT N, 1
    );
)
END $$
DELIMITER ;