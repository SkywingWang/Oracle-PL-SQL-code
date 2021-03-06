select prod_name from products;
select prod_id,prod_name,prod_price from products;
select vend_id from products;
select distinct vend_id from products;
select products.prod_name from products;
select products.prod_name from products;
select SYS_CONTEXT('USERENV','INSTANCE_NAME') from dual;
select prod_name from products order by prod_name;
select prod_id,prod_price,prod_name from products order by prod_price,prod_name; 
select prod_name,prod_price from products where prod_price = 2.50;
select prod_name,prod_price from products where prod_name = 'Fuses';
select prod_name,prod_price from products where prod_price<10;
select vend_id,prod_name from products where vend_id <> 1003;
select vend_id,prod_name from products where vend_id != 1003;
select prod_name,prod_price from products where prod_price between 5 and 10;
select prod_name from products where prod_price IS NULL;
select cust_id from customers where cust_email is null;
select prod_id,prod_price,prod_name from products where vend_id = 1003 and prod_price <= 10;
select prod_name,prod_price from products where vend_id = 1002 or vend_id = 1003;
set linesize 20
show linesize
set linesize 60
 column prod_name format a60
select prod_name,prod_price from products where (vend_id = 1002 or vend_id = 1003) and prod_price >= 10;
select prod_name,prod_price from products where vend_id not in (1002,1003) order by prod_name; 
select prod_id,prod_name from products where prod_name like 'Jet%';
select prod_id,prod_name from products where prod_name like '%anvil%';
select prod_id,prod_name from products where prod_name like '_ ton anvil%';
select prod_name from products where REGEXP_LIKE(prod_name,'1000') order by prod_name;
select prod_name from products where REGEXP_LIKE(prod_name,'.000') order by prod_name;
select prod_name from products where REGEXP_LIKE(prod_name,'1000|2000') order by prod_name;
select prod_name from products where REGEXP_LIKE(prod_name,'[123] ton') order by prod_name;
select prod_name from products where regexp_like(prod_name,'1|2|3 ton') order by prod_name;
select prod_name from products where regexp_like(prod_name,'[^2] ton') order by prod_name;
select prod_name from products where regexp_like(prod_name,'[1-5] ton') order by prod_name;
select vend_name from vendors where regexp_like(vend_name,'.') order by vend_name;
select RTrim(vend_name) || ',('  || RTrim(vend_country) || ')' from vendors order by vend_name;
select Rtrim(vend_name) || ',(' || RTrim(vend_country) || ')' as vend_title from vendors order by vend_name;
select prod_id,quantity,item_price from orderitems where order_num = 20005;
select prod_id,quantity,item_price,quantity*item_price as expanded_price from orderitems where order_num = 20005;
select vend_name,upper(vend_name) as vend_name_upcase from vendors order by vend_name;
select cust_name,cust_contact from customers where cust_contact = 'Y Lie';
select cust_name,cust_contact from customers where Soundex(cust_contact) = Soundex('y lie');
select cust_id,order_num from orders where order_date = TO_DATE('2015-02-01','yyyy-mm-dd');
select cust_id,order_num from orders where order_date >= TO_DATE('2015-02-01','yyyy-mm-dd') and order_date < TO_DATE('2015-02-02','yyyy-mm-dd');
select cust_id,order_num from orders where order_date between TO_DATE('2015-02-01','yyyy-mm-dd') and TO_DATE('2015-02-28','yyyy-mm-dd');
select cust_id,order_num from orders where extract(year from order_date) = 2015 and extract(month from order_date) = 2;
select AVG(prod_price) AS avg_price from products;
select AVG(prod_price) AS avg_price from products where vend_id = 1003;
select count(*) as num_cust from customers;
select count(cust_email) as num_cust from customers;
select max(prod_price) as max_price from products;
select min(prod_price) as min_price from products;
select sum(quantity) as items_ordered from orderitems where order_num = 20005;
select sum(item_price*quantity) as total_price from orderitems where order_num = 20005;
select avg(distinct prod_price) as avg_price from products where vend_id = 1003;
select count(*) as num_items,min(prod_price) as price_min,MAX(prod_price) as price_max, AVG(prod_price) as price_avg from products;   
select count(*) as num_prods from products where vend_id = 1003;
select vend_id,count(*) as num_prods from products group by vend_id;
select cust_id,count(*) as orders from orders group by cust_id having count(*) >= 2;
select vend_id,count(*) as num_prods from products where prod_price >= 10 group by vend_id having count(*) >= 2;
select vend_id,count(*) as num_prods from products group by vend_id having count(*) >=2;
select order_num,sum(quantity*item_price) as ordertotal from orderitems group by order_num having sum(quantity*item_price) >= 50;
select order_num,sum(quantity*item_price) as ordertotal from orderitems group by order_num having sum(quantity*item_price) >= 50 order by ordertotal;
select order_num from orderitems where prod_id = 'TNT2';
select cust_id from orders where order_num IN (20005,20007);
select cust_id from orders where order_num IN (SELECT order_num from orderitems where prod_id = 'TNT2');
select order_num FROM orderitems WHERE prod_id = 'TNT2';
SELECT cust_id FROM orders WHERE order_num IN (20005,20007);
SELECT cust_name, cust_contact FROM customers WHERE cust_id IN (10001,10004);
SELECT cust_name, cust_contact FROM customers WHERE cust_id IN (SELECT cust_id FROM orders WHERE order_num IN (SELECT order_num FROM orderitems WHERE prod_id = 'TNT2'));
SELECT COUNT(*) AS orders FROM orders WHERE cust_id = 10001; 
SELECT cust_name,cust_state,(SELECT COUNT(*) FROM orders WHERE orders.cust_id = customers.cust_id) AS orders FROM customers ORDER BY cust_name;
select vend_name,trim(prod_name),prod_price FROM vendors,products WHERE vendors.vend_id = products.vend_id ORDER BY vend_name, prod_name;
SELECT prod_name,vend_name,prod_price,quantity FROM orderitems,products,vendors WHERE products.vend_id = vendors.vend_id and orderitems.prod_id= products.prod_id and order_num = 20005;
SELECT cust_name,cust_contact FROM customers WHERE cust_id IN (SELECT cust_id FROM orders WHERE order_num IN (SELECT order_num FROM orderitems WHERE prod_id = 'TNT2'));
SELECT cust_name,cust_contact FROM customers,orders,orderitems WHERE customers.cust_id = orders.cust_id AND orderitems.order_num = orders.order_num AND prod_id = 'TNT2'; 
SELECT cust_name,cust_contact FROM customers INNER JOIN orders ON customers.cust_id = orders.cust_id INNER JOIN orderitems ON orderitems.order_num = orders.order_num WHERE prod_id = 'TNT2';
SELECT prod_id,prod_name FROM products WHERE vend_id = (SELECT vend_id FROM products WHERE prod_id = 'DTNTR');
SELECT p1.prod_id,p1.prod_name FROM products p1 INNER JOIN products p2 on p1.vend_id = p2.vend_id where p2.prod_id = 'DTNTR';
SELECT customers.cust_id,orders.order_num FROM customers INNER JOIN orders ON customers.cust_id = orders.cust_id;
SELECT customers.cust_id,orders.order_num FROM customers LEFT OUTER JOIN orders ON customers.cust_id = orders.cust_id;
SELECT customers.cust_id,orders.order_num FROM customers RIGHT OUTER JOIN orders ON orders.cust_id = customers.cust_id;
SELECT customers.cust_name, COUNT(orders.order_num) AS num_ord FROM customers INNER JOIN orders ON customers.cust_id = orders.cust_id group by customers.cust_name;
SELECT customers.cust_name,COUNT(orders.order_num) AS num_ord FROM customers LEFT OUTER JOIN orders ON customers.cust_id = orders.cust_id GROUP BY customers.cust_name;
SELECT vend_id,prod_id,prod_price FROM products WHERE prod_price <= 5;
SELECT vend_id,prod_id,prod_price FROM products WHERE prod_price <= 5 UNION SELECT vend_id,prod_id,prod_price FROM products WHERE vend_id IN (1001,1002);
INSERT INTO Customers(cust_id,cust_name,cust_address,cust_city,cust_state,cust_zip,cust_country) VALUES(10006,'Pep E. LaPew','100 Main Stret','Los Angeles','CA','90046','USA');
UPDATE customers SET cust_email = 'elmer@fudd.com' WHERE cust_id = 10005;
UPDATE customers SET cust_name = 'The Fudds',cust_email = 'elmer@fudd.com' WHERE cust_id = 10005;
SELECT cust_name,cust_contact FROM customers,orders,orderitems WHERE customers.cust_id = orders.cust_id AND orderitems.order_num = orders.order_num AND prod_id = 'TNT2';
CREATE VIEW productcustomers AS SELECT cust_name,cust_contact,prod_id FROM customers,orders,orderitems WHERE customers.cust_id = orders.cust_id AND orderitems.order_num = orders.order_num;
SELECT cust_name,cust_contact FROM productcustomers WHERE prod_id = 'TNT2';
CREATE OR REPLACE PROCEDURE Hello IS BEGIN
  DBMS_OUTPUT.PUT_LINE('Hello World');
END;
DECLARE 
  CURSOR c_vendors IS 
  SELECT vend_id,vend_name,vend_address,vend_city,vend_state,vend_zip,vend_country FROM vendors;
BEGIN
  OPEN c_vendors;
  CLOSE c_vendors;
END;