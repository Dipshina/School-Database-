
-- 1)Creating table Student
Create table Student(
Id INT Primary Key Identity (1,1),
FirstName VARCHAR(200) NOT NULL,
LastName VARCHAR(200) NOT NULL,
Gender CHAR(1),
Roll INT,
Mobile VARCHAR(100),
Address VARCHAR(200),
DOB Date
)


-- 2)Inserting values in table
Insert into Student(FirstName,LastName,Gender,Roll,Mobile,Address, DOB)
values ('Dipshina', 'Tamang', 'F', 1, '9887546738', 'Chabahil', '2003-04-03'),
 ('Sujata', 'Basnet', 'F', 2, '9843567866', 'Baneshwor', '2002-09-12'),
 ('Ruja', 'Shrestha', 'F', 3, '9876545676', 'Sankhu', '2003-05-13'),
 ('Roji', 'Bist', 'F', 4, '9876545321', 'Mitrapark', '2003-11-02'),
 ('Anisha','Katel','F',5,'9874972547','Lazimpat','2001-12-29'),
 ('Ajay','Bhattarai','M',6,'9834256546','Kapan','2002-07-26'),
 ('Aashish','KC','M',7,'9812098456','Dhumbarahi','2003-01-15'),
 ('Amit','Shah','M',8,'9835664765','Sundhara','2004-10-11'),
 ('Bijay','Thapa','M',9,'9864563421','Basundhara','2002-03-17'),
 ('Manju','Dahal','F',10,'9812323212','Jorpati','2003-02-12')


 -- 3)Ordering Names
 --Ascending
 Select * from Student
 Order By FirstName

--Descending
 Select * from Student
 Order By FirstName Desc


-- 4)Ordering only FirstName starting from A also creating fullname by concatinating first and last name
Select CONCAT (FirstName,' ',LastName) As Name, Address, DOB
From Student
Where FirstName LIKE 'A%'
Order by name ASC

--OR

Select FirstName+' '+LastName Name, Address, DOB
From Student
Where FirstName LIKE 'A%'
Order by name ASC;


-- 5)Ordering only FirstName starting from A and also creating fullname by concatinating first and last name 
--Also changing name of table
Select FirstName+' '+LastName Name,
Address Permanent_Address,
DOB as Date_of_Birth
FROM Student
where FirstName like'A%'
Order by FirstName


-- 6)Sum
Select 1+2


-- 7)Concatenate
Select 'a'+'b'
Select '1'+'2'


-- 8)List the Name, Address and DOB of Students who were born later than 2002
Select FirstName+' '+LastName Name, Address, DOB
from Student
WHERE DOB > '2002-12-31'


-- 9)List the Name, Address and DOB of Students who were born later than 2003
Select FirstName+' '+LastName Name, Address, DOB
from Student
WHERE Year(DOB) > 2003


-- 10)List DOB and Year, Month and Day from the table
Select DOB, Year(DOB) Year, MONTH(DOB) Month, Day(DOB) Day
From Student


-- 11)Current Date and Time
Select GetDate()


-- 12)Age
Select DATEDIFF(Year,'2001-01-01', GetDate())
Select * from Student

SELECT FirstName, LastName,
       DATEDIFF(YEAR, DOB, GETDATE()) AS Age
FROM Student
ORDER BY Age;


SELECT TOP 1 FirstName
FROM Student
ORDER BY DOB;

SELECT FirstName
FROM Student
WHERE DOB = (DATEDIFF(Year, DOB, GetDate())>=16)

-- 13)List the Name, DOB and Age of student and sort them by their age
Select FirstName+' '+LastName Name, DOB, DATEDIFF(Year, DOB, GetDate()) Age
From Student

SELECT
    (SELECT AVG(Amount) FROM Fee) AS AverageFeeAmount,
    (SELECT COUNT(*) FROM Student) AS TotalStudents,
    (SELECT MIN(NumOfSemester) FROM Course) AS MinimumNumOfSemesters,
    (SELECT MAX(NumOfSemester) FROM Course) AS MaximumNumOfSemesters,
    (SELECT SUM(Amount) FROM Fee) AS TotalFeePaid;



