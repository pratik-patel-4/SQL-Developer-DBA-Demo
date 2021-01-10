--Reset Account
CREATE OR ALTER PROC uspResetAccount
AS 
BEGIN
	-- If we want to reset Identity then Drop.
	DROP TABLE Account;
	CREATE TABLE Account(
		[ACCOUNT_ID] VARCHAR(12) primary key,
		[CUSTOMER_ID] VARCHAR(16),
		[CUSTOMER_NAME] VARCHAR(Max),
		[IBAN] VARCHAR(32),
		[Country_Code] VARCHAR(3),
		[BANK_ID] VARCHAR(4),
		[BRNCH_ID]  VARCHAR(9),
	);

	-- Else 
	----Delete FROM Account;
	
	DECLARE @COUNT BIGINT = 0;
	WHILE @COUNT < 10
	BEGIN
		DECLARE @AccountId VARCHAR(12) = @count + 1
		DECLARE @CUSTOMER_ID VARCHAR(16) = 'CUSTOMER_ID' + RIGHT('00000000' + CAST((10*@Count ) AS VARCHAR(2)), 2)
		DECLARE @CUSTOMER_NAME VARCHAR(MAX) = 'CUSTOMER_NAME' + RIGHT('00000000' + CAST((100-@Count) AS VARCHAR(4)), 4)
		DECLARE @IBAN VARCHAR(32) = 'IBAN' + RIGHT('00000' + CAST(@Count AS VARCHAR(4)), 4)
		DECLARE @Country_Code VARCHAR(3) = 'IN'
		DECLARE @BANK_ID VARCHAR(4)  = 'SBI'
		DECLARE @BRNCH_ID  VARCHAR(9) = 'XXXXXX'

		INSERT INTO Account VALUES 
			(@AccountId,@CUSTOMER_ID,@CUSTOMER_NAME,@IBAN,@Country_Code,@BANK_ID,@BRNCH_ID)

		SET @Count = @count + 1;

	END
END;
Go