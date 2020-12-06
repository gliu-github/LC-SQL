USE LeetCode;

DROP TABLE IF EXISTS Users;
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Items;

Create table If Not Exists Users (user_id int, join_date date, favorite_brand varchar(10));
create table if not exists Orders (order_id int, order_date date, item_id int, buyer_id int, seller_id int);
create table if not exists Items (item_id int, item_brand varchar(10));

insert into Users (user_id, join_date, favorite_brand) values ('1', '2019-01-01', 'Lenovo');
insert into Users (user_id, join_date, favorite_brand) values ('2', '2019-02-09', 'Samsung');
insert into Users (user_id, join_date, favorite_brand) values ('3', '2019-01-19', 'LG');
insert into Users (user_id, join_date, favorite_brand) values ('4', '2019-05-21', 'HP');

insert into Orders (order_id, order_date, item_id, buyer_id, seller_id) values ('1', '2019-08-01', '4', '1', '2');
insert into Orders (order_id, order_date, item_id, buyer_id, seller_id) values ('2', '2019-08-02', '2', '1', '3');
insert into Orders (order_id, order_date, item_id, buyer_id, seller_id) values ('3', '2019-08-03', '3', '2', '3');
insert into Orders (order_id, order_date, item_id, buyer_id, seller_id) values ('4', '2019-08-04', '1', '4', '2');
insert into Orders (order_id, order_date, item_id, buyer_id, seller_id) values ('5', '2019-08-04', '1', '3', '4');
insert into Orders (order_id, order_date, item_id, buyer_id, seller_id) values ('6', '2019-08-05', '2', '2', '4');

insert into Items (item_id, item_brand) values ('1', 'Samsung');
insert into Items (item_id, item_brand) values ('2', 'Lenovo');
insert into Items (item_id, item_brand) values ('3', 'LG');
insert into Items (item_id, item_brand) values ('4', 'HP');

SELECT U.user_id AS seller_id,
       (CASE WHEN U.favorite_brand = I.item_brand THEN 'yes'
             ELSE 'no' END) AS 2nd_item_fav_brand
FROM Users U
LEFT JOIN (SELECT seller_id, 
                  item_id
           FROM Orders O1
           WHERE 1 = (SELECT COUNT(DISTINCT order_id) 
                      FROM Orders  
                      WHERE O1.order_date > order_date AND O1.seller_id = seller_id)) O 
ON U.user_id = O.seller_id
LEFT JOIN Items I 
ON O.item_id = I.item_id
ORDER BY seller_id;


/*
SELECT U.USER_ID seller_id, CASE WHEN U.favorite_brand = I.ITEM_BRAND THEN 'yes' ELSE 'no' END AS "2nd_item_fav_brand"
FROM
USERS U LEFT JOIN
(SELECT SELLER_ID, ITEM_ID
FROM ORDERS O1
WHERE 1= (SELECT COUNT(DISTINCT ORDER_ID) from ORDERS WHERE O1.order_date > order_date AND O1.SELLER_ID = SELLER_ID)) O
ON U.USER_ID = O.SELLER_ID
LEFT JOIN ITEMS I
ON O.ITEM_ID = I.ITEM_ID
order by seller_id; */