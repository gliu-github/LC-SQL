USE LeetCode;

DROP TABLE IF EXISTS salesperson;
CREATE TABLE salesperson (sales_id INT,
                          name VARCHAR(255));
INSERT INTO salesperson (sales_id, name) VALUES (1, 'John'),
                                                (2, 'Amy'),
                                                (3, 'Mark'),
                                                (4, 'Pam'),
                                                (5, 'Alex');
DROP TABLE IF EXISTS company;
CREATE TABLE company (com_id INT,
                      name VARCHAR(255));                                            
INSERT INTO company (com_id, name) VALUES (1, 'RED'),
                                          (2, 'ORANGE'),
                                          (3, 'YELLOW'),
                                          (4, 'GREEN');
DROP TABLE IF EXISTS orders;
CREATE TABLE orders (order_id INT,
                     com_id INT,
                     sales_id INT);
INSERT INTO orders (order_id, com_id, sales_id) VALUES (1, 3, 4),
                                                       (2, 4, 5),
                                                       (3, 1, 1),
                                                       (4, 1, 4);

-- MY CODE
SELECT s.name
    FROM salesperson s
  WHERE s.sales_id NOT IN (SELECT o.sales_id
                               FROM orders o JOIN company c
                               ON o.com_id = c.com_id
                             WHERE c.name = 'RED');