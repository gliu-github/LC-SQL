USE LeetCode;
DROP TABLE IF EXISTS orders;
CREATE TABLE orders (order_number INT,
                     customer_number INT,
                     status VARCHAR(255));

INSERT INTO orders (order_number, customer_number, status) VALUES (1, 1, 'closed'),
                                                                  (2, 2, 'closed'),
                                                                  (3, 3, 'closed'),
                                                                  (4, 3, 'closed');
                                                            
-- MY CODE
SELECT customer_number
    FROM orders
  GROUP BY customer_number
  ORDER BY COUNT(*) DESC
  LIMIT 1;