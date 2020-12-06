USE LeetCode;
DROP TABLE IF EXISTS Numbers;
Create table If Not Exists Numbers (Number int, Frequency int);
Truncate table Numbers;
insert into Numbers (Number, Frequency) values ('0', '7');
insert into Numbers (Number, Frequency) values ('1', '1');
insert into Numbers (Number, Frequency) values ('2', '3');
insert into Numbers (Number, Frequency) values ('3', '1');


SELECT AVG(n.Number) AS median
FROM Numbers n
WHERE n.Frequency >= ABS((SELECT SUM(Frequency) 
                          FROM Numbers 
                          WHERE Number <= n.Number) 
                          -
                         (SELECT SUM(Frequency) 
                          FROM Numbers 
                          WHERE Number >= n.Number));