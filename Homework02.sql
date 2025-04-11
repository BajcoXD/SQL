select * from Student

SELECT * 
FROM Student
WHERE FirstName = 'Antonio';

SELECT * 
FROM Student
WHERE DateOfBirth > '1999-01-01';

SELECT * 
FROM Student
WHERE LastName LIKE 'J%' 
  AND MONTH(EnrolledDate) = 1 
  AND YEAR(EnrolledDate) = 1998;

  SELECT * 
FROM Student
ORDER BY FirstName;

SELECT LastName 
FROM Student

UNION

SELECT LastName 
FROM Teacher;

--
ALTER TABLE dbo.Grade
DROP CONSTRAINT FK_Grade_Student;


ALTER TABLE dbo.Grade
ADD CONSTRAINT FK_Grade_Student
FOREIGN KEY (StudentId) REFERENCES dbo.Student(Id);
--

SELECT 
    c.Name AS CourseName,
    a.Name AS AchievementName
FROM dbo.Course c
CROSS JOIN dbo.AchievementType a;

SELECT * 
FROM dbo.Teacher t
WHERE NOT EXISTS (
    SELECT 1 
    FROM dbo.Grade g 
    WHERE g.TeacherId = t.Id
);
