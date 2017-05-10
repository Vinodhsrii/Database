--Trigger to update the votes and ratings of a movie based on the user reviews (review table)

CREATE OR REPLACE TRIGGER Update_Movie_Rating
AFTER INSERT OR UPDATE ON Review

FOR EACH ROW
DECLARE
M_votes   Integer;
BEGIN
Update movies set votes = votes+10 where entityID= :new.entityID;

update movies set rating = rating+0.1 where entityID = :new.entityID;


END;
/


