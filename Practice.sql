select * from Customers
union 
select * from Employees

select * from Customers
union all
select * from Employees

select * from Customers
except
select * from Employees

select * from Customers
intersect
select * from Employees

select GETDATE() as 'Date and Time'

select * from Employees order by Age asc
select * from Employees order by Name desc

select * from Employees where Id > 3 order by Age desc

select COUNT(*) as 'Count by age',Age from Employees where Age > 19 group by Age

select COUNT(*) as 'Count by age',Age from Employees group by Age
having COUNT(*) > 1 order by Age desc



