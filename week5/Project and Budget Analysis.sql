#Question 3 – Project and Budget Analysis 
create database Project_Budget_Analysis ;
use Project_Budget_Analysis ;
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

#1 Display employee name, department name, project name, project budget, and project status using joins. 
select e.emp_name,d.dept_name,p.project_name,p.project_budget,p.status from  departments d join employees e on d.dept_id = e.dept_id 
join projects p on e.emp_id = p.emp_id;
#2 Find employees who are not assigned to any project using a LEFT JOIN. 
select e.emp_id,e.emp_name,p.project_name,p.project_budget,p.status from projects p left join employees e on p.emp_id = e.emp_id;
#3 Find projects whose budget is greater than the average project budget using a subquery. 
select project_name,project_budget from projects where project_budget >(select avg(project_budget) from projects);
#4 Display the total project budget for each employee using GROUP BY. 
select emp_id,sum(project_budget) as total_project_budget from projects group by emp_id;
#5 Display project details with the following conditions using CASE: ○ Budget greater than or equal to 400000 → High Budget ○ Budget between 200000 and 399999 → Medium Budget ○ Budget below 200000 → Low Budget 
select project_name,project_budget ,case
when project_budget >= 400000 then 'High budget'
when project_budget between 200000 and 399999 then 'medium budget'
when project_budget <= 200000 then 'low budget' else 'N/A' end as range_project_budget from projects;
#6 Find all possible combinations of employees and projects using CROSS JOIN. 
select e.emp_id,e.emp_name,p.project_name from employees e cross join projects p;
#7 Display the project name and the number of days since the project started using a date function. 
select project_name,datediff(curdate(),start_date) as number_of_days  from projects;
#8 Retrieve the second-highest project budget using a nested subquery. 
select project_name,project_budget from projects where project_budget =(select max(project_budget) from projects where project_budget<(select max(project_budget) from projects));

select * from departments;
select * from employees;
select * from projects;