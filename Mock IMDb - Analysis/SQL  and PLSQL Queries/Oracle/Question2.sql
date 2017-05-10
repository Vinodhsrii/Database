-- Rank movies with PG13-certificate whose Total Weekend Turnover is more than its budget 
-- Tables linked : Movie BoxOffice (BoxOffice.BoxOffice), 
-- 				   BoxOffice Weekend Collection (BoxOffice.WeekBoxOffice) , 
--				   Movies (Movies.Movies) , 
--				   Movie certification (Events.Certificate), 



Select c.Name as MovieName,d.CertificateName,a.Budget as MovieBudget,
sum (b.WeekendCollections) as NetWeekendCollection,
DENSE_RANK() over (order by a.Budget desc) as Rank 
from BoxOffice a  join
WeekBoxOffice b
on a.BoxOfficeID = b.BoxOfficeID
join Movies c 
on a.EntityID = c.EntityID
join Certificate d
on c.CertificateID = d.CertificateID
where d.CertificateName = 'PG-13'
group by c.Name, a.Budget, d.CertificateName
having sum (b.WeekendCollections) > a.Budget;