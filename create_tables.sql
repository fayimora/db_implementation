SET TERMOUT ON
PROMPT Building tables. Please wait...

-- Drop all tables incase any already exists
DROP TABLE Year;
DROP TABLE CourseworkQuestion;
DROP TABLE ExamQuestions;
DROP TABLE Question;
DROP TABLE Exam;
DROP TABLE Coursework;
DROP TABLE LecturerSubjects;
DROP TABLE StudentSubjects;
DROP TABLE Subject;
DROP TABLE Lecturer;
DROP TABLE Student;



PROMPT Creating Student table
-- Table representing Students
CREATE TABLE Student
        (student_id INT PRIMARY KEY NOT NULL,
         name VARCHAR2(255) NOT NULL,
         dob DATE,
         year_of_study INT,
         email_address VARCHAR2(255) NOT NULL,
         mobile_number VARCHAR2(255),
         house_address VARCHAR2(255) NOT NULL);


PROMPT Creating Lecturer table
-- Table representing Lecturers
CREATE TABLE Lecturer
        (lecturer_id INT PRIMARY KEY NOT NULL,
         name VARCHAR2(255) NOT NULL,
         email_address VARCHAR2(255) NOT NULL,
         employed_date DATE,
         mobile_number VARCHAR2(255),
         house_address VARCHAR2(255) NOT NULL);



PROMPT Creating Subject table
-- Table representing Subjects
CREATE TABLE Subject
        (subject_id VARCHAR2(255) PRIMARY KEY,
         name VARCHAR2(255) NOT NULL, 
         no_of_students NUMBER(38),
         no_of_coursework INT,
         semester_id INT,
         lecturer_id INT,
         FOREIGN KEY (lecturer_id) REFERENCES Lecturer(lecturer_id));


PROMPT Creating StudentSubjects table
-- Table representing association between Students and Subjects 
CREATE TABLE StudentSubjects
        (student_id INT,
         subject_id VARCHAR2(255),
         FOREIGN KEY (student_id) REFERENCES Student(student_id),
         FOREIGN KEY (subject_id) REFERENCES Subject(subject_id));


PROMPT Creating LecturerSubjects table
-- Table representing the association between Lecturers and Subjects
CREATE TABLE LecturerSubjects
        (lecturer_id INT,
         subject_id VARCHAR2(255),
         FOREIGN KEY (lecturer_id) REFERENCES Lecturer(lecturer_id),
         FOREIGN KEY (subject_id) REFERENCES Subject(subject_id));



PROMPT Creating Coursework table
-- Table representing Courseworks
CREATE TABLE Coursework
        (coursework_id INT PRIMARY KEY,
         subject_id VARCHAR2(255),
         due_date DATE,
         marks NUMBER(38),
         FOREIGN KEY (subject_id) REFERENCES Subject(subject_id));


PROMPT Creating Exam table
-- Table representing Exam
CREATE TABLE Exam
        (exam_id INT PRIMARY KEY,
         marks INT,
         subject_id VARCHAR2(255),
         FOREIGN KEY (subject_id) REFERENCES Subject(subject_id));


PROMPT Creating Question table
-- Table representing Questions
CREATE TABLE Question
        (question_id INT PRIMARY KEY,
         question VARCHAR2(3000));


PROMPT Creating ExamQuestions table
-- Table representing the association between Exams and Questions 
CREATE TABLE ExamQuestions
        (exam_id INT,
         question_id INT,
         FOREIGN KEY (question_id) REFERENCES Question(question_id));


PROMPT Creating CourseworkQuestion table
-- Table representing association between Courseworks and Questions
CREATE TABLE CourseworkQuestion
        (coursework_id INT,
         question_id INT,
         FOREIGN KEY (coursework_id) REFERENCES Coursework(coursework_id),
         FOREIGN KEY (question_id) REFERENCES Question(question_id));


PROMPT Creating Year table
-- Table representing Year
CREATE TABLE Year
        (degree VARCHAR2(255));

PROMPT Tables have been built. Thanks for waiting!


COMMIT;
SET TERMOUT OFF