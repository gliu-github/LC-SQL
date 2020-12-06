USE LeetCode;

DROP TABLE IF EXISTS Events;
CREATE TABLE Events (bussiness_id INT,
                     event_type VARCHAR(255),
                     occurences INT);
INSERT INTO Events VALUES (1, 'reviews', 7),
                          (3, 'reviews', 3),
                          (1, 'ads', 11),
                          (2, 'ads', 7),
                          (3, 'ads', 6),
                          (1, 'page views', 3),
                          (2, 'page views', 12);
SELECT bussiness_id
    FROM Events 
    INNER JOIN (SELECT event_type, AVG(occurences) AS mean
                   FROM Events 
                 GROUP BY event_type) s
    ON Events.event_type = s.event_type AND Events.occurences > s.mean
  GROUP BY bussiness_id
  HAVING COUNT(Events.occurences) > 1;


SELECT business_id
    FROM Events 
    LEFT JOIN (SELECT event_type, AVG(occurences) AS mean
                   FROM Events 
                 GROUP BY event_type) s
    ON Events.event_type = s.event_type
  GROUP BY business_id
  HAVING SUM(Events.occurences > s.mean) > 1;