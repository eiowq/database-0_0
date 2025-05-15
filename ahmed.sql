 

mysql> use ahmed
Database changed
mysql> show database;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'database' at line 1
mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| ahmed              |
| information_schema |
| mysql              |
| performance_schema |
| sys                |
| world              |
+--------------------+
6 rows in set (0.021 sec)

mysql> show tables;
Empty set (0.026 sec)

mysql> create table customers (id int primary key auto_increment, firstname varchar(50) not null, lastname varchar(50) not null, address varchar(100), mobile varchar(20), email varchar(50));
Query OK, 0 rows affected (0.462 sec)

mysql> create table products (id int primary key auto_increment, name varchar(50) not null, color varchar(30), price decimal(10,2) not null);
Query OK, 0 rows affected (0.507 sec)

mysql> create table orders (id int primary key auto_increment, customerid int not null, orderdate date not null, shippeddate date, foreign key (customerid) references customers(id));
Query OK, 0 rows affected (0.568 sec)

mysql> create table orderdetails (orderid int not null, productid int not null, quantity int not null, primary key (orderid, productid), foreign key (orderid) references orders(id), foreign key (productid) references products(id));
Query OK, 0 rows affected (0.671 sec)

mysql> insert into customers (id, firstname, lastname, address, mobile, email) values (1, 'ahmed', 'mohamed', 'cairo', '01001234567', 'ahmed@mail.com'), (2, 'sara', 'ali', 'alex', '01111222333', 'sara@mail.com'), (3, 'mohamed', 'khaled', 'giza', '01234567890', 'mohamed@mail.com');
Query OK, 3 rows affected (0.312 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> insert into products (id, name, color, price) values (101, 'phone', 'black', 5000), (102, 'laptop', 'silver', 10000), (103, 'headset', 'white', 1000), (104, 'bag', 'blue', 500);
Query OK, 4 rows affected (0.117 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> insert into orders (id, customerid, orderdate, shippeddate) values (1001, 1, '2025-01-01', '2025-01-03'), (1002, 2, '2025-01-05', null), (1003, 3, '2025-01-10', '2025-01-12');
Query OK, 3 rows affected (0.110 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> insert into orderdetails (orderid, productid, quantity) values (1001, 101, 1), (1001, 103, 2), (1002, 102, 1), (1002, 104, 1), (1003, 101, 1), (1003, 104, 3);
Query OK, 6 rows affected (0.241 sec)
Records: 6  Duplicates: 0  Warnings: 0

mysql> select * from customers;
+----+-----------+----------+---------+-------------+------------------+
| id | firstname | lastname | address | mobile      | email            |
+----+-----------+----------+---------+-------------+------------------+
|  1 | ahmed     | mohamed  | cairo   | 01001234567 | ahmed@gmail.com   |
|  2 | sara      | ali      | alex    | 01111222333 | sara@gmail.com    |
|  3 | mohamed   | khaled   | giza    | 01234567890 | mohamed@gmail.com |
+----+-----------+----------+---------+-------------+------------------+
3 rows in set (0.009 sec)

mysql> select * from products;
+-----+---------+--------+----------+
| id  | name    | color  | price    |
+-----+---------+--------+----------+
| 101 | phone   | black  |  5000.00 |
| 102 | laptop  | silver | 10000.00 |
| 103 | headset | white  |  1000.00 |
| 104 | bag     | blue   |   500.00 |
+-----+---------+--------+----------+
4 rows in set (0.008 sec)

mysql> select * from orders;
+------+------------+------------+-------------+
| id   | customerid | orderdate  | shippeddate |
+------+------------+------------+-------------+
| 1001 |          1 | 2025-01-01 | 2025-01-03  |
| 1002 |          2 | 2025-01-05 | NULL        |
| 1003 |          3 | 2025-01-10 | 2025-01-12  |
+------+------------+------------+-------------+
3 rows in set (0.008 sec)

mysql> select * from orderdetails;
+---------+-----------+----------+
| orderid | productid | quantity |
+---------+-----------+----------+
|    1001 |       101 |        1 |
|    1001 |       103 |        2 |
|    1002 |       102 |        1 |
|    1002 |       104 |        1 |
|    1003 |       101 |        1 |
|    1003 |       104 |        3 |
+---------+-----------+----------+
6 rows in set (0.008 sec)


mysql> insert into customers (id, firstname, lastname, address, mobile, email) values (4, 'ali', 'hassan', 'portsaid', '01011112222', 'ali@mail.com'), (5, 'nada', 'samir', 'luxor', '01122223333', 'nada@mail.com'), (6, 'omar', 'youssef', 'aswan', '01233334444', 'omar@mail.com');
Query OK, 3 rows affected (0.249 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> insert into products (id, name, color, price) values (105, 'mouse', 'red', 250), (106, 'keyboard', 'black', 600), (107, 'monitor', 'blue', 3500), (108, 'printer', 'white', 2000);
Query OK, 4 rows affected (0.225 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> insert into orders (id, customerid, orderdate, shippeddate) values (1004, 4, '2025-02-01', '2025-02-03'), (1005, 5, '2025-02-05', null), (1006, 6, '2025-02-10', '2025-02-12');
Query OK, 3 rows affected (0.222 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> insert into orderdetails (orderid, productid, quantity) values (1004, 105, 2), (1004, 106, 1), (1005, 107, 1), (1005, 108, 1), (1006, 105, 3), (1006, 107, 1);
Query OK, 6 rows affected (0.229 sec)
Records: 6  Duplicates: 0  Warnings: 0

mysql> insert into customers (id, firstname, lastname, address, mobile, email) values (7, 'yara', 'fouad', 'ismailia', '01044445555', 'yara@mail.com'), (8, 'tarek', 'nabil', 'minya', '01155556666', 'tarek@mail.com');
Query OK, 2 rows affected (0.229 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> insert into products (id, name, color, price) values (109, 'ssd', 'gray', 1200), (110, 'router', 'black', 800);
Query OK, 2 rows affected (0.218 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> select * from customers;
+----+-----------+----------+----------+-------------+------------------+
| id | firstname | lastname | address  | mobile      | email            |
+----+-----------+----------+----------+-------------+------------------+
|  1 | ahmed     | mohamed  | cairo    | 01001234567 | ahmed@gmail.com   |
|  2 | sara      | ali      | alex     | 01111222333 | sara@gmail.com    |
|  3 | mohamed   | khaled   | giza     | 01234567890 | mohamed@gmail.com |
|  4 | ali       | hassan   | portsaid | 01011112222 | ali@gmail.com     |
|  5 | nada      | samir    | luxor    | 01122223333 | nada@gmail.com    |
|  6 | omar      | youssef  | aswan    | 01233334444 | omar@gmail.com    |
|  7 | yara      | fouad    | ismailia | 01044445555 | yara@gmail.com    |
|  8 | tarek     | nabil    | minya    | 01155556666 | tarek@gmail.com   |
+----+-----------+----------+----------+-------------+------------------+
8 rows in set (0.009 sec)

mysql> select * from products;
+-----+----------+--------+----------+
| id  | name     | color  | price    |
+-----+----------+--------+----------+
| 101 | phone    | black  |  5000.00 |
| 102 | laptop   | silver | 10000.00 |
| 103 | headset  | white  |  1000.00 |
| 104 | bag      | blue   |   500.00 |
| 105 | mouse    | red    |   250.00 |
| 106 | keyboard | black  |   600.00 |
| 107 | monitor  | blue   |  3500.00 |
| 108 | printer  | white  |  2000.00 |
| 109 | ssd      | gray   |  1200.00 |
| 110 | router   | black  |   800.00 |
+-----+----------+--------+----------+
10 rows in set (0.009 sec)