-- Procedure to do seacrh on Movie - to  display the list of theaters in which the movie is screened
-- also with the list of ScreenName and Price for each category with the showtime 

CREATE PROCEDURE MovieSearch @searchByMovieName nvarchar(50) 
AS
BEGIN
      SET NOCOUNT ON;
 
      --DECLARE THE VARIABLES FOR HOLDING DATA.
      DECLARE 
	  			@MovieName VARCHAR(100),
				@TheaterName VARCHAR(100), 
				@ScreenName VARCHAR(100),
				@ShowTime Time,
				@Price Money 

 
      --DECLARE AND SET COUNTER.
      DECLARE @Counter INT, 
			  @rowcount INT
			  set @rowCount = 0
      SET @Counter = 1
	 select @rowcount = count(*)
	 from Movies.Movies as a
join Theater.TheaterMovie as b 
on a.EntityID = b.EntityID
join Theater.Theater as c 
on b.BusinessEntityID = c.BusinessEntityID
join Theater.TheaterScreen as d 
on c.BusinessEntityID = d.BusinessEntityID 
join Movies.MovieShowTime as e 
on d.BusinessEntityID = e.BusinessEntityID 
join Movies.ShowTimeCategory as f 
on e.BusinessEntityID = f.BusinessEntityID
and e.ScreenID= f.ScreenID
and e.ShowTimeID = f.ShowTimeID
and e.Status = 'Active'
where a.Name = @searchByMovieName
group by a.EntityID
if (@rowcount = 0 )
Begin 
Print 'No Match found for the selection criteria'+ @searchByMovieName
Print 'Processing Terminated'
Return
End

      --DECLARE THE CURSOR FOR A QUERY.
      DECLARE Moviescr CURSOR READ_ONLY
      FOR select 
	   a.Name,
	   c.TheaterName, 
	   d.ScreenName,
	   e.ShowTime,
	   f.Price
from Movies.Movies as a
join Theater.TheaterMovie as b 
on a.EntityID = b.EntityID
join Theater.Theater as c 
on b.BusinessEntityID = c.BusinessEntityID
join Theater.TheaterScreen as d 
on c.BusinessEntityID = d.BusinessEntityID 
join Movies.MovieShowTime as e 
on d.BusinessEntityID = e.BusinessEntityID 
join Movies.ShowTimeCategory as f 
on e.BusinessEntityID = f.BusinessEntityID
and e.ScreenID= f.ScreenID
and e.ShowTimeID = f.ShowTimeID
and e.Status = 'Active'
where a.Name = @searchByMovieName
order by a.Name,c.TheaterName
-- End of New Code 
 
      --OPEN CURSOR.
      OPEN Moviescr
      --FETCH THE RECORD INTO THE VARIABLES.
      FETCH NEXT FROM Moviescr INTO
      @MovieName , @TheaterName , 
	  @ScreenName ,@ShowTime,
	  @Price
 
	  	
      --LOOP UNTIL RECORDS ARE AVAILABLE.
      WHILE @@FETCH_STATUS = 0
      BEGIN
             if @counter = 1 
			 print 'Movie Name:' + @MovieName + char(13)
		
             --PRINT CURRENT RECORD.
             Print  @TheaterName + CHAR(9) + CHAR(9) + CHAR(9) +
					@ScreenName + CHAR(9) + CHAR(9) + CHAR(9)+ CAST(@ShowTime as VARCHAR(10)) + CHAR(9) + CHAR(9) + CHAR(9) +
					CAST (@Price as VARCHAR(10))

             --INCREMENT COUNTER.
             SET @Counter = @Counter + 1
 
             --FETCH THE NEXT RECORD INTO THE VARIABLES.
             FETCH NEXT FROM Moviescr INTO
      @MovieName , @TheaterName , 
	  @ScreenName ,@ShowTime,
	  @Price
      END
 
      --CLOSE THE CURSOR.
      CLOSE Moviescr
      DEALLOCATE Moviescr 
END
GO


Execute MovieSearch 'Doctor Strange'