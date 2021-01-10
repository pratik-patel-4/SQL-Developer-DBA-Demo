CREATE OR ALTER PROC uspCreateOrUpdateAccount (
	@AccountId VARCHAR(12) = '', --As It is required to created automatically if not specified in create
	@CUSTOMER_ID VARCHAR(16),
	@CUSTOMER_NAME VARCHAR(MAX),
	@IBAN VARCHAR(32),
	@Country_Code VARCHAR(3),
	@BANK_ID VARCHAR(4),
	@BRNCH_ID  VARCHAR(9)
)
As 
BEGIN 
	DECLARE @UPDATEFLAG BIGINT = 0;
	IF TRIM(@AccountId) IS NOT NULL OR TRIM(@AccountId) <> ''
	BEGIN
		DECLARE @COUNT as BIGINT = 0;
		SELECT @COUNT = Count(1) FROM Account WHERE ACCOUNT_ID = @AccountId;
		IF @COUNT > 0
		BEGIN 
			SET @UPDATEFLAG = 1;
			IF TRIM(@CUSTOMER_NAME) IS NOT NULL OR TRIM(@CUSTOMER_NAME) <> '' 
			BEGIN
				UPDATE Account SET CUSTOMER_NAME = @CUSTOMER_NAME WHERE ACCOUNT_ID = @AccountId
			END
			IF TRIM(@Country_Code) IS NOT NULL OR TRIM(@Country_Code) <> '' 
			BEGIN
				UPDATE Account SET Country_Code = @Country_Code WHERE ACCOUNT_ID = @AccountId
			END
			IF TRIM(@BANK_ID) IS NOT NULL OR TRIM(@BANK_ID) <> '' 
			BEGIN
				UPDATE Account SET BANK_ID = @BANK_ID WHERE ACCOUNT_ID = @AccountId
			END
			IF TRIM(@BRNCH_ID) IS NOT NULL OR TRIM(@BRNCH_ID) <> '' 
			BEGIN
				UPDATE Account SET BRNCH_ID = @BRNCH_ID WHERE ACCOUNT_ID = @AccountId
			END
			IF TRIM(@IBAN) IS NOT NULL OR TRIM(@IBAN) <> '' 
			BEGIN
				UPDATE Account SET IBAN = @IBAN WHERE ACCOUNT_ID = @AccountId
			END

		END
	END

	--check if the update flag is 0
	IF @UPDATEFLAG = 0 
	BEGIN 

		-- check if the account id is empty or not.
		IF TRIM(@AccountId) IS NULL OR TRIM(@AccountId) = ''
		BEGIN
			SET @AccountId = (SELECT ISNULL(MAX(CAST(Account_Id as bigint)),0) FROM Account) + 1
		END

		INSERT INTO Account VALUES 
		(@AccountId,@CUSTOMER_ID,@CUSTOMER_NAME,@IBAN,@Country_Code,@BANK_ID,@BRNCH_ID)

		SELECT * FROM Account WHERE ACCOUNT_ID = @AccountId
	END
END;
Go
