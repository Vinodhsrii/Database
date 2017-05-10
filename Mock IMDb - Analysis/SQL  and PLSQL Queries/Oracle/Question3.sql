-- Get all details of the Cast and Crew - Personal details and Images
-- IMDB Category :  Cast and Crew (Details of Directors, Actors , Actress , Singer , Composer etc)
-- Tables Linked :  1.Cast and Crew table (Events.CastCrew)
--					2.Movies (Movies)
--					3.Bridging Table (MoviesCastCrew )
					 
select	a.Name as CastName,
a.DateOfBirth,
a.imageID  as Image,
d.Name as MovieName 
from CastCrew a 
join CastCrewType b
on a.TypeID = b.TypeID
join MoviesCastCrew c 
on a.CastCrewID = c.CastCrewID
join Movies d 
on c.EntityID = d.EntityID
where b.Type = 'cast';
		 

	
