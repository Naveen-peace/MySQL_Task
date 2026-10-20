#Online Store Sales and Product Analysis
use storeDB;
create table Sales_Details(sale_id int,product_name varchar(100),category varchar(50),price decimal(10,2),quantity int,sale_data date);
alter table sales_details modify sale_id int primary key; 
alter table sales_details modify price decimal(10,2) check(price>0),modify quantity int check(quantity>0); 

insert into sales_details values
(001,'phone','electronics',45000.75,10,"2024-02-16"),
(002,'vaccum cleaner','electronics',35000.75,15,"2024-03-16"),
(003,'airfrier','electronics',85000.73,20,"2024-08-16"),
(004,'fan','electronics',25000.43,25,"2025-02-16"),
(005,'studytable','Furniture',25000.78,22,"2024-06-18"),
(006,'milk','groceries',30.35,100,"2024-04-08"),
(007,'icecream','groceries',58.07,150,"2024-09-16"),
(008,'pen','stationary',300.65,300,"2024-12-26"),
(009,'notebook','stationary',100.05,400	,"2024-02-16"),
(010,'Running Shoes','Footwear',5100.05,240	,"2025-05-16");

select* from sales_details;
select product_name,Price*quantity as total_revenue from sales_details;
select product_name, sum(Price*quantity) as total_revenue from sales_details group by product_name;
select category, sum(Price*quantity) as total_revenue from sales_details group by category having total_revenue >= 20000;
select * from sales_details where product_name like "phone";
select count(category) as salesrecords from sales_details ;
select extract(month from sale_data) from sales_details ;
select * from sales_details where year(sale_data) = 2025; 