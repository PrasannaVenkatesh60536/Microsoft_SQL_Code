use happy;

select * from emp

select e_name, e_salary from emp;
select distinct e_salary from emp;

select e_name,e_salary from emp where e_age>30;
select e_name,e_salary from emp where e_age>30 and e_dept='development';

select e_name,e_salary from emp where e_age>30 or e_dept='it';

select * from emp where  not e_age>29;
select * from emp where not e_age<31;

select * from emp where e_name like 'a%';
select * from emp where e_age like '3_';