-- Creating a Backup File for the Database (IMDB- Database) with the TimeStamp of  
CREATE PROCEDURE CreateBackup @fpath nvarchar(max)
AS
BEGIN
SET NOCOUNT ON;
DECLARE @name VARCHAR(50)     
DECLARE @fName VARCHAR(256)   
DECLARE @fDate VARCHAR(20) 

SELECT @fDate = CONVERT(VARCHAR(20),GETDATE(),112) + REPLACE(CONVERT(VARCHAR(20),GETDATE(),108),':','')
 
DECLARE backup_cursor CURSOR FOR  
SELECT name 
FROM master.dbo.sysdatabases 
WHERE name NOT IN ('master','model','msdb','tempdb','Verification DB - IMDB')
OPEN backup_cursor   
FETCH NEXT FROM backup_cursor INTO @name   
WHILE @@FETCH_STATUS = 0   
BEGIN   
       SET @fName = @fpath + rtrim(@name) + '_' + @fDate + '.BAK'  
       BACKUP DATABASE @name TO DISK = @fName  
       FETCH NEXT FROM backup_cursor INTO @name   
END   
CLOSE backup_cursor   
DEALLOCATE backup_cursor
END
go

drop Procedure CreateBackup
execute CreateBackup 'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\Backup\'
