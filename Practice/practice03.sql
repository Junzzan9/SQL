--문제1.
select  em.employee_id,
        em.first_name,
        em.last_name,
        dp.department_name
from    employees em,departments dp
where   em.department_id=dp.department_id
order by dp.department_name asc, em.employee_id desc;

--문제2.
select  em.employee_id,
        em.first_name,
        em.salary,
        dp.department_name,
        jb.job_title
from    employees em,departments dp,jobs jb
where   em.department_id=dp.department_id
        and em.job_id=jb.job_id
order by em.employee_id asc;

--문제2-1.
select  em.employee_id,
        em.first_name,
        em.salary,
        dp.department_name,
        jb.job_title
from    employees em,departments dp,jobs jb
where   em.department_id=dp.department_id(+)
        and em.job_id=jb.job_id
order by em.employee_id asc;

--문제3.
select  lo.location_id,
        lo.city,
        dp.department_name,
        dp.department_id
from    locations lo,departments dp
where   lo.location_id=dp.location_id
order by lo.location_id asc;

--문제3-1.
select  lo.location_id,
        lo.city,
        dp.department_name,
        dp.department_id
from    locations lo,departments dp
where   lo.location_id=dp.location_id(+)
order by lo.location_id asc;

--문제4.
select  rg.region_name,
        cn.country_name
from    countries cn,regions rg
where   cn.region_id=rg.region_id
order by rg.region_name asc,cn.country_name desc;

--문제5.
select  em.employee_id,
        em.first_name,
        em.hire_date,
        ma.first_name,
        ma.hire_date
from    employees em,employees ma
where   em.manager_id=ma.employee_id
        and em.hire_date<ma.hire_date;
        
--문제6.
select  cn.country_name,
        cn.country_id,
        lo.city,
        lo.location_id,
        dp.department_name,
        dp.department_id
from    countries cn,locations lo,departments dp
where   cn.country_id=lo.country_id
        and lo.location_id=dp.location_id
order by cn.country_name asc;

select *
from employees;


--문제7.
select  em.employee_id,
        em.first_name||em.last_name,
        em.job_id,
        jh.job_id,
        jh.start_date,
        jh.end_date
from    employees em,job_history jh
where   jh.job_id='AC_ACCOUNT'
        and em.employee_id=jh.employee_id;

--문제8.
select  dp.department_id,
        dp.department_name,
        em.first_name,
        lo.city,
        con.country_name,
        rg.region_name
from    countries con,employees em,departments dp,locations lo,regions rg
where   con.country_id=lo.country_id
        and con.region_id=rg.region_id
        and lo.location_id=dp.location_id
        and dp.manager_id=em.employee_id;
        
--문제9.
select  em.employee_id,
        em.first_name,
        dp.department_name,
        ma.first_name manger_name
from    employees em,employees ma,departments dp
where   dp.department_id(+)=em.department_id
        and em.manager_id=ma.employee_id;