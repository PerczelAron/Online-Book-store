CREATE TABLE `authors` (
  `id` SERIAL PRIMARY KEY,
  `author_name` VARCHAR(255) NOT NULL,
  `date_of_birth` DATE
);

CREATE TABLE `genres` (
  `id` SERIAL PRIMARY KEY,
  `genre` VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE `books` (
  `id` SERIAL PRIMARY KEY,
  `title` VARCHAR(255) NOT NULL,
  `release_date` DATE,
  `description` TEXT,
  `author_id` INT NOT NULL,
  `list_price` NUMERIC(10,2) NOT NULL CHECK (list_price >= 0)
);

CREATE TABLE `books_genres` (
  `book_id` INT NOT NULL,
  `genre_id` INT NOT NULL,
  PRIMARY KEY (`book_id`, `genre_id`)
);

CREATE TABLE `customers` (
  `id` SERIAL PRIMARY KEY,
  `name` VARCHAR(255) NOT NULL,
  `gender` VARCHAR(10),
  `date_of_birth` DATE,
  `postal_code` VARCHAR(10),
  `country` VARCHAR(100),
  `region` VARCHAR(100),
  `city` VARCHAR(100),
  `street` VARCHAR(100),
  `house_no` VARCHAR(10),
  `email_address` VARCHAR(255) UNIQUE NOT NULL,
  `registration_date` TIMESTAMP DEFAULT (CURRENT_TIMESTAMP)
);

CREATE TABLE `payments` (
  `id` SERIAL PRIMARY KEY,
  `method` VARCHAR(50) NOT NULL
);

CREATE TABLE `orders` (
  `id` SERIAL PRIMARY KEY,
  `order_date` TIMESTAMP DEFAULT (CURRENT_TIMESTAMP),
  `ship_date` TIMESTAMP,
  `customer_id` INT NOT NULL,
  `payment_id` INT,
  `total_items` INT CHECK (total_items >= 0),
  `total_amount` NUMERIC(12,2) CHECK (total_amount >= 0)
);

CREATE TABLE `order_items` (
  `id` SERIAL PRIMARY KEY,
  `order_id` INT NOT NULL,
  `book_id` INT NOT NULL,
  `warehouse_id` INT,
  `order_quantity` INT NOT NULL CHECK (order_quantity > 0),
  `unit_price` NUMERIC(10,2) NOT NULL CHECK (unit_price >= 0),
  `unit_price_discount` NUMERIC(5,2) CHECK (unit_price_discount >= 0) DEFAULT 0,
  `line_total` NUMERIC(12,2)
);

CREATE TABLE `warehouses` (
  `id` SERIAL PRIMARY KEY,
  `name` VARCHAR(100) NOT NULL,
  `location` VARCHAR(100),
  `country` VARCHAR(100)
);

CREATE TABLE `inventory` (
  `book_id` INT NOT NULL,
  `warehouse_id` INT NOT NULL,
  `quantity` INT NOT NULL CHECK (quantity >= 0),
  PRIMARY KEY (`book_id`, `warehouse_id`)
);

ALTER TABLE `books` ADD FOREIGN KEY (`author_id`) REFERENCES `authors` (`id`) ON DELETE CASCADE;

ALTER TABLE `books_genres` ADD FOREIGN KEY (`book_id`) REFERENCES `books` (`id`) ON DELETE CASCADE;

ALTER TABLE `books_genres` ADD FOREIGN KEY (`genre_id`) REFERENCES `genres` (`id`) ON DELETE CASCADE;

ALTER TABLE `orders` ADD FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE;

ALTER TABLE `orders` ADD FOREIGN KEY (`payment_id`) REFERENCES `payments` (`id`);

ALTER TABLE `order_items` ADD FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

ALTER TABLE `order_items` ADD FOREIGN KEY (`book_id`) REFERENCES `books` (`id`) ON DELETE CASCADE;

ALTER TABLE `order_items` ADD FOREIGN KEY (`warehouse_id`) REFERENCES `warehouses` (`id`) ON DELETE CASCADE;

ALTER TABLE `inventory` ADD FOREIGN KEY (`book_id`) REFERENCES `books` (`id`) ON DELETE CASCADE;

ALTER TABLE `inventory` ADD FOREIGN KEY (`warehouse_id`) REFERENCES `warehouses` (`id`) ON DELETE CASCADE;
