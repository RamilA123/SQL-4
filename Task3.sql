create table Countries(
Id int primary key identity(1,1),
Name nvarchar(50)
)

create table Cities(
Id int primary key identity(1,1),
Name nvarchar(50),
CountryId int foreign key references Countries(Id)
)

create table Students1(
Id int primary key identity(1,1),
FullName nvarchar(50),
Age int,
Email nvarchar(50),
Address nvarchar(50),
Phone nvarchar(50),
CityId int foreign key references Cities(Id)
)

create table Teachers(
Id int primary key identity(1,1),
Name nvarchar(50),
Surname nvarchar(50),
Age int,
Email nvarchar(50),
Salary decimal,
CityId int foreign key references Cities(Id)
)


create table StaffMembers(
Id int primary key identity(1,1),
FullName nvarchar(50),
Email nvarchar(50),
Address nvarchar(50),
CityId int foreign key references Cities(Id)
)

create table Roles(
Id int primary key identity(1,1),
Name nvarchar(50),
)


create table MembersRoles(
Id int primary key identity(1,1),
StaffMemberId int foreign key references StaffMembers(Id),
RoleId int foreign key references Roles(Id)
)

create table Educations(
Id int primary key identity(1,1),
Name nvarchar(50),
)

create table Rooms(
Id int primary key identity(1,1),
Name nvarchar(50),
Capacity int
)

create table Groups(
Id int primary key identity(1,1),
Name nvarchar(50),
Capacity int,
RoomId int foreign key references Rooms(Id),
EducationId int foreign key references Educations(Id)
)

create table StudentsGroups(
Id int primary key identity(1,1),
GroupId int foreign key references Groups(Id),
StudentId int foreign key references Students(Id)
)

create table TeachersGroups(
Id int primary key identity(1,1),
GroupId int foreign key references Groups(Id),
TeacherId int foreign key references Teachers(Id)
)

create table WeekDays(
Id int primary key identity(1,1),
Day nvarchar(50)
)

create table Sessions(
Id int primary key identity(1,1),
Name nvarchar(50)
)

create table WeekDaySessions(
Id int primary key identity(1,1),
WeekDayId int foreign key references WeekDays(Id),
SessionId int foreign key references Sessions(Id)
)

create table GroupsWeeksDaySessions(
Id int primary key identity(1,1),
GroupId int foreign key references Groups(Id),
WeekDaySessionId int foreign key references WeekDaySessions(Id)
)


