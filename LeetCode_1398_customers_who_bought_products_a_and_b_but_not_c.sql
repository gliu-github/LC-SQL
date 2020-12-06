USE LeetCode;
DROP TABLE IF EXISTS Customers;
Create table Customers (customer_id int, customer_name varchar(30));
DROP TABLE IF EXISTS Orders;
Create table Orders (order_id int, customer_id int, product_name varchar(30));

insert into Customers (customer_id, customer_name) values ('1', 'Daniel');
insert into Customers (customer_id, customer_name) values ('2', 'Diana');
insert into Customers (customer_id, customer_name) values ('3', 'Elizabeth');
insert into Customers (customer_id, customer_name) values ('4', 'Jhon');

insert into Orders (order_id, customer_id, product_name) values ('10', '1', 'A');
insert into Orders (order_id, customer_id, product_name) values ('20', '1', 'B');
insert into Orders (order_id, customer_id, product_name) values ('30', '1', 'D');
insert into Orders (order_id, customer_id, product_name) values ('40', '1', 'C');
insert into Orders (order_id, customer_id, product_name) values ('50', '2', 'A');
insert into Orders (order_id, customer_id, product_name) values ('60', '3', 'A');
insert into Orders (order_id, customer_id, product_name) values ('70', '3', 'B');
insert into Orders (order_id, customer_id, product_name) values ('80', '3', 'D');
insert into Orders (order_id, customer_id, product_name) values ('90', '4', 'C');


SELECT customer_id, 
       customer_name
FROM Customers
WHERE customer_id NOT IN (SELECT customer_id
                          FROM Orders
                          WHERE product_name = 'C')
AND customer_id IN (SELECT customer_id
                    FROM Orders
                    WHERE product_name = 'A')
AND customer_id IN (SELECT customer_id
                    FROM Orders
                    WHERE product_name = 'B');