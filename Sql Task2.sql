create database Practice;

use Practice;

create table Employee(
Empcode int,
EmpFname varchar(20),
EmpLname varchar(20),
Job varchar(40),
Manager varchar(20),
HireDate Date,
Salary int,
commision int,
DeptCode int);


create table Department
(DeptCode int,
DeptName varchar(30),
Location varchar(40)
);



ALTER TABLE Department
ADD CONSTRAINT PK_Department PRIMARY KEY (DeptCode);

Alter table Department alter column DeptCode int not null;

Alter table Department add constraint uni_Dept Unique (DeptName);

Alter table Department alter column Location varchar(40) not null;

Alter table Employee alter column Empcode int not null;

Alter table Employee add constraint pk_emp Primary Key (Empcode);

Alter table Employee add constraint fk_emp Foreign Key (Deptcode) References Department(DeptCode);


INSERT INTO DEPARTMENT VALUES (10, 'FINANCE', 'EDINBURGH'),
                              (20,'SOFTWARE','PADDINGTON'),
                              (30, 'SALES', 'MAIDSTONE'),
                              (40,'MARKETING', 'DARLINGTON'),
                              (50,'ADMIN', 'BIRMINGHAM');


INSERT INTO EMPLOYEE  
VALUES (9369, 'TONY', 'STARK', 'SOFTWARE ENGINEER', 7902, '1980-12-17', 2800,0,20),
       (9499, 'TIM', 'ADOLF', 'SALESMAN', 7698, '1981-02-20', 1600, 300,30),    
       (9566, 'KIM', 'JARVIS', 'MANAGER', 7839, '1981-04-02', 3570,0,20),
       (9654, 'SAM', 'MILES', 'SALESMAN', 7698, '1981-09-28', 1250, 1400, 30),
       (9782, 'KEVIN', 'HILL', 'MANAGER', 7839, '1981-06-09', 2940,0,10),
       (9788, 'CONNIE', 'SMITH', 'ANALYST', 7566, '1982-12-09', 3000,0,20),
       (9839, 'ALFRED', 'KINSLEY', 'PRESIDENT', 7566, '1981-11-17', 5000,0, 10),
       (9844, 'PAUL', 'TIMOTHY', 'SALESMAN', 7698, '1981-09-08', 1500,0,30),
       (9876, 'JOHN', 'ASGHAR', 'SOFTWARE ENGINEER', 7788, '1983-01-12',3100,0,20),
       (9900, 'ROSE', 'SUMMERS', 'TECHNICAL LEAD', 7698, '1981-12-03', 2950,0, 20),
       (9902, 'ANDREW', 'FAULKNER', 'ANAYLYST', 7566, '1981-12-03', 3000,0, 10),
       (9934, 'KAREN', 'MATTHEWS', 'SOFTWARE ENGINEER', 7782, '1982-01-23', 3300,0,20),
       (9591, 'WENDY', 'SHAWN', 'SALESMAN', 7698, '1981-02-22', 500,0,30),
       (9698, 'BELLA', 'SWAN', 'MANAGER', 7839, '1981-05-01', 3420, 0,30),
       (9777, 'MADII', 'HIMBURY', 'ANALYST', 7839, '1981-05-01', 2000, 200, NULL),
       (9860, 'ATHENA', 'WILSON', 'ANALYST', 7839, '1992-06-21', 7000, 100, 50),
       (9861, 'JENNIFER', 'HUETTE', 'ANALYST', 7839, '1996-07-01', 5000, 100, 50); 

	Select * from Department;
	Select * from Employee;

	--1.	Create a query that displays EMPFNAME, EMPLNAME, DEPTCODE, DEPTNAME, LOCATION from EMPLOYEE, and DEPARTMENT tables. Make sure the results are in ascending order based on the EMPFNAME and LOCATION of the department.


	Select e.EmpFname, e.EmpLname, e.DeptCode, d.DeptName, d.Location from Employee e  join Department d on e.DeptCode = d.Deptcode
	order by e.EmpFname asc, d.Location asc;

	--2.	Display EMPFNAME and �TOTAL SALARY� for each employe

	SELECT EmpFname, SUM(Salary) AS "Total Salary" FROM Employee GROUP BY EmpFname;

	--3.	Display MAX and 2nd MAX SALARY from the EMPLOYEE table.

	SELECT TOP 2 * FROM Employee
    ORDER BY Salary DESC;


	--4.	Display the TOTAL SALARY drawn by an analyst working in dept no 20
	
	Select sum(Salary) as "Total Sum" from Employee where DeptCode = 20;

	--5.	Compute the average, minimum, and maximum salaries of the group of employees having the job of ANALYST.
	select avg(Salary) as "Average Salary", min(Salary) as "Minimum Salary", max(Salary) as "Maximum Salary" from Employee where job = 'Analyst'; 
	
	
	--6.	Query to find all departments that are located in Edinburgh:
	Select DeptName from Department where Location = 'Edinburgh';

	--7.	Query to find all employees who work in the FINANCE department:

	select e.EmpFname, e.EmpLname from Employee e Join Department d on e.DeptCode = d.DeptCode where DeptName = 'Finance';

	--8.	Query to find the average salary of employees in each department:

	Select d.DeptName , AVG(e.Salary) As "Average Salary" from Employee e join Department d on e.DeptCode = d.DeptCode group by d.DeptName;

	--9.	Query to find the top 10 highest-paid employees:

	select top 10 * from Employee order by Salary desc;
	
	--10.	Query to find all employees who did not get a promotion in the last year:

	select * from Employee where commision<=0;

--11.	Return a list of all employees who are paid above the average salary.

select EmpFname , Salary from Employee where Salary < (select avg(salary) from Employee);

-- 12.	Return a list of all employees who have been with the company for more than 5 years.

	select * from Employee where DATEDIFF(year,HireDate,GETDATE())>5;

--13.	 Return a list of all departments, ordered by the number of employees in each department.

Select * from Department;
	Select * from Employee;

SELECT d.DeptName, COUNT(e.Empcode) AS NumEmployees
FROM Department d
LEFT JOIN Employee e ON d.DeptCode = e.DeptCode
GROUP BY d.DeptName
ORDER BY NumEmployees DESC;

--14.	Return a list of all job titles, ordered by the number of employees in each job title.
Select * from Employee;
SELECT Job, COUNT(*) AS NumEmployees
FROM Employee
GROUP BY Job
ORDER BY NumEmployees DESC;


--15.	Return a list of all managers, ordered by the number of employees managed by each manager.

SELECT Manager, COUNT(*) AS NumEmployeesManaged
FROM Employee
GROUP BY Manager
ORDER BY NumEmployeesManaged DESC;




