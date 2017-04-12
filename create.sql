---------------------------------------------------
-- Sams Teach Yourself Oracle PL/SQL in Ten Minutes
-- http://forta.com/books/0672328666
-- Example table population scripts
---------------------------------------------------


---------------------------------------------
-- Create customers table
---------------------------------------------
CREATE TABLE customers
(
  cust_id      int       NOT NULL ,
  cust_name    char(50)  NOT NULL ,
  cust_address char(50)  NULL ,
  cust_city    char(50)  NULL ,
  cust_state   char(5)   NULL ,
  cust_zip     char(10)  NULL ,
  cust_country char(50)  NULL ,
  cust_contact char(50)  NULL ,
  cust_email   char(255) NULL 
);


---------------------------------------------
-- Create orderitems table
---------------------------------------------
CREATE TABLE orderitems
(
  order_num  int          NOT NULL ,
  order_item int          NOT NULL ,
  prod_id    char(10)     NOT NULL ,
  quantity   int          NOT NULL ,
  item_price decimal(8,2) NOT NULL
);


---------------------------------------------
-- Create orders table
---------------------------------------------
CREATE TABLE orders
(
  order_num  int  NOT NULL ,
  order_date date NOT NULL ,
  cust_id    int  NOT NULL
);

---------------------------------------------
-- Create products table
---------------------------------------------
CREATE TABLE products
(
  prod_id    char(10)      NOT NULL,
  vend_id    int           NOT NULL ,
  prod_name  char(255)     NOT NULL ,
  prod_price decimal(8,2)  NOT NULL ,
  prod_desc  varchar(1000) NULL
);


---------------------------------------------
-- Create vendors table
---------------------------------------------
CREATE TABLE vendors
(
  vend_id      int      NOT NULL,
  vend_name    char(50) NOT NULL ,
  vend_address char(50) NULL ,
  vend_city    char(50) NULL ,
  vend_state   char(5)  NULL ,
  vend_zip     char(10) NULL ,
  vend_country char(50) NULL
);


---------------------------------------------
-- Create productnotes table
---------------------------------------------
CREATE TABLE productnotes
(
  note_id    int      NOT NULL ,
  prod_id    char(10) NOT NULL ,
  note_date  date     NOT NULL ,
  note_text  clob     NULL
);


----------------------
-- Define primary keys
----------------------
ALTER TABLE customers ADD CONSTRAINT pk_customers PRIMARY KEY (cust_id);
ALTER TABLE orderitems ADD CONSTRAINT pk_orderitems PRIMARY KEY (order_num, order_item);
ALTER TABLE orders ADD CONSTRAINT pk_orders PRIMARY KEY (order_num);
ALTER TABLE products ADD CONSTRAINT pk_products PRIMARY KEY (prod_id);
ALTER TABLE vendors ADD CONSTRAINT pk_vendors PRIMARY KEY (vend_id);
ALTER TABLE productnotes ADD CONSTRAINT pk_productnotes PRIMARY KEY (note_id);


---------------------------------------------
-- Define foreign keys
---------------------------------------------
ALTER TABLE orderitems ADD CONSTRAINT fk_orderitems_orders FOREIGN KEY (order_num) REFERENCES orders (order_num);
ALTER TABLE orderitems ADD CONSTRAINT fk_orderitems_products FOREIGN KEY (prod_id) REFERENCES products (prod_id);
ALTER TABLE orders ADD CONSTRAINT fk_orders_customers FOREIGN KEY (cust_id) REFERENCES customers (cust_id);
ALTER TABLE products ADD CONSTRAINT fk_products_vendors FOREIGN KEY (vend_id) REFERENCES vendors (vend_id);
ALTER TABLE productnotes ADD CONSTRAINT fk_productnotes_products FOREIGN KEY (prod_id) REFERENCES products (prod_id);
