
-- 1.Create table Fee to store the details of Fee paid by each Student. 
-- The table should be able to store StudentID
-- Amount(greater than 0)
-- PaidDate(default to CurrentDate)
-- Remarks(default to 'Fee Paid')
Create table Fee(
Id Int Primary Key Identity(1,1),
StudentId Int Foreign Key References Student(Id),
Amount Decimal(10,2) check (Amount>0),
PaidDate Date Default GetDate(),
Remarks Varchar(100) Default 'Fee Paid'
)


-- 2.Inserting values into Table: Fees
Insert into Fee(StudentId, Amount)
values(1,1000),
(1,500),
(2,800)


-- 3.Inner Join
Select * from Student s
Inner Join Fee f
On s.Id = f.StudentId
-- OR
Select f.*, s.* from Student s
Inner Join Fee f
On s.Id = f.StudentId


-- 4. Left Outer Join
Select * from Student s
Left Outer Join Fee f
On s.Id = f.StudentId


-- 5. Right Outer Join
Select * from Student s
Right Outer Join Fee f
On s.Id = f.StudentId


-- 6.Full Outer Join
Select * from Student s
Full Outer Join Fee f
On s.Id = f.StudentId


-- 7.List the student who have paid fee
Select Concat(FirstName,' ',LastName)As Name from Student s
Inner Join Fee f
On s.Id = f.StudentId
group by FirstName, LastName	


-- 8.List the students and total fee paid by each
Select Concat(FirstName,' ',LastName)As Name,sum(Amount)Total_Amount from Student s
Inner Join Fee f
On s.Id = f.StudentId
group by FirstName, LastName


-- 9.List the students and number of times fee paid by each


Select Concat(FirstName,' ',LastName)As Name,Count(Amount)No_of_Times_Fees_Paid, sum(Amount)Total_Amount 
from Student s
Inner Join Fee f
On s.Id = f.StudentId
group by FirstName, LastName


-- 10.List the students who have not paid fee
Select CONCAT(FirstName, ' ',LastName)As Name 
from Student s
Left Outer Join Fee f
On s.Id = f.StudentId
where f.StudentId is Null
--Aggregate function 
SELECT
    MIN(Amount) AS MinFee,
    MAX(Amount) AS MaxFee,
    COUNT(*) AS FeeCount,
    SUM(Amount) AS TotalFeesCollected,
    AVG(Amount) AS AvgerageFeeAmount
FROM Fee;

SELECT * from Fee


