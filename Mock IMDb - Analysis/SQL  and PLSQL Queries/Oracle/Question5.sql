-- Get the list of Reporters and the Link to the inforamtion Source of Top News for each category 
-- IMDN Category	: News - News Source - News Reporter 
-- Tables Linked	: 1. News (News.News)
--					  2. News Category (News.NewsCategory)
--					  3. News Source(News.NewsSource )
--					  4. News and Source Bridge (News.NewsSource)
--					  5. Reporter (News.NewsReporter
--					  6. News - Reporter Bridge (News.ReporterNews)
select	b.CategoryName as NewsCategory,
a.NewsTitle, 
d.SourceName, 
d.SourceLink , 
f.Name as ReporterName	  
from	News a 
join NewsCategory b 
on a.NewsCategoryID = b.NewsCategoryID
join NewsSourceBR c 
on a.NewsID = c.NewsID
join NewsSource d
on d.SourceID = c.SourceID
join ReporterNews e 
on a.NewsID = e.NewsID 
join Reporter f
on f.ReporterID = e.ReporterID
where a.IsImportant = 'Y'
Order by b.categoryNAme;

   