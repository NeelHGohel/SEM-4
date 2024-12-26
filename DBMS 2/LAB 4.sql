--Note: for Table valued function use tables of Lab-2
--Part – A
--1. Write a function to print "hello world".
CREATE OR ALTER FUNCTION FN_HELLOwORLD()
RETURNS VARCHAR(100)
AS
BEGIN
	RETURN 'HELLO WORLD'
END

SELECT DBO.FN_HELLOwORLD();

--2. Write a function which returns addition of two numbers.
CREATE OR ALTER FUNCTION FN_ADDNUMBER(@NUM1 INT , @NUM2 INT)
RETURNS INT
AS
BEGIN
	RETURN @NUM1+@NUM2;
END

SELECT DBO.FN_ADDNUMBER(10,20);

--3. Write a function to check whether the given number is ODD or EVEN.
CREATE OR ALTER FUNCTION FN_A3(@NUM1 INT)
RETURNS VARCHAR(100)
AS
BEGIN
	DECLARE @RESULT VARCHAR(10)
	IF @NUM1%2=0
		SET @RESULT = 'EVEN'
	ELSE
		SET @RESULT = 'ODD'
	RETURN @RESULT
END

SELECT DBO.FN_A3(10);

--4. Write a function which returns a table with details of a person whose first name starts with B.
CREATE OR ALTER FUNCTION FN_A4()
RETURNS TABLE
AS
	RETURN (SELECT * FROM Person WHERE FirstName LIKE 'B%')

SELECT * FROM DBO.FN_A4();

--5. Write a function which returns a table with unique first names from the person table.
CREATE OR ALTER FUNCTION FN_A5()
RETURNS TABLE
AS
	RETURN (SELECT DISTINCT FirstName FROM Person)

SELECT * FROM DBO.FN_A5();

--6. Write a function to print number from 1 to N. (Using while loop)
CREATE OR ALTER FUNCTION FN_A6(@NUM INT)
RETURNS VARCHAR(100)
AS
BEGIN
	DECLARE @I INT = 1
	DECLARE @N VARCHAR(100) = '';
	WHILE @I <= @NUM
		BEGIN
			SET @N = @N + CAST(@I AS VARCHAR) + ' '
			SET @I = @I+1
	END
	RETURN @N
END

SELECT DBO.FN_A6(10);

--7. Write a function to find the factorial of a given integer.
CREATE OR ALTER FUNCTION FN_A7(@NUM1 INT)
	RETURNS INT
AS
BEGIN
	DECLARE @FAC INT = 1;
	DECLARE @I INT = 1;
	WHILE @I <=@NUM1
		BEGIN 
			SET @FAC = @FAC * @I
			SET @I = @I + 1
		END
	RETURN @FAC
END

SELECT DBO.FN_A7(5);

--Part – B
--8. Write a function to compare two integers and return the comparison result. (Using Case statement)
CREATE OR ALTER FUNCTION FN_B8(@N1 INT , @N2 INT)
RETURNS VARCHAR(50)
AS
BEGIN
	RETURN
	CASE
		WHEN @N1 = @N2 THEN 'EQUAL'
		WHEN @N1 > @N2 THEN 'NUMBER1 IS BIG'
		WHEN @N1 < @N2 THEN 'NUMBER2 IS BIG'
		ELSE 'NOO'
	END
END

SELECT DBO.FN_B8(50,50)

--9. Write a function to print the sum of even numbers between 1 to 20.
CREATE OR ALTER FUNCTION FN_B9()
RETURNS INT
AS
BEGIN
	DECLARE @I INT = 0
	DECLARE @ANS INT = 0;
	WHILE @I <= 20
		BEGIN
			SET @ANS = @ANS + @I
			SET @I = @I+2
	END
	RETURN @ANS
END

SELECT DBO.FN_B9()
	

--10. Write a function that checks if a given string is a palindrome
CREATE OR ALTER FUNCTION FN_PALINDROME(@ANS VARCHAR(50))
RETURNS VARCHAR(100)
AS
BEGIN
	DECLARE @REV VARCHAR(100) = REVERSE(@ANS)
	DECLARE @RESULT VARCHAR(100)
	IF @ANS = @REV
		SET @RESULT = 'PALINDROME'
	ELSE
		SET @RESULT = 'NOT PALINDROME'
	RETURN @RESULT
END

SELECT DBO.FN_PALINDROME('AABAAC')

--Part – C
--11. Write a function to check whether a given number is prime or not.


--12. Write a function which accepts two parameters start date & end date, and returns a difference in days.


--13. Write a function which accepts two parameters year & month in integer and returns total days each
--year.


--14. Write a function which accepts departmentID as a parameter & returns a detail of the persons.

 
--15. Write a function that returns a table with details of all persons who joined after 1-1-1991.

