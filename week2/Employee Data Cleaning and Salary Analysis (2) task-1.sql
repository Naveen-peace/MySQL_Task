#Employee Data Cleaning and Salary Analysis
create database hrdb;
use hrdb;
create table Employees(employee_id int,employee_name varchar(100),department varchar(50),email varchar(100),salary decimal(10,2),joining_date date,city varchar(50));
alter table employees modify employee_id int primary key,modify employee_name varchar(100) not null;
insert into employees values
(1, '  NaveEn Kumar  ', 'IT', 'naveen@gmail.com', 50000.00, '2024-01-15', 'Chennai'),
(2, 'ARUN KUMAR', 'HR', 'arun@gmail.com', 45000.00, '2023-06-10', 'Bangalore'),
(3, 'priya SHarma', 'Finance', 'priya@gmail.com', 39000.00, '2022-03-20', 'Chennai'),
(4, '  Rahul  ', 'IT', 'rahul@gmail.com', 40000.00, '2021-11-05', 'Hyderabad'),
(5, 'SNEHA DEVI', 'Marketing', 'sneha@gmail.com', 38000.00, '2024-07-01', 'Mumbai'),
(6, 'karthik raj', 'Sales', 'karthik@gmail.com', 62000.00, '2023-09-12', 'Chennai'),
(7, '  Divya Lakshmi', 'HR', 'divya@gmail.com', 37000.00, '2022-12-18', 'Coimbatore'),
(8, 'Vijay Kumar  ', 'Finance', 'vijay@gmail.com', 78000.00, '2020-05-25', 'Bangalore'),
(9, 'meena RANI', 'IT', 'meena@gmail.com', 75000.00, '2019-08-14', 'Chennai'),
(10, '  Ajith Kumar  ', 'Marketing', 'ajith@gmail.com', 89000.00, '2025-02-10', 'Madurai');

select*from employees;
drop table employees;
select upper(employee_name) from employees;
select trim(employee_name) from employees;
select left(employee_name,3) from employees;

select substring(email,1,20) from employees;
select email from employees;
select*from employees where salary between 30000 and 70000;
select avg(salary) from employees where department = "IT";
select department,avg(salary) from employees  group by department;
select department,avg(salary) as averagSalary from employees  group by department having averagSalary > 45000;
select joining_date from employees where joining_date between "2024-01-01" and current_date();
select datediff(joining_date) from employees;