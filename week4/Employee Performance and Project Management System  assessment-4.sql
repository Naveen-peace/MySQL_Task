CREATE DATABASE EMPMS;
USE EMPMS;
# TABLE 1
CREATE TABLE DEPARTMENTS ( department_id INT PRIMARY KEY,department_name VARCHAR(50) NOT NULL,location VARCHAR(50));
INSERT INTO DEPARTMENTS (department_id, department_name, location) VALUES
(1, 'IT', 'Chennai'),
(2, 'HR', 'Bangalore'),
(3, 'Finance', 'Hyderabad'),
(4, 'Marketing', 'Mumbai'),
(5, 'Operations', 'Pune'),
(6, 'Support', 'Kerala');
#TABLE 2
CREATE TABLE Employee_Perform (employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100) NOT NULL,
    manager_id INT,
    department_id INT NOT NULL,
    salary DECIMAL(10,2) CHECK (salary > 0),
    joining_date DATE, FOREIGN KEY (department_id) REFERENCES Departments(department_id)
);
INSERT INTO Employee_Perform
(employee_id, employee_name, manager_id, department_id, salary, joining_date)
VALUES
(1, 'Vikram', NULL, 1, 90000, '2020-01-15'),
(2, 'Ananya', 1, 2, 65000, '2021-03-10'),
(3, 'Rahul', NULL, 3, 85000, '2019-07-20'),
(4, 'Meera', 1, 4, 70000, '2022-02-12'),
(5, 'Sanjay', 3, 5, 60000, '2024-11-05');
#TABLE 3
	CREATE TABLE Projects (
		project_id INT PRIMARY KEY,
		employee_id INT,
		project_name VARCHAR(100) NOT NULL,
		project_type VARCHAR(50),
		budget DECIMAL(12,2) CHECK (budget > 0),
		hours_worked INT CHECK (hours_worked > 0),
		start_date DATE,
		FOREIGN KEY (employee_id)
			REFERENCES Employee_Perform(employee_id)
	);
	INSERT INTO Projects VALUES
	(201, 1, 'AI Healthcare Assistant', 'Generative AI', 650000, 45, '2025-01-10'),
	(202, 2, 'Smart Banking Portal', 'Web Development', 450000, 30, '2025-03-15'),
	(203, 3, 'Payroll Automation', 'Software Development', 300000, 40, '2025-05-20'),
	(204, 4, 'Customer Analytics', 'Data Analytics', 800000, 70, '2025-07-01'),
	(205, 5, 'Cloud Migration', 'Cloud Computing', 550000, 50, '2025-09-12'),
	(206, 1, 'Inventory Management', 'Software Development', 250000, 35, '2026-01-05'),
	(207, 1, 'AI Chatbot', 'Generative AI', 700000, 65, '2026-02-10'),
	(208, 3, 'Data Warehouse', 'Data Analytics', 600000, 55, '2026-03-15');

#1.Generate an employee report displaying employee names, department names, salary details, joining dates, and years of experience. 
select e.employee_name,d.department_name,e.salary,e.joining_date,timestampdiff(year,joining_date,curdate()) as year_experience from employee_perform e 
inner join departments d on d.department_id = e.department_id;

#2.Identify employees based on their salary range and classify them into salary categories such as Low, Medium, and High. 
select employee_id,employee_name,
case
when salary <= 60000 THEN 'low'
when salary > 60000 and salary < 85000 THEN 'medium'
when salary >= 85000 THEN 'high'
else 'very low' end as salary_range from employee_perform;

#3. Generate a department-wise report showing the total salary, average salary, highest salary, and number of employees. Display only departments whose average salary is greater than ₹40,000. 
insert into employee_perform (employee_id, employee_name, manager_id, department_id, salary, joining_date) values
(6, 'divya', 3, 1, 95000, '2020-06-20'),(7, 'Raj', 6, 1, 100000, '2021-02-16'),
(8, 'dass', 1, 2, 125000, '2025-04-02'),(9, 'sumathi', NULL, 1, 185000, '2018-03-01');
select d.department_id,d.department_name,sum(e.salary) as total_salary,avg(e.salary) as average_salary,max(e.salary) as highest_salary ,count(employee_id) as number_of_employees 
from employee_perform e left join departments d on e.department_id = d.department_id group by d.department_id,d.department_name having avg(salary)> 40000;

#4. Display employee names along with their respective manager names and identify employees who do not have a manager. 
select e.employee_name,m.employee_name from employee_perform e left join employee_perform m on e.manager_id = m.employee_id;

#5. Generate a report showing employee and project combinations, including employees who are not assigned to any project and projects that do not have any employees. 
select e.employee_id,e.employee_name,p.project_id,p.project_name,p.project_type from employee_perform e left join projects p on p.employee_id = e.employee_id 
union
select e.employee_id,e.employee_name,p.project_id,p.project_name,p.project_type from employee_perform e right join projects p on p.employee_id = e.employee_id ;

#6. Identify employees whose salary is greater than the company's average salary and employees who earn more than the average salary of their respective departments. wrong
select e.employee_name,d.department_name,e.salary from employee_perform e inner join departments d on e.department_id = d.department_id
where e.salary >(select avg(salary) from employee_perform) and e.salary >(select avg(e1.salary) from employee_perform e1 where e1.department_id = e.department_id) order by e.department_id asc;
 
#7. Find employees who work in the same department as a given employee and employees whose salary is greater than the average salary of the IT department. 
 

#8. Identify the second-highest-paid employee in the company and the highest-paid employee in each department. 
select employee_name ,salary from employee_perform where salary = (select max(salary) from employee_perform where salary < (select max(salary) from employee_perform));

#9. Find employees who are assigned to projects with a budget greater than the average project budget. 
select e.employee_id,e.employee_name,p.project_name,p.budget from employee_perform e 
inner join projects p on p.employee_id = e.employee_id where p.budget > (select avg(budget) from projects ) ;
# difference
select * from projects where budget >(select avg(budget) from projects);


#10. Identify employees who have worked on projects with more hours than the average project working hours. 
select p.project_id,p.project_name,e.employee_id,e.employee_name,sum(hours_worked) as total_hour from projects p inner join employee_perform e on p.employee_id = e.employee_id
where p.hours_worked >(select avg(hours_worked) from projects ) group by p.project_id,p.project_name,e.employee_id,e.employee_name;
#difference
select * from projects where hours_worked >(select avg(hours_worked) from projects);

#11. Generate a report showing each employee's total number of assigned projects and identify employees who are assigned to more projects than the average number of projects per employee. 
select e.employee_id,e.employee_name,count(p.project_id) as assigned_projects_no from employee_perform e left join projects p on e.employee_id = p.employee_id
group by e.employee_id,e.employee_name ;
#difference
select e.employee_id,e.employee_name,count(p.project_id) as assigned_projects_no from employee_perform e left join projects p on e.employee_id = p.employee_id
group by e.employee_id,e.employee_name having count(p.project_id) >(select count(*) from projects)/(select count(*) from employee_perform);

#12. Display all possible employee and project combinations for project planning and resource allocation. 
select e.employee_name,p.project_name ,p.project_type from employee_perform e cross join projects p;

select*from departments;
select*from employee_Perform;
select*from projects;