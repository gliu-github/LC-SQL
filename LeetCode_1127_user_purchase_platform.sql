USE LeetCode;
DROP TABLE IF EXISTS Spending;
Create table If Not Exists Spending (user_id int, spend_date date, platform ENUM('desktop', 'mobile'), amount int);
Truncate table Spending;
insert into Spending (user_id, spend_date, platform, amount) values ('1', '2019-07-01', 'mobile', '100');
insert into Spending (user_id, spend_date, platform, amount) values ('1', '2019-07-01', 'desktop', '100');
insert into Spending (user_id, spend_date, platform, amount) values ('2', '2019-07-01', 'mobile', '100');
insert into Spending (user_id, spend_date, platform, amount) values ('2', '2019-07-02', 'mobile', '100');
insert into Spending (user_id, spend_date, platform, amount) values ('3', '2019-07-01', 'desktop', '100');
insert into Spending (user_id, spend_date, platform, amount) values ('3', '2019-07-02', 'desktop', '100');

SELECT user_id, 
            spend_date,
            CASE WHEN COUNT(*) = 1 THEN platform ELSE 'both' END AS platform,
            SUM(amount) AS amount 
    FROM Spending
    GROUP BY user_id, spend_date;



SELECT c.spend_date,
       c.platform,
       SUM(COALESCE(amount, 0)) AS total_amount,
       SUM(CASE WHEN amount IS NULL THEN 0 ELSE 1 END) AS total_users
FROM
    (SELECT DISTINCT spend_date, 'desktop' AS platform 
    FROM spending 
    UNION ALL
    SELECT DISTINCT spend_date, 'mobile' AS platform 
    FROM spending 
    UNION ALL    
    SELECT DISTINCT spend_date, 'both' AS platform 
    FROM spending) c
LEFT JOIN
    (SELECT user_id, 
            spend_date,
            CASE WHEN COUNT(*) = 1 THEN platform ELSE 'both' END AS platform,
            SUM(amount) AS amount 
    FROM Spending
    GROUP BY user_id, spend_date) v
ON c.spend_date = v.spend_date AND c.platform = v.platform
GROUP BY c.spend_date, c.platform;