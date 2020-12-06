USE LeetCode;

DROP TABLE IF EXISTS Ads;
CREATE TABLE Ads (ad_id INT,
                  user_id INT,
                  action ENUM('Clicked', 'Viewed', 'Ignored'));
INSERT INTO Ads (ad_id, user_id, action) VALUES (1, 1, 'Clicked'),
                                                (2, 2, 'Clicked'),
                                                (3, 3, 'Viewed'),
                                                (5, 5, 'Ignored'),
                                                (1, 7, 'Ignored'),
                                                (2, 7, 'Viewed'),
                                                (3, 5, 'Clicked'),
                                                (1, 4, 'Viewed'),
                                                (2, 11, 'Viewed'),
                                                (1, 2, 'Clicked');

-- MY CODE
SELECT s.ad_id,
       (CASE WHEN clicks + views = 0 THEN 0
        ELSE ROUND(clicks / (clicks + views) * 100, 2) END) AS ctr
    FROM (SELECT ad_id,
                 SUM(CASE WHEN action = 'Clicked' THEN 1 ELSE 0 END) AS clicks,
                 SUM(CASE WHEN action = 'Viewed' THEN 1 ELSE 0 END) AS views
              FROM Ads
            GROUP BY ad_id) s
  ORDER BY ctr DESC, s.ad_id ASC;