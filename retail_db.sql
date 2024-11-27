create database Retail_Management
use retail_management

CREATE TABLE Adminn (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    phone_num varchar(15)
);

INSERT INTO Adminn (name, password, email, phone_num) 
VALUES ('saeed', '123', 'admin@example.com', '1234567890');

CREATE TABLE Cashier (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    email varchar(255),
    phone_num varchar(15)
);
INSERT INTO Cashier (name, password, email, phone_num) 
VALUES 
('cashier1', '123', 'cashier1@example.com', '1111111111'),
('cashier2', '123', 'cashier2@example.com', '2222222222'),
('cashier3', '123', 'cashier3@example.com', '3333333333'),
('cashier4', '123', 'cashier4@example.com', '4444444444');


CREATE TABLE Customer (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    password varchar(255) NOT NULL,
	email VARCHAR(255) NOT NULL,
    phone_num varchar(15) UNIQUE
);
INSERT INTO Customer (name, password, email, phone_num) 
VALUES 
('customer1', '123', 'customer1@example.com', '5555555555'),
('customer2', '123', 'customer2@example.com', '6666666666'),
('customer3', '123', 'customer3@example.com', '7777777777'),
('customer4', '123', 'customer4@example.com', '8888888888');

CREATE TABLE LoyaltyPoints (
    points INT DEFAULT 0,
    customerID INT UNIQUE,
    FOREIGN KEY (customerID) REFERENCES Customer(ID),
    Primary key(customerID)
);
INSERT INTO LoyaltyPoints (points, customerID) 
VALUES 
(0, 1),
(0, 2),
(0, 3),
(0, 4);

CREATE TABLE Category(
	catID INT AUTO_INCREMENT PRIMARY KEY,
    categoryName varchar(255) NOT NULL unique,
    tax int 
);
INSERT INTO Category (categoryName, tax) 
VALUES 
('Bakery Items', 2),
('Electronics', 8),
('Cosmetics', 4),
('Utensils', 5),
('Home and Life Style', 3),
('Grocery', 1);

CREATE TABLE Product (
    productID INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    categoryID int,
    price DECIMAL(10, 2),
    stockQuantity INT,
    barcode varchar(255) NOT NULL unique,
	purchasePrice DECIMAL(10, 2) NOT NULL,
    suppName varchar(255) NULL,
    FOREIGN KEY (categoryID) REFERENCES Category(catID),
    FOREIGN KEY (suppName) REFERENCES Supplier(SupplyName)
);
INSERT INTO Product (name, categoryID, price, stockQuantity, barcode, purchasePrice, suppName)  
VALUES  
('Chocolate Cake', 1, 15.00, 11, 'BAK12345', 12.00, 'Bakery Supplies Co.'),
('Croissant', 1, 5.00, 11, 'BAK54321', 4.00, 'Bakery Supplies Co.'),
('Smartphone', 2, 300.00, 11, 'ELE12345', 250.00, 'Electronics Distributors'),
('Headphones', 2, 50.00, 22, 'ELE54321', 40.00, 'Electronics Distributors'),
('Lipstick', 3, 10.00, 22, 'COS12345', 7.50, 'Cosmetic Suppliers'),
('Perfume', 3, 25.00, 22, 'COS54321', 20.00, 'Cosmetic Suppliers'),
('Cooking Pan', 4, 20.00, 13, 'UTE12345', 15.00, 'Kitchen Essentials'),
('Cutlery Set', 4, 15.00, 3, 'UTE54321', 12.00, 'Kitchen Essentials'),
('Cushion Cover', 5, 8.00, 23, 'HLS12345', 6.00, 'Home Goods Ltd.'),
('Wall Clock', 5, 30.00, 11, 'HLS54321', 25.00, 'Home Goods Ltd.'),
('Rice Pack', 6, 12.00, 11, 'GRO12345', 10.00, 'Grocery Wholesalers'),
('Cooking Oil', 6, 18.00, 3, 'GRO54321', 15.00, 'Grocery Wholesalers'),
('Muffin', 1, 3.50, 15, 'BAK98765', 2.50, 'Bakery Supplies Co.'),
('Baguette', 1, 6.00, 10, 'BAK67890', 4.50, 'Bakery Supplies Co.'),
('Laptop', 2, 800.00, 5, 'ELE67890', 700.00, 'Electronics Distributors'),
('Smartwatch', 2, 120.00, 12, 'ELE98765', 100.00, 'Electronics Distributors'),
('Foundation', 3, 20.00, 18, 'COS67890', 15.00, 'Cosmetic Suppliers'),
('Eyeliner', 3, 8.00, 20, 'COS98765', 6.50, 'Cosmetic Suppliers'),
('Pressure Cooker', 4, 45.00, 7, 'UTE67890', 35.00, 'Kitchen Essentials'),
('Mixing Bowl', 4, 12.00, 25, 'UTE98765', 9.00, 'Kitchen Essentials'),
('Table Lamp', 5, 35.00, 8, 'HLS67890', 28.00, 'Home Goods Ltd.'),
('Photo Frame', 5, 12.00, 14, 'HLS98765', 9.50, 'Home Goods Ltd.'),
('Sugar Pack', 6, 5.00, 30, 'GRO67890', 3.50, 'Grocery Wholesalers'),
('Flour Pack', 6, 7.00, 25, 'GRO98765', 5.50, 'Grocery Wholesalers');

