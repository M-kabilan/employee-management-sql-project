use logicfirst;

drop table employee;
drop table branch;

create table branches(
branch_id int primary key auto_increment,
br_name varchar(30),
addr varchar(300)
);

create table employees(
emp_id int primary key auto_increment,
emp_name varchar(30) not null,
job_desc varchar(20),
salary int ,
branch_id int,
constraint fk_branchid foreign key(branch_id) references branches(branch_id));

INSERT INTO branches VALUES (1,'chennai', '123 Main Street, Cityville, State, ZIP');
INSERT INTO branches VALUES (2,'trichy', '456 Downtown Avenue, Townsville, State, ZIP');
INSERT INTO branches VALUES (3, 'karaikudi', '789 Westside Road, Villageton, State, ZIP');
INSERT INTO branches VALUES (4,'thanjavur','XYZ road');

INSERT INTO employees VALUES (1,'John Doe', 'Manager', 60000, 1);
INSERT INTO employees VALUES (2,'Jane Smith', 'Sales Executive', 45000, 2);
INSERT INTO employees VALUES  (3,'Michael Johnson', 'Software Developer', 70000, 1);
INSERT INTO employees VALUES    (4,'Emily Davis', 'HR Specialist', 50000, 3);
INSERT INTO employees VALUES    (5,'David Wilson', 'Accountant', 55000, 2);
INSERT INTO employees VALUES    (6,'Sarah Brown', 'Marketing Manager', 62000, 1);
INSERT INTO employees VALUES    (7,'Daniel Lee', 'Customer Support', 48000, 3);
INSERT INTO employees VALUES    (8,'Jessica Garcia', 'Operations Manager', 65000, 2);
INSERT INTO employees VALUES    (9,'Andrew Martinez', 'Data Analyst', 58000, 1);
INSERT INTO employees VALUES   (10,'Lisa Thompson', 'Project Manager', 69000, 3);
INSERT INTO employees VALUES   (11,'Matthew Robinson', 'IT Administrator', 53000, 2);
INSERT INTO employees VALUES    (12,'Olivia Harris', 'Financial Analyst', 61000, 1);
INSERT INTO employees VALUES    (13,'William Clark', 'Sales Manager', 68000, 3);
INSERT INTO employees VALUES    (14,'Sophia Young', 'Software Engineer', 72000, 2);
INSERT INTO employees VALUES    (15,'James White', 'HR Coordinator', 49000, 1);

select * from employees;
select * from branches;

create view em_br
as
select employees.emp_id,employees.emp_name,employees.job_desc,branches.br_name
from employees
join branches
on employees.branch_id=branches.branch_id
order by employees.emp_id;

select* from em_br
where job_desc="manager";

select employees.emp_id,employees.emp_name,employees.job_desc,branches.br_name
from employees
right join branches
on employees.branch_id=branches.branch_id
order by employees.emp_id;

select employees.emp_id,employees.emp_name,employees.job_desc,branches.br_name
from employees
cross join branches;

select b.br_name, count(e.emp_id) no_of_emp
from branches as b
join employees as e
on b.branch_id=e.branch_id
group by e.branch_id;
-- subqueries
select* from employees
where branch_id=(select branch_id from branches
where br_name="chennai");

select* from employees
where salary=(select min(salary) from employees);

select branch_id,br_name from branches
where exists(
select * from employees
where job_desc= "Manager" and branches.branch_id=employees.emp_id);

select * from branches
where branch_id=any(
select branch_id from employees
where salary>60000);

select* from employees
where branch_id <> all(
select branch_id from branches
where br_name in ("chennai","karaikudi"));

select concat(upper(substr(emp_name,1,length(emp_name)/2)),reverse(substr(emp_name,length(emp_name)/2+1)))
from employees;

select instr(emp_name,'o')
from employees;

select concat((upper(substr(emp_name,1,1))),substr(emp_name,2))
from employees;

select emp_name,job_desc
from employees
where substr(emp_name,-1)='n';

select emp_name,job_desc
from employees
where substr(job_desc,1,3)in ('man','sal');

select *
from employees
where substr(emp_name,1,2)='ma';

select concat(lower(substr(emp_name,1,1)),substr(emp_name,2))as name
from employees;

select reverse(substr(emp_name,length(emp_name)/2+1))
from employees;

select concat(lower(substr(emp_name,1,length(emp_name)/2)),reverse(substr(emp_name,length(emp_name)/2+1)))
from employees;

select * from employees
where substr(emp_name,1,1)<>'m';

select emp_name,salary from employees
where substr(emp_name,1,6)and substr(salary,1,4);

select *
from employees
where substr(emp_name,length(emp_name)-1,1)='e';

