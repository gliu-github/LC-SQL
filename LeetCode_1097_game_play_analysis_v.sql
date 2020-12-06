USE LeetCode;
DROP TABLE IF EXISTS Activity;

Create table Activity (player_id int, device_id int, event_date date, games_played int);
insert into Activity (player_id, device_id, event_date, games_played) values ('1', '2', '2016-03-01', '5');
insert into Activity (player_id, device_id, event_date, games_played) values ('1', '2', '2016-03-02', '6');
insert into Activity (player_id, device_id, event_date, games_played) values ('2', '3', '2017-06-25', '1');
insert into Activity (player_id, device_id, event_date, games_played) values ('3', '1', '2016-03-01', '0');
insert into Activity (player_id, device_id, event_date, games_played) values ('3', '4', '2018-07-03', '5');


SELECT A.event_date AS install_dt, 
       COUNT(A.player_id) AS installs, 
       ROUND(COUNT(B.player_id) / COUNT(A.player_id), 2) AS Day1_retention
FROM (SELECT player_id, 
             MIN(event_date) AS event_date 
      FROM Activity 
      GROUP BY player_id) AS A
LEFT JOIN Activity B
ON A.player_id = B.player_id AND A.event_date + 1 = B.event_Date
GROUP BY A.event_date;