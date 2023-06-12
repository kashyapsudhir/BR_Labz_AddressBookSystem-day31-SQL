/*
UC-1
create database Address_Book_Service_DB
use Address_Book_Service_DB;

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



------ UC 3: Insert Values to Table ------
Insert into Address_Book_Table
(FirstName,SecondName,Address,City,State,zip,PhoneNumber,Email) 
values
('Harish','Roy','123_Street','Bangalore','Karnataka',12345,9898765050,'harish@gmail.com'),
('Ruju','Singh','321_GolaRoad','kanpur','UP',54321,98402000,'Ruju@gmail.com'),
('Rinku','Yadav','132_Biharsarif','BiharSarif','Bihar',53421,87210123453,'rinku@gmail.com'),
('Pramela','Satesh','432_StreetGali','indore','MP',13242,9752909823,'Pramela@gmail.com');
select * from Address_Book_Table


------ UC 4: Ability to Edit Contact Person Based on their Name ------
--Edit Email based on Name--
Update Address_Book_Table
set Email='rinkuyadav123@gmail.com'
where FirstName='Rinku'

--Edit Address based on Name--
Update Address_Book_Table
set Address='321_streetRoad'
where FirstName='Rinku' and SecondName='Yadav';

------ UC 5: Ability to Delete Contact Person Based on their Name ------
delete 
from Address_Book_Table
where FirstName='Pramela' and SecondName='Satesh'

select * from Address_Book_Table

*/

------ UC 6: Ability to Retrieve Person belonging to a City or State ------

select * from Address_Book_Table
where City='Bangalore' or State='Karnataka';