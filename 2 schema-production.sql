
-- Désactiver temporairement les contraintes pr éviter les pb
SET FOREIGN_KEY_CHECKS = 0 ;
-- https://stackoverflow.com/questions/1905470/cannot-delete-or-update-a-parent-row-a-foreign-key-constraint-fails

-- CREATE SCHEMA

DROP SCHEMA IF EXISTS production ;
CREATE SCHEMA production ;
USE production ;


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
	list_price DECIMAL (10, 2) NOT NULL
-- 	FOREIGN KEY (category_id) REFERENCES categories (category_id) ON DELETE CASCADE ON UPDATE CASCADE,
-- 	FOREIGN KEY (brand_id) REFERENCES brands (brand_id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- The production.stocks table stores the inventory information i.e. the quantity of a particular product in a specific store.

CREATE TABLE stocks (
	store_id INT,
	product_id INT,
	quantity INT,
	PRIMARY KEY (store_id, product_id)
-- 	FOREIGN KEY (product_id) REFERENCES products (product_id) ON DELETE CASCADE ON UPDATE CASCADE
-- 	FOREIGN KEY (store_id) REFERENCES sales.stores (store_id) ON DELETE CASCADE ON UPDATE CASCADE,
);
