# Question 5 – Business Database Operations and Management 
create database Business_Database_Operations_Management ;
use Business_Database_Operations_Management ;
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

#1 Add a new column called employment_status to the employees table with a default value of 'Active'. 
alter table employees add employment_status varchar(100) default('Active');
#2 Update the salary of employees working in the IT department by increasing it by 10%. 
update employees set salary = salary * 1.10 where dept_id = 1;
#3 Display employees whose bonus is NULL and replace the NULL bonus with 0 in the output. 
select emp_name,salary,ifnull(bonus,0) as bonus from employees;
#4 Find employees whose salary is not between ₹40,000 and ₹70,000. 
select emp_name,salary from employees where salary not between 40000 and 70000;
#5  Display employee details sorted by salary in descending order and limit the output to the top three employees. 
select *  from employees order by salary desc limit 3; 
#6 Find employees who are working in departments located in Chennai or Bangalore using a JOIN and IN operator. 
select e.emp_id,e.emp_name,d.dept_name,d.location from employees e join departments d on e.dept_id = d.dept_id where d.location in('Chennai','Bangalore');
#7 Use a CTE to calculate the average salary and display employees earning more than that average. 
with avg_salary as(select avg(salary) as emp_avg_salary from employees ) 
select e.emp_id,e.emp_name,e.salary from employees e CROSS JOIN avg_salary a
WHERE e.salary > a.emp_avg_salary;
#8 Demonstrate a transaction using START TRANSACTION, UPDATE, ROLLBACK, and COMMIT. Explain the difference between ROLLBACK and COMMIT. 
#difference
#rollback when we update the transction data we can undo the changes using rollback this will work on before commit 
# commit  when we update the transction data once its commit it permanently change data we can't undo the changes after commit
#9 Create a VIEW that displays employee name, department name, salary, and location. 
create view employee_details as
select e.emp_name,d.dept_name,e.salary,d.location from employees e join departments d on e.dept_id = d.dept_id;
select * from employee_details;

select * from departments;
select * from employees;
select * from projects;