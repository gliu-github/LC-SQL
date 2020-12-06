USE LeetCode;
DROP TABLE IF EXISTS UserActivity;
Create table If Not Exists UserActivity (username varchar(30), activity varchar(30), startDate date, endDate date);

insert into UserActivity (username, activity, startDate, endDate) values ('Alice', 'Travel', '2020-02-12', '2020-02-20');
insert into UserActivity (username, activity, startDate, endDate) values ('Alice', 'Dancing', '2020-02-21', '2020-02-23');
insert into UserActivity (username, activity, startDate, endDate) values ('Alice', 'Travel', '2020-02-24', '2020-02-28');
insert into UserActivity (username, activity, startDate, endDate) values ('Bob', 'Travel', '2020-02-11', '2020-02-18');

SELECT *
FROM UserActivity
GROUP BY username
HAVING COUNT(1) = 1

UNION

SELECT a.*
FROM UserActivity AS a 
LEFT JOIN UserActivity AS b
ON a.username = b.username AND a.endDate < b.endDate
GROUP BY a.username, a.endDate
HAVING COUNT(b.endDate) = 1;