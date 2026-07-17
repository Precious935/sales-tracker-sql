CREATE DATABASE Sales_Tracker;


USE Sales_Tracker;
-- 1. Regions Table
CREATE TABLE Regions (
    region_id INT PRIMARY KEY AUTO_INCREMENT,
    region_name VARCHAR(50) NOT NULL
);

-- 2. Products Table
CREATE TABLE Products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50),
    price DECIMAL(10, 2) NOT NULL
);

-- 3. Orders Table
CREATE TABLE Orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT,
    region_id INT,
    quantity INT NOT NULL,
    order_date DATE,
    FOREIGN KEY (product_id) REFERENCES Products(product_id),
    FOREIGN KEY (region_id) REFERENCES Regions(region_id)
);
INSERT INTO Regions (region_name) VALUES ('North America'), ('Europe'), ('Asia');

INSERT INTO Products (product_name, category, price) VALUES 
('Laptop', 'Electronics', 1200.00),
('Smartphone', 'Electronics', 800.00),
('Desk Chair', 'Furniture', 150.00),
('Monitor', 'Electronics', 300.00),
('Coffee Table', 'Furniture', 200.00);

INSERT INTO Orders (product_id, region_id, quantity, order_date) VALUES 
(1, 1, 2, '2026-01-10'),
(2, 2, 5, '2026-01-12'),
(3, 1, 10, '2026-01-15'),
(1, 3, 1, '2026-01-20'),
(4, 2, 3, '2026-01-22'),
(5, 3, 2, '2026-01-25');

SELECT * FROM Regions;
SELECT * FROM Products;
SELECT * FROM Orders;
SELECT SUM(quantity) AS Total_Items_sold FROM Orders;
SELECT product_id, SUM(quantity) AS total_qty FROM Orders GROUP BY product_id;