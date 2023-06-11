/*
UC-1
create database Address_Book_Service_DB
use Address_Book_Service_DB;
*/
------ UC 2: Create Table ------
create table Address_Book_Table
(
FirstName varchar(100),
SecondName varchar(100),
Address varchar(250),
City varchar(100),
State varchar(100),
zip BigInt,
PhoneNumber BigInt,
Email varchar(200)
);

Select * from Address_Book_Table;



