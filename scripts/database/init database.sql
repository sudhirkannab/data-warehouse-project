-- Switch to the master database
-- We cannot delete a database while we are using it.
use master;
GO
-- Check whether the DataWarehouse database already exists.
IF EXISTS (
    SELECT 1
    FROM sys.databases
    WHERE name = 'DataWarehouse'
    )
begin 
-- Force all users to disconnect from the database.
    -- SINGLE_USER allows only one connection.
    -- ROLLBACK IMMEDIATE cancels any active transactions immediately.
    ALTER DATABASE DataWarehouse 
    set SINGLE_USER 
    WITH ROLLBACK IMMEDIATE;
    -- Permanently delete the existing DataWarehouse database.
    DROP DATABASE DataWarehouse;
end;
go

-- Create a new, empty DataWarehouse database.

CREATE DATABASE DataWarehouse;
GO
-- Switch to the newly created database.
use Datawarehouse;
GO

CREATE SCHEMA bronze;
GO
CREATE SCHEMA silver;
GO
CREATE SCHEMA gold;

