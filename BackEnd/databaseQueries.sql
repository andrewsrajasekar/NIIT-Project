CREATE TABLE category(
        id IDENTITY,
        name VARCHAR(50),
        description VARCHAR(255),
        image_url VARCHAR(50),
        is_active BOOLEAN,
        CONSTRAINT pk_category_id PRIMARY KEY(id)
);

CREATE TABLE user_detail(
id IDENTITY,
first_name VARCHAR(50),
last_name VARCHAR(50),
role VARCHAR(50),
enabled BOOLEAN,
password VARCHAR(60),
email VARCHAR(100),
contact_number varchar(15),
CONSTRAINT pk_category_id PRIMARY KEY(id),
);

CREATE TABLE product(
id IDENTITY,
code VARCHAR(20),
name VARCHAR(50),
brand VARCHAR(50),
description VARCHAR(255),
unit_price DECIMAL(10,2),
quantity INT,
is_active BOOLEAN,
category_id INT,
supplier_id INT,
purchases INT DEFAULT 0,
views INT DEFAULT 0,
CONSTRAINT pk_product_id PRIMARY KEY(id),
CONSTRAINT fk_product_category_id FOREIGN KEY (category_id) REFERENCES category (id),
CONSTRAINT fk_product_supplier_id FOREIGN KEY (supplier_id) REFERENCES user_detail (id),
);
--the address table to store the user billing and shipping addresses
CREATE TABLE address(
id IDENTITY,
user_id int,
address_line_one VARCHAR(100),
address_line_two VARCHAR(100),
city VARCHAR(20),
state VARCHAR(20),
country VARCHAR(20),
postal_code VARCHAR(10),
is_billing BOOLEAN,
is_shipping BOOLEAN,
	CONSTRAINT fk_address_user_id FOREIGN KEY (user_id ) REFERENCES user_detail (id),
	CONSTRAINT pk_address_id PRIMARY KEY (id)
);

-- the cart table to store the user cart top-level details
CREATE TABLE cart (
	id IDENTITY,
	user_id int,
	grand_total DECIMAL(10,2),
	cart_lines int,
	CONSTRAINT fk_cart_user_id FOREIGN KEY (user_id ) REFERENCES user_detail (id),
	CONSTRAINT pk_cart_id PRIMARY KEY (id)
);

--adding three categories
INSERT INTO category(name,description,image_url,is_active)VALUES ('Mobiles Phones','This is a Description for Mobiles!','CAT_1.png',true);
INSERT INTO category(name,description,image_url,is_active)VALUES ('Mobiles Phones Accessories','This is a Description for Accessories!','CAT_2.png',true);
INSERT INTO category(name,description,image_url,is_active)VALUES ('Laptops','This is a Description for Laptops!','CAT_3.png',true);

--adding three users
INSERT INTO user_detail
(first_name,last_name,role,enabled,password,email,contact_number)
VALUES('Andrews','Rajasekar','ADMIN',true,'$2b$10$YbTkFnPou4en6LmW7jV2MeKf8gATlBoo1kURF4ABX3HMlN9AHZwpy','andrewsrajasekar@gmail.com','9791914303');

INSERT INTO user_detail
(first_name,last_name,role,enabled,password,email,contact_number)
VALUES('MS','Dhoni','SUPPLIER',true,'$2b$10$ELAvkXkt/4DHdnodp97xT.7BY2ioTn/DaSjFDeDw7A6E0xUeZJS2y','msdhoni@gmail.com','9840198402');

INSERT INTO user_detail
(first_name,last_name,role,enabled,password,email,contact_number)
VALUES('Cheetah','Siva','SUPPLIER',true,'$2b$10$2SAGB6Vyp6m1RMtEMujw6eza/iMERs57xPGxUWn.t9jBhsITXNVG6','cheetahsiva@gmail.com','9999988888');

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDABC123DEFX', 'Moto Z2 Play', 'MOTO', 'A Phone Updated from Z to its Second Version!', 28000, 6, true, 1, 2, 0, 0 );
INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDDEF123DEFX', 'Iphone X', 'APPLE', 'A New Designed Phone by Apple!', 102000, 4, true, 1, 3, 0, 0 );
INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDPQR123WGTX', '128gb Memory Card', 'Transcend', 'A 128gb Storage Available!', 3500, 10, true, 2, 2, 0, 0 );
INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDMNO123PQRX', 'Dell Inspiron 7560', 'DELL', 'A Budget Gaming Laptop by Dell!', 72000, 5, true, 3, 2, 0, 0 );
INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDABCXYZDEFX', 'MacBook Pro', 'APPLE', 'A Qualtiy Laptop from Apple!', 93000, 4, true, 3, 3, 0, 0 );