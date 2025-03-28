-- Creating PersonInfo Table
CREATE TABLE PersonInfo (
 PersonID INT PRIMARY KEY,
 PersonName VARCHAR(100) NOT NULL,
 Salary DECIMAL(8,2) NOT NULL,
 JoiningDate DATETIME NULL,
 City VARCHAR(100) NOT NULL,
 Age INT NULL,
 BirthDate DATETIME NOT NULL
);


-- Creating PersonLog Table
CREATE TABLE PersonLog (
 PLogID INT PRIMARY KEY IDENTITY(1,1),
 PersonID INT NOT NULL,
 PersonName VARCHAR(250) NOT NULL,
 Operation VARCHAR(50) NOT NULL,
 UpdateDate DATETIME NOT NULL,
);

--drop table PersonInfo
--drop table PersonLog

--Part � A
--1. Create a trigger that fires on INSERT, UPDATE and DELETE operation on the PersonInfo table to display
--a message �Record is Affected.�
CREATE OR ALTER TRIGGER TR_A1
ON PersonInfo
AFTER INSERT , UPDATE , DELETE
AS
BEGIN
	PRINT 'RECORD IS AFFECTED'
END;

SELECT * FROM PersonInfo;
INSERT INTO PersonInfo VALUES(1, 'neel' , 1111.11 , '2025-01-16' ,'RAJKOT' , 19 , '2005-11-30');

--2. Create a trigger that fires on INSERT, UPDATE and DELETE operation on the PersonInfo table. For that,
--log all operations performed on the person table into PersonLog.

--INSERT
CREATE OR ALTER TRIGGER TR_A2_INSERT
ON PersonInfo
AFTER INSERT
AS
BEGIN
	DECLARE @PID INT , @PNAME VARCHAR(50)
	SELECT @PID = PersonID , @PNAME = PersonName FROM inserted
	INSERT INTO PersonLog VALUES (@PID , @PNAME , 'INSERT' , GETDATE())
END

--UPDATE
CREATE OR ALTER TRIGGER TR_A2_UPDATE
ON PersonInfo
AFTER UPDATE
AS
BEGIN
	DECLARE @PID INT , @PNAME VARCHAR(50)
	SELECT @PID = PersonID , @PNAME = PersonName FROM inserted
	INSERT INTO PersonLog VALUES (@PID , @PNAME , 'UPDATE' , GETDATE())
END

--DELETE
CREATE OR ALTER TRIGGER TR_A2_DELETE
ON PersonInfo
AFTER DELETE
AS
BEGIN
	DECLARE @PID INT , @PNAME VARCHAR(50)
	SELECT @PID = PersonID , @PNAME = PersonName FROM deleted
	INSERT INTO PersonLog VALUES (@PID , @PNAME , 'DELETE' , GETDATE())
END

SELECT * FROM PersonInfo
SELECT * FROM PersonLog

--3. Create an INSTEAD OF trigger that fires on INSERT, UPDATE and DELETE operation on the PersonInfo
--table. For that, log all operations performed on the person table into PersonLog.

--INSERT
CREATE OR ALTER TRIGGER TR_A3_INSERT
ON PersonInfo
INSTEAD OF INSERT
AS
BEGIN
	DECLARE @PID INT , @PNAME VARCHAR(50)
	SELECT @PID = PersonID , @PNAME = PersonName FROM inserted
	INSERT INTO PersonLog VALUES (@PID , @PNAME , 'INSERT' , GETDATE())
END

DROP TRIGGER TR_A3_DELETE

--UPDATE
CREATE OR ALTER TRIGGER TR_A3_UPDATE
ON PersonInfo
INSTEAD OF UPDATE
AS
BEGIN
	DECLARE @PID INT , @PNAME VARCHAR(50)
	SELECT @PID = PersonID , @PNAME = PersonName FROM inserted
	INSERT INTO PersonLog VALUES (@PID , @PNAME , 'UPDATE' , GETDATE())
END

--DELETE
CREATE OR ALTER TRIGGER TR_A3_DELETE
ON PersonInfo
INSTEAD OF DELETE
AS
BEGIN
	DECLARE @PID INT , @PNAME VARCHAR(50)
	SELECT @PID = PersonID , @PNAME = PersonName FROM deleted
	INSERT INTO PersonLog VALUES (@PID , @PNAME , 'DELETE' , GETDATE())
END


--4. Create a trigger that fires on INSERT operation on the PersonInfo table to convert person name into
--uppercase whenever the record is inserted.
CREATE OR ALTER TRIGGER TR_A4
ON PersonInfo
AFTER INSERT
AS
BEGIN
	DECLARE @PID INT , @PNAME VARCHAR(50)
	SELECT @PID = PersonID , @PNAME = PersonName FROM inserted
	UPDATE PersonInfo SET PersonName = UPPER(@PNAME) WHERE PersonID = @PID
END


INSERT INTO PersonInfo VALUES(14, 'neel' , 5000 , '2025-01-16' ,'RAJKOT' , 19 , '2005-11-30');

SELECT * FROM PersonInfo
SELECT * FROM PersonLog


--5. Create trigger that prevent duplicate entries of person name on PersonInfo table.
CREATE OR ALTER TRIGGER TR_A5
ON PersonInfo
INSTEAD OF INSERT
AS
BEGIN
	INSERT INTO PersonInfo (PersonID , PersonName , Salary , JoiningDate , City , Age , BirthDate)
	SELECT * FROM inserted WHERE PersonID NOT IN (SELECT PersonID FROM PersonInfo)
END

--DROP TRIGGER TR_A5;


--6. Create trigger that prevent Age below 18 years.
CREATE OR ALTER TRIGGER TR_A6
ON PersonInfo
INSTEAD OF INSERT
AS
BEGIN
	INSERT INTO PersonInfo (PersonID , PersonName , Salary , JoiningDate , City , Age , BirthDate)
	SELECT * FROM inserted WHERE Age >= 18
END

INSERT INTO PersonInfo VALUES(15, 'neel' , 5000 , GETDATE() ,'RAJKOT' , 19 , '2005-11-30');

--Part � B

--7. Create a trigger that fires on INSERT operation on person table, which calculates the age and update
--that age in Person table.
CREATE OR ALTER TRIGGER TR_B7
ON PersonInfo
AFTER INSERT
AS
BEGIN
	UPDATE PersonInfo
	SET Age = DATEDIFF(YEAR , BirthDate , GETDATE())
	WHERE PersonID IN (SELECT PersonID FROM inserted)
END

SELECT * FROM PersonInfo
SELECT * FROM PersonLog
		
--8. Create a Trigger to Limit Salary Decrease by a 10%.



--Part � C

--9. Create Trigger to Automatically Update JoiningDate to Current Date on INSERT if JoiningDate is NULL
--during an INSERT.
CREATE OR ALTER TRIGGER TR_C9
ON PersonInfo
AFTER INSERT
AS
BEGIN
    UPDATE PersonInfo
    SET JoiningDate = GETDATE()
    WHERE JoiningDate IS NULL AND PersonID IN (SELECT PersonID FROM inserted);
END;

--10. Create DELETE trigger on PersonLog table, when we delete any record of PersonLog table it prints
--�Record deleted successfully from PersonLog�.
CREATE OR ALTER TRIGGER TR_C10
ON PersonLog
AFTER DELETE
AS
BEGIN
    PRINT 'Record deleted successfully from PersonLog.'
END;
