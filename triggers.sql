-- Trigger to automatically populate StudentSubjects tables
CREATE TRIGGER populateStudentSubjects
        AFTER INSERT ON Student
        REFERENCING NEW ROW AS stu
        BEGIN
            --INSERT INTO StudentSubjects VALUES
            year := SELECT year_of_study FROM Student ORDER BY id DESC LIMIT 1;
            stu_id := SELECT student_id FROM Student ORDER BY id DESC LIMIT 1;
            IF(year=1) THEN
                SELECT * FROM Subjects LIMIT 6    
        END;