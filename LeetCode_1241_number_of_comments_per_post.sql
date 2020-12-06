USE LeetCode;
DROP TABLE IF EXISTS submissions;
CREATE TABLE submissions (sub_id INT, parent_id INT);
INSERT INTO submissions (sub_id, parent_id) VALUES (1, NULL),
                                                   (2, NULL),
                                                   (1, NULL),
                                                   (12, NULL),
                                                   (3, 1),
                                                   (5, 2),
                                                   (3, 1),
                                                   (4, 1),
                                                   (9, 1),
                                                   (10, 2), 
                                                   (6, 7);


-- MY CODE

SELECT DISTINCT s.sub_id AS post_id,
       (SELECT COUNT(DISTINCT(s1.sub_id)) 
           FROM submissions s1 
          WHERE s1.parent_id = s.sub_id) AS number_of_comments
    FROM submissions s
  WHERE s.parent_id IS NULL
  ORDER BY 1 ASC;