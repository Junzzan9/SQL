select *
from employees;

select *
from departments;

select *
from    employees,
        departments;
        
SELECT *
FROM employees,departments
where employees.department_id = departments.department_id;


--일반적인 join(equi join)
select  e.employee_id,
        e.first_name,
        e.department_id,
        d.department_id
from employees e, departments d
where e.department_id=d.department_id;

SELECT  em.first_name,dp.department_name,jb.job_title,
        dp.department_id,jb.job_id,em.department_id,em.job_id
FROM    employees em, departments dp, jobs jb
where   em.department_id = dp.department_id
        and jb.job_id = em.job_id;
        
--OUTER JOIN

--(left outer join)
SELECT  em.employee_id,
        em.first_name,
        em.department_id,
        dp.department_id
FROM    employees em left outer join departments dp
        on em.department_id=dp.department_id;
        
--oracle 에서만 사용가능(left outer join)
select  em.employee_id,
        em.first_name,
        em.department_id,
        dp.department_id
from employees em, departments dp
where em.department_id=dp.department_id(+);


--right outer join
select  em.employee_id,
        em.first_name,
        em.department_id,
        dp.department_id
from    employees em right outer join departments dp
        on em.department_id=dp.department_id;
 
--oracle에서만 (right outer join)       
select  em.employee_id,
        em.first_name,
        em.department_id,
        dp.department_id
from    employees em, departments dp
where   em.department_id(+)=dp.department_id;

-- 헷갈리니까 자리바꿔서 왼쪽으로! right->left
select  em.employee_id,
        em.first_name,
        em.department_id,
        dp.department_id
from    departments dp left outer join employees em
        on dp.department_id=em.department_id;
        
--full outer join (양쪽다)
select  em.employee_id,
        em.first_name,
        em.department_id,
        dp.department_id
from    employees em full outer join departments dp
        on em.department_id=dp.department_id;
        
-- full outer join 쌍쁘라스 사용불가!!

--self join
select  em.employee_id,
        em.first_name,
        em.manager_id,
        ma.employee_id,
        ma.first_name
from    employees ma, employees em
where   em.manager_id=ma.employee_id;


--아무생각없이 매칭 ㄴㄴ
select *
from employees em,locations lo
where em.salary=lo.location_id;

