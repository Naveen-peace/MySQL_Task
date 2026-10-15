# task-1:Student Management System 

create database CollegeDB; 
use CollegeDB;
create table Students(Student_ID int,Student_Name varchar(20),Age int,Department varchar(20),Marks int);
insert into Students values(17215344,"Akash",20,"Mech",69),
(17215365,"Barath",21,"EEE",74),
(17215369,"Vignesh",19,"ECE",66),
(17215349,"Hariharan",20,"IT",87),
(17215400,"jaibalaji",22,"CSE",79);

#Display all student records. 
select*from Students;

#Display only the student names and departments. 
select Student_Name,Department from Students;

#Display students who scored more than 80 marks. 
select* from Students where Marks >80;