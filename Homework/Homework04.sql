DECLARE @FirstName NVARCHAR(100)
SET @FirstName = 'Antonio'

SELECT *
FROM Student
WHERE FirstName = @FirstName

DECLARE @FemaleStudents TABLE (StudentId INT, StudentName NVARCHAR(100), DateOfBirth DATE)
INSERT INTO @FemaleStudents (StudentId, StudentName, DateOfBirth)
SELECT ID, FirstName, DateOfBirth
FROM Student
WHERE Gender = 'F'

SELECT *
FROM @FemaleStudents

DROP TABLE IF EXISTS #MaleStudents
CREATE TABLE #MaleStudents (LastName NVARCHAR(100), EnrolledDate DATE)
INSERT INTO #MaleStudents (LastName, EnrolledDate)
SELECT LastName, EnrolledDate
FROM Student
WHERE Gender = 'M' AND FirstName LIKE 'A%'

SELECT *
FROM #MaleStudents

SELECT *
FROM #MaleStudents
WHERE LEN(LastName) = 7

SELECT *
FROM Teacher
WHERE LEN(FirstName) < 5 AND LEFT(FirstName, 3) = LEFT(LastName, 3)