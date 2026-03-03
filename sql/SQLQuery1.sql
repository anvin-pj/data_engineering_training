create database db
use db

create Table employees(
emp_id INT PRIMARY KEY,
name VARCHAR(50),
department VARCHAR(50),
salary DECIMAL(10,2),
hire_date DATE);


(1,'ann','cs',10000,'02-05-2020'),
insert into employees values
(2,'sam','cs',20000,'02-06-2021'),
insert into employees values
 (3,'kevin','ec',10000,'03-05-2022')

 select * from employees
 select CURRENT_TIMESTAMP;

 select UPPER(name) from employees
 select LEN(name) from employees
 select count(*) from employees
 select avg(salary) from employees
 select sum(salary) from employees

 create table dept(
 dept_id INT PRIMARY KEY,
 dept_name VARCHAR(50))

 insert into dept values(
 1,'cs')

 insert into dept values(
 2,'ec')
 insert into dept values(
 3,'eee')
 select * from dept

 SELECT emp.name
FROM employees as emp
LEFT JOIN dept
ON emp.department = dept.dept_name;

SELECT emp.name
FROM employees as emp
right JOIN dept
ON emp.department = dept.dept_name;

SELECT emp.name
FROM employees as emp
inner JOIN dept
ON emp.department = dept.dept_name;

select department,count(*)
from employees
group by department;

select ROUND(AVG(salary),2) FROM employees
select MAX(salary),min(salary) from employees


create view high_salary AS 
select name,salary from employees
where salary>10000;
select * from high_salary

select name,salary from employees
where salary>(select AVG(salary) from employees)

select name from employees 
where department in(
select dept_name  from dept where dept_name='cs')




select * from employees

select hire_date from employees
where hire_date>'05-01-2021'

select * from employees
order by hire_date 

select * from employees
order by hire_date desc

select top 1 * from employees
order by hire_date

DELETE FROM employees
WHERE emp_id==4;

drop table dept 
truncate table dept


create Table student(
std_id INT PRIMARY KEY,
name VARCHAR(50) not null,
department VARCHAR(50),
salary DECIMAL(10,2),
ph VARCHAR(50) unique);

insert into student values(1,'sam','cs',10000,9999999)
insert into student values(2,'sann','cs',10000,9999998)
insert into student values(3,'sammy','ec',10000,9999997)
insert into student values(4,'amy','ec',10000,9999996)
insert into student values(5,'anny','cs',10000,9999995)

insert into student values(6,'manny','cs',10000,9999994)
insert into student values(7,'aby','eee',10000,9999993)
insert into student values(8,'babu','eee',10000,9999992)
insert into student values(9,'tom','eee',10000,9999991)
select * from student 
select CURRENT_TIMESTAMP;

 select UPPER(name) from student
 select LOWER(name) from student
 select CONCAT(name,' ',department) as dp from student 
 select LEN(name) from  student
 select count(*) from  student
 select avg(salary) from  student
 select sum(salary) from  student

 create table dep(
 dep_id int primary key,
 dep_name varchar(50)
 )
 insert into dep values(1,'cs')
 insert into dep values(2,'ec')
insert into dep values(3,'eee')
insert into dep values(4,'mech')



ALTER TABLE student
ADD department_id INT;


ALTER TABLE student
ADD CONSTRAINT fk_department
FOREIGN KEY (department_id) REFERENCES dep(dep_id);

ALTER TABLE student
DROP COLUMN department;

UPDATE student SET department_id = 1 WHERE std_id = 1
UPDATE student SET department_id = 3 WHERE std_id = 4
UPDATE student SET department_id = 2 WHERE std_id = 3
UPDATE student SET department_id = 3 WHERE std_id = 8
UPDATE student SET department_id = 2 WHERE std_id = 2

select * from student

SELECT student.name,student.department_id,student.ph
FROM student 
LEFT JOIN dep
ON student.department_id = dep.dep_id;

SELECT student.name,student.department_id,student.ph
FROM student 
right JOIN dep
ON student.department_id = dep.dep_id;

SELECT student.name,student.department_id,student.ph
FROM student 
full JOIN dep
ON student.department_id = dep.dep_id;


select * from student
select * from dep

select department_id,count(*) from student
group by department_id

select department_id,count(*) from student
group by department_id
having department_id >1

UPDATE student SET salary=5000 WHERE std_id = 1
UPDATE student SET salary=7000 WHERE std_id = 2


select ceiling(avg(salary)) from student
select floor(avg(salary)) from student
select round(avg(salary),3) from student


select department_id,avg(salary) from student
group by department_id
having avg(salary)>5000;

create view high as
select * from student where salary>5000

select * from high;

select * from student 
where std_id IN(