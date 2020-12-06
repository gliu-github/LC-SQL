USE LeetCode;
DROP TABLE IF EXISTS Employee;
CREATE TABLE Employee (Id INT,
                       Salary INT);
INSERT INTO Employee (Id, Salary) VALUES
                     (1, 100),
                     (2, 200),
                     (3, 300);

-- MY CODE

SELECT (
        SELECT DISTINCT Salary
            FROM Employee
            ORDER BY Salary DESC
            LIMIT 1, 1
    ) AS SecondHighestSalary;