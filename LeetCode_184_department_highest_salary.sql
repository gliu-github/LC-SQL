
USE LeetCode;
DROP TABLE IF EXISTS Employee;
DROP TABLE IF EXISTS Department;

CREATE TABLE Employee (Id INT,
                       Name VARCHAR(255),
                       Salary INT,
                       DepartmentId INT);
CREATE TABLE Department (Id INT,
                         Name VARCHAR(255));

INSERT INTO Employee (Id, Name, Salary, DepartmentId) VALUES 
                     (1, 'Joe', 70000, 1),
                     (2, 'Jim', 90000, 1),
                     (3, 'Henry', 80000, 2),
                     (4, 'Sam', 60000, 2),
                     (5, 'Max', 90000, 1);
INSERT INTO Department(Id, Name) VALUES
                     (1, 'IT'),
                     (2, 'Sales');

-- MY CODE
SELECT d.NAME AS Department,
       e.NAME AS Employee,
       e.Salary
    FROM Employee e JOIN Department d
    ON e.DepartmentId = d.Id
    WHERE (e.DepartmentId, e.Salary) IN
        (SELECT DepartmentId, 
                MAX(Salary)
            FROM Employee
            GROUP BY DepartmentId);