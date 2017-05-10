-- Trigger to update the Age and Registration of any IMDB user on First Login 

Create  TRIGGER update_user_age1 on Events.imdbuser 
for insert 
as
begin
declare @i_userid    int,
		@i_dob        date

select @i_userid =  REGID from inserted
select @i_dob    =  dateofbirth from inserted


update Events.UserRegDetails set userAge = (select (DATEPART(YEAR,GETDATE()) - DATEPART(YEAR,dateofbirth)) as age FROM Events.imdbuser 
where REGID= @i_userid
and dateofbirth = @i_dob  ) , regyear = year (getdate())
where REGID= @i_userid

end

insert into Events.IMDBUser values (42,'Individual','PRI1','PO1','F','1984-02-03','PRIAL','artrdt',27)