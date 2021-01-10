-- Delete Account by Account Id.
CREATE OR ALTER PROC uspDeleteAccount(@AccountId varchar(12))
AS 
BEGIN
	Delete FROM Account WHERE ACCOUNT_ID = @AccountId;
END;
