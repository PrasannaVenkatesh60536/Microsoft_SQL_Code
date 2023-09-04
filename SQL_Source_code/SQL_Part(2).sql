use happy;

--case statement
select *, generation=
case
when e_age>30 then 'Older'
when e_age<30 then 'Younger'
else 'no'
end
from emp;
go

--iif statement

select e_name,e_dept, iif(e_age<20,'Younger','Elder')
as empgen from emp;

--user defined function

create function adds(@num as int)
returns int
as
begin
return(@num+10)
end
 select dbo.adds(10)

 --top clause

 select top 3 * from emp;
 select top 3 * from emp order by e_age desc;

 --group by
 select avg(e_salary),e_dept from emp group by e_dept;

 select avg(e_salary),e_dept from emp group by e_dept order by avg(e_salary) desc;

 --having clause

 select e_dept,avg(e_salary) as avg_Salary
 from emp
 group by e_dept
 having avg(e_salary)>50000
 order by avg(e_salary) desc;

 drop table emp2;
 
 create table emp2 (eid int, ename varchar(20),esalary int, eage int,egender varchar(20),edept varchar(20));
 insert into emp2 values(1, 'prasanna',20000,23,'Male','Production'),
 (2, 'Prasath',20000,27,'Male','development'),
 (3, 'Venkatesh',20000,23,'Male','IT'),
 (4, 'Blaji',20000,23,'Male','IT'),
 (5, 'Anne',20000,33,'Female','Development');
 --union operator
 select * from  emp;
 select * from  emp2;

 select * from emp
 union 
 select * from  emp2;

 --unionall
 select * from emp
 union all
 select * from  emp2;

 create table student(stid int, sname varchar(20), smark int);
 insert into student values(1,'prasanna',45),
 (2,'Venkatesh',49),
 (3,'Balaji',60);


 create table student2(stid int, sname varchar(10), smark int);
 insert into student2 values(4,'Priya',45),
 (5,'Dinesh',49),
 (6,'Loganathan',60);
 insert into student2 values(7,'Balaji',60);
 update  student2 set stid=3;

 select * from student
 except 
 select * from student2;

 select * from student
 intersect 
 select * from student2;

 --stored procedure
 drop procedure prd;
 create procedure prd
as
select e_name from emp
go

exec prd;

--passing parameter
drop procedure empprocedure;
create procedure empprocedure @gender varchar(10)
as 
select *from emp
where e_gender=@gender

exec empprocedure @gender='male';

--view

create view femp
as
select * from emp
where e_gender='Female'

select * from femp;

drop view femp;

select * from emp where e_gender='male';

--Trancaction
begin transaction
update emp set e_salary=1000 where e_gender='male'
 rollback transaction;
 select * from emp;

 begin try
 begin transaction
 update emp set e_age=30 where e_salary>95000
 commit transaction
 print'Commited'
end try
begin catch
rollback transaction
print 'Rollbacked'
end catch
select * from emp;

--Exception handling

declare @num1 int;
declare @num2 int;
begin try
set @num1=3;
set @num2=4;
print 'Sucess'
end try
begin catch
print error_message()
end catch
go

