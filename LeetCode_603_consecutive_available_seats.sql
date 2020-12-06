USE LeetCode;

DROP TABLE IF EXISTS cinema;
CREATE TABLE cinema (seat_id INT,
                     free INT);
INSERT INTO cinema (seat_id, free) VALUES (1, 1),
                                          (2, 0),
                                          (3, 1),
                                          (4, 1),
                                          (5, 1);

-- MY CODE

SELECT DISTINCT a.seat_id
    FROM cinema  a 
    JOIN cinema  b ON abs(a.seat_id - b.seat_id) = 1
  WHERE a.free = TRUE AND b.free = TRUE
  ORDER BY a.seat_id;