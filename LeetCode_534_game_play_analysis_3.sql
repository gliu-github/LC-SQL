USE LeetCode;
DROP TABLE IF EXISTS Activity;
CREATE TABLE Activity (player_id INT,
                       device_id INT,
                       event_date DATE,
                       games_played INT);
INSERT INTO Activity VALUES (1, 2, '2016-03-01', 5),
                            (1, 2, '2016-05-02', 6),
                            (1, 3, '2017-06-25', 1),
                            (3, 1, '2016-03-02', 0),
                            (3, 4, '2018-07-03', 5);

SELECT a.player_id,
       a.event_date,
       SUM(b.games_played) AS games_played_so_far
    FROM Activity a 
    LEFT JOIN Activity b 
    ON a.player_id = b.player_id AND a.event_date >= b.event_date
  GROUP BY 1, 2;

SELECT player_id,
       event_date,
       SUM(games_played) OVER(PARTITION BY player_id ORDER BY event_date) AS games_played_so_far
    FROM Activity;