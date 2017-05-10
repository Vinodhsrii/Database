-- Get all details of the Cast and Crew - Personal details and Images
-- IMDB Category :  Cast and Crew (Details of Directors, Actors , Actress , Singer , Composer etc)
-- Tables Linked :  Cast and Crew table (CastCrew)
--					Movies (Movies)
--					Bridging Table (MoviesCastCrew )

select	a.Name as CastName,
		a.DateOfBirth,
		a.imageID  as Image,
		d.Name     as MovieName 
	from CastCrew as a 
	join CastCrewType as b
	on a.castcrewid = b.castcrewid
	join MovieCastCrew as c 
	on a.CastCrewID = c.CastCrewID
	join Movies as d 
	on c.EntityID = d.EntityID
	where b.castcrewtype = 'cast';

