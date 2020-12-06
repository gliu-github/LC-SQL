USE LeetCode;
DROP TABLE IF EXISTS Customer;
DROP TABLE IF EXISTS Product;

CREATE TABLE Customer (customer_id INT, product_key INT);
CREATE TABLE Product (product_key INT);

INSERT INTO Customer VALUES (1, 5),
                            (2, 6),
                            (3, 5),
                            (3, 6),
                            (1, 6);
INSERT INTO Product VALUES (5), (6);

SELECT customer_id
    FROM Customer
  GROUP BY customer_id
  HAVING COUNT(DISTINCT product_key) = (SELECT COUNT(DISTINCT product_key) FROM Product);