-- Get the list of Movies screened in Theaters of Screen type IMax and price is less than $40 for an Adult
-- IMDB Category : Movies - Ticket - Pricing Category - Price 
-- Tables linked : Movies (Movies), 
-- 				   Theater (Theater) , 
--				   TheaterScreen (TheaterScreen) , 
--				   MoviePricing (ShowTimeCategory), 
--				   Ticketscategory (Category) 
--                  	
select	a.name ,
		d.TheaterName,
		c.ScreenName,
		f.CategoryName,
		e.Price
	from	Movies		 as a 
	join	TheaterMovie as b
	on a.EntityID = b.EntityID
	join TheaterScreen	 as c
	on b.ScreenID = c.ScreenID
	join	Theater		 as d
	on d.BusinessEntityID = c.BusinessEntityID 
	join ShowTimeCategory as e
	on e.BusinessEntityID = d.BusinessEntityID
	join Category as f
	on f.CategoryID = e.CategoryID
	where c.ScreenName  = 'Imax' and 
		  e.Price < 40 			 and 
		  f.CategoryName = 'Adult'
	order by a.Name;

