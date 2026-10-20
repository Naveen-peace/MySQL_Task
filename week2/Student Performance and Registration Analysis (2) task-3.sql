#Student Performance and Registration Analysis 
create database TrainingDB;
use TrainingDB;
create table Students(student_id int,student_name varchar(100),email varchar(100),course_name varchar(50),marks int,Registration_Date date,city varchar(50));
alter table students modify student_id int primary key,modify student_name varchar(100) not null,modify email varchar(100) unique ;
insert into students values
(1, 'Naveen Kumar', 'naveen@gmail.com', 'B.Tech IT', 85, '2025-01-15', 'Chennai'),
(2, 'Arun Kumar', 'arun@gmail.com', 'Python', 78, '2025-02-10', 'Bangalore'),
(3, 'Priya Sharma', 'priya@gmail.com', 'Data Analytics', 92, '2025-03-05', 'Coimbatore'),
(4, 'Rahul Raj', 'rahul@gmail.com', 'Java', 67, '2025-04-12', 'Hyderabad'),
(5, 'Sneha Devi', 'sneha@gmail.com', 'SQL', 88, '2025-05-20', 'Chennai'),
(6, 'Karthik Raj', 'karthik@gmail.com', 'Web Development', 73, '2025-06-18', 'Madurai'),
(7, 'Divya Lakshmi', 'divya@gmail.com', 'Data Analytics', 95, '2025-07-08', 'Salem'),
(8, 'Vijay Kumar', 'vijay@gmail.com', 'Python', 56, '2025-08-22', 'Trichy'),
(9, 'Meena Rani', 'meena@gmail.com', 'Java', 81, '2025-09-14', 'Chennai'),
(10, 'Ajith Kumar', 'ajith@gmail.com', 'SQL', 69, '2025-10-01', 'Tiruppur');

#Display student names in lowercase using LOWER(). 
select lower(student_name) from students;

#Display the length of each student's name using LENGTH()
select length(student_name) from students;

#Extract the first name from Student_Name, assuming each name contains a first name followed by a space and surname, using SUBSTRING_INDEX().
select student_name,substring(trim(student_name),1,6) as firstname from students;


#Display students who scored above 75 and registered after 2025-01-01
select *from students where marks > 75 and registration_date > 2025-01-01 ;

# Display the number of students registered for each course using GROUP BY.
select course_name,count(course_name) as studentsregistered from students group by course_name;

#Display courses with more than two registered students using HAVING.
select course_name,count(course_name) as studentsregistered from students group by course_name having studentsregistered>2;

#Calculate the average marks, maximum marks, and minimum marks using aggregate functions. 
select avg(marks),max(marks),min(marks) from students ;
select student_name,avg(marks),max(marks),min(marks) from students group by student_name ;patients

#Display the number of days since each student's registration using DATEDIFF() with CURDATE().
select datediff(curdate(),registration_date) from students ;

select*from students;