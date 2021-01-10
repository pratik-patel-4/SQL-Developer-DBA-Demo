-- Get Account Details by Account Id.
CREATE OR ALTER PROC uspGetAccountDetailsById(@AccountId varchar(12))
AS 
BEGIN
	SELECT * FROM Account WHERE ACCOUNT_ID = @AccountId 
END;
Go
