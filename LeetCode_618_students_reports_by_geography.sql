USE LeetCode;
DROP TABLE IF Exists student;
Create table If Not Exists student (name varchar(50), continent varchar(7));

insert into student (name, continent) values ('Jane', 'America');
insert into student (name, continent) values ('Pascal', 'Europe');
insert into student (name, continent) values ('Xi', 'Asia');
insert into student (name, continent) values ('Jack', 'America');


SELECT 
    America, Asia, Europe
FROM
    (SELECT @as:=0, @am:=0, @eu:=0) t,
    (SELECT 
        @as:=@as + 1 AS asid, name AS Asia
    FROM
        student
    WHERE
        continent = 'Asia'
    ORDER BY Asia) AS t1

    RIGHT JOIN

    (SELECT 
        @am:=@am + 1 AS amid, name AS America
    FROM
        student
    WHERE
        continent = 'America'
    ORDER BY America) AS t2 ON asid = amid

    LEFT JOIN

    (SELECT 
        @eu:=@eu + 1 AS euid, name AS Europe
    FROM
        student
    WHERE
        continent = 'Europe'
    ORDER BY Europe) AS t3 ON amid = euid; 