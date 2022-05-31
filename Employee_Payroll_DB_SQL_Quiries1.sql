-----------------------------------------------------------------------------------------------------------------------
--UC1-CREATING payroll_services DATABASE

create database payroll_services
use payroll_services

-----------------------------------------------------------------------------------------------------------------------
--UC2-CREATING TABLE employee_payroll IN DB

create table employee_payroll
(Id int Primary key Identity(1,1),
Name varchar(150),
Age int,
Salary int,
StartDate date);

-----------------------------------------------------------------------------------------------------------------------
--UC3-INSERTING VALUES INTO TABLE

insert employee_payroll (Name,Age,Salary,StartDate) values 
('Rehan',24,28000,'04-07-2022'),
('Ramesh',30,28000,'08-12-2021'),
('Akhil',22,28000,'12-15-2019'),
('Gaurav',26,28000,'11-09-2021'),
('saheed',44,28000,'07-23-2021'),
('Surfraz',44,28000,'07-23-2021');

 drop table employee_payroll

 delete from employee_payroll where Name='Surfraz';

-----------------------------------------------------------------------------------------------------------------------
--	UC4_RETRIVING ALL DATA FROM TABLE

 select * from employee_payroll

-----------------------------------------------------------------------------------------------------------------------
--UC5_RETRIVING ALL DATA FROM TABLE USING WHERE CLAUSE & RANGE BTW DATE

select * from employee_payroll where Name='Rehan';					--Retrieve Row values where Name=Rehan
select * from employee_payroll where Name like'Ram%'				--Retrieve Row values where Name=Ram

select * from employee_payroll									    --Retrieving Data Range From Given StartDate
where StartDate BETWEEN CAST('2021-04-07' AS DATE) AND GETDATE();


Alter table employee_payroll Add Gender varchar(1)

-----------------------------------------------------------------------------------------------------------------------
--UC6_UPDATE GENDER & SALARY WHERE ID's

UPDATE employee_payroll SET Gender='M' where Id =1
UPDATE employee_payroll SET Gender='M' where Id =6
UPDATE employee_payroll SET Gender='M' where Id in (2,3,4,5)

UPDATE employee_payroll SET Salary=30000 where Id=2
UPDATE employee_payroll SET Salary=22000 where Id=3
UPDATE employee_payroll SET Salary=18000 where Id=5
UPDATE employee_payroll SET Salary=34000 where Id=4


UPDATE employee_payroll SET Gender='F' where Id = 5;
UPDATE employee_payroll SET Name='Sirisha' where Id = 5;

UPDATE employee_payroll SET Name='Akhila',Gender='F' where Id = 3;

-----------------------------------------------------------------------------------------------------------------------
--UC7_FIND SUM,AVG,COUNT,MIN & MAX VALUES OF SALARY GROUP BY TO GENDER

select SUM(salary) from employee_payroll where Gender='M' Group by Gender;     --Sum of salary where gender=M

select Count(*),Gender from employee_payroll where Gender='M' Group by Gender; --Emp Count where gender=M

select AVG(Salary) from employee_payroll where Gender='M' Group by Gender;     --Avg of salary where gender=M

select MIN(Salary) from employee_payroll where Gender='M' Group by Gender;     --Min salary of Emp where gender=M

select Max(Salary) from employee_payroll where Gender='F' Group by Gender;	   --Max salary of Emp where gender=F

---------------------------------------------------------------------------------------------------------------------
--UC8_ALTER employee_payroll ADD PHONE,ADRESS & DEPARTMENT WITH default VALUES


alter table employee_payroll Add PhoneNumber varchar(15);

alter table employee_payroll Add Adress varchar(150) not null default 'Address', 
Department varchar(60) not null default 'Dept';

UPDATE employee_payroll SET Department='EEE' where Id=1;

-----------------------------------------------------------------------------------------------------------------------
--UC9_ALTER ADD COLUMNS WITH DEFAULTS

alter table employee_payroll Add Deductions int not null default 0,Taxable_Pay int not null default 0,
Income_Tax int not null default 0,Net_Pay int not null default 0 ;

-----------------------------------------------------------------------------------------------------------------------
--UC10_INSERTING GIVEN TERISSA DATA VALUES

insert into employee_payroll
(Name,Age,Salary,StartDate,Gender,PhoneNumber,Department,Deductions,Taxable_Pay,Income_Tax,Net_Pay) 
Values ('Terissa',36,30000,'03-01-2018','F','9900998877','Marketing',11000,500,500,400000);

-----------------------------------------------------------------------------------------------------------------------

select * from employee_payroll
