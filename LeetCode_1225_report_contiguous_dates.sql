USE LeetCode;
DROP TABLE IF EXISTS Failed;
DROP TABLE IF EXISTS Succeeded;

Create table Failed (fail_date date);
Create table Succeeded (success_date date);

insert into Failed (fail_date) values ('2018-12-28');
insert into Failed (fail_date) values ('2018-12-29');
insert into Failed (fail_date) values ('2019-01-04');
insert into Failed (fail_date) values ('2019-01-05');

insert into Succeeded (success_date) values ('2018-12-30');
insert into Succeeded (success_date) values ('2018-12-31');
insert into Succeeded (success_date) values ('2019-01-01');
insert into Succeeded (success_date) values ('2019-01-02');
insert into Succeeded (success_date) values ('2019-01-03');
insert into Succeeded (success_date) values ('2019-01-06');


SELECT fail_date AS date1, 
             'failed' AS state,
             ROW_NUMBER() OVER (ORDER BY fail_date) AS rn
      FROM Failed
      WHERE fail_date BETWEEN '2019-01-01' AND '2019-12-31'
      
      UNION ALL
      
      SELECT success_date AS date1, 
             'succeeded' AS state,
             ROW_NUMBER() OVER(ORDER BY success_date) AS rn
      FROM Succeeded
      WHERE success_date BETWEEN '2019-01-01' AND '2019-12-31';


SELECT state AS period_state, 
       MIN(date1) AS start_date, 
       MAX(date1) AS end_date
FROM (SELECT fail_date AS date1, 
             'failed' AS state,
             ROW_NUMBER() OVER (ORDER BY fail_date) AS rn
      FROM Failed
      WHERE fail_date BETWEEN '2019-01-01' AND '2019-12-31'
      
      UNION ALL
      
      SELECT success_date AS date1, 
             'succeeded' AS state,
             ROW_NUMBER() OVER(ORDER BY success_date) AS rn
      FROM Succeeded
      WHERE success_date BETWEEN '2019-01-01' AND '2019-12-31') a
GROUP BY state, DATEDIFF(date1, '2017-01-01') - rn
ORDER BY start_date; 

