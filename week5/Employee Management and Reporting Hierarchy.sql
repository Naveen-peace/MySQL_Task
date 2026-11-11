#Question 2 – Employee Management and Reporting Hierarchy 
create database employee_Management_Hierarchy ;
use employee_Management_Hierarchy ;
#table 1
CREATE TABLE departments ( dept_id INT PRIMARY KEY, dept_name VARCHAR(50) NOT NULL, location VARCHAR(50));
INSERT INTO departments VALUES (1, 'IT', 'Chennai'), (2, 'HR', 'Bangalore'), (3, 'Finance', 'Chennai'), (4, 'Sales', 'Mumbai'),(5, 'Marketing', 'Hyderabad'); 
#table 2
CREATE TAbLE employees (emp_id INT PRIMARY KEY,emp_name VARCHAR(50) NOT NULL,email VARCHAR(100) UNIQUE,salary DECIMAL(10,2),dept_id INT,
manager_id INT,joining_date DATE,city VARCHAR(50),bonus DECIMAL(10,2),FOREIGN KEY (dept_id)REFERENCES departments(dept_id),FOREIGN KEY (manager_id)REFERENCES employees(emp_id) );
INSERT INTO employees VALUES (101, 'Arun', 'arun@gmail.com', 75000, 1, NULL, '2021-01-15', 'Chennai', 10000),
(102, 'Priya', 'priya@gmail.com', 55000, 2, 101, '2022-03-20', 'Bangalore', NULL),
(103, 'Karthik', 'karthik@gmail.com', 65000, 1, 101, '2020-06-10', 'Chennai', 8000),
(104, 'Divya', 'divya@gmail.com', 40000, 3, 103, '2023-07-05', 'Mumbai', 5000),
(105, 'Rahul', 'rahul@gmail.com', 35000, 4, 103, '2024-02-12', 'Hyderabad', NULL); 
#table 3
CREATE TABLE projects ( project_id INT PRIMARY KEY, project_name VARCHAR(100), emp_id INT, project_budget DECIMAL(12,2),
start_date DATE, status VARCHAR(30), FOREIGN KEY (emp_id) REFERENCES employees(emp_id) ); 
INSERT INTO projects VALUES (201, 'Banking Analytics', 101, 500000, '2024-01-10', 'Completed'),
(202, 'HR Automation', 102, 200000, '2024-03-15', 'Ongoing'), (203, 'Customer Prediction', 103, 450000, '2024-05-20', 'Ongoing'),
(204, 'Financial Dashboard', 104, 150000, '2024-07-01', 'Completed'), (205, 'Sales Forecasting', 105, 300000, '2024-09-10', 'Pending');

#1 Display each employee's name along with their manager's name using a SELF JOIN. 
select e.emp_id,e.emp_name,m.emp_name as manager_name,e.manager_id  from employees e left join employees m on e.manager_id = m.emp_id;
#2 Find employees who earn more than their manager's salary. 
select e.emp_id,e.emp_name,e.salary from employees e where e.salary >(select m.salary from employees m where m.emp_id = e.manager_id );
#3 Display all employees, including employees who are not assigned to any department, using an appropriate OUTER JOIN. 
select e.emp_id,e.emp_name,d.dept_name,d.dept_id,e.salary from employees e right join departments d on e.dept_id = d.dept_id;
select e.emp_id,e.emp_name,d.dept_name,d.dept_id,e.salary from departments d left join employees e on e.dept_id = d.dept_id;
#4 Find employees who work in the same department as Arun using a nested subquery. 
select emp_name,salary from employees where dept_id in(select dept_id from employees where emp_name in('arun'));
#5 Generate an employee hierarchy using a RECURSIVE CTE with the following columns: ○ emp_id ○ emp_name ○ manager_id ○ hierarchy_level 
with recursive employee_hierarchy as (select emp_id,emp_name,manager_id, 1 as hierarchy_level from employees where manager_id is null  union all
select e.emp_id,e.emp_name,e.manager_id,eh.hierarchy_level + 1 from employees e join employee_hierarchy eh on e.manager_id = eh.emp_id)
 select * from employee_hierarchy;
#6 Display employees whose salary is greater than ANY salary of employees working in department 3. 
select emp_id,emp_name,salary from employees where salary >(select salary from employees where dept_id = 3 );
#7 Find employees who belong to departments where ALL employees earn more than ₹30,000. 
select  emp_id,emp_name,salary from employees where dept_id in (select dept_id from employees where salary > 30000 );
#8 Display the employee count for each department. 
select dept_id,count(emp_id) as emp_count from employees group by dept_id;

select * from departments;
select * from employees;
select * from projects;