create database AI_Support_DB; 
use AI_Support_DB;
create table Customers (customer_id int,customer_name varchar(100),email varchar(100),customer_type varchar(30),registration_date date);
create table Chatbot_Interactions (interaction_id int,customer_id int,query_category varchar(50),ai_response_status varchar(30),satisfaction_score int,interaction_date date,Resolution_Time_Minutes decimal(8,2));

#1. Create both tables and apply suitable constraints, including primary keys, a foreign key, NOT NULL, UNIQUE, and a CHECK constraint for satisfaction scores between 1 and 5. 
alter table customers
 modify customer_id int primary key,
modify customer_name varchar(100) not null,
modify email varchar(100) unique;

alter table Chatbot_Interactions 
modify interaction_id int primary key,
modify satisfaction_score int check(satisfaction_score between 1 and 5),
add foreign key(customer_id) references customers(customer_id);

#2. Insert at least 6 customers and 10 chatbot interaction records. Include customers who have never used the chatbot and, where appropriate, customers with multiple interactions. 
insert into customers (Customer_ID, Customer_Name, Email, Customer_Type, Registration_Date) values
(1, 'Arun Kumar', 'arun@gmail.com', 'Premium', '2025-01-15'),
(2, 'Priya Sharma', 'priya@gmail.com', 'Regular', '2025-02-20'),
(3, 'Rahul Raj', NULL, 'Premium', '2025-03-10'),
(4, 'Sneha Devi', 'sneha@gmail.com', 'Regular', '2025-04-05'),
(5, 'Karthik M', NULL, 'Enterprise', '2025-05-12'),
(6, 'Divya S', 'divya@gmail.com', 'Regular', '2025-06-18');

insert into Chatbot_Interactions (Interaction_ID, Customer_ID, Query_Category,
 AI_Response_Status, Satisfaction_Score,
 Interaction_Date, Resolution_Time_Minutes) values
(101, 1, 'Technical Support', 'Resolved', 5, '2026-10-01', 4.50),
(102, 2, 'Billing', 'Resolved', 4, '2026-10-02', 3.25),
(103, 3, 'Product Inquiry', 'Pending', 3, '2026-10-03', 6.00),
(104, 4, 'Account Access', 'Resolved', 5, '2026-10-04', 2.75),
(105, 5, 'Technical Support', 'Escalated', 2, '2026-10-05', 12.50),
(106, 2, 'Refund', 'Resolved', 4, '2026-10-06', NULL),
(107, 5, 'Billing', 'Pending', NULL, '2026-10-07', 8.00),
(108, 3, 'Product Inquiry', 'Resolved', 5, '2026-10-08', 3.50),
(109, 1, 'Account Access', 'Resolved', 4, '2026-10-09', 2.00),
(110, 4, 'Refund', 'Failed', 1, '2026-10-10', 15.75);

#3. Display customers and their chatbot interactions using an INNER JOIN. 
select b.Interaction_ID,
a.Customer_Name,a.Email,a.Customer_Type,a.Registration_Date,
b.Query_Category,b.AI_Response_Status,b.Satisfaction_Score,
b.Interaction_Date,b.Resolution_Time_Minutes from Customers a inner join Chatbot_Interactions b on a.customer_id = b.customer_id;

#4. Display all customers, including customers who have never interacted with the chatbot, using a LEFT JOIN. 
select b.Interaction_ID,
a.Customer_Name,a.Email,a.Customer_Type,a.Registration_Date,
b.Query_Category,b.AI_Response_Status,b.Satisfaction_Score,
b.Interaction_Date,b.Resolution_Time_Minutes from Customers a left join Chatbot_Interactions b on a.customer_id = b.customer_id;

#5. Display all chatbot interactions and the corresponding customer information using a RIGHT JOIN. 
create table customer_info (customer_id int,customer_name varchar(100),Customer_Type varchar(30));
insert into customer_info (customer_id ,customer_name,customer_type) values (1,'naveen kumar','premium'),
(7,'kumaran','regular'),(6,'akashya','regular'),(8,'deepika','premium');
select a.Customer_Name,a.Customer_Type,
b.Interaction_ID, b.Query_Category,b.AI_Response_Status from Customer_info a right join Chatbot_Interactions b on a.customer_id = b.customer_id;

#6. Produce a report containing all customers and all interactions, including unmatched rows, using a MySQL-compatible alternative to FULL OUTER JOIN. 
select b.Interaction_ID,
a.Customer_Name,a.Email,a.Customer_Type,a.Registration_Date,
b.Query_Category,b.AI_Response_Status,b.Satisfaction_Score,
b.Interaction_Date,b.Resolution_Time_Minutes from Customers a left join Chatbot_Interactions b on a.customer_id = b.customer_id
union
select b.Interaction_ID,
a.Customer_Name,a.Email,a.Customer_Type,a.Registration_Date,
b.Query_Category,b.AI_Response_Status,b.Satisfaction_Score,
b.Interaction_Date,b.Resolution_Time_Minutes from Customers a right join Chatbot_Interactions b on a.customer_id = b.customer_id;

#7. Use CASE to classify chatbot interactions: ● Satisfaction score of 4 or 5: Satisfied ● Satisfaction score of 3: Neutral ● Satisfaction score of 1 or 2: Unsatisfied ● Missing score: Not Rated 8. Display customer names in uppercas
select Interaction_ID,
case 
when Satisfaction_Score between 4 and 5 THEN 'Satisfied'
when Satisfaction_Score = 3  THEN 'Neutral '
when Satisfaction_Score between 1 and 2 THEN 'Unatisfied'
else 'Not Rated'
end classify_interactions from Chatbot_Interactions;

#8.Display customer names in uppercase, extract the first name from each full name using string functions, and calculate the length of each customer name.
select substring(upper(customer_name),1,5) first_name, length(customer_name) length_of_name from customers;

#9. Count the number of chatbot interactions for each query category using GROUP BY. 
select query_category,count(*) count_of_query from Chatbot_Interactions group by query_category;

#10.Display query categories with more than 2 interactions using HAVING. 
select query_category,count(*) count_of_query from Chatbot_Interactions group by query_category having count_of_query > 1 ;

#11. Display customers whose registration date is earlier than 2025-01-01 and whose customer type is either Premium or Enterprise, using date filtering and operators.
select * from customers where registration_date > '2025-01-01' and customer_type in('premium',"enterprise");

#12. Display the average satisfaction score and average resolution time for each query category. Classify average satisfaction using CASE as High, Medium, or Low. 
select query_category,avg(satisfaction_score)as avg_satisfaction,avg(resolution_time_minutes) as avg_resolution,
case
when avg(satisfaction_score) >=5 THEN 'High'
when avg(satisfaction_score) between 3 and 4 THEN 'Medium' 
else 'Low'
end as satisfaction_status from Chatbot_Interactions group by query_category;

select * from Customers;
select * from Chatbot_Interactions;