--문제1
select count(manager_id)
from employees;

--문제2
select  max(salary) 최고임금,
        min(salary) 최저임금,
        max(salary)-min(salary) "최고임금-최저임금"
from employees;

--문제3
select to_char(max(hire_date),'YYYY"년" MM"월" DD"일"')
from employees;

--문제4
select  avg(salary), 
        max(salary), 
        min(salary), 
        department_id
from employees
group by department_id
order by department_id desc;

--문제5
select  avg(salary), 
        max(salary), 
        min(salary), 
        job_id
from employees
group by job_id
order by min(salary) desc, round(avg(salary), 0) asc;

--문제6
select to_char(min(hire_date),'YYYY-MM-DD DAY')
from employees;

--문제7
select  department_id,
        avg(salary), 
        min(salary), 
        avg(salary)-min(salary)
from employees
group by department_id
having avg(salary)-min(salary) < 2000
order by avg(salary)-min(salary) desc;

--문제8
select  max(max_salary),
        min(min_salary),
        max(max_salary)-min(min_salary)
from jobs
group by job_id
order by max(max_salary)-min(min_salary) desc;



--문제9
select round(avg(salary),0), min(salary), max(salary)
from employees
where hire_date > '2004-12-31'
group by manager_id
having avg(salary)> 5000
order by avg(salary) desc;

--문제10.

select  first_name,
        hire_date,
        case when hire_date < '03-01-01' then '창립멤버'
             when hire_date < '04-01-01' then '03년입사'
             when hire_date < '05-01-01' then '04년입사'
             else '상장이후입사'
        end optDate
from employees
order by hire_date asc;
