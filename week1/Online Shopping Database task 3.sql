#Online Shopping Database 

create database OnlineShopping;
use OnlineShopping;
create table customer(Customer_ID int primary key,
Customer_Name varchar(20) not null,
Email  varchar(25) unique,
Phone varchar(15),
City varchar(25));
insert into Customer values(101, 'Arun Kumar', 'arun.kumar@gmail.com', '9000000001', 'Chennai'),
(102, 'Priya Sharma', 'priya.sharma@gmail.com', '9000000002', 'Bengaluru'),
(103, 'Rahul Verma', 'rahul.verma@gmail.com', '9000000003', 'Hyderabad'),
(104, 'Divya Raj', 'divya.raj@gmail.com', '9000000004', 'Coimbatore'),
(105, 'Karthik S', 'karthik.s@gmail.com', '9000000005', 'Madurai'),
(106, 'Sneha Patel', 'sneha.patel@gmail.com', '9000000006', 'Mumbai'),
(107, 'Vignesh R', 'vignesh.r@gmail.com', '9000000007', 'Salem'),
(108, 'Meena Devi', 'meena.devi@gmail.com', '9000000008', 'Tiruchirappalli');

#Try inserting two customers with the same Customer_ID. 
insert into Customer values (104, 'Test Customer', 'test1@gmail.com','9000000010', 'Chennai');
update Customer set Customer_ID=104 where Customer_ID=105;

#Try inserting two customers with the same email address. 
insert into Customer values(109,'Newcostumer','vignesh.r@gmail.com','9000000009','Chengalpattu');
update customer set Email="sneha.patel@gmail.com" where Customer_ID=108;

#Try inserting a customer without a name. 
update customer set Customer_Name="" where Customer_ID=101;
update customer set Customer_Name=null where Customer_ID=101;

#Display all customer records. 
select*from customer;