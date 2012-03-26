
--SELECT max(coursework.marks) as MaxCourseWorkMark from coursework;


--Dropping all views
Drop View MaxStudentMarks;
Drop View MaxStudentExMarks;

--this query returns the name of the students with the maximum coursework mark
Create view MaxStudentMarks as 
	SELECT student.Name, coursework.marks FROM student , coursework 
	where coursework.marks = (SELECT max(coursework.marks) from coursework);


--this view stores the name of students with the maximum exam mark
Create view MaxStudentExMarks as 
	SELECT student.Name, exam.marks FROM student , exam 
	where exam.marks = (SELECT max(exam.marks) from exam);


--this view stores the name of the subject which students stored the highest marks in
Create view MaxSubjStudentMarks as 
	SELECT subject.Name, exam.marks FROM subject , exam 
	where exam.marks = (SELECT max(exam.marks) from exam);


--this query shows all the names of students the school
SELECT student.name from student;


--this query shows all student in the first year
SELECT student.name from student where student.year_of_study = 1; 

--this query shows all students in the second year
SELECT student.name from student where student.year_of_study = 2;


--this query shows all students in the second year
SELECT student.name from student where student.year_of_study = 3;


--this query shows all the ages of the student in the school 
SELECT  student where to_char(sysdate, 'YY') - to_char(student.Dob,'YY')


--this query shows the list of all the ages of students in the school 
SELECT to_char(student.Dob, 'YY')-to_char(sysdate,'YY') AS All_Dobs FROM student;

--this query shows the maximum age of all the students in the school
SELECT max(to_char(student.Dob, 'YY')-to_char(sysdate,'YY')) AS Maximum_DOB FROM student;

--this query shows the name of the oldest student in the school
SELECT student.name from student
 where to_char(student.Dob, 'YY')-to_char(sysdate,'YY') = (SELECT max(to_char(student.Dob, 'YY')-to_char(sysdate,'YY')) FROM student);


--this shows the best subject in the school i.e. the subject with the most number of students getting me max scores
SELECT max(MaxSubjStudentMarks.Name) from MaxSubjStudentMarks inner join subject on MaxSubjStudentMarks.Name = subject.Name;


--this shows the best lecturer in the school i.e. the lecturer with the most number of students getting me max scores
SELECT lecturer.name from lecturer inner join subject on subject.lecturer_id = lecturer.lecturer_id where subject.name = 
(SELECT max(MaxSubjStudentMarks.Name) from MaxSubjStudentMarks inner join subject on MaxSubjStudentMarks.Name = subject.Name);




