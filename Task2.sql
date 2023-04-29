create database Course
use Course

create table Students(
Id int primary key identity(1,1),
Name nvarchar(50),
Surname nvarchar(50),
Age int,
Email nvarchar(50),
Address nvarchar(50)
)

insert into Students(Name,Surname,Age,Email,Address)
values('Ramil','Allahverdiyev',26,'ramil78@gmail.com','Azadliq'),
('Ulfet','Mirzeyev',19,'ulfet56@gmail.com','Neftciler'),
('Selim','Agamaliyev',20,'selim40@yahoo.com','Sumqayit'),
('Elcan','Musali',23,'elcan124@code.edu.az','Inqilab'),
('Yunis','Balakisiyev',24,'yunis348@mail.ru','Yasamal')

select * from Students


create table StudentArchives(
Id int primary key identity(1,1),
StudentId int,
Operation nvarchar(50),
Date datetime
)


create trigger trg_DeleteStudent on Students
for delete
as
begin
   insert into StudentArchives(StudentId,Operation,Date)
   select Id,'Delete', GETDATE() from deleted
end


create procedure usp_DeleteStudent
@id int
as
delete from Students where Id = @id

exec usp_DeleteStudent 2