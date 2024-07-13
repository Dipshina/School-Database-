-- 2.Create a table 'Enrollment' to store the Enrollment details of Student.
-- Including following columns:
-- | StudentId(Fk)	| CourseId(Fk)	| Grade	| Semester	|
-- | 1				| 1				| -		| 1			|
-- | 2				| 2				| -		| 3			|


CREATE TABLE Enrollment (
    Id INT PRIMARY KEY IDENTITY(1, 1),
    StudentId INT Foreign Key REFERENCES Student(Id),
    CourseId INT Foreign Key REFERENCES Course(Id),
    Grade INT,
    Semester INT
);

INSERT INTO Enrollment (StudentId, CourseId, Grade, Semester) 
VALUES 
    (1, 1, '-', 1),
    (2, 2, '-', 3);

Select * from Enrollment