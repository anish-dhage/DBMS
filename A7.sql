cat ~/.mysql_history

mysql -h 10.10.10.54 -u t31106 -p
t31106
use t31106db
show tables;

create table Customer2 ( Cust_id int(11) , Name varchar(20), total_pur int(11) );

insert into Customer2 values (	1, 'aaa' , 1000		);
insert into Customer2 values (	2, 'bbb' , 2000		);
insert into Customer2 values (	3, 'ccc' , 3000		);
insert into Customer2 values (	4, 'ddd' , 4999		);
insert into Customer2 values (	5, 'eee' , 5000		);
insert into Customer2 values (	6, 'fff' , 10000	);
insert into Customer2 values (	7, 'ggg' , 15000	);
insert into Customer2 values (	8, 'hhh' , 20000	);
insert into Customer2 values (	9, 'iii' , 20000	);

create table Category ( Cust_id int(11) , Name varchar(20), category varchar(20) );

delimiter $$
	create procedure Cat()
		begin
			declare name varchar(30);
			declare b int default 0;
			declare id int;
			declare total int;
			declare cursor_c1 cursor for select * from Customer2;
			declare continue handler for not found set b=1;
			open cursor_c1;
			repeat
				fetch cursor_c1 into id,name,total;
				if not b then
					if total>=10000 and total<=20000 then
						insert into Category values(id,name,'Platinum');
					end if;
					if total>=5000 and total<=9999 then
						insert into Category values(id,name,'Gold');
					end if;
					if total>=2000 and total<=4999 then
						insert into Category values(id,name,'Silver');
					end if;
				end if;
			until b end repeat;
		end;
$$
delimiter ;
call Cat();


