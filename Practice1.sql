use Practice

--Task1
create view vw_TeachersByAge
as
select * from Teachers where Age > 30


create view vw_TeachersBySalary
as
select * from Teachers where Salary > 2500


select * from vw_TeachersByAge
select * from vw_TeachersBySalary

select * from Teachers

create view vw_TeachersGroupByAndOrderBySalary
as
select top(100) COUNT(*) as 'Count by Salary',Salary from Teachers group by Salary
order by Salary desc


select * from vw_TeachersGroupByAndOrderBySalary


create function GetTeachersCount()
returns int
as
begin
   declare @count int
   select @count = count(*) from Teachers 
   return @count
end


select dbo.GetTeachersCount() as 'Count'

create function GetTeachersCountByAgeStatic()
returns int
as
begin
   declare @count int
   declare @age int = 35
   select @count = count(*) from Teachers where Age > @age
   return @count
end


select dbo.GetTeachersCountByAgeStatic()



create function GetTeachersCountByAge(@age int)
returns int
as
begin
   declare @count int
   select @count = count(*) from Teachers where Age > @age
   return @count
end



select dbo.GetTeachersCountByAge(35)


select * from Teachers

create function getTeachersAverageSalaryByCondition(@id int)
returns decimal
as
begin
    declare @average decimal
	select @average = AVG(Salary) from Teachers where Id > @id
	return @average
end


select dbo.getTeachersAverageSalaryByCondition(3)

create function getTeachersAverageSalaryByCondition1(@id int)
returns decimal
as
begin
    declare @sum decimal = (select sum(Salary) from Teachers where Id > @id)
	declare @count decimal = cast((select count(*) from Teachers where Id > @id) as decimal)
	return @sum/@count
end

select dbo.getTeachersAverageSalaryByCondition2(3)


select * from Users

create function getUsersAverageSalaryByCondition2(@id int)
returns float
as
begin
    declare @sum float = (select sum(Salary) from Teachers where Id > @id)
	declare @count float = cast((select count(*) from Teachers where Id > @id) as float)
	return @sum/@count
end



select dbo.getUsersAverageSalaryByCondition2(3)



create procedure usp_InsertTeacher
@name nvarchar(50),
@surname nvarchar(50),
@age int,
@email nvarchar(100),
@salary decimal
as
begin
     insert into Teachers(Name,Surname,Age,Email,Salary)
	 values(@name,@surname,@age,@email,@salary)
end

exec usp_InsertTeacher 'Elcan', 'Musali', 19, 'elcan@code.edu.az','1450'

create procedure usp_SumOfNums
@num1 int,
@num2 int
as 
select @num1 + @num2


exec usp_SumOfNums 345,789

create trigger trg_InsertEmployee on Employees
for insert
as
begin
     insert into EmployeeLogs(EmployeeId,Operation,Date)
	 select Id,'Insert',GETDATE() from inserted
end

create trigger trg_DeleteEmployee on Employees
after delete
as
begin
     insert into EmployeeLogs(EmployeeId,Operation,Date)
	 select Id,'Delete',GETDATE() from deleted
end

--Task 2









