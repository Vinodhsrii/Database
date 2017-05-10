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
		  
from	News.News as a 
join    News.NewsCategory as b 
on a.NewsCategoryID = b.NewsCategoryID
join    News.NewsSourceBR as c 
on a.NewsID = c.NewsID
join   News.NewsSource as d
on d.SourceID = c.SourceID
join  News.ReporterNews as e 
on a.NewsID = e.NewsID 
join News.Reporter as f
on f.ReporterID = e.ReporterID
where a.IsImportant = 'Y'
Order by b.categoryNAme

   