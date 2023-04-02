use hr;
select * from employees;

/* 1 */
select max(salary) max_salary from employees;

/* 2 */
select count(*) as employees_cnt from employees;

/* 3 */
select avg(salary) average_salary from employees;

/* 4 */
select employee_id as id, first_name as name, last_name as surname, salary
from employees 
where salary = (select max(salary) max_salary from employees);

/* 5 */
select employee_id as id, first_name as name, last_name as surname, salary, (select avg(salary) avg_salary from employees) as avg_salary
from employees 
where salary < (select avg(salary) avg_salary from employees);

/* 6 */
select count(*) as departments_number from departments;

/* 7 */
select count(*) as quantity_of_departments from departments 
where department_id not in (select department_id from employees
							where department_id is not null);

select count(*) as numbers_of_departments from departments t1
left join employees t2 
on t2.department_id = t1.department_id
where t2.employee_id is null;

/* 8 */
select  avg(salary) as avg_salary from employees
where department_id = 90;

/* 9 */
select max(salary) as max_salary from employees
where department_id in (70, 80);

/* 10 */
select count(*) as quantity_of_employees from employees
where department_id = 100 and salary > 5000;

/* 11 */
select count(*) as quantity_of_employees from employees
where department_id = 60 and salary > (select avg(salary) from employees);


