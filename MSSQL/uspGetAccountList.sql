--Get All the Accounts List.
CREATE OR ALTER PROC uspGetAccountList
AS 
BEGIN
	SELECT * FROM Account;
END;
Go
