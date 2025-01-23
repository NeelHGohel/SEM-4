
CREATE TABLE EmployeeDetails(
	EmployeeID Int Primary Key,
	EmployeeName Varchar(100),
	ContactNo Varchar(100),
	Department Varchar(100),  
	Salary Decimal(10,2),
	Joiningdate DateTime
);

CREATE TABLE EmployeeLogs(
	LogID Int Primary Key IDENTITY(1,1),
	EmployeeID Int,
	EmployeeName Varchar(100),
	ActionPerformed Varchar(100),
	ActionDate DateTime,
);

--drop table EmployeeLogs
--drop table EmployeeDetails

--1) Create a trigger that fires AFTER INSERT, UPDATE, and DELETE operations on the
--EmployeeDetails table to display the message "Employee record inserted", "Employee
--record updated", "Employee record deleted"

--INSERT
CREATE OR ALTER TRIGGER TR_1_i
ON EmployeeDetails
AFTER INSERT
AS
BEGIN 
	PRINT 'Employee record inserted'
END

--UPDATE
CREATE OR ALTER TRIGGER TR_1_ii
ON EmployeeDetails
AFTER UPDATE
AS
BEGIN 
	PRINT 'Employee record updated'
END

--DELETE
CREATE OR ALTER TRIGGER TR_1_iii
ON EmployeeDetails
AFTER DELETE
AS
BEGIN 
	PRINT 'Employee record deleted'
END

--2) Create a trigger that fires AFTER INSERT, UPDATE, and DELETE operations on the
--EmployeeDetails table to log all operations into the EmployeeLog table.

CREATE OR ALTER TRIGGER TR_2
ON EmployeeDetails
AFTER INSERT , UPDATE , DELETE
AS
BEGIN
	INSERT INTO EmployeeLogs (EmployeeID , EmployeeName , ActionPerformed , ActionDate)
	SELECT EmployeeID ,EmployeeName , 'INSERT' , Joiningdate FROM inserted
END;

INSERT INTO EmployeeDetails VALUES (10 , 'NEEL' , '1213' , 'CE' ,100.2 , '2025-01-23')

SELECT * FROM EmployeeLogs
select * from EmployeeDetails


--3) Create a trigger that fires AFTER INSERT to automatically calculate the joining bonus
--(10% of the salary) for new employees and update a bonus column in the EmployeeDetails
--table.



--4) Create a trigger to ensure that the JoiningDate is automatically set to the current date if it
--is NULL during an INSERT operation.


--5) Create a trigger that ensure that ContactNo is valid during insert and update(Like
--ContactNo length is 10)