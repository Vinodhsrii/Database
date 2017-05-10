-- Get the Report of the Movies screened in theaters by geo-Hierarchy
-- Linked Tables : 1. Movies (Movies.Movies)
--				   2. Briding Table (Theater Movie)
--				   3. Theater (Theater.Theater)
--				   4. Briding Table (TheaterBusinessEntityAddress)
--				   5. Address (contactDetails.Address)
--				   6. City (ContactDetails.City)
--				   7. State (ContactDetails.State)
--				   8. Country (ContactDetails.Country)
 
select	f.Name as CountryName,
e.StateProvinceName,
d.Name as CityName,
a.TheaterName,
count(g.EntityID)as MovieScreenedCount 	
From	Movies g 
join  TheaterMovie h 
on g.EntityID = h.EntityID
join Theater a  on 
h.BusinessEntityID  = a.BusinessEntityID join  
BusinessEntityAddress b
on a.BusinessEntityID = b.BusinessEntityID 
join Address c 
on b.AddressID = c.AddressID
join City d 
on c.CityID = d.CityID
join StateProvince e
on e.StateProvinceID = d.StateProvinceID
join Country f
on e.CountryRegionCode  = f.CountryRegionCode
group by rollUp (f.Name ,
		e.StateProvinceName,
		d.Name,
		a.TheaterName);






