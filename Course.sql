-- 1.Create a table 'Course' to store the course details offered by a College.
-- Including following columns:
-- | Name(Unique)	| Code(Unique)	| Credit	| No. of Semester|
-- | Bachelor of..	| BIT			| 129		| 6				 |
-- | Bachelor of..	| BCS			| 127		| 6				 |

CREATE TABLE Course (
    Id INT PRIMARY KEY IDENTITY(1, 1),
    Name VARCHAR(200) UNIQUE,
    Code VARCHAR(10) UNIQUE,
    Credit INT,
    NumOfSemester INT
)


INSERT INTO Course (Name, Code, Credit, NumOfSemester) 
VALUES 
    ('Bachelor of IT', 'BIT', 129, 6),
    ('Bachelor of Computer Science', 'BCS', 127, 6);

Select * from Course

--How many student are enrolled in each course
SELECT 
    c.CourseName, 
    COUNT(e.StudentId) AS NumOfStudentsEnrolled
FROM 
    Course c
LEFT JOIN 
    Enrollment e ON c.Id = e.CourseId
GROUP BY 
    c.CourseName;


--which student is enrolled in which course
SELECT 
    CONCAT(s.FirstName, ' ', s.LastName) AS StudentName, 
    c.CourseName, 
    e.Grade, 
    e.Semester 
FROM 
    Student s
INNER JOIN 
    Enrollment e ON s.Id = e.StudentId
INNER JOIN 
    Course c ON e.CourseId = c.Id;

--student who haven't enrolled in any course
SELECT 
    CONCAT(s.FirstName, ' ', s.LastName) AS StudentName
FROM 
    Student s
LEFT JOIN 
    Enrollment e ON s.Id = e.StudentId
WHERE 
    e.Id IS NULL;

--Course with no enrollment
SELECT 
    c.CourseName
FROM 
    Course c
LEFT JOIN 
    Enrollment e ON c.Id = e.CourseId
WHERE 
    e.Id IS NULL;