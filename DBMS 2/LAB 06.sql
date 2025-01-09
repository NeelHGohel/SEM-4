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

SELECT * FROM Products;
--Part - A

--1. Create a cursor Product_Cursor to fetch all the rows from a products table.
DECLARE @Product_id INT ,
	@Product_Name VARCHAR(250),
	@Price DECIMAL(10, 2); 

DECLARE Product_Cursor CURSOR
FOR SELECT Product_id,Product_Name,Price FROM Products;

OPEN Product_Cursor;
FETCH NEXT FROM Product_Cursor INTO @Product_id, @Product_Name, @Price;

WHILE @@FETCH_STATUS = 0
	BEGIN
		PRINT CAST(@Product_id AS VARCHAR) + '-' + @Product_Name + '-' + CAST(@Price AS VARCHAR)
		FETCH NEXT FROM Product_Cursor INTO @Product_id, @Product_Name, @Price;
	END

CLOSE Product_Cursor;
DEALLOCATE Product_Cursor;

SELECT * FROM Products;
--2. Create a cursor Product_Cursor_Fetch to fetch the records in form of ProductID_ProductName.
--(Example: 1_Smartphone)
DECLARE @Product_id1 INT,
	@Product_Name1 VARCHAR(50); 

DECLARE Product_Cursor_Fetch CURSOR
FOR SELECT Product_id , Product_Name FROM Products;

OPEN Product_Cursor_Fetch;
FETCH NEXT FROM Product_Cursor_Fetch INTO @Product_id1, @Product_Name1;

WHILE @@FETCH_STATUS = 0
	BEGIN
		PRINT CAST(@Product_id1 AS VARCHAR) + '_' + @Product_Name1
		FETCH NEXT FROM Product_Cursor_Fetch INTO @Product_id1, @Product_Name1;
	END

CLOSE Product_Cursor_Fetch;
DEALLOCATE Product_Cursor_Fetch;

--3. Create a Cursor to Find and Display Products Above Price 30,000.
DECLARE @Product_id2 INT ,
	@Product_Name2 VARCHAR(250),
	@Price2 DECIMAL(10, 2); 

DECLARE Product_Cursor_Price CURSOR
FOR SELECT Product_id , Product_Name , Price FROM Products WHERE Price > 30000;

OPEN Product_Cursor_Price;
FETCH NEXT FROM Product_Cursor_Price INTO @Product_id2, @Product_Name2, @Price2;

WHILE @@FETCH_STATUS = 0
	BEGIN
		PRINT CAST(@Product_id2 AS VARCHAR) + '-' + @Product_Name2 + '-' + CAST(@Price2 AS VARCHAR) 
		FETCH NEXT FROM Product_Cursor_Price INTO @Product_id2, @Product_Name2, @Price2;
	END

CLOSE Product_Cursor_Price;
DEALLOCATE Product_Cursor_Price;

--4. Create a cursor Product_CursorDelete that deletes all the data from the Products table.
DECLARE @Product_id3 INT ,
	@Product_Name3 VARCHAR(250),
	@Price3 DECIMAL(10, 2); 

DECLARE Product_Cursor_Delete CURSOR
FOR SELECT Product_id , Product_Name , Price FROM Products;

OPEN Product_Cursor_Delete;
FETCH NEXT FROM Product_Cursor_Delete INTO @Product_id3, @Product_Name3, @Price3;

WHILE @@FETCH_STATUS = 0
	BEGIN
		DELETE FROM Products WHERE Product_id = @Product_id3
		FETCH NEXT FROM Product_Cursor_Delete INTO @Product_id3, @Product_Name3, @Price3;
	END

CLOSE Product_Cursor_Delete;
DEALLOCATE Product_Cursor_Delete;

--Part – B

--5. Create a cursor Product_CursorUpdate that retrieves all the data from the products table and increases
--the price by 10%.
DECLARE @Product_id4 INT ,
	@Product_Name4 VARCHAR(250),
	@Price4 DECIMAL(10, 2); 

DECLARE Product_CursorUpdate CURSOR
FOR SELECT Product_id , Product_Name , Price FROM Products;

OPEN Product_CursorUpdate;
FETCH NEXT FROM Product_CursorUpdate INTO @Product_id4, @Product_Name4, @Price4;

WHILE @@FETCH_STATUS = 0
	BEGIN
		PRINT CAST(@Product_id4 AS VARCHAR) + '-' + @Product_Name4 + '-' + CAST(@Price4 + @Price4*.1 AS VARCHAR) 
		FETCH NEXT FROM Product_CursorUpdate INTO @Product_id4, @Product_Name4, @Price4;
	END

CLOSE Product_CursorUpdate;
DEALLOCATE Product_CursorUpdate;

--6. Create a Cursor to Rounds the price of each product to the nearest whole number.


--Part – C
--7. Create a cursor to insert details of Products into the NewProducts table if the product is “Laptop”
--(Note: Create NewProducts table first with same fields as Products table)


--8. Create a Cursor to Archive High-Price Products in a New Table (ArchivedProducts), Moves products
--with a price above 50000 to an archive table, removing them from the original Products table.