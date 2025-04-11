
SELECT COUNT(Grade) AS CountOfAllGrades
FROM Teacher t
JOIN Grade g ON g.TeacherID = t.ID

SELECT *
FROM Teacher

select *
from Grade

select *
from Student

SELECT COUNT(Grade) AS CountGradesOnStudentsBellow100
FROM Teacher t
JOIN Grade g ON g.TeacherID = t.ID
WHERE g.StudentID < 100

SELECT s.FirstName, MAX(g.Grade) AS MaxGrade, AVG(g.Grade) AS AvgGrade
FROM Student s
JOIN Grade g ON g.StudentID = s.ID
GROUP BY s.FirstName

SELECT t.FirstName, t.LastName
FROM Teacher t
JOIN Grade g ON g.TeacherID = t.ID
GROUP BY t.FirstName, t.LastName
HAVING COUNT(g.Grade) > 200


SELECT
s.FirstName,
s.LastName,
MAX(g.Grade) AS MaxGrade, 
AVG(g.Grade) AS AvgGrade,
COUNT(g.Grade) AS CountGrades
FROM Student s
JOIN Grade g ON g.StudentID = s.ID
GROUP BY s.FirstName, s.LastName
HAVING MAX(g.Grade) = AVG(g.Grade)


CREATE VIEW vv_StudentGrades AS
SELECT StudentID, COUNT(*) AS GradeCount
FROM Grade
GROUP BY StudentID

ALTER VIEW vv_StudentGrades AS
SELECT S.FirstName, S.LastName, COUNT(g.Grade) AS GradeCount 
FROM Student s
JOIN Grade g ON s.ID = g.StudentID
GROUP BY s.FirstName, s.LastName

SELECT * 
FROM vv_StudentGrades
ORDER BY GradeCount DESC