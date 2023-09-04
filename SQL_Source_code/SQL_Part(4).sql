use happy;

select * from emp;
select * from emp where e_id=1;
select e_name from emp where e_dept like 'D%';
select e_id, e_dept from emp where e_name like 'a%';
select * from emp where e_dept=(select e_dept from emp where e_name='Anne');

select  distinct e_dept from emp;