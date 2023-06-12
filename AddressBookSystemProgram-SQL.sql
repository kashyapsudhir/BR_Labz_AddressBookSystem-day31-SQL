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
where FirstName='Raju' and SecondName='Yadav;

------ UC 5: Ability to Delete Contact Person Based on their Name ------
delete 
from Address_Book_Table
where FirstName='Pramela' and SecondName='Satesh'

select * from Address_Book_Table



------ UC 6: Ability to Retrieve Person belonging to a City or State ------

select * from Address_Book_Table
where City='Bangalore' or State='Karnataka';


------ UC 7: Ability to Retrieve Count of Person belonging to a City or State ------

select Count(*),state,City
from Address_Book_Table
Group by state,City;


------ UC 8: Ability to retrieve entries sorted alphabetically ------

select * from Address_Book_Table
where City='Biharsarif'
order by(FirstName)



------ UC 9: Identify each Address Book with name andType ------

alter table Address_Book_Table
add 
AddressBookName varchar(100),
Type varchar(100)


--Update values for Type=Friends--
update Address_Book_Table
set AddressBookName='FriendName',Type='Friends'
where FirstName='Harish' or SecondName='Roy'

--Update values for Type=Family--
update Address_Book_Table
set AddressBookName='Father',Type='Family'
where FirstName='Raju'

--Update values for Type=Profession--
update Address_Book_Table
set AddressBookName='Manager',Type='Profession'
where FirstName='Ruju'



------ UC 10: Ability to get number of contact persons by Type------
select Count(*) as NumberOfContacts,Type
from Address_Book_Table
Group by Type


------ UC 11: Ability to add person to both Friend and Family------

Insert into Address_Book_Table
(FirstName,SecondName,Address,City,State,zip,PhoneNumber,Email,AddressBookName,Type) 
values
('Ram','Singh','123_GaliRoad','Chandigarh','Haryana',17845,1243765050,'ram@gmail.com','Son','Student'),
('Shyam','Kumar','321_Nagar','Patna','Bihar',54231,984021234,'shyam@gmail.com', 'Farmer', 'Employee');



-------- UC-12 Creating Tables Based on ER Diagrams  --------

create table Address_Book(
Address_BookID int identity(1,1) primary key,
Address_BookName varchar(200)
)
insert into Address_Book values 
('Ashs Book'),('Priyankas Book')
select * from Address_Book;

create table Contact_Person(
AddressBook_ID int,
Contact_ID int identity(1,1) primary key,
FirstName varchar(100),
SecondName varchar(100),
Address varchar(250),
City varchar(100),
State varchar(100),
zip BigInt,
PhoneNumber BigInt,
Email varchar(200),
foreign key (AddressBook_ID) references Address_Book(Address_BookID))

insert into Contact_Person values
(1,'Harsha','Vargheese','645 Catherine Street','Bangalore','Karnataka',243001,9842905050,'harsha@gmail.com'),
(2,'Rujula','Mathialagan','836 Heritage Rd','Chennai','Tamil Nadu',134002,98402000,'Rujula@gmail.com'),
(2,'Anita','Yadav','19 Augusta Avenue','Lucknow','Uttar Pradesh',113201,87210505053,'anita@gmail.com'),
(1,'Pramela','Satesh','356 Newburgh','Bangalore','Karnataka',243001,9842905050,'Pramela@gmail.com')

select * from Contact_Person

create table ContactType
(ContactType_ID int identity(1,1) primary key,
ContactType_Name varchar(200)
)

insert into ContactType 
values
('Family'),
('Friends'),
('Profession');

select * from ContactType

create Table TypeManager(
ContactType_Identity int,
Contact_Identity int,
foreign key (ContactType_Identity) references ContactType(ContactType_ID),
foreign key (Contact_Identity) references Contact_Person(Contact_ID)
)

insert into TypeManager values
(1,3),
(2,3),
(3,1),
(1,2),
(2,4)
select * from TypeManager



------ UseCase 11: Create Contact for both Family and Friends Type ------ 

select Address_BookName,Concat(FirstName,' ',SecondName) as Name,Concat(Address,' ,',City,' ,',State,' ,',zip) as Address,PhoneNumber,Email,ContactType_Name
from Address_Book 
Full JOIN Contact_Person on Address_Book.Address_BookID=AddressBook_ID 
Full JOIN TypeManager on TypeManager.Contact_Identity=Contact_ID
Full JOIN ContactType on TypeManager.ContactType_Identity=ContactType_ID

*/

------  UseCase 13------  

-- 1: Ability to Retrieve Person belonging to a City or State --

select Address_BookName,Concat(FirstName,' ',SecondName) as Name,Concat(Address,' ,',City,' ,',State,' ,',zip) as Address,PhoneNumber,Email,ContactType_Name
from Contact_Person 
INNER JOIN  Address_Book on Address_Book.Address_BookID=AddressBook_ID and (City='Bangalore' or State='Karnataka')
INNER JOIN TypeManager on TypeManager.Contact_Identity=Contact_ID
INNER JOIN ContactType on TypeManager.ContactType_Identity=ContactType_ID

------ 2: Ability to Retrieve Count of Person belonging to a City or State ------

select Count(*),state,City
from Contact_Person 
INNER JOIN  Address_Book on Address_Book.Address_BookID=AddressBook_ID 
Group by state,City

------ 3: Ability to retrieve entries sorted alphabetically ------

select Address_BookName,(FirstName+' '+SecondName) as Name,Concat(Address,' ,',City,' ,',State,' ,',zip) as Address,PhoneNumber,Email,ContactType_Name
from Contact_Person 
INNER JOIN  Address_Book on Address_Book.Address_BookID=AddressBook_ID and (City='Bangalore')
INNER JOIN TypeManager on TypeManager.Contact_Identity=Contact_ID
INNER JOIN ContactType on TypeManager.ContactType_Identity=ContactType_ID
order by(FirstName)

------ 4: Ability to get number of contact persons by Type------

select Count(*) as NumberOfContacts,ContactType.ContactType_Name
from Contact_Person 
INNER JOIN  Address_Book on Address_Book.Address_BookID=AddressBook_ID
INNER JOIN TypeManager on TypeManager.Contact_Identity=Contact_ID
INNER JOIN ContactType on TypeManager.ContactType_Identity=ContactType_ID
Group by ContactType_Name