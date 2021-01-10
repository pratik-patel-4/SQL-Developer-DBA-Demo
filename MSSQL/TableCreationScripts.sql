DROP TABLE Account;
CREATE TABLE Account(
	[ACCOUNT_ID] VARCHAR(12) primary key,
	[CUSTOMER_ID] VARCHAR(16),
	[CUSTOMER_NAME] VARCHAR(MAX),
	[IBAN] VARCHAR(32),
	[Country_Code] VARCHAR(3),
	[BANK_ID] VARCHAR(4),
	[BRNCH_ID]  VARCHAR(9),
);

-- IF the account id has some prefix then we can also do like this.
--CREATE TABLE Account(
--	[Id] bigint identity primary key,
--	[prefix] varchar(50),
--	[ACCOUNT_ID] AS ([PreFix]+ RIGHT('00000000' + CAST(Id AS VARCHAR(8)), 8)) PERSISTED,
--	[CUSTOMER_ID] VARCHAR(16),
--	[CUSTOMER_NAME] VARCHAR(MAX),
--	[IBAN] VARCHAR(32),
--	[Country_Code] VARCHAR(3),
--	[BANK_ID] VARCHAR(4),
--	[BRNCH_ID]  VARCHAR(9),
--);
-- IF we are using above approch then we have to change in the sp
