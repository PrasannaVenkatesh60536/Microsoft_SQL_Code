use happy;
--select Statement
select e_name,e_age,e_salary from emp;

select distinct e_salary from emp;

--Where clause

select * from emp where e_age<30;

select * from emp where e_salary>70000;

--And Operator

select * from emp where e_gender='Male' and e_age<25;


--Or Operator

select * from emp where e_gender='Female' or e_dept='development';

select * from emp;

--Not Operator

select * from emp where  not e_age>29;

--Like operator

select * from emp where e_name like 'a%';

select * from emp where e_age like '2_';

--Between Operator

select * from emp where e_age between 20 and 39;


--Inner Join

create table department(d_id int,
d_name varchar(20),
d_location varchar(20));

insert into department values(1,'Development','Chennai'),
(2,'Technical','Banglore'),
(3,'Tester','Chennai'),
(4,'Hr','Coimbatore'),
(5,'Production','Noida');

select * from department;
select * from emp;

select emp.e_name, emp.e_dept,department.d_name, department.d_location
from emp
inner join department
on emp.e_dept = department.d_name;

--Left outer join

select emp.e_name, emp.e_dept, department.d_name,department.d_location
from emp
left join department
on emp.e_dept=department.d_name;

--Right outer join

select emp.e_name,emp.e_dept,department.d_name,department.d_location
from emp
right join department
on emp.e_dept=department.d_name;

--Full join
 select emp.e_name,emp.e_dept,department.d_name,department.d_location
 from emp
 full join department
 on emp.e_dept=department.d_name;

 select * from department;
 select * from emp;

 --Delete query

 create table emp2(id int, name varchar(10));

 insert into emp2 values(1,'prasana'),
 (2,'Venkatesh'),
 (3,'Balahi'),
 (4,'Priya');

 select * from emp2;

 delete from emp2 where id=2;

 --truncate query 

 truncate table emp2;

 --update query

 update emp 
 set e_salary=99999
 where e_age>39;
 
 select * from emp;

 --update using join

 insert into emp values(6,'prasana',5000,34,'male','hr'),
 (7,'venkatesh',6000,24,'male','hr'),
 (8,'Balaji',50000,54,'male','hr');

 update emp
 set e_salary=99999
 from emp
 join department
 on emp.e_dept=department.d_name
 where e_dept='hr';

 --Delete using join

 delete emp
 from emp
 join department
 on emp.e_dept=department.d_name
 where e_dept='hr';

 select * from emp;

 --merge table

 truncate table emp_t;

 create table emp_t(eid int,
 ename varchar(20),
esalary int,
eage int,
egender varchar(20),
edept varchar(20));

insert into emp_t values(1,'Prasanna','100000',26,'Male','Development'),
(2,'Venkatesh','200000',27,'Male','Hr'),
(3,'Balaji','300000',27,'Male','Development'),
(4,'Priya','800000',23,'Female','Production'),
(5,'dinesh','500000',26,'Male','Testing');


truncate table emp_S;

create table emp_s(eid int,
 ename varchar(20),
esalary int,
eage int,
egender varchar(20),
edept varchar(20));

insert into emp_s values(1,'Prasanna','100000',26,'Male','Development'),
(2,'Venkatesh','50000',27,'Male','Hr'),
(3,'Balaji','60000',30,'Male','Development'),
(4,'Priya','90000',23,'Female','Production'),
(5,'dinesh','30000',23,'Male','Testing'),
(6,'Loganathan','50000',53,'Male','Development'),
(7,'Cauvery','20000',56,'Female','Hr');

select * from emp_t;
select * from emp_s;

merge emp_t as t
using emp_s as s
on t.eid=s.eid
when matched
then update set t.esalary=s.esalary,t.eage=s.eage
when not matched by target
then insert (eid,ename,esalary,eage,egender,edept)
values(s.eid,s.ename,s.esalary,s.eage,s.egender,s.edept)
when not matched by source
then delete;

select * from emp_t;

--Alter Table

select * from emp;
--Add new column
alter table emp
add edate date;

--drop column

alter table emp
drop column edate;

--create temp table

create table #student(
id int,name varchar(20)
);
insert into #student values(1,'prasana');
select * from #student;

------------Module 3-------------------------