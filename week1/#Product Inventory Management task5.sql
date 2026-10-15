#Product Inventory Management 
create database StoreDB;
use StoreDB;
create table Products (Product_ID int primary key,Product_Name varchar(50) not null,Category varchar(30),Price decimal(10,2),Stock_Quantity int);
insert into Products values
(101, "Laptop", "Electronics", 55000.00, 15),
(102, "Smartphone", "Electronics", 25000.65, 30),
(103, "Headphones", "Accessories", 1500.50, 50),
(104, "Office Chair", "Furniture", 4500.36, 20),
(105, "Study Table", "Furniture", 6500.00, 12),
(106, "Backpack", "Bags", 1200.73, 40);

#Display all products whose price is greater than 1000. 
select * from products where Price > 2000;

#Update the stock quantity of a product after a new shipment arrives. 
update Products set Stock_Quantity=20 where Product_ID=105; 

#Delete a product that is no longer sold. 
delete from Products where Product_ID=105;

#Add a new column named Supplier_Name using ALTER TABLE. 
alter table Products add Supplier_Name varchar(25); 

#Display products with stock quantity less than 10. 
select*from Products where Stock_Quantity < 30;

#Remove the Supplier_Name column using ALTER TABLE. 
alter table Products drop Supplier_Name;

select*from Products;
