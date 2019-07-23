USE Broker_Project;
CREATE TABLE IF NOT EXISTS customers(
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    last_name VARCHAR(40),
    first_name VARCHAR(40),
    phone VARCHAR(10),
    fmail VARCHAR(40),
    street VARCHAR(40),
    city VARCHAR(20),
    state VARCHAR(20),
    zip_code CHAR (5)
);

    
CREATE TABLE IF NOT EXISTS staffs(
    staff_id INT AUTO_INCREMENT PRIMARY KEY,
    last_name VARCHAR(40),
    irst_name VARCHAR(40),
    phone INT(10),
    email VARCHAR(40),
    Active TINYINT,
    store_id INT,
    manager_id INT,
    FOREIGN KEY(store_id) REFERENCES stores(store_id),
    FOREIGN KEY(manager_id) REFERENCES staffs(staff_id)
    );

CREATE TABLE IF NOT EXISTS orders(
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    order_status TINYINT,
    order_date DATE,
    required_date DATE,
    shipped_date DATE,
    store_id INT,
    staff_id INT,

    FOREIGN KEY(customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY(staff_id) REFERENCES staffs(staff_id),
    FOREIGN KEY(store_id) REFERENCES stores(store_id)
    );


CREATE TABLE IF NOT EXISTS stores(
    store_id INT AUTO_INCREMENT PRIMARY KEY,
    store_name VARCHAR(40),
    phone VARCHAR(20),
    email VARCHAR(40),
    street VARCHAR(40),
    city VARCHAR(20),
    state VARCHAR(40),
    zip_code CHAR (5)
    );


CREATE TABLE IF NOT EXISTS order_items(
    order_id INT,
    item_id INT,
    product_id INT,
    quantity INT(25),
    liste_price DECIMAL(10,2),
    discount DECIMAL(4,2) DEFAULT 0,
    
    PRIMARY KEY(order_id, item_id),
    FOREIGN KEY(product_id) REFERENCES products(product_id),
    FOREIGN KEY(order_id) REFERENCES orders(order_id)
    );

   SET FOREIGN_KEY_CHECKS = 0 ;
-- https://stackoverflow.com/questions/1905470/cannot-delete-or-update-a-parent-row-a-foreign-key-constraint-fails

-- CREATE SCHEMA

DROP SCHEMA IF EXISTS production ;
CREATE SCHEMA production ;



-- CREATE TABLES

-- The categories table stores the bike’s categories such as children bicycles, comfort bicycles, and electric bikes.

CREATE TABLE categories (
    category_id INT AUTO_INCREMENT  PRIMARY KEY,
    category_name VARCHAR (255) NOT NULL
);

-- The brands table stores the brand’s information of bikes (caaracteristiques, particularités des vélos), for example, Electra, Haro, and Heller

CREATE TABLE brands (
    brand_id INT AUTO_INCREMENT  PRIMARY KEY,
    brand_name VARCHAR (255) NOT NULL
);

-- The products table stores the product’s information such as name, brand, category, model year, and list price.
-- Each product belongs to a brand specified by the brand_id column. Hence, a brand may have zero or many products.
-- Each product also belongs a category specified by the category_id column. Also, each category may have zero or many products.

CREATE TABLE products (
    product_id INT AUTO_INCREMENT  PRIMARY KEY,
    product_name VARCHAR (255) NOT NULL,
    brand_id INT NOT NULL,
    category_id INT NOT NULL,
    model_year SMALLINT NOT NULL,
    list_price DECIMAL (10, 2) NOT NULL,
 FOREIGN KEY (category_id) REFERENCES categories (category_id) ON DELETE CASCADE ON UPDATE CASCADE,
 FOREIGN KEY (brand_id) REFERENCES brands (brand_id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- The production.stocks table stores the inventory information i.e. the quantity of a particular product in a specific store.

CREATE TABLE stocks (
    Store_id INT,
    product_id INT,
    quantity INT,
  PRIMARY KEY (store_id, product_id),
  FOREIGN KEY (product_id) REFERENCES products (product_id) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (store_id) REFERENCES stores (store_id) ON DELETE CASCADE ON UPDATE CASCADE
  );