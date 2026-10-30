create database selfndcross;
use selfndcross;
create table employee ( employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10,2),
    manager_id INT
);
insert into employee values(1, 'Ravi', 'IT', 60000, NULL),
(2, 'Arun', 'IT', 40000, 1),
(3, 'Priya', 'HR', 45000, 1),
(4, 'Karthik', 'IT', 35000, 2),
(5, 'Divya', 'HR', 38000, 3),
(6, 'Sneha', 'Finance', 50000, 1),
(7, 'Gokul', 'Finance', 32000, 6),
(8, 'Naveen', 'IT', 30000, 2);

#self join
select e.employee_name as employee,m.employee_name as manager,e.manager_id from employee e left join employee m on e.manager_id = m.employee_id;

#cross join
CREATE TABLE Cloth (
    color_id INT PRIMARY KEY,
    color_name VARCHAR(30),
        size VARCHAR(10)
);
insert into cloth values(1, 'Red', 'S'),
(2, 'Red', 'M'),
(3, 'Red', 'L'),
(4, 'Red', 'XL'),
(5, 'Blue', 'S'),
(6, 'Blue', 'M'),
(7, 'Blue', 'L'),
(8, 'Blue', 'XL'),
(9, 'Black', 'S'),
(10, 'Black', 'M'),
(11, 'Black', 'L'),
(12, 'Black', 'XL');

select e.employee_id,e.employee_name,c.color_name,c.size from employee e cross join cloth c;

#view
create view emp_details1 as select employee_name,department,salary from employee where department ="it" ;
alter view emp_details1 as select employee_id,employee_name,department,salary from employee where department ="it"; 
select * from emp_details where department ="it" ;


select*from cloth;
select*from employee;
select*from emp_details1;
