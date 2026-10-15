#Employee Records Management 

create database EmployeeData;
use EmployeeData;
create table Employees(
Employee_ID int,
Employees_Names varchar(50),
Departmnet Varchar(30),
Salary decimal(10,2),
City varchar(30));
insert into Employees values(54990,"Naveenkumar","ServoBooster",16700,"chennai"),
(58790,"Krishna","DrumBrakes",20800,"chennai"),
(14491,"Arun","IT",45000,"pune"),
(11111,"Akshya","HR",34550.89,"bengaluru"),
(24698,"Naresh","HR",40900.94,"bengaluru"),
(55999,"Selvam","QualityControl",16700,"chennai");
select*from employees;
#Increase the salary of an employee named Arun -> Akshya to 45000. 
update Employees set Salary = 45896.68 where Employee_ID = 11111;

#Change the department of one employee from HR to Finance. 
update Employees set Departmnet = "Finance" where Employee_ID = 11111;

#Delete the record of an employee who has resigned. 
delete from Employees where Employee_ID = 55999;

#Display employees whose salary is greater than 40000. 
select*from Employees where Salary > 45000.00;

#Display employees who belong to the IT department. 
select*from Employees where Departmnet="IT";
