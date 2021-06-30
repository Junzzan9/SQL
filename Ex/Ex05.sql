/*
---------------JOIN------------------
-equi join --> null 포함x
-outer join (left right full) --> null 포함시켜야할때
(+)<- 오라클에서만
-self join

*/

select  em.employee_id "사번",
        em.first_name "사원이름",
        em.manager_id "매니저 사번",
        ma.first_name as 매니저이름
from employees em,employees ma
where em.manager_id=ma.employee_id;
--------------------------------------

-------------SUBQUERY-----------------

--Den의급여의 쿼리
select salary
from employees
where first_name='Den';

-- Den의 급여 쿼리 를 서브쿼리로 이용한 쿼리
select  first_name,
        salary
from employees
where salary  >=(select salary
                from employees
                where first_name='Den';
                
--ex01.급여를 가장 적게 받는 사람의 이름, 급여, 사원번호는?
--1.급여를 가장 적게 받는사람의 급여
select min(em.salary)
from employees em;

--2.10000을 받는사람의 이름 급여 사원번호
select  em.first_name,
        em.salary,
        em.employee_id
from    employees em
where   salary=10000;

--3.두 식을 조합
select  em.first_name,
        em.salary,
        em.employee_id
from    employees em
where   salary = (select min(em.salary)
                  from employees em);

--예제) 평균 급여보다 적게받는 사름의 이름, 급여를 출력하세요.
--1.평균급여를 구한다. --6461.83 
select avg(salary)
from    employees;

--2. 6461.83보다 적게받는 사람의 이름, 급여를 구한다.
select  first_name,
        salary
from    employees
where   salary < 6461.83;

--3. 식을 조합한다.
select  first_name,
        salary
from    employees
where   salary < (select avg(salary)
                  from employees);

/*다중행 SubQuery*/
--부서번호 110인 직원의 급여리스트
select  salary,
        first_name
from    employees
where   department_id=110;
-->Shelly 12008, William 8300

--급여가 12008,8300인 직원리스트를 구한다.
select  salary
from    employees
where   salary=12008
        or salary=8300;

select  first_name,
        salary
from    employees
where   salary in (12008,8300);

select  first_name,
        salary,
        department_id
from    employees
where   salary in   (select salary
                    from employees
                    where department_id=110);


--예제)각 부서별로 최고급여를 받는 사원을 출력하세요.

--1.그룹별 최고급여를 구한다.
select  max(salary),
        department_id
from employees
where department_id IS not NULL
group by department_id;



--2.사원테이블에서 그룹번호와 급여가 같은 직원의 정보를 구한다.
select  *
from    employees
where   (department_id,salary) in (select department_id,max(salary)
                                from employees
                                --where department_id IS not NULL
                                group by department_id);
                                
--예제)부서번호가 110인 직원의 급여보다 큰 모든직원의
--    사번, 이름, 급여를 출력하세요.(or연산-->8300보다 큰)

--1.부서번호가 110인 직원 리스트 12008, 8300
select *
from employees
where department_id=110;

--2. 12008,8300 보다 급여가 큰 직원리스트 (사번,이름,급여)를 구하시오.
select  em.employee_id,
        em.first_name,
        em.salary
from    employees em
where   salary>12008
        or salary>8300;
        
select  em.employee_id,
        em.first_name,
        em.department_id,
        em.salary
from    employees em
where   salary> = any(select salary
                     from employees
                     where department_id=110)
        and  em.department_id<>110;

select  em.employee_id,
        em.first_name,
        em.department_id,
        em.salary
from    employees em
where   salary> = all(select salary
                     from employees
                     where department_id=110)
        and  em.department_id<>110;	
        
--예제
--각 부서별로 최고급여를 받는 사원을 출력하세요
--1. 각부서별 최고급여 리스트 구하기

select max(salary),
       department_id
from employees
group by department_id;


--2. 직원테이블 부서코드,급여가 동시에 같은 직원리스트 출력하기

select  first_name,
        department_id,
        salary
from employees
where (salary,department_id) in   (select max(salary),
                                   department_id
                                   from employees
                                   group by department_id);

select  em.employee_id,
        em.first_name,
        em.department_id,
        em.salary,
        s.salary,
        s.department_id
from    employees em,(select max(salary) salary,
                                   department_id
                                   from employees
                                   group by department_id) s
where   em.department_id=s.department_id
        and em.salary=s.salary;
                
                
--급여를 가장많이 받는 5명의 직원의 이름을 출력하시요.

--1.rownum이 먼저 작동
select  rownum ,
        employee_id,
        first_name,
        salary
from employees
where   rownum>0
        and rownum<6
order by salary desc;

-->정렬 하고 rownum
select  rownum,
        ot.employee_id,
        ot.first_name,
        ot.salary,
        ot.hire_date
from    (select employee_id,
                salary,
                first_name,
                hire_date
        from employees  --정렬이 되어있는 테이블을 from에 쓴다 !
        order by salary desc) ot
where   rownum<6;   --rownum >= 데이터가 없다 (1부터매겨지는데 조건에 걸려서 1버려짐)

---> 정렬하고 rownum하고 그테이블 쓴다.

select  rt.rn,
        rt.employee_id,
        rt.first_name,
        rt.salary

from    (select  rownum rn,
                ot.employee_id,
                ot.first_name,
                ot.salary
        from    (select employee_id,
                first_name,
                salary
                from    employees
                order by salary desc) ot)
                rt
where rn>2
and   rn<6;

--[예제]
--07년에 입사한 직원중 급여가 많은 직우너중 3~7등의 이름 급여 입사일은?

select  ort.rn,
        ort.first_name,
        ort.salary,
        ort.hire_date

from    (select  rownum rn,
                 ot.first_name,
                 ot.salary,
                 ot.hire_date
         from    (select first_name,
                         salary,
                         hire_date
                 from    employees
                 where   to_char(hire_date,'YYYY')='2007'
                 order by salary desc) ot) ort
                 
where   ort.rn>=3
and     ort.rn<=7;


