/*
--------------------------------------------------------------------
Â© 2017 sqlservertutorial.net All Rights Reserved
--------------------------------------------------------------------
Name   : BikeStores
Link   : http://www.sqlservertutorial.net/load-sample-database/
Version: 1.0
--------------------------------------------------------------------
*/
-- create tables
CREATE TABLE categories (
	category_id NUMBER PRIMARY KEY,
	category_name VARCHAR2(255) NOT NULL
);

CREATE TABLE brands (
	brand_id NUMBER PRIMARY KEY,
	brand_name VARCHAR2(255) NOT NULL
);

CREATE TABLE products (
	product_id NUMBER PRIMARY KEY,
	product_name VARCHAR2(255) NOT NULL,
	brand_id NUMBER NOT NULL,
	category_id NUMBER NOT NULL,
	model_year NUMBER NOT NULL,
	list_price NUMBER(10, 2) NOT NULL,
	FOREIGN KEY (category_id) REFERENCES categories (category_id) ON DELETE CASCADE,
	FOREIGN KEY (brand_id) REFERENCES brands (brand_id) ON DELETE CASCADE
);

CREATE TABLE customers (
	customer_id NUMBER PRIMARY KEY,
	first_name VARCHAR2(255) NOT NULL,
	last_name VARCHAR2(255) NOT NULL,
	phone VARCHAR2(25),
	email VARCHAR2(255) NOT NULL,
	street VARCHAR2(255),
	city VARCHAR2(50),
	state VARCHAR2(25),
	zip_code VARCHAR2(5)
);

CREATE TABLE stores (
	store_id NUMBER PRIMARY KEY,
	store_name VARCHAR2(255) NOT NULL,
	phone VARCHAR2(25),
	email VARCHAR2(255),
	street VARCHAR2(255),
	city VARCHAR2(255),
	state VARCHAR2(10),
	zip_code VARCHAR2(5)
);

CREATE TABLE staffs (
	staff_id NUMBER PRIMARY KEY,
	first_name VARCHAR2(50) NOT NULL,
	last_name VARCHAR2(50) NOT NULL,
	email VARCHAR2(255) NOT NULL UNIQUE,
	phone VARCHAR2(25),
	active NUMBER(2) NOT NULL,
	store_id NUMBER NOT NULL,
	manager_id NUMBER,
	FOREIGN KEY (store_id) REFERENCES stores (store_id) ON DELETE CASCADE,
	FOREIGN KEY (manager_id) REFERENCES staffs (staff_id)
  );

CREATE TABLE orders (
	order_id NUMBER PRIMARY KEY,
	customer_id NUMBER,
	order_status NUMBER(2) NOT NULL,
	-- Order status: 1 = Pending; 2 = Processing; 3 = Rejected; 4 = Completed
	order_date VARCHAR2(8) NOT NULL,
	required_date VARCHAR2(8) NOT NULL,
	shipped_date VARCHAR2(8),
	store_id NUMBER NOT NULL,
	staff_id NUMBER NOT NULL,
	FOREIGN KEY (customer_id) REFERENCES customers (customer_id) ON DELETE CASCADE,
	FOREIGN KEY (store_id) REFERENCES stores (store_id) ON DELETE CASCADE,
	FOREIGN KEY (staff_id) REFERENCES staffs (staff_id)
);

CREATE TABLE order_items (
	order_id NUMBER,
	item_id NUMBER,
	product_id NUMBER NOT NULL,
	quantity NUMBER NOT NULL,
	list_price NUMBER(10, 2) NOT NULL,
	discount NUMBER(4, 2) DEFAULT 0 NOT NULL,
	PRIMARY KEY (order_id, item_id),
	FOREIGN KEY (order_id) REFERENCES orders (order_id) ON DELETE CASCADE,
	FOREIGN KEY (product_id) REFERENCES products (product_id) ON DELETE CASCADE
);

CREATE TABLE stocks (
	store_id NUMBER,
	product_id NUMBER,
	quantity NUMBER,
	PRIMARY KEY (store_id, product_id),
	FOREIGN KEY (store_id) REFERENCES stores (store_id) ON DELETE CASCADE,
	FOREIGN KEY (product_id) REFERENCES products (product_id) ON DELETE CASCADE
);