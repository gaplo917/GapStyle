
--# Mysql
--eval CREATE TABLE t1 (a VARCHAR(200), b TEXT, FULLTEXT fts_idx(a,b), c INT PRIMARY KEY) $CREATE_TABLE_PARAMS
--source suite/innodb/include/show_i_s_tables.inc

INSERT INTO t1 VALUES
        ('MySQL Tutorial','DBMS stands for DataBase', 1)  ,
        ('How To Use MySQL Well','After you went through a', 2),
        ('Optimizing MySQL','In this tutorial we will show', 3);

INSERT INTO t1 VALUES
        ('1001 MySQL Tricks','1. Never run mysqld as root', 4),
        ('MySQL vs. YourSQL','In the following database comparison', 5),
        ('MySQL Security','When configured properly, MySQL', 6);

SELECT c FROM t1 WHERE MATCH (a,b)
        AGAINST ('Tutorial' IN NATURAL LANGUAGE MODE);

ALTER  TABLE t1 ADD UNIQUE INDEX idx1(b(20)), ALGORITHM=INPLACE;
--source suite/innodb/include/show_i_s_tables.inc

SELECT c FROM t1 WHERE MATCH (a,b)
        AGAINST ('Tutorial' IN NATURAL LANGUAGE MODE);

--echo # Test with ALGORITHM=COPY and with FTS Index
ALTER TABLE t1 ADD COLUMN pk INT NOT NULL AUTO_INCREMENT, DROP PRIMARY KEY, ADD PRIMARY KEY(pk), ALGORITHM=copy;
--source suite/innodb/include/show_i_s_tables.inc

SELECT pk FROM t1 WHERE MATCH (a,b)
        AGAINST ('Tutorial' IN NATURAL LANGUAGE MODE);

--echo # Before drop FTS index
--source suite/innodb/include/show_i_s_tables.inc

--echo # Test with DROP FTS Index & ADD FTS Index
ALTER TABLE t1 DROP INDEX fts_idx, ADD FULLTEXT INDEX fts_idx(a,b);
--source suite/innodb/include/show_i_s_tables.inc

SELECT pk FROM t1 WHERE MATCH (a,b)
        AGAINST ('Tutorial' IN NATURAL LANGUAGE MODE);

DROP TABLE t1;

-- MSSQL
-- Creates external tables

CREATE EXTERNAL TABLE [ext].[Date] 
(
    [DateID] int NOT NULL, 
    [Date] datetime NULL, 
    [DateBKey] char(10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL, 
    [DayOfMonth] varchar(2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL, 
    [DaySuffix] varchar(4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL, 
    [DayName] varchar(9) COLLATE SQL_Latin1_General_CP1_CI_AS NULL, 
    [DayOfWeek] char(1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL, 
    [DayOfWeekInMonth] varchar(2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL, 
    [DayOfWeekInYear] varchar(2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL, 
    [DayOfQuarter] varchar(3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL, 
    [DayOfYear] varchar(3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL, 
    [WeekOfMonth] varchar(1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL, 
    [WeekOfQuarter] varchar(2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL, 
    [WeekOfYear] varchar(2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL, 
    [Month] varchar(2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL, 
    [MonthName] varchar(9) COLLATE SQL_Latin1_General_CP1_CI_AS NULL, 
    [MonthOfQuarter] varchar(2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL, 
    [Quarter] char(1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL, 
    [QuarterName] varchar(9) COLLATE SQL_Latin1_General_CP1_CI_AS NULL, 
    [Year] char(4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL, 
    [YearName] char(7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL, 
    [MonthYear] char(10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL, 
    [MMYYYY] char(6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL, 
    [FirstDayOfMonth] date NULL, 
    [LastDayOfMonth] date NULL, 
    [FirstDayOfQuarter] date NULL, 
    [LastDayOfQuarter] date NULL, 
    [FirstDayOfYear] date NULL, 
    [LastDayOfYear] date NULL, 
    [IsHolidayUSA] bit NULL, 
    [IsWeekday] bit NULL, 
    [HolidayUSA] varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
WITH 
(  
    LOCATION = 'Date'  
,   DATA_SOURCE = NYTPublic
,   FILE_FORMAT = uncompressedcsv
,   REJECT_TYPE = value
,   REJECT_VALUE = 0  
)


CREATE EXTERNAL TABLE [ext].[Geography]
(
    [GeographyID] int NOT NULL, 
    [ZipCodeBKey] varchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL, 
    [County] varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL, 
    [City] varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL, 
    [State] varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL, 
    [Country] varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL, 
    [ZipCode] varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
WITH 
(  
    LOCATION = 'Geography'  
,   DATA_SOURCE = NYTPublic
,   FILE_FORMAT = uncompressedcsv
,   REJECT_TYPE = value
,   REJECT_VALUE = 0  
)
;

CREATE EXTERNAL TABLE [ext].[HackneyLicense] 
(
    [HackneyLicenseID] int NOT NULL, 
    [HackneyLicenseBKey] varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL, 
    [HackneyLicenseCode] varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
WITH 
(  
    LOCATION = 'HackneyLicense'  
,   DATA_SOURCE = NYTPublic
,   FILE_FORMAT = uncompressedcsv
,   REJECT_TYPE = value
,   REJECT_VALUE = 0  
)
;
CREATE EXTERNAL TABLE [ext].[Medallion] 
(
    [MedallionID] int NOT NULL, 
    [MedallionBKey] varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL, 
    [MedallionCode] varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
WITH 
(  
    LOCATION = 'Medallion'  
,   DATA_SOURCE = NYTPublic
,   FILE_FORMAT = uncompressedcsv
,   REJECT_TYPE = value
,   REJECT_VALUE = 0  
)
;
CREATE EXTERNAL TABLE [ext].[Time] 
(
    [TimeID] int NOT NULL, 
    [TimeBKey] varchar(8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL, 
    [HourNumber] tinyint NOT NULL, 
    [MinuteNumber] tinyint NOT NULL, 
    [SecondNumber] tinyint NOT NULL, 
    [TimeInSecond] int NOT NULL, 
    [HourlyBucket] varchar(15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL, 
    [DayTimeBucketGroupKey] int NOT NULL, 
    [DayTimeBucket] varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
)
WITH 
(  
    LOCATION = 'Time'  
,   DATA_SOURCE = NYTPublic
,   FILE_FORMAT = uncompressedcsv
,   REJECT_TYPE = value
,   REJECT_VALUE = 0  
)
;

CREATE EXTERNAL TABLE [ext].[Trip] 
(
    [DateID] int NOT NULL, 
    [MedallionID] int NOT NULL, 
    [HackneyLicenseID] int NOT NULL, 
    [PickupTimeID] int NOT NULL, 
    [DropoffTimeID] int NOT NULL, 
    [PickupGeographyID] int NULL, 
    [DropoffGeographyID] int NULL, 
    [PickupLatitude] float NULL, 
    [PickupLongitude] float NULL, 
    [PickupLatLong] varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL, 
    [DropoffLatitude] float NULL, 
    [DropoffLongitude] float NULL, 
    [DropoffLatLong] varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL, 
    [PassengerCount] int NULL, 
    [TripDurationSeconds] int NULL, 
    [TripDistanceMiles] float NULL, 
    [PaymentType] varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL, 
    [FareAmount] money NULL, 
    [SurchargeAmount] money NULL, 
    [TaxAmount] money NULL, 
    [TipAmount] money NULL, 
    [TollsAmount] money NULL, 
    [TotalAmount] money NULL
)
WITH 
(  
    LOCATION = 'Trip2013'  
,   DATA_SOURCE = NYTPublic
,   FILE_FORMAT = compressedcsv
,   REJECT_TYPE = value
,   REJECT_VALUE = 0  
)
;
CREATE EXTERNAL TABLE [ext].[Weather] 
(
    [DateID] int NOT NULL, 
    [GeographyID] int NOT NULL, 
    [PrecipitationInches] float NOT NULL, 
    [AvgTemperatureFahrenheit] float NOT NULL
)
WITH 
(  
    LOCATION = 'Weather2013'  
,   DATA_SOURCE = NYTPublic
,   FILE_FORMAT = uncompressedcsv
,   REJECT_TYPE = value
,   REJECT_VALUE = 0  
)
;

CREATE PROCEDURE [Application].Configuration_ApplyPartitioning
WITH EXECUTE AS OWNER
AS
BEGIN
    SET NOCOUNT ON;
    SET XACT_ABORT ON;

    IF SERVERPROPERTY(N'IsXTPSupported') = 0 -- TODO Check for a better way to check for partitioning
    BEGIN                                    -- Currently versions that support in-memory OLTP also support partitions
        PRINT N'Warning: Partitions are not supported in this edition.';
    END ELSE BEGIN -- if partitions are permitted

        BEGIN TRAN;

        DECLARE @SQL nvarchar(max) = N'';

        IF NOT EXISTS (SELECT 1 FROM sys.partition_functions WHERE name = N'PF_TransactionDateTime')
        BEGIN
            SET @SQL =  N'
CREATE PARTITION FUNCTION PF_TransactionDateTime(datetime)
AS RANGE RIGHT
FOR VALUES (N''20140101'', N''20150101'', N''20160101'', N''20170101'');';
            EXECUTE (@SQL);
        END;

        IF NOT EXISTS (SELECT 1 FROM sys.partition_functions WHERE name = N'PF_TransactionDate')
        BEGIN
            SET @SQL =  N'
CREATE PARTITION FUNCTION PF_TransactionDate(date)
AS RANGE RIGHT
FOR VALUES (N''20140101'', N''20150101'', N''20160101'', N''20170101'');';
            EXECUTE (@SQL);
        END;

        IF NOT EXISTS (SELECT * FROM sys.partition_schemes WHERE name = N'PS_TransactionDateTime')
        BEGIN

            -- for Azure DB, assign to primary filegroup
            IF SERVERPROPERTY('EngineEdition') = 5
                SET @SQL =  N'
CREATE PARTITION SCHEME PS_TransactionDateTime
AS PARTITION PF_TransactionDateTime
ALL TO ([PRIMARY]);';
            -- for other engine editions, assign to user data filegroup
            IF SERVERPROPERTY('EngineEdition') != 5
                SET @SQL =  N'
CREATE PARTITION SCHEME PS_TransactionDateTime
AS PARTITION PF_TransactionDateTime
ALL TO ([USERDATA]);';

            EXECUTE (@SQL);
        END;

        IF NOT EXISTS (SELECT 1 FROM sys.partition_schemes WHERE name = N'PS_TransactionDate')
        BEGIN
        -- for Azure DB, assign to primary filegroup
        IF SERVERPROPERTY('EngineEdition') = 5
            SET @SQL =  N'
CREATE PARTITION SCHEME PS_TransactionDate
AS PARTITION PF_TransactionDate
ALL TO ([PRIMARY]);';
        -- for other engine editions, assign to user data filegroup
        IF SERVERPROPERTY('EngineEdition') != 5
            SET @SQL =  N'
CREATE PARTITION SCHEME PS_TransactionDate
AS PARTITION PF_TransactionDate
ALL TO ([USERDATA]);';

            EXECUTE (@SQL);
        END;

        IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'CX_Sales_CustomerTransactions')
        BEGIN
            SET @SQL =  N'
ALTER TABLE Sales.CustomerTransactions
DROP CONSTRAINT PK_Sales_CustomerTransactions;';
            EXECUTE (@SQL);

            SET @SQL = N'
ALTER TABLE Sales.CustomerTransactions
ADD CONSTRAINT PK_Sales_CustomerTransactions PRIMARY KEY NONCLUSTERED
(
	CustomerTransactionID
);';
            EXECUTE (@SQL);

            SET @SQL = N'
CREATE CLUSTERED INDEX CX_Sales_CustomerTransactions
ON Sales.CustomerTransactions
(
	TransactionDate
)
ON PS_TransactionDate(TransactionDate);';
            EXECUTE (@SQL);

            SET @SQL = N'
CREATE INDEX FK_Sales_CustomerTransactions_CustomerID
ON Sales.CustomerTransactions
(
	CustomerID
)
WITH (DROP_EXISTING = ON)
ON PS_TransactionDate(TransactionDate);';
            EXECUTE (@SQL);

            SET @SQL = N'
CREATE INDEX FK_Sales_CustomerTransactions_InvoiceID
ON Sales.CustomerTransactions
(
	InvoiceID
)
WITH (DROP_EXISTING = ON)
ON PS_TransactionDate(TransactionDate);';
            EXECUTE (@SQL);

            SET @SQL = N'
CREATE INDEX FK_Sales_CustomerTransactions_PaymentMethodID
ON Sales.CustomerTransactions
(
	PaymentMethodID
)
WITH (DROP_EXISTING = ON)
ON PS_TransactionDate(TransactionDate);';
            EXECUTE (@SQL);

            SET @SQL = N'
CREATE INDEX FK_Sales_CustomerTransactions_TransactionTypeID
ON Sales.CustomerTransactions
(
	TransactionTypeID
)
WITH (DROP_EXISTING = ON)
ON PS_TransactionDate(TransactionDate);';
            EXECUTE (@SQL);

            SET @SQL = N'
CREATE INDEX IX_Sales_CustomerTransactions_IsFinalized
ON Sales.CustomerTransactions
(
	IsFinalized
)
WITH (DROP_EXISTING = ON)
ON PS_TransactionDate(TransactionDate);';
            EXECUTE (@SQL);
        END;

        IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'CX_Purchasing_SupplierTransactions')
        BEGIN
            SET @SQL =  N'
ALTER TABLE Purchasing.SupplierTransactions
DROP CONSTRAINT PK_Purchasing_SupplierTransactions;';
            EXECUTE (@SQL);

            SET @SQL =  N'
ALTER TABLE Purchasing.SupplierTransactions
ADD CONSTRAINT PK_Purchasing_SupplierTransactions PRIMARY KEY NONCLUSTERED
(
	SupplierTransactionID
);';
            EXECUTE (@SQL);

            SET @SQL =  N'
CREATE CLUSTERED INDEX CX_Purchasing_SupplierTransactions
ON Purchasing.SupplierTransactions
(
	TransactionDate
)
ON PS_TransactionDate(TransactionDate);';
            EXECUTE (@SQL);

            SET @SQL =  N'
CREATE INDEX FK_Purchasing_SupplierTransactions_PaymentMethodID
ON Purchasing.SupplierTransactions
(
	PaymentMethodID
)
WITH (DROP_EXISTING = ON)
ON PS_TransactionDate(TransactionDate);';
            EXECUTE (@SQL);

            SET @SQL =  N'
CREATE INDEX FK_Purchasing_SupplierTransactions_PurchaseOrderID
ON Purchasing.SupplierTransactions
(
	PurchaseOrderID
)
WITH (DROP_EXISTING = ON)
ON PS_TransactionDate(TransactionDate);';
            EXECUTE (@SQL);

            SET @SQL =  N'
CREATE INDEX FK_Purchasing_SupplierTransactions_SupplierID
ON Purchasing.SupplierTransactions
(
	SupplierID
)
WITH (DROP_EXISTING = ON)
ON PS_TransactionDate(TransactionDate);';
            EXECUTE (@SQL);

            SET @SQL =  N'
CREATE INDEX FK_Purchasing_SupplierTransactions_TransactionTypeID
ON Purchasing.SupplierTransactions
(
	TransactionTypeID
)
WITH (DROP_EXISTING = ON)
ON PS_TransactionDate(TransactionDate);';
            EXECUTE (@SQL);

            SET @SQL =  N'
CREATE INDEX IX_Purchasing_SupplierTransactions_IsFinalized
ON Purchasing.SupplierTransactions
(
	IsFinalized
)
WITH (DROP_EXISTING = ON)
ON PS_TransactionDate(TransactionDate);';
            EXECUTE (@SQL);
        END;

        COMMIT;

        PRINT N'Partitioning successfully enabled';
    END;
END;
