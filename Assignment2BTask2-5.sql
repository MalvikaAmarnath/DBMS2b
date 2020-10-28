TASK 2 QUERY 1

SELECT firstName, surname, studentID, email, suburb
FROM pulselearning.student
WHERE suburb LIKE '%Everton%'; 

TASK 2 QUERY 2

SELECT studentID, firstName, surname, buddyID
FROM pulselearning.student
WHERE buddyID is NOT NULL;

TASK 2 QUERY 3

SELECT t.staffID, firstName, surname, COUNT(t.staffID) AS NofUnits
FROM pulselearning.tutor t, pulselearning.unittutor u
WHERE t.staffID = u.staffID
GROUP BY firstName
ORDER BY staffID;

TASK 2 QUERY 4

SELECT DISTINCT g.assignmentID, assignmentName,
MIN(grade) AS minGrade,
AVG(grade) AS avgGrade,
MAX(grade) AS maxGrade,
COUNT(grade) AS noOfSubmission
FROM pulselearning.grade g, pulselearning.assignment a
WHERE g.assignmentID = a.assignmentID
GROUP BY g.assignmentID;

TASK 2 QUERY 5

SELECT firstName, surname, email 
FROM pulselearning.tutor
WHERE staffID NOT IN 
	(SELECT  staffID 
	FROM pulselearning.unittutor 
	WHERE unitID IN
		(SELECT  unitID 
		FROM pulselearning.unit
		WHERE semester = '2'));
        
TASK 2 QUERY 6

SELECT  DISTINCT s.studentID, a.assignmentID, grade
FROM pulselearning.grade g, pulselearning.assignment a, pulselearning.sleeppatterns s
WHERE duedate LIKE '%04%'AND
	timeAsleep < 6 AND
    s.studentID = g.studentID AND
    a.assignmentID = g.assignmentID
ORDER BY s.studentID, assignmentID, grade;

TASK 3 INSERT

SELECT * FROM pulselearning.unit;
INSERT INTO pulselearning.unit
VALUES ('114' , 'Advanced Database Management' , 'IFB801' , '2019' , '1');

TASK 3 DELETE

DELETE FROM pulselearning.phonenumber
WHERE phoneNumber LIKE '02%';

TASK 3 UPDATE

SELECT * FROM pulselearning.student;
UPDATE pulselearning.student
SET streetNumber = '72', streetName = 'Evergreen Terrace', suburb = 'Springfield'
WHERE surname = 'Smith' and streetNumber = '180' and streetName = 'Zelda Street' and suburb = 'Linkburb';

TASK 4 CREATE INDEX

CREATE INDEX AssignNameID ON pulselearning.assignment(assignmentName);

TASK 4 CREATE VIEW

CREATE VIEW StuNotEnrolled AS
SELECT studentID, firstName, surname, email FROM pulselearning.student  
WHERE studentID NOT IN
	(SELECT studentID FROM pulselearning.enrolments)
    
TASK 5 A

GRANT INSERT 
ON pulselearning.student
TO nikki;

TASK 5 B

GRANT DELETE 
ON pulselearning.student
TO nikki;

TASK 5 C

REVOKE INSERT 
ON pulselearning.student
FROM jake;

TASK 5 D

REVOKE DELETE 
ON pulselearning.student
FROM jake;


