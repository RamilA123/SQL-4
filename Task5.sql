create database Company
use Company

create table Countries1(
Id int primary key identity(1,1),
Name nvarchar(50),
)

create table Cities1(
Id int primary key identity(1,1),
Name nvarchar(50),
CountryId int foreign key references Countries1(Id)
)

create table Employees1(
Id int primary key identity(1,1),
Name nvarchar(50),
Surname nvarchar(50),
Age int,
Salary decimal,
Position nvarchar(50),
IsDeleted bit default 0,
CityId int foreign key references Cities1(Id)
)

insert into Countries1(Name)
values('Azerbaycan'),
      ('Turkiye'),
      ('Amerika'),
	  ('Fransa')

insert into Cities1(Name,CountryId)
values('Baki',1),
      ('Quba',1),
      ('Istanbul',2),
	  ('Izmir',2),
	  ('New York',3),
	  ('Washinqtion',3),
	  ('Paris',4),
	  ('Marsel',4)

insert into Employees1(Name,Surname,Age,Salary,Position,CityId)
values('Ramil','Allahverdiyev',26,1200,'Reception',1),
      ('Imran','Haqverdiyev',22,3000,'Marketing Manager',1),
      ('Murad','Umudov',21,2000,'Reception',2),
	  ('Agaekber','Hesenov',27,1500,'Accountant',2),
	  ('Xeyal','Aslanov',20,1000,'Office Manager',3),
	  ('Elman','Huseynov',25,3700,'Reception',3),
	  ('Elgun','Memmedov',27,1800,'HR',4),
	  ('Ruslan','Huseynov',29,4600,'Supervisor',5),
	  ('Ceyhun','Memmedov',26,4800,'Reception',6),
	  ('Elnur','Haciyev',30,1900,'Super Admin',6),
	  ('Cavid','Necefli',29,4900,'Reception',7),
	  ('Movlan','Aslanov',31,5500,'CEO',8)


update Employees1 set IsDeleted = 'true' where Id > 6


select * from Employees1
select * from Cities1
select * from Countries1

--Query 1
select emp.Name,emp.Surname,emp.Age,emp.Salary,emp.Position,ct.Name as 'City Name',
co.Name as 'Country Name'
from Employees1 emp inner join Cities1 ct on emp.CityId = ct.Id inner join 
Countries1 co on ct.CountryId = co.Id 

--Query 2
select emp.Name,co.Name as 'Country Name'
from Employees1 emp inner join Cities1 ct on emp.CityId = ct.Id inner join 
Countries1 co on ct.CountryId = co.Id where emp.Salary > 2000

--Query 3
select ct.Name as 'City Name',co.Name as 'Country Name'
from Cities1 ct inner join Countries1 co on ct.CountryId = co.Id

--Query 4
select emp.Name,emp.Surname,emp.Age,emp.Salary,emp.Position,ct.Name as 'City Name',
co.Name as 'Country Name'
from Employees1 emp inner join Cities1 ct on emp.CityId = ct.Id inner join 
Countries1 co on ct.CountryId = co.Id where emp.Position = 'Reception'

--Query 5
select emp.Name,emp.Surname,ct.Name as 'City Name',co.Name as 'Country Name'
from Employees1 emp inner join Cities1 ct on emp.CityId = ct.Id inner join 
Countries1 co on ct.CountryId = co.Id where emp.IsDeleted = 'true'