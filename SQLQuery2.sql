---UC1---
create database payroll_service; --Create database
use payroll_service;             --To use payroll_service Database

---UC2---
CREATE TABLE employee_payroll(
Id int NOT NULL identity(1, 1) primary key,
Name varchar(200),
salary float,
startDate date,
);

---UC3---
INSERT INTO employee_payroll (Name, salary, startDate) VALUES
	('Bill', 1000000.00, '2018-01-03'),
	('Teresha', 2000000.00, '2019-11-13'),
	('Charlie', 300000.00, '2020-05-21');

---UC4---
select * from employee_payroll;    --Retrieving Records from the table

---UC5----
select salary from employee_payroll where Name='Bill';
SELECT * FROM employee_payroll
	WHERE startDate BETWEEN CAST('2018-01-01' AS DATE) AND cast(getdate() as date);
select * from employee_payroll where startDate=cast('2018-01-03' as date);
select * from employee_payroll where startDate between cast('2017-1-03' as date) and cast(getdate() as date);

---UC6---
Alter table employee_payroll  add Gender char(1) after Name;
select * from employee_payroll;
update employee_payroll set Gender ='F' where Name='Teresha';
update employee_payroll set Gender ='M' where Name='Bill' or Name='Charlie';
update employee_payroll set Salary=3000000 where Id=3

---UC7---
SELECT AVG(salary) FROM employee_payroll WHERE Gender='M' GROUP BY Gender;
SELECT gender, AVG(salary) FROM employee_payroll GROUP BY Gender;
SELECT Gender, COUNT(Name) FROM employee_payroll GROUP BY Gender
SELECT Gender, SUM(salary) FROM employee_payroll GROUP BY Gender
SELECT gender, MIN(salary) FROM employee_payroll GROUP BY Gender;
SELECT gender, MAX(salary) FROM employee_payroll GROUP BY Gender;

---UC8---
ALTER TABLE employee_payroll ADD phone_number VARCHAR(250);   ---Adding phone number field
ALTER TABLE employee_payroll ADD address VARCHAR(250);
ALTER TABLE employee_payroll ADD department VARCHAR(150);
--ALTER TABLE employee_payroll ALTER address SET DEFAULT 'TBD';
INSERT INTO employee_payroll ( Name, salary, startDate) VALUES ('Bill', 1000000.00, '2018-01-03')
select * from employee_payroll;

---UC9---
--ALTER TABLE employee_payroll RENAME COLUMN salary TO basic_pay;
exec sp_rename 'employee_payroll.salary', 'Basic_Pay', 'COLUMN';
Alter table employee_payroll add Taxable_pay float, Deduction float, NetPay float, IncomeTax float;

---UC10---
UPDATE employee_payroll SET Phone_Number='7008958457',department=DEFAULT;
UPDATE employee_payroll SET Phone_Number='6005846582',department=' TL', address = 'Bengaluru', Basic_Pay=12000,Deduction=5000,Taxable_Pay=2300,IncomeTax = 2564,NetPay=18000 WHERE Name='Bill';
UPDATE employee_payroll SET Phone_Number='7552389478',department='Marketing', address = 'Pune', Basic_Pay=12000,Deduction=5000,Taxable_Pay=2300,IncomeTax = 2564,NetPay=10000 WHERE Name='Teresha';
UPDATE employee_payroll SET Phone_Number='9443656564',department='Sales', address = 'Mumbai', Basic_Pay=22000,Deduction=16000,Taxable_Pay=5300,IncomeTax = 5564,NetPay=22000 WHERE Name='Charlie';

INSERT INTO employee_payroll VALUES('Terissa','12000','2019-11-13','F','7552389478','Pune','Sales','2300',50000,1000,2564);
INSERT INTO employee_payroll VALUES('Terissa','12000','2019-11-13','F','7552389478','Pune','Marketing','2300',50000,1000,2564);
select * from employee_payroll where Name='Terissa';