select * from product

CREATE TABLE Supplier(
	SupplyID INT AUTO_INCREMENT PRIMARY KEY,
    SupplyName Varchar(255) NOT NULL UNIQUE,
    SupplyDate date,
    Quantity INT
);
SELECT * FROM Supplier
INSERT INTO Supplier (SupplyName, SupplyDate, Quantity)  
VALUES  
('Bakery Supplies Co.', '2024-01-15', 100),
('Electronics Distributors', '2024-02-10', 50),
('Cosmetic Suppliers', '2024-03-05', 80),
('Kitchen Essentials', '2024-04-20', 70),
('Home Goods Ltd.', '2024-05-25', 90),
('Grocery Wholesalers', '2024-06-15', 120);


CREATE TABLE orderr (
    orderID INT AUTO_INCREMENT PRIMARY KEY,
    cashierID int NULL,
    orderDate DATETIME NOT NULL,
    status VARCHAR(50),
    customerNumber varchar(15) NULL,
    customerName varchar(255),
    orderType VARCHAR(20),
    FOREIGN KEY (customerNumber) REFERENCES Customer(phone_num),
    FOREIGN KEY (cashierID) REFERENCES Cashier(ID)
);
INSERT INTO orderr (cashierID, orderDate, status, customerNumber, customerName, orderType) 
VALUES 
(1, '2020-02-15 10:15:00', 'Completed', '5555555555', 'customer1', 'In-Store'),
(2, '2020-05-20 14:30:00', 'Pending', '6666666666', 'customer2', 'Online'),
(3, '2021-03-10 12:00:00', 'Completed', '7777777777', 'customer3', 'In-Store'),
(4, '2022-07-25 18:45:00', 'Completed', '8888888888', 'customer4', 'Online'),
(1, '2023-01-05 09:30:00', 'Completed', NULL, 'customer1', 'In-Store'),
(2, '2023-11-11 11:45:00', 'Cancelled', '6666666666', 'customer2', 'Online'),
(3, '2024-01-15 16:30:00', 'Completed', '7777777777', 'customer3', 'Online'),
(4, '2024-04-05 13:15:00', 'Pending', 7777777777, 'customer3', 'Online');

INSERT INTO orderr (cashierID, orderDate, status, customerNumber, customerName, orderType) 
VALUES 
(4, '2024-12-05 13:15:00', 'Completed', 7777777777, 'customer3', 'In-Store');

SELECT LAST_INSERT_ID() AS id from orderr

