--Function to calculate total weekend turnover for a given movie

CREATE OR REPLACE FUNCTION findtotal
(Movie_name IN Char)
RETURN number 
IS
TotalAmount number;
no_data_found exception;

BEGIN

if Movie_Name is null then
dbms_output.put_line('Movie Name cannot be Empty');
raise_application_error(-20001,'NO DATA FOUND');

else
select max(weekendcollections * weeknumber) into totalAmount from weekboxoffice
where entityID in (select entityID from movies where name=Movie_name);

Return(TotalAmount);
END IF;
END;
/




