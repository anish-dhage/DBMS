triggers

Student(Rollno,Name,DateofAdmission,branch,percent,Status)
create table student (rollno number not null primary key, sname varchar2(20), date_of_ad date, branch varchar2(20), percent float, status varchar2(10));

create table alumini(rollno number not null, sname varchar2(20), date_of_ad date, branch varchar2(20), percent float, status varchar2(10));     //, date_of_cancel date);

insert into student21 values(&rollno, &sname, &date_of_ad, &branch, &percent, &status);

 1) BEFORE UPDATE, Statement Level: This trigger will insert a record into the table 'product_check' before a sql update statement is executed, at the statement level.


CREATE or REPLACE TRIGGER insert_into_alumni 
BEFORE UPDATE OR DELETE ON student FOR EACH ROW 
BEGIN 
INSERT INTO alumini VALUES (:old.rollno, :old.sname, :old.date_of_ad, :old.branch, :old.percent, 'PASSED'); 
END; 
/ 














CREATE or REPLACE TRIGGER Before_Update_Stat_student 
BEFORE 
UPDATE ON student
Begin 
INSERT INTO alumini 
Values('Before update, statement level',sysdate); 
END; 

/ 


p
CREATE or REPLACE TRIGGER after_into_alumini after UPDATE OR DELETE ON student21 FOR EACH ROW 
BEGIN 
INSERT INTO alumini VALUES (:old.rollno, :old.sname, :old.date_of_ad, :old.branch,:old.precent, :old.status, sysdate); 
END; 

/
f
CREATE or REPLACE TRIGGER after_into_alumini after UPDATE OR DELETE ON student21 
BEGIN 
INSERT INTO alumini VALUES (:old.rollno, :old.sname, :old.date_of_ad, :old.branch,:old.precent, :old.status, sysdate); 
END; 

/  
CREATE or REPLACE TRIGGER before_into_alumini after UPDATE OR DELETE ON student21 
BEGIN 
INSERT INTO alumini VALUES (:old.rollno, :old.sname, :old.date_of_ad, :old.branch,:old.precent, :old.status, sysdate); 
END; 
/ 
u
Create or replace trigger 
