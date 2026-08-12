# Curs3 - exercitiu 1 - constrangeri


# ------------------------------------------------------- crearea de db si tabel

DROP DATABASE IF EXISTS online_store;
CREATE DATABASE online_store;
USE online_store;

CREATE TABLE IF NOT EXISTS computer_parts(
	part_id INT PRIMARY KEY AUTO_INCREMENT,
	part_code VARCHAR(5),
    part_type VARCHAR(20) DEFAULT 'Electronic',
    part_name VARCHAR(20) UNIQUE NOT NULL,
    part_price NUMERIC(7,2)
);

SELECT * FROM computer_parts;

# ------------------------------------------------------- inserare de date

# inserare de date manuala

INSERT INTO computer_parts SET part_code = "12345", part_name = "vent", part_price = 1000;


