#Question 1 – Employee Performance and Salary Analysis 
create database employee_performance_salary_analysis;
use employee_performance_salary_analysis;
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

#Employee Performance and Salary Analysis 
#1 Display employee name, department name, salary, and location using an INNER JOIN. 
select e.emp_name,d.dept_name,e.salary,d.location from employees e inner join departments d on e.dept_id = d.dept_id;
#2 Find employees whose salary is greater than the average salary of their respective departments using a correlated subquery. 
select e.emp_name,e.salary,e.city from employees e where e.salary >(select avg(e1.salary) from employees e1 where e1.dept_id = e.dept_id);
#3 Display the total salary, average salary, minimum salary, and maximum salary for each department using GROUP BY. 
select dept_id,sum(salary) as total_salary,avg(salary) as avg_salary,min(salary) as minimum_salary,max(salary) as max_salary from employees group by dept_id;
#4 Display only those departments whose average salary is greater than ₹40,000 using HAVING. 
select d.dept_id,d.dept_name,avg(e.salary) as avg_salary from employees e inner join departments d on e.dept_id = d.dept_id group by d.dept_id, d.dept_name having avg_salary > 40000;
#5 Categorize employees using CASE: ○ Salary greater than or equal to 70,000 → High Salary ○ Salary between 50,000 and 69,999 → Medium Salary ○ Salary below 50,000 → Low Salary 
select emp_name,salary ,case
when salary >= 70000 THEN 'High salary'
when salary between 50000 and 69999 THEN 'Medium salary'
when salary <= 50000 THEN 'Low salary'
else 'N/A' end as Salary_range from employees;
#6 Display employee names in uppercase and extract the year from their joining date. 
select emp_id,upper(emp_name) as employees_name,timestampdiff(year,joining_date,curdate()) as year_exp from employees;
#7 Display employee name and bonus. If bonus is NULL, display 0 using COALESCE. 
select emp_name,coalesce(bonus,0) as bonus from employees;
#8 Find the second-highest salary using a subquery. 
select emp_name,salary from employees where salary =(select max(salary) from employees where salary <(select max(salary) from employees));

select * from departments;
select * from employees;
select * from projects;