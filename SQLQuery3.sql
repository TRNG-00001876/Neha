use master;
create database Employee;

--using database Employee
use Employee;

--Created a table Department with DeptId as a Primary Key

Create table Department
(
		DeptId int Primary key NOT NULL,
		DeptName varchar(100)
);
select * from Department;


--creating the table Employees

create table Employees(
EmployeeId int NOT NULL , 
FirstName varchar(50) NOT NULL,
LastName varchar(50) NOT NULL,
Email varchar(50) UNIQUE ,
DateOfBirth date NOT NULL,
DepId int not null,
Primary Key(EmployeeId),
constraint fk_key_dep foreign key(DepId)
references Department(deptId)
);

select * from Employees;

--updating the table Employees to add the column Phone number

Alter table Employees add PhoneNumber varchar(15);

Alter table Employees drop UQ__Employee__A9D105344F9C3C80;
alter table Employees drop unique_key;
alter table Employees drop PK__Employee__7AD04F11A635CF6B;

alter table Employees alter column Email varchar(30) not null;

--created the composite key

alter table Employees add constraint pk_compositeVal Primary Key(EmployeeId,Email);


--Inserting elements to the Department

Insert into Department values(101, 'Tech Team');
Insert into Department values(102, 'HR');
Insert into Department values(103, 'Finance');
Insert into Department values(104, 'Support Team');
Insert into Department values(105, 'HR');
Insert into Department values(106, 'Finance');
Insert into Department values(10, 'Finance');


--Inserting elemnts to the Employees

Insert into Employees values(1,'Vicky','Gupta', 'vickugupta031@gmail.com', '1998-08-31', 101,9845634528);
Insert into Employees values(2,'Sarika', 'Prasad','prasadsarika5@gmail.com', '1995-02-05', 102,9845634527);
Insert into Employees values(3,'Sandeep', 'Kumar','sandeepkumar6@gmail.com', '1994-09-14', 103,9845655528);
Insert into Employees values(4,'Nidhi','Shah', 'nidhikumari24@gmail.com', '2005-09-24', 104,9645634528);
Insert into Employees values(5,'Simran','Dutta', 'duttadimran44@gmail.com', '2001-05-28', 105,9845639928);
Insert into Employees values(6,'Nia','Singh', 'niasingh67@gmail.com', '2001-12-28', 106,9811639928);
Insert into Employees values(7,'Samarth','Kumar', 'samarthkuma03@gmail.com', '1999-12-28', 107,null);


--updating phonenumber column

update Employees set PhoneNumber  = 7028834123 where FirstName = 'Nidhi';

--Deleted one row of Employees table
Delete from Employees Where LastName = 'Prasad';

--Task 4
Insert into Employees values(6,'Singh', 'nehaprasadkvs@gmail.com', '2000-11-02', 106,9645639928);
select * from Employees;

--task 5
ALTER TABLE Employees
ADD CONSTRAINT CHK_DateOfBirth CHECK (DateOfBirth <= DateOfBirth);


ALTER TABLE Employees
ADD CONSTRAINT DF_PhoneNo DEFAULT '0000-00-00' FOR PhoneNumber;

ALTER TABLE Employees
DROP CONSTRAINT DF_PhoneNo;
select * from Employees;
ALTER TABLE Employees
ADD CONSTRAINT DF_PhoneNumber DEFAULT '000-000-0000' FOR PhoneNumber;

ALTER TABLE Employees
ADD PhoneNumber VARCHAR(15) DEFAULT '000-000-0000';
