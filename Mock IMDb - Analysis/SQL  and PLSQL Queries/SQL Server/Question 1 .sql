-- Get the list of Movies screened in Theaters of Screen type IMax and price is less than $40 for an Adult
-- IMDB Category : Movies - Ticket - Pricing Category - Price 
-- Tables linked : Movies (Movies.Movies), 
-- 				   Theater (Theater.Theater) , 
--				   TheaterScreen (Theater.TheaterScreen) , 
--				   MoviePricing (Movies.ShowTimeCategory), 
--				   Ticketscategory (Events.Category) 
--                 Bridging table (Movies.ShowTimeCategory)  
 
select	a.name as MovieName,
		d.TheaterName,
		c.ScreenName,
		f.CategoryName,
		e.Price
from	Movies.Movies		 as a 
join	Theater.TheaterMovie as b
on a.EntityID = b.EntityID
join Theater.TheaterScreen	 as c
on b.ScreenID = c.ScreenID
join	Theater.Theater		 as d
on d.BusinessEntityID = c.BusinessEntityID 
join Movies.ShowTimeCategory as e
on e.BusinessEntityID = d.BusinessEntityID
join Events.Category as f
on f.CategoryID = e.CategoryID
where c.ScreenName  = 'Imax' and 
	  e.Price < 40 			 and 
	  f.CategoryName = 'Adult'
order by a.Name;