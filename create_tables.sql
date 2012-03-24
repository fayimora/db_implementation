SET TERMOUT ON
PROMPT Building tables. Please wait...

-- Drop all tables incase any already exists
DROP TABLE Student;
DROP TABLE Subject;
DROP TABLE StudentSubjects;
DROP TABLE Lecturer;
DROP TABLE LecturerSubjects;
DROP TABLE Coursework;
DROP TABLE CourseworkQuestion;
DROP TABLE Exam;
DROP TABLE Question;
DROP TABLE ExamQuestions;
DROP TABLE Semester;
DROP TABLE Year;

-- Table representing Students
CREATE TABLE Student
        (student_id INT PRIMARY KEY NOT NULL,
         name VARCHAR2(255) NOT NULL,
         dob DATE,
         year_of_study INT,
         email_address VARCHAR2(255) NOT NULL,
         mobile_number VARCHAR2(11),
         house_address VARCHAR2(255) NOT NULL);

-- Table representing Subjects
CREATE TABLE Subject
        (subject_id INT PRIMARY KEY,
         name VARCHAR2(255) NOT NULL, 
         no_of_students NUMBER(200),
         no_of_coursework INT,
         semester_id INT,
         lecturer_id INT,
         FOREIGN KEY (lecturer_id) REFERENCES Lecturer(lecturer_id));

-- Table representing association between Students and Subjects 
CREATE TABLE StudentSubjects
        (student_id INT,
         subject_id INT,
         FOREIGN KEY (student_id) REFERENCES Student(student_id),
         FOREIGN KEY (subject_id) REFERENCES Subject(subject_id));

-- Table representing Lecturers
CREATE TABLE Lecturer
        (lecturer_id INT PRIMARY KEY NOT NULL,
         name VARCHAR2(255) NOT NULL,
         email_address VARCHAR2(255) NOT NULL,
         employed_date DATE,
         mobile_number VARCHAR2(11),
         house_address VARCHAR2(255) NOT NULL);

-- Table representing the association between Lecturers and Subjects
CREATE TABLE LecturerSubjects
        (lecturer_id INT,
         subject_id INT,
         FOREIGN KEY (lecturer_id) REFERENCES Lecturer(lecturer_id),
         FOREIGN KEY (subject_id) REFERENCES Subject(subject_id));

-- Table representing Courseworks
CREATE TABLE Coursework
        (coursework_id INT PRIMARY KEY,
         subject_id INT,
         due_date DATE,
         marks NUMBER(100),
         FOREIGN KEY (subject_id) REFERENCES Subject(subject_id));

-- Table representing Exam
CREATE TABLE Exam
        (exam_id INT PRIMARY KEY,
         marks INT,
         subject_id INT);

-- Table representing Questions
CREATE TABLE Question
        (question_id INT PRIMARY KEY,
         question VARCHAR2(3000),
         marks INT );

-- Table representing the association between Exams and Questions 
CREATE TABLE ExamQuestions
        (exam_id INT,
         question_id INT );

-- Table representing association between Courseworks and Questions
CREATE TABLE CourseworkQuestion
        (coursework_id INT,
         question_id INT,
         FOREIGN KEY (coursework_id) REFERENCES Coursework(coursework_id),
         FOREIGN KEY (question_id) REFERENCES Question(question_id));
-- Table representing Semester
CREATE TABLE Semester
    (semester_id INT )

-- Table representing Year
CREATE TABLE Year
        (degree VARCHAR2(255));

PROMPT Tables have been built. Thanks for waiting!