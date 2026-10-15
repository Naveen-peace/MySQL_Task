#Banking Transaction System 

create database BankingSystem;
use BankingSystem;
create table Bank_Customers (Customer_ID int primary key,Customer_Name varchar(50) not null,City varchar(30));
create table Bank_Accounts  (Account_ID int primary key,Customer_ID int,Account_Type  varchar(20),Balance decimal(10,2) check (Balance >= 0),Status varchar(20) default "Active");
drop table Bank_Accounts;
insert into Bank_Customers values
(101, "Arun Kumar", "Chennai"),
(102, "Priya Sharma", "Bengaluru"),
(103, "Rahul Verma", "Hyderabad"),
(104, "Divya Raj", "Coimbatore");

#Insert at least four bank accounts belonging to existing customers
insert into Bank_Accounts(Account_ID, Customer_ID, Account_Type, Balance) values 
(1001, 101, "Savings", 25000.00),
(1002, 102, "Current", 50000.00),
(1003, 103, "Savings", 15000.50),
(1004, 104, "Salary", 35000.00),
(1005, 105, "Savings", 10000.00),
(1006, 106, "Current", 75000.00),
(1007, 107, "Savings", 5000.00),
(1008, 108, "Salary", 42000.75);

#Try inserting an account using a Customer_ID that does not exist. 
insert into Bank_Accounts values(1009,109,"Current",159000.98,"Inactive");

#Try inserting an account with a negative balance. 
insert into Bank_Accounts values(1009,109,"Current",-159000.98,"Inactive");
update Bank_Accounts set Balance = -15000 where Account_ID=1004;

#Insert an account without specifying the Status column. 
insert into Bank_Accounts(Account_ID, Customer_ID, Account_Type, Balance) values(1010,110,"Savings",289900.86);

#Display all records from both tables. 
select*from Bank_Customers;
select*from Bank_Accounts;