-- Create the Customers table
CREATE TABLE Customers (
 Customer_id INT PRIMARY KEY,
 Customer_Name VARCHAR(250) NOT NULL,
 Email VARCHAR(50) UNIQUE
);

-- Create the Orders table
CREATE TABLE Orders (
 Order_id INT PRIMARY KEY,
 Customer_id INT,
 Order_date DATE NOT NULL,
 FOREIGN KEY (Customer_id) REFERENCES Customers(Customer_id)
);



--From the above given tables perform the following queries:
--Part – A
--1. Handle Divide by Zero Error and Print message like: Error occurs that is - Divide by zero error.
DECLARE @N1 INT;
DECLARE @N2 INT;
BEGIN TRY
	SET @N1 = 10;
	SET @N2 = @N1/0;
END TRY

BEGIN CATCH
	PRINT  'Divide by zero error'
END CATCH
--2. Try to convert string to integer and handle the error using try…catch block.
DECLARE @NAME VARCHAR(50)
BEGIN TRY
	SET @NAME = 'HELLO'
	DECLARE @ANS INT;
	SET @ANS = CAST(@NAME AS INT)
END TRY
BEGIN CATCH
	PRINT 'CASTING IS NOT POSSIBLE'
END CATCH

--3. Create a procedure that prints the sum of two numbers: take both numbers as integer & handle
--exception with all error functions if any one enters string value in numbers otherwise print result.
CREATE OR ALTER PROC PR_A3
@NUM1 INT , @NUM2 INT
AS
BEGIN
	BEGIN TRY
		DECLARE @ANS INT
		SET @ANS = @NUM1 + @NUM2
		PRINT @ANS
	END TRY
	BEGIN CATCH
		PRINT 'HELOO FROM THE H205'
	END CATCH
END

EXEC PR_A3 9,'AS'


--4. Handle a Primary Key Violation while inserting data into customers table and print the error details
--such as the error message, error number, severity, and state.
BEGIN TRY
	INSERT INTO Customers VALUES (1 , 'NEEL' , 'neel@neel.com')
END TRY
BEGIN CATCH
	PRINT 'PRIMARY KEY ERROR'
	PRINT 'ERROR MESSAGE ' + ERROR_MESSAGE()
	PRINT 'ERROR NUMBER ' + CAST(ERROR_NUMBER() AS VARCHAR(50))
	PRINT 'ERROR SEVERITY ' + CAST(ERROR_SEVERITY() AS VARCHAR(50))
	PRINT 'ERROR STATE ' + CAST(ERROR_STATE() AS VARCHAR(50))
END CATCH


--5. Throw custom exception using stored procedure which accepts Customer_id as input & that throws
--Error like no Customer_id is available in database.
CREATE OR ALTER PROC PR_A5
@CUSTOMER_ID INT
AS
BEGIN
	IF NOT EXISTS (SELECT 1 FROM Customers WHERE Customer_id = @CUSTOMER_ID)
	BEGIN
		THROW 51000 , 'no Customer_id is available in database' , 1;
	END
	ELSE
	BEGIN
		PRINT 'AA CUSTOMER CHE'
	END
END

EXEC PR_A5 1


--Part – B
--6. Handle a Foreign Key Violation while inserting data into Orders table and print appropriate error message.
BEGIN TRY
    INSERT INTO Orders (Order_id, Customer_id, Order_date)
    VALUES (1, 100, GETDATE());
END TRY
BEGIN CATCH
    PRINT 'Foreign Key Violation: Customer_id does not exist in the Customers table.';
    PRINT 'Error Message: ' + ERROR_MESSAGE();
END CATCH;

--7. Throw custom exception that throws error if the data is invalid.
CREATE PROCEDURE SP_ValidateData
@CustomerName VARCHAR(250)
AS
BEGIN
    IF LEN(@CustomerName) = 0
    BEGIN
        THROW 51001, 'Invalid data: Customer name cannot be empty.', 1;
    END
    ELSE
    BEGIN
        PRINT 'Data is valid.';
    END
END

EXEC SP_ValidateData ''
EXEC SP_ValidateData 'neel'

--8. Create a Procedure to Update Customer’s Email with Error Handling.
CREATE PROCEDURE SP_UpdateCustomerEmail
@Customer_id INT, @Email VARCHAR(50)
AS
BEGIN
    BEGIN TRY
        UPDATE Customers
        SET Email = @Email
        WHERE Customer_id = @Customer_id;
        PRINT 'Email updated successfully.';
    END TRY
    BEGIN CATCH
        PRINT 'Error updating email.';
        PRINT 'Error Message: ' + ERROR_MESSAGE();
    END CATCH;
END;

EXEC SP_UpdateCustomerEmail 1, 'neel@gmail.com'
EXEC SP_UpdateCustomerEmail 2, 'neel@gmail.com'
--Part – C
--9. Create a procedure which prints the error message that “The Customer_id is already taken. Try another
--one”.
--10. Handle Duplicate Email Insertion in Customers Table.