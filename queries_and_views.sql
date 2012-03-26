SELECT * FROM Student;
SELECT * FROM Lecturer;

SELECT Student.name FROM Student
    INNER JOIN StudentSubject ON Student.student_id = StudentSubject.student_id;

SELECT Lecturer.name FROM Lecturer 
    INNER JOIN LecturerSubject ON Lecturer.lecturer_id = LecturerSubject.lecturer_id; 

SELECT to_char(Student.Dob, 'YY') FROM Student; 
SELECT to_char()