USE LeetCode;

DROP TABLE IF EXISTS Customers;
DROP TABLE IF EXISTS Contacts;
DROP TABLE IF EXISTS Invoices;

CREATE TABLE Customers (customer_id INT, customer_name VARCHAR(255));
CREATE TABLE Contacts (user_id INT, contact_name VARCHAR(255));
CREATE TABLE Invoices (invoice_id INT, price INT, user_id INT);

INSERT INTO Customers VALUES (1, 'Alice'),
                             (2, 'Bob'),
                             (13, 'John'),
                             (6, 'Alex');

INSERT INTO Contacts VALUES (1, 'Bob'),
                            (1, 'John'),
                            (1, 'Jal'),
                            (2, 'Omar'),
                            (2, 'Meir'),
                            (6, 'Alice');

INSERT INTO Invoices VALUES (77, 100, 1),
                            (88, 200, 1),
                            (99, 300, 2),
                            (66, 400, 2),
                            (55, 500, 13),
                            (44, 60, 6);


SELECT invoice_id, 
       customer_name, 
       price,
       COUNT(Contacts.user_id) AS contacts_cnt,
       SUM(CASE WHEN contact_name IN (SELECT customer_name FROM Customers) THEN 1 ELSE 0 END) AS trusted_contacts_cnt
    FROM Invoices
    LEFT JOIN Customers
    ON Invoices.user_id = Customers.customer_id
    LEFT JOIN Contacts
    ON Customers.customer_id = Contacts.user_id
  GROUP BY invoice_id
  ORDER BY invoice_id;