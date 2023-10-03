/*
.open restaurant.db
.table
*/

.mode column
  
CREATE TABLE IF NOT EXISTS customers (
  customer_id int,
  firstname varchar, 
  lastname varchar,
  email varchar
);

INSERT INTO customers VALUES 
  (1, "Madalena", "Sampaio", "madalena.s@example.com"),
  (2, "Hannah", "Schneider", "hannah.s@example.com"),
  (3, "Fynn", "Zimmermann", "fynn.z@example.com"),
  (4, "Camille", "Bernard", "camille.b@example.com"),
  (5, "Dominique", "Lefebvre", "dominique.l@example.com"),
  (6, "Marc", "Dubois", "marc.d@example.com"),
  (7, "Wyatt", "Girard", "wyatt.g@example.com"),
  (8, "Isabelle", "Mercier", "isabelle.m@example.com"),
  (9, "Joakim", "Johansson", "joakim.j@example.com"),
  (10, "Emma", "Jones", "emma.j@example.com");

-- SELECT * FROM customers;

CREATE TABLE IF NOT EXISTS menus (
  menu_id int,
  name varchar, 
  price int
);

INSERT INTO menus VALUES 
  (1,	"tomyum",	100),
  (2,	"somtam",	40),
  (3,	"noodle",	50);

-- SELECT * FROM menus;

CREATE TABLE IF NOT EXISTS transactions (
  transaction_id int,
  customer_id int, 
  menu_id int,
  quantity int,
  total_price int,
  date_time date,
  staff_id int 
);

INSERT INTO transactions VALUES 
(1,	1, 1,	1, 100, "2023-06-06", 3),
(2,	2, 1,	2, 200, "2023-06-06", 3),
(3,	3, 2,	3, 120, "2023-06-06", 3),
(4,	4, 2,	2, 80, "2023-06-06", 3),
(5,	5, 3,	1, 50, "2023-06-07", 4),
(6,	6, 3,	4, 200, "2023-06-07", 4),
(7,	7, 1, 3, 300, "2023-06-07", 4),
(8,	8, 2, 4, 160, "2023-06-07", 3),
(9, 9, 3, 1, 50, "2023-06-07", 4),
(10, 10, 1, 2, 200,	"2023-06-07",	3);

-- SELECT * FROM transactions;

CREATE TABLE IF NOT EXISTS staff (
  staff_id int,
  firstname varchar,
  lastname varchar,
  position varchar,
  income int
);
  
INSERT INTO staff VALUES 
  (1, "lisa", "manoban", "CEO", 150000), 
  (2, "rose", "park","chef", 80000),
  (3, "jisoo", "kim", "cashier", 30000),
  (4, "jennie", "kim", "cashier", 30000);

-- SELECT * FROM staff;

-- Top Spender (5 customers)
SELECT 
  customers.firstname, 
  customers.lastname,
  transactions.total_price,
  CASE
    WHEN total_price >= 300 THEN "Platinum"
    WHEN total_price >= 200 THEN "Gold"
    ELSE "Silver"
  END AS member_tier
FROM customers, transactions
  WHERE customers.customer_id = transactions.customer_id
  ORDER BY transactions.total_price DESC
  LIMIT 5;

-- restaurant income by menu
SELECT 
  menus.name, 
  menus.price,
  SUM(transactions.quantity) AS n_orders,
  SUM(transactions.quantity) * menus.price AS amount,
  CASE 
    WHEN SUM(transactions.quantity) >= 9 THEN "best seller"
    ELSE "must try"
  END AS description
FROM menus, transactions
WHERE menus.menu_id = transactions.menu_id
GROUP BY menus.name
ORDER BY n_orders DESC;

-- the most popular menu
 SELECT 
  sub1.menu_id,
  sub1.name,
  SUM(sub1.quantity) AS n_sold
FROM (
  SELECT 
    me.menu_id,
    me.name,
    tr.quantity,
    me.price,
    tr.total_price
  FROM menus AS me
  JOIN transactions AS tr
  ON me.menu_id = tr.menu_id
) AS sub1
WHERE menu_id = 2;
   
-- which staff is this transaction made by? 
-- common table expression
WITH sub1 AS (
  SELECT *
  FROM transactions
  WHERE menu_id = 1 
), sub2 AS (
  SELECT *
  FROM staff
)

SELECT 
  sub1.transaction_id,
  sub1.staff_id,
  sub2.firstname,
  sub2.lastname,
  sub2.position
FROM sub1
JOIN sub2
ON sub1.staff_id = sub2.staff_id
