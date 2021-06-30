--문제1.
select 	count(salary)
from 	employees
where 	salary  < 	(select avg(salary)
                	 from employees);

--문제2.
select  em.employee_id,
        em.first_name,
        em.salary,
        av,
        mx   
from 	employees em, (select  avg(salary) av,max(salary) mx
                       from employees)
where	salary >= av
and 	salary <= mx
order by em.salary asc;

--문제3.
select  lo.location_id,
        lo.street_address,
        lo.postal_code,
        lo.city,
        lo.state_province,
        lo.country_id
from	departments dp, locations lo
where 	dp.department_id = (select department_id
                            from employees
                            where first_name||last_name = 'StevenKing')
                            and lo.location_id = dp.location_id;

--문제4.
select  employee_id,
        first_name,
        salary
from 	employees
where 	salary < any (select salary
                     from employees
                     where job_id = 'ST_MAN')
order by salary desc;

--문제5.
select  employee_id,
        first_name,
        salary,
        department_id
from 	employees
where 	(department_id, salary) in (select department_id, max(salary)
                                  from employees
                                  group by department_id)
order by salary desc;

--문제5.
select  em.employee_id,
        em.first_name,
        em.salary,
        em.department_id
from 	employees em, (select department_id, max(salary) mx
                    	from employees
                    	group by department_id)
where 	em.department_id = dm.department_id
and 	em.salary = mx
order by em.salary desc;


--문제6.
select  sj.job_id,
        sj.sm
from 	jobs jb, (select job_id, sum(salary) sm
               	  from employees
              	  group by job_id) sj
where 	sj.job_id = jb.job_id
order by sm desc;

--문제7.
select  em.employee_id,
        em.first_name,
        em.salary
from 	employees em, 	(select department_id, avg(salary) av
                    	from employees
                    	group by department_id) sd
where 	em.department_id = sd.department_id
and 	em.salary > sd.av;

--문제8.
select  rot.rn,
        rot.employee_id,
        rot.first_name,
        rot.salary,
        rot.hire_date
from	   (select  rownum rn,
             		ot.employee_id,
             		ot.first_name,
             		ot.salary,
             		ot.hire_date
     		from (select employee_id,
                 		first_name,
                 		salary,
                 		hire_date
          		  from employees
          		  order by hire_date asc)ot)rot
where 	rn >= 11 
and     rn <=15;