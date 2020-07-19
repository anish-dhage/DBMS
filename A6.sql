cursors




create table old ( id number(2) not null, name varchar2(25) not null);
create table new ( id number(2) not null, name varchar2(25) not null);

insert into old (id, name) values (1,'Pratik');
insert into old (id, name) values (2,'Dhwani');
insert into old (id, name) values (3,'Shahrukh');
insert into old (id, name) values (4,'Tanvi');

insert into new(id, name) values (1,'Pratik');
insert into new(id, name) values (3,'Shahrukh');

declare
newcid int;
newname varchar2(25);
oldcid int;
oldname varchar2(25);
cursor newcursor(n int) is select * from new where id=n;
cursor oldcursor is select * from old;
begin
open oldcursor;
loop
fetch oldcursor into newcid, newname;
exit when oldcursor%notfound;
open newcursor(newcid);
fetch newcursor into oldcid, oldname;
if newcursor%notfound then
insert into new values(newcid,newname);
end if;
close newcursor;
end loop;
close oldcursor;
end;
/

select * from old;
select * from new;






create table employee21 (emp_id number not null primary key, eName varchar2(20), joining_date date, dept_name varchar2(20), salary number);
insert into employee21 values(&emp_id, &eName, &joining_date, &dept_name, &salary);
update employee21 set city = 'mumbai' where emp_id=5;  

//implicit

declare
	total_rows number(5);
begin
    update employee21
    set salary = salary*1.05
    where year(joining_date ) = 2015;


//implicit
    DECLARE   
       total_rows number;  
    BEGIN  
       UPDATE  employee21  
       SET salary = salary*1.05;  
       IF sql%notfound THEN  
          dbms_output.put_line('no such employee updated');  
       ELSIF sql%found THEN  
          total_rows := sql%rowcount;  
          dbms_output.put_line( total_rows || ' employee salary updated ');  
       END IF;   
    END;  
    /  



create table employee21 (emp_id number not null primary key, eName varchar2(20), joining_date date, dept_name varchar2(20), salary number);
//explicit for loop 


declare
    e_id number;
    ename employee21.eName%type;
    edate date;
	sal number;
    cursor c is select emp_id, eName, joining_date, salary from employee21;
begin
	open c;
	loop
		fetch c into e_id, ename, edate, sal;
		EXIT when c%notfound;
			UPDATE  employee21  
       		SET salary = salary*1.05 where extract(year from edate)<2017;  
			dbms_output.put_line(e_id || ' ' || ename || ' ' || sal || ' ' || edate);  
		
	end loop;
	close c;
end;
/


//parameterized explicit

declare
    e_id number;
    ename employee21.eName%type;
    edate date;
	sal number;
    cursor c1 (min_sal number) is select emp_id, eName, joining_date, salary from employee21 where salary<min_sal;
begin
	open c1(21000);
	loop
		fetch c1 into e_id, ename, edate, sal;
		EXIT when c1%notfound;
			UPDATE  employee21  
       		SET salary = salary + 5000;  
			dbms_output.put_line(e_id || ' ' || ename || ' ' || sal || ' ' || edate);  
	end loop;
