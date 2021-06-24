select *
from employees;

SELECT first_name, salary, commission_pct, salary*commission_pct
    
FROM employees
where salary between 13000 and 15000;

select first_name,salary,commission_pct
from employees
--where commission_pct is null;
where commission_pct is not null;



--예제) 커미션비율이 있는 사원의 이름과 연봉 커미션비율을 출력하세요
select first_name,salary,commission_pct
from employees
where commission_pct is not null;

--예제) 담당매니저가 없고 커미션비율이 없는 직원의 이름
select first_name
from employees
where manager_id is null 
and commission_pct is null;

--order by
select first_name,salary
from employees
order by salary desc;

select first_name,salary
from employees
order by salary asc;

select first_name,salary
from employees
order by salary asc, first_name desc;

select department_id,salary,first_name
from employees
order by department_id asc;

select first_name,salary
from employees
order by salary desc;

select department_id,salary,first_name
from employees
order by department_id asc,salary desc;

/*단일행 함수*/
select email, initcap(email),department_id
from employees
where department_id =100;

--가상의 테이블 dual
select initcap('aaaaa')
from dual;

select first_name,lower(first_name),upper (first_name)
from employees
where department_id =100;

select first_name
from employees
where department_id =100;

select substr('abcdefg',4,3)
from dual;

select first_name, substr(first_name,1,3),substr(first_name , -3,3)
from employees
where department_id=100;

--lpad() rpad()
select  first_name,
        lpad(first_name,10,'*'),
        rpad(first_name,10,'*')
from employees;

select  first_name,
        replace(first_name,'a','*'),
        replace(first_name, substr(first_name,2,3),'***')
from employees;

select first_name, substr(first_name,2,3)
from employees;

--숫자함수(반올림)
select  round(123.346,2) r2,
        round(123.346,0) as r0,
        round(123.346,-2) as "r-2"
from dual;

--trunc(버림)
select  trunc(123.346,2) r2,
        trunc(123.346,0) as r0,
        trunc(123.346,-2) as "r-2"
from dual;

--abs
select abs(-5)
from dual;

/*날짜함수*/
select sysdate
from dual;

--Month_between (d1,d2)
select  sysdate,
        hire_date,
        round(months_between(sysdate,hire_date),0),
        trunc(months_between(sysdate,hire_date),0)
from employees;

/*변환함수*/
--to.char()
select first_name,to_char(salary*12,'$999,999.99')
from employees
where department_id=110;

select to_char(9876, '9,999.99') "sal",
       to_char(9876,'0999999') "sal2",
       to_char(9876,'99999.99') "sal3"
from dual;

select to_char(sysdate,'YYYY'),
       to_char(sysdate,'YY'),
       to_char(sysdate,'MM'),
       to_char(sysdate,'mon'),
       to_char(sysdate,'dd'),
       to_char(sysdate,'day'),
       to_char(sysdate,'hh'),
       to_char(sysdate,'hh24'),
       to_char(sysdate,'Mi'),
       to_char(sysdate,'ss')
from dual;

--nvl() , nvl2()
select first_name,
       commission_pct,
       nvl(commission_pct,0),
       nvl2(commission_pct,100,0)
       
from employees;