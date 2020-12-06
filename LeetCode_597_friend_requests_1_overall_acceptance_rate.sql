USE LeetCode;

DROP TABLE IF EXISTS friend_request;
DROP TABLE IF EXISTS request_accepted;

CREATE TABLE friend_request (sender_id INT,
                             send_to_id INT);
CREATE TABLE request_accepted (requester_id INT,
                               accepter_id INT);
INSERT INTO friend_request (sender_id, send_to_id) VALUES (1, 2),
                                                          (1, 3),
                                                          (1, 4),
                                                          (2, 3),
                                                          (3, 4);
INSERT INTO request_accepted (requester_id, accepter_id) VALUES (1, 2),
                                                                (1, 3),
                                                                (2, 3),
                                                                (3, 4),
                                                                (3, 4);
SELECT ROUND(IFNULL((SELECT COUNT(*) 
                         FROM (SELECT DISTINCT requester_id, accepter_id 
                                   FROM request_accepted) AS accept_count) 
                    / 
                    (SELECT COUNT(*) 
                         FROM (SELECT DISTINCT sender_id, send_to_id 
                                   FROM friend_request) AS request_count), 0), 2) AS accept_rate;
