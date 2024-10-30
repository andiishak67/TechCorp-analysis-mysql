#create database techcorp;\

CREATE TABLE Products (
  product_id INT AUTO_INCREMENT PRIMARY KEY,
  product_name VARCHAR(100) NOT NULL,
  category VARCHAR(50),
  price DECIMAL(10,2),
  stock_quantity INT
);

CREATE TABLE Customers (
  customer_id INT AUTO_INCREMENT PRIMARY KEY,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  email VARCHAR(100) UNIQUE,
  phone VARCHAR(20),
  address VARCHAR(200)
);

CREATE TABLE Orders (
  order_id INT AUTO_INCREMENT PRIMARY KEY,
  customer_id INT NOT NULL,
  order_date DATE NOT NULL,
  total_amount DECIMAL(10,2) NOT NULL,
  FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

CREATE TABLE Employees (
  employee_id INT AUTO_INCREMENT PRIMARY KEY,  
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  email VARCHAR(100) UNIQUE,
  phone VARCHAR(20),
  hire_date DATE,
  department VARCHAR(50)
);

CREATE TABLE SupportTickets (
  ticket_id INT AUTO_INCREMENT PRIMARY KEY,  
  customer_id INT,
  employee_id INT,
  issue TEXT,
  STATUS VARCHAR(20),
  created_at DATETIME,
  resolved_at DATETIME,
  FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
  FOREIGN KEY (employee_id) REFERENCES Employees(employee_id)
);


# Data Input for Tables

ALTER TABLE Products
ADD discount INT;

CREATE TABLE OrderDetails (
  order_detail_id INT AUTO_INCREMENT PRIMARY KEY,
  order_id INT,
  product_id INT,
  quantity INT,
  unit_price DECIMAL(10, 2),
  FOREIGN KEY (order_id) REFERENCES Orders(order_id),
  FOREIGN KEY (product_id) REFERENCES Products(product_id)
);


INSERT INTO Products (product_name, category, price, stock_quantity, discount)
VALUES
('Laptop Pro 15', 'Laptop', 1500.00, 100, 0),
('Smartphone X', 'Smartphone', 800.00, 200, 0),
('Wireless Mouse', 'Accessories', 25.00, 500, 0),
('USB-C Charger', 'Accessories', 20.00, 300, 0),
('Gaming Laptop', 'Laptop', 2000.00, 50, 10),
('Budget Smartphone', 'Smartphone', 300.00, 150, 5),
('Noise Cancelling Headphones', 'Accessories', 150.00, 120, 15),
('Wireless Earphones', 'Accessories', 100.00, 100, 10);

INSERT INTO Customers (first_name, last_name, email, phone, address)
VALUES
('John', 'Doe', 'john.doe@example.com', '123-456-7890', '123 Elm Street'),
('Jane', 'Smith', 'jane.smith@example.com', '123-456-7891', '456 Oak Street'),
('Emily', 'Johnson', 'emily.johnson@example.com', '123-456-7892', '789 Pine Street'),
('Michael', 'Brown', 'michael.brown@example.com', '123-456-7893', '101 Maple Street'),
('Sarah', 'Davis', 'sarah.davis@example.com', '123-456-7894', '202 Birch Street');

INSERT INTO Orders (customer_id, order_date, total_amount)
VALUES
(1, '2023-07-01', 1525.00),
(2, '2023-07-02', 820.00),
(3, '2023-07-03', 25.00),
(1, '2023-07-04', 2010.00),
(4, '2023-07-05', 300.00),
(2, '2023-07-06', 315.00),
(5, '2023-07-07', 165.00);

INSERT INTO OrderDetails (order_id, product_id, quantity, unit_price)
VALUES
(1, 1, 1, 1500.00),
(1, 3, 1, 25.00),
(2, 2, 1, 800.00),
(2, 4, 1, 20.00),
(3, 3, 1, 25.00),
(4, 5, 1, 2000.00),
(4, 6, 1, 10.00),
(5, 6, 1, 300.00),
(6, 6, 1, 300.00),
(7, 7, 1, 150.00),
(7, 4, 1, 15.00);

INSERT INTO Employees (first_name, last_name, email, phone, hire_date, department)
VALUES
('Alice', 'Williams', 'alice.williams@example.com', '123-456-7895', '2022-01-15', 'Support'),
('Bob', 'Miller', 'bob.miller@example.com', '123-456-7896', '2022-02-20', 'Sales'),
('Charlie', 'Wilson', 'charlie.wilson@example.com', '123-456-7897', '2022-03-25', 'Development'),
('David', 'Moore', 'david.moore@example.com', '123-456-7898', '2022-04-30', 'Support'),
('Eve', 'Taylor', 'eve.taylor@example.com', '123-456-7899', '2022-05-10', 'Sales');

INSERT INTO SupportTickets (customer_id, employee_id, issue, `status`, created_at, resolved_at)
VALUES
(1, 1, 'Cannot connect to Wi-Fi', 'resolved', '2023-07-01 10:00:00', '2023-07-01 11:00:00'),
(2, 1, 'Screen flickering', 'resolved', '2023-07-02 12:00:00', '2023-07-02 13:00:00'),
(3, 1, 'Battery drains quickly', 'open', '2023-07-03 14:00:00', NULL),
(4, 2, 'Late delivery', 'resolved', '2023-07-04 15:00:00', '2023-07-04 16:00:00'),
(5, 2, 'Damaged product', 'open', '2023-07-05 17:00:00', NULL),
(1, 3, 'Software issue', 'resolved', '2023-07-06 18:00:00', '2023-07-06 19:00:00'),
(2, 3, 'Bluetooth connectivity issue', 'resolved', '2023-07-07 20:00:00', '2023-07-07 21:00:00'),
(5, 4, 'Account issue', 'open', '2023-07-08 22:00:00', NULL),
(3, 4, 'Payment issue', 'resolved', '2023-07-09 23:00:00', '2023-07-09 23:30:00'),
(4, 5, 'Physical damage', 'open', '2023-07-10 08:00:00', NULL),
(4, 1, 'Laptop blue screen', 'resolved', '2024-01-05 10:00:00', '2024-02-05 12:00:00'),
(5, 1, 'Laptop lagging', 'resolved', '2024-01-06 10:00:00', '2024-01-25 12:00:00'),
(3, 1, 'Some part of laptop broken', 'resolved', '2024-02-05 10:00:00', '2024-03-05 12:00:00');

# Query

SELECT * FROM customers;
SELECT * FROM employees;
SELECT * FROM orderdetails;
SELECT * FROM orders;
SELECT * FROM products;
SELECT * FROM supporttickets;

# 1. Identifikasi 3 pelanggan teratas berdasarkan total nominal pesanan!

SELECT 
a.customer_id, 
CONCAT(a.first_name,' ', a.last_name) AS `Name`, 
SUM(b.total_amount) AS `total_amount`
FROM Customers a
JOIN Orders b ON a.customer_id = b.customer_id
GROUP BY a.customer_id, a.first_name, a.last_name
ORDER BY total_amount DESC LIMIT 3;

# 2. Temukan rata-rata nominal pesanan untuk setiap pelanggan!

SELECT 
a.customer_id, 
CONCAT(a.first_name,' ', a.last_name) AS `Name`, 
AVG(b.total_amount) AS `rata rata pesanan`
FROM Customers a
JOIN Orders b ON a.customer_id = b.customer_id
GROUP BY a.customer_id, a.first_name, a.last_name;

# 3. Temukan semua karyawan yang telah menyelesaikan lebih dari 4 tiket support!

SELECT
	a.employee_id,
	CONCAT(a.first_name,' ', a.last_name) AS `Name`,
    COUNT(b.ticket_id) AS `capai target`
FROM employees a
JOIN supporttickets b ON a.employee_id = b.employee_id
WHERE `status` = 'resolved'
GROUP BY employee_id, first_name, last_name
HAVING COUNT(b.ticket_id) >= 4;

# 4. Temukan semua produk yang belum pernah dipesan!

SELECT 
    products.product_name
FROM products
LEFT JOIN orderdetails od ON products.product_id = od.product_id
WHERE od.order_id IS NULL;

# 5. Hitung total pendapatan yang dihasilkan dari penjualan produk!

SELECT
SUM(quantity*unit_price) AS pendapatan 
FROM orderdetails;

# 6.Temukan harga rata-rata produk untuk setiap kategori dan temukan kategori dengan harga rata-rata lebih dari $500!

WITH rerata_per_category AS (
	SELECT category, AVG(price) AS rerata_harga
		FROM products
	GROUP BY category
)
SELECT * FROM rerata_per_category 
	WHERE rerata_harga >+ 500;


# 7. Temukan pelanggan yang telah membuat setidaknya satu pesanan dengan total jumlah lebih dari $1000!

SELECT *
FROM customers
WHERE customer_id IN (
SELECT customer_id, total_amount
FROM orders
WHERE total_amount >= 1000)
 
