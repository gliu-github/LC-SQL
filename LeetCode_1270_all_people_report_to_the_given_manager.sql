USE LeetCode;

DROP TABLE IF EXISTS Employees;
CREATE TABLE Employees (employee_id INT,
                        employee_name VARCHAR(255),
                        manager_id INT);
INSERT INTO Employees VALUES (1, 'Boss', 1),
                             (3, 'Alice', 3),
                             (2, 'Bob', 1),
                             (4, 'Daniel', 2),
                             (7, 'Luis', 4),
                             (8, 'Jhon', 3),
                             (9, 'Angela', 8),
                             (77, 'Robert', 1);

SELECT employee_id FROM Employees WHERE employee_id != 1 AND manager_id IN (
    SELECT employee_id FROM Employees WHERE manager_id IN (
        SELECT employee_id FROM Employees WHERE manager_id = 1
    )
);