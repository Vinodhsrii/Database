-- Get the list of Movies screened in Theaters of Screen type IMax and price is less than $40 for an Adult
-- IMDB Category : Movies - Ticket - Pricing Category - Price
-- Tables linked : Movies (Movies.Movies),
-- 		Theater (Theater.Theater) ,
--		TheaterScreen (Theater.TheaterScreen) ,
--		MoviePricing (Movies.ShowTimeCategory),
--		Ticketscategory (Events.Category)
--                 	Bridging table (Movies.ShowTimeCategory)

select	a.name as MovieName,
d.TheaterName,
c.ScreenName,
f.CategoryName,
e.Price
from	Movies a
join	TheaterMovie b
on a.EntityID = b.EntityID
join TheaterScreen c
on b.ScreenID = c.ScreenID
join	Theater d
on d.BusinessEntityID = c.BusinessEntityID
join ShowTimeCategory e
on e.BusinessEntityID = d.BusinessEntityID
join Category f
on f.CategoryID = e.CategoryID
where c.ScreenName  = 'Imax' and
e.Price < 40
and
f.CategoryName = 'Adult'
order by a.Name;
