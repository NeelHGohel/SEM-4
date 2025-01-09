-- Create the Products table
CREATE TABLE Products (
	Product_id INT PRIMARY KEY,
	Product_Name VARCHAR(250) NOT NULL,
	Price DECIMAL(10, 2) NOT NULL
);


-- Insert data into the Products table
INSERT INTO Products (Product_id, Product_Name, Price) VALUES
(1, 'Smartphone', 35000),
(2, 'Laptop', 65000),
(3, 'Headphones', 5500),
(4, 'Television', 85000),
(5, 'Gaming Console', 32000);

--Part - A

--1. Create a cursor Product_Cursor to fetch all the rows from a products table.


--2. Create a cursor Product_Cursor_Fetch to fetch the records in form of ProductID_ProductName.
--(Example: 1_Smartphone)


--3. Create a Cursor to Find and Display Products Above Price 30,000.


--4. Create a cursor Product_CursorDelete that deletes all the data from the Products table.


--Part – B


--5. Create a cursor Product_CursorUpdate that retrieves all the data from the products table and increases
--the price by 10%.


--6. Create a Cursor to Rounds the price of each product to the nearest whole number.


--Part – C
--7. Create a cursor to insert details of Products into the NewProducts table if the product is “Laptop”
--(Note: Create NewProducts table first with same fields as Products table)


--8. Create a Cursor to Archive High-Price Products in a New Table (ArchivedProducts), Moves products
--with a price above 50000 to an archive table, removing them from the original Products table.