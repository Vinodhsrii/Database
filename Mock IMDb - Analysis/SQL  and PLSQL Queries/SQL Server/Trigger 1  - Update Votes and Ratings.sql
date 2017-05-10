--Trigger to update the Votes and rating based on the user reviews from the review table  

CREATE  TRIGGER Update_Movie_Rating on events.Review
for  INSERT 
as 

BEGIN
DECLARE @M   Integer;
select @m = entityID from inserted

Update movies.Movies set votes = votes+10 where entityID= @M;

update movies.Movies set rating = rating+0.1 where entityID = @M;


END;

--------------------------------------

insert into Events.review values 

(28,    'I took my 5 1/2 year old daughter to watch Trolls, and for her it was a sight for sore eyes.',     101 , 26)