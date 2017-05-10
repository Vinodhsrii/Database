-- Trigger to calculate the Total Turn Over for a given Movie 
-- considering the BoxOffice of all geo locations 
IF OBJECT_ID('CalculateTotalTurnOver', 'FN') IS NOT NULL
  DROP FUNCTION CalculateTotalTurnOver;
GO

CREATE FUNCTION CalculateTotalTurnOver
(@Movie_name Char(50))
RETURNS float 
AS
BEGIN
DECLARE @TotalAmount float
Declare @newTotal float
Declare @str nvarchar
set @newTotal = 0.0

select @totalAmount = max(weekendcollections * weeknumber) from BoxOffice.weekboxoffice
where entityID in (select entityID from  Movies.Movies where  name=@Movie_name)
set @newTotal = @TotalAmount
Return(@newTotal)
END;
GO

DECLARE @ret float;   
EXEC @ret =  CalculateTotalTurnOver @Movie_name='Arrival'; 
SELECT @ret;