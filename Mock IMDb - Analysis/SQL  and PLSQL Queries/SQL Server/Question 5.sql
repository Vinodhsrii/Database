-- Get all the Choice Count and for each Poll choices of the polls created since the last five days
-- IMDB Category 	: Community - Polls 
-- Tables Related 	: 	1. Polls (Community.Polls)
--						2. Poll Details (community.PollDetails)
--						3. Poll Response (community.PollsResponse) 

select a.PollID as PollName,b.ChoiceID, b.Choice, jc.ResponseCount from Community.Polls as a 
join Community.PollsDetails as b 
on a.PollID = b.PollID 
join (select PollID, ChoiceID, Count (ResponseID) as ResponseCount from Community.PollsResponse
group by PollID, ChoiceID) as jc
on b.PollID = jc.PollID and b.ChoiceID = jc.ChoiceID
where CreatedOn < (select GETDate()) 
and	  CreatedOn >=  (select (GETDate() - 5)) 