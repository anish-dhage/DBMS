CREATE OR REPLACE PROCEDURE check_fine(cid in int) is

  namesch varchar2(20);
  dateop date;
  amount real;
  currdate date := sysdate;
  days int;
  val number;
  invalid_entry exception;
  
BEGIN
  select count(*) into val from Customer where cust_id = cid;
  if (val = 0) then
    raise invalid_entry;
  end if;
  
  select DOP into dateop from Customer where Cust_id = cid;  
  days := trunc(currdate) - trunc(dateop);
  
  if (days>15 and days<30) then
    amount := days*5;
    insert into Fine values(cid,currdate,amount);
    update Customer set status = 'N' where Cust_id = cid;
  end if;
  
  if (days>30) then
    amount := 150+((days-30)*50);  
    insert into Fine values(cid,currdate,amount);
    update Customer set status = 'N' where Cust_id = cid;
  end if;
  
EXCEPTION
  when invalid_entry then  
    dbms_output.put_line('Invalid ID'); 

END;
/      