select * from OrderProducts

CREATE TABLE OrderProducts (
    orderID INT,
    productID INT,
    quantity INT NOT NULL,
    PRIMARY KEY (orderID, productID),
    FOREIGN KEY (orderID) REFERENCES orderr(orderID),
    FOREIGN KEY (productID) REFERENCES Product(productID)
);
INSERT INTO OrderProducts (orderID, productID, quantity) 
VALUES 
(1, 1, 2),
(1, 3, 1),
(2, 5, 3),
(2, 7, 1),
(3, 8, 2),
(3, 11, 5),
(4, 2, 1),
(4, 15, 1),
(5, 20, 3),
(5, 22, 2),
(6, 6, 4),
(7, 19, 1),
(7, 12, 3),
(8, 4, 2),
(8, 24, 1);
INSERT INTO OrderProducts (orderID, productID, quantity) 
VALUES 
(9, 1, 3),
(9, 3, 8);

CREATE TABLE Invoice (
    invoiceID INT AUTO_INCREMENT PRIMARY KEY,
    amount DECIMAL(10, 2) NOT NULL,
    date DATETIME NOT NULL,
    discount DECIMAL(10, 2),
    orderID INT UNIQUE,
    FOREIGN KEY (orderID) REFERENCES orderr(orderID)
);
INSERT INTO Invoice (amount, date, discount, orderID) 
VALUES 
(42.50, '2020-02-15 10:20:00', 2.50, 1),
(120.00, '2021-03-10 12:05:00', 10.00, 3),
(50.00, '2022-07-25 18:50:00', 0.00, 4),
(150.00, '2023-01-05 09:35:00', 15.00, 5),
(85.00, '2024-01-15 16:35:00', 5.00, 7);

INSERT INTO Invoice (amount, date, discount, orderID) 
VALUES 
(2445, '2024-12-05 13:15:00', 0.0, 9);

CREATE TABLE returnn (
    returnID INT AUTO_INCREMENT PRIMARY KEY,
    date DATE NOT NULL,
    orderID int,
    productID INT,
    cashierID INT,
    status VARCHAR(50) NOT NULL,
	FOREIGN KEY (orderID) REFERENCES orderr(productID),
    FOREIGN KEY (productID) REFERENCES Product(productID),
    FOREIGN KEY (cashierID) REFERENCES Cashier(ID)
);

SELECT * FROM orderr

SELECT SUM(p.price * op.quantity) AS totalSales
            FROM OrderProducts op
            INNER JOIN Product p ON op.productID = p.productID
            INNER JOIN orderr o ON op.orderID = o.orderID
            WHERE YEAR(o.orderDate) = 2022 AND o.status = "Completed" ;
            
SELECT SUM((p.price - p.purchasePrice) * op.quantity) AS totalProfit
            FROM OrderProducts op
            INNER JOIN Product p ON op.productID = p.productID
            INNER JOIN orderr o ON op.orderID = o.orderID
            WHERE YEAR(o.orderDate) = 2024;
            
SELECT p.name, SUM(op.quantity) AS totalQuantity, SUM(p.price * op.quantity) AS totalSales
            FROM OrderProducts op
            INNER JOIN Product p ON op.productID = p.productID
            INNER JOIN orderr o ON op.orderID = o.orderID
            WHERE YEAR(o.orderDate) = 2024
            GROUP BY p.name
            ORDER BY totalQuantity DESC
            LIMIT 1;
SELECT MONTH(o.orderDate) AS month, 
                   SUM(p.price * op.quantity) AS totalSales, 
                   SUM((p.price - p.purchasePrice) * op.quantity) AS totalProfit
            FROM OrderProducts op
            INNER JOIN Product p ON op.productID = p.productID
            INNER JOIN orderr o ON op.orderID = o.orderID
            WHERE YEAR(o.orderDate) = 2024 AND o.status = "Completed"
            GROUP BY MONTH(o.orderDate)
