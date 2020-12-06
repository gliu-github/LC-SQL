USE LeetCode;

DROP TABLE IF EXISTS Players;
DROP TABLE IF EXISTS Matches;

Create table If Not Exists Players (player_id int, group_id int);
Create table If Not Exists Matches (match_id int, first_player int, second_player int, first_score int, second_score int);

insert into Players (player_id, group_id) values ('10', '2');
insert into Players (player_id, group_id) values ('15', '1');
insert into Players (player_id, group_id) values ('20', '3');
insert into Players (player_id, group_id) values ('25', '1');
insert into Players (player_id, group_id) values ('30', '1');
insert into Players (player_id, group_id) values ('35', '2');
insert into Players (player_id, group_id) values ('40', '3');
insert into Players (player_id, group_id) values ('45', '1');
insert into Players (player_id, group_id) values ('50', '2');

insert into Matches (match_id, first_player, second_player, first_score, second_score) values ('1', '15', '45', '3', '0');
insert into Matches (match_id, first_player, second_player, first_score, second_score) values ('2', '30', '25', '1', '2');
insert into Matches (match_id, first_player, second_player, first_score, second_score) values ('3', '30', '15', '2', '0');
insert into Matches (match_id, first_player, second_player, first_score, second_score) values ('4', '40', '20', '5', '2');
insert into Matches (match_id, first_player, second_player, first_score, second_score) values ('5', '35', '50', '1', '1');

SELECT group_id, 
       player AS player_id
FROM (SELECT group_id, 
             player, 
             SUM(score) AS total
      FROM (SELECT first_player AS player, 
                   first_score AS score
            FROM Matches
            UNION ALL
            SELECT second_player AS player, 
                   second_score AS score
            FROM Matches
        ) AS mat, Players 
      WHERE player = player_id 
      GROUP BY player
      ORDER BY group_id ASC, total DESC, player ASC
    ) as final 
GROUP BY group_id;