Question 1 Achieving 1NF (First Normal Form)

-- First Normal Form (1NF) 
-- Create a table with non-1NF structure (for demonstration)
CREATE TABLE ProductDetail (
  OrderID INT,
  CustomerName VARCHAR(100),
  Products VARCHAR(255)
);


-- Insert sample data with comma-separated values
INSERT INTO ProductDetail VALUES
(101, 'John Doe', 'Laptop, Mouse'),
(102, 'Jane Smith', 'Tablet, Keyboard, Mouse'),
(103, 'Emily Clark', 'Phone');


-- Create a new table in 1NF
CREATE TABLE NormalizedProductDetail (
  OrderID INT,
  CustomerName VARCHAR(100),
  Product VARCHAR(50),
  PRIMARY KEY (OrderID, Product)
);


-- Insert the normalized data
INSERT INTO NormalizedProductDetail VALUES
(101, 'John Doe', 'Laptop'),
(101, 'John Doe', 'Mouse'),
(102, 'Jane Smith', 'Tablet'),
(102, 'Jane Smith', 'Keyboard'),
(102, 'Jane Smith', 'Mouse'),
(103, 'Emily Clark', 'Phone');



Question 2 Achieving 2NF (Second Normal Form)

-- Second Normal Form (2NF)
-- Create a table in 1NF but not in 2NF (for demonstration)
CREATE TABLE OrderDetails (
  OrderID INT,
  CustomerName VARCHAR(100),
  Product VARCHAR(50),
  Quantity INT,
  PRIMARY KEY (OrderID, Product)
);


-- Insert sample data with redundant customer information
INSERT INTO OrderDetails VALUES
(101, 'John Doe', 'Laptop', 2),
(101, 'John Doe', 'Mouse', 1),
(102, 'Jane Smith', 'Tablet', 3),
(102, 'Jane Smith', 'Keyboard', 1),
(102, 'Jane Smith', 'Mouse', 2),
(103, 'Emily Clark', 'Phone', 1);



-- Create 2NF compliant tables
-- Orders table
CREATE TABLE Orders (
  OrderID INT PRIMARY KEY,
  CustomerName VARCHAR(100)
);

-- OrderItems table
CREATE TABLE OrderItems (
  OrderID INT,
  Product VARCHAR(50),
  Quantity INT,
  PRIMARY KEY (OrderID, Product),
  FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- Insert data into Orders table
INSERT INTO Orders VALUES
(101, 'John Doe'),
(102, 'Jane Smith'),
(103, 'Emily Clark');

-- Insert data into OrderItems table
INSERT INTO OrderItems VALUES
(101, 'Laptop', 2),
(101, 'Mouse', 1),
(102, 'Tablet', 3),
(102, 'Keyboard', 1),
(102, 'Mouse', 2),
(103, 'Phone', 1);