#Question 4 – Advanced Employee Data Analysis 
create database Advanced_Employee_Data_Analysis ;
use Advanced_Employee_Data_Analysis ;
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

#1. Rank employees based on salary using the RANK() window function.
select emp_id,emp_name,salary,rank() over(order by salary desc) as employees_rank from employees ;
#2 Display employee name, salary, department ID, and department-wise salary ranking using PARTITION BY
select dept_id,emp_name,salary,rank() over(partition by dept_id order by salary desc) as ranking from employees;
#3 Find the employees who earn more than the overall average salary using a subquery.
select emp_name,salary from employees where salary > (select avg(salary) from employees);
#4 Display the highest-paid employee in each department using a CTE. 
with high_paid as(select dept_id,max(salary) as maximum_salary from employees group by dept_id) 
select e.emp_id,e.emp_name,e.salary from employees e join high_paid h on e.dept_id = h.dept_id and e.salary = h.maximum_salary;
#5 Use ROW_NUMBER() to assign a unique ranking to employees based on salary in descending order.
select emp_name,salary,row_number() over(order by salary desc) as unique_Ranking from employees;
#6 Find the difference between each employee's salary and the previous employee's salary using LAG(). 
select emp_name,salary,lag(salary) over(order by joining_date) as pervious_salary, salary - lag(salary) over(order by joining_date) as difference_salary from employees;
#7 Display employees who joined after January 1, 2022, and whose salary is between ₹40,000 and ₹70,000. 
select emp_name,salary,joining_date from employees where joining_date >'2022-01-01' and salary between 40000 and 70000; 
#8 Display employee names starting with 'A' or 'P' using LIKE and combine the results with another city-based condition using logical operators. 
select * from employees where (emp_name like 'a%' or emp_name like 'p%') and city ='chennai';

select * from departments;
select * from employees;
select * from projects;