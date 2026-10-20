#Hospital Appointment and Patient Record Analysis

create database HospitalDB;
use HospitalDB;
create table Appointments(appointment_id int,
Patient_Name varchar(100),
Department varchar(50),
age int,
appointment_date date,
appointment_status varchar(30),
consultation_fee decimal(10,2));

#Set Appointment_ID as the Primary Key and Patient_Name as NOT NULL
alter table appointments modify appointment_id int primary key,
modify Patient_Name varchar(100) not null;

#Apply a CHECK constraint to ensure that Age is greater than zero and Consultation_Fee is non-negative. 
alter table appointments modify age int check(age>0),
modify Consultation_Fee decimal(10,2) check(Consultation_Fee>0);

#Insert at least 10 appointment records across different departments and dates
insert into appointments values(1, 'Mohan Prakash', 'Cardiology', 55, '2026-05-05', 'Scheduled', 850.00),
(2, 'Kavitha Devi', 'Dermatology', 29, '2026-05-12', 'Completed', 600.00),
(3, 'Dinesh Raj', 'Orthopedics', 42, '2026-06-08', 'Scheduled', 1200.00),
(4, 'Revathi Selvam', 'Neurology', 37, '2026-06-15', 'Completed', 1500.00),
(5, 'Gokul Krishna', 'Pediatrics', 8, '2026-07-03', 'Scheduled', 450.00),
(6, 'Janani Murugan', 'Gynecology', 32, '2026-07-10', 'Cancelled', 50.00),
(7, 'Pradeep Kumar', 'ENT', 46, '2026-08-02', 'Completed', 550.00),
(8, 'Swetha Rajan', 'Ophthalmology', 26, '2026-08-14', 'Scheduled', 700.00),
(9, 'Bharath Chandran', 'General Medicine', 63, '2026-09-06', 'Completed', 350.00),
(10, 'Nithya Lakshmi', 'Cardiology', 41, '2026-09-18', 'Scheduled', 950.00);

#Display patient names with their first letter capitalized using CONCAT(), UPPER(), LOWER(), and string functions as appropriate. 
select concat(upper(LEFT(Patient_Name,7)),"__",lower(right(patient_name,7))) as stringfunctions from appointments;

#Display appointments scheduled in the current month using MONTH() and YEAR() with CURDATE().
select * from appointments where month(appointment_date) = month(curdate()) and year(appointment_date) = year(curdate());
select * from appointments where month(appointment_date) = 9 and year(appointment_date) = 2026;

#Display appointments scheduled within a specified date range using BETWEEN. 
select * from appointments where appointment_date between '2026-05-01' and '2026-07-30';

#Count appointments for each department using GROUP BY. 
select department,count(*) as appointments from appointments group by department; 

#Display departments with more than two appointments using HAVING. 
select department,count(*) as appointments from appointments group by department having appointments > 1;

#Calculate the total consultation fees collected for each department using SUM(). 
select department,sum(consultation_fee) from appointments group by department;

#Display the number of days between each appointment date and today's date using DATEDIFF().
select  appointment_id,Patient_Name,appointment_date,datediff(curdate(),appointment_date) as datedifferent from appointments;
select*from Appointments;