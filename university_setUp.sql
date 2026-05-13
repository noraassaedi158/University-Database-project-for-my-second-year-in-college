USE university; 

 

CREATE TABLE Departments ( 

    dept_id INT PRIMARY KEY, 

    dept_name VARCHAR(100) NOT NULL, 

    dept_head VARCHAR(100) 

); 

 

CREATE TABLE Classroom ( 

    class_id VARCHAR(50) PRIMARY KEY, 

    capacity INT, 

    building VARCHAR(100) 

); 

 

CREATE TABLE Major ( 

    major_id INT PRIMARY KEY, 

    name VARCHAR(100), 

    dept_id INT, 

    FOREIGN KEY (dept_id) REFERENCES Departments(dept_id) 

); 

 

CREATE TABLE Courses ( 

    course_id VARCHAR(10) PRIMARY KEY, 

    course_title VARCHAR(100) NOT NULL, 

    course_level VARCHAR(50), 

    dept_id INT, 

    FOREIGN KEY (dept_id) REFERENCES Departments(dept_id) 

); 

 

CREATE TABLE Instructors ( 

    instructor_id INT PRIMARY KEY AUTO_INCREMENT, 

    name VARCHAR(100) NOT NULL, 

    dept_id INT, 

    FOREIGN KEY (dept_id) REFERENCES Departments(dept_id) 

); 

 

CREATE TABLE Students ( 

    student_id INT PRIMARY KEY, 

    F_name VARCHAR(50) NOT NULL, 

    L_name VARCHAR(50) NOT NULL, 

    email VARCHAR(100) UNIQUE NOT NULL, 

    major_id INT NOT NULL, 

    FOREIGN KEY (major_id) REFERENCES Major(major_id) 

); 

 

CREATE TABLE SECTIONS ( 

    section_id VARCHAR(10) PRIMARY KEY, 

    semester VARCHAR(20) NOT NULL, 

    instructor_id INT, 

    course_id VARCHAR(10), 

    FOREIGN KEY (instructor_id) REFERENCES Instructors(instructor_id), 

    FOREIGN KEY (course_id) REFERENCES Courses(course_id) 

); 

 

CREATE TABLE ENROLLMENTS ( 

    enrollment_id VARCHAR(10) PRIMARY KEY, 

    grade VARCHAR(2), 

    section_id VARCHAR(10), 

    student_id INT, 

    FOREIGN KEY (section_id) REFERENCES SECTIONS(section_id), 

    FOREIGN KEY (student_id) REFERENCES Students(student_id) 

); 

 

CREATE TABLE SCHEDULES ( 

    schedule_id VARCHAR(10) PRIMARY KEY, 

    section_id VARCHAR(10), 

    class_id VARCHAR(50), 

    time VARCHAR(50), 

    day VARCHAR(20), 

    FOREIGN KEY (section_id) REFERENCES SECTIONS(section_id), 

    FOREIGN KEY (class_id) REFERENCES Classroom(class_id) 

); 

 

CREATE TABLE PAYMENTS ( 

    payment_id VARCHAR(10) PRIMARY KEY, 

    student_id INT, 

    amount DECIMAL(10,2), 

    date DATE, 

    FOREIGN KEY (student_id) REFERENCES Students(student_id) 

); 

 

INSERT INTO Departments (dept_id, dept_name, dept_head) VALUES 

(101, 'Computer Science', 'Dr. Faisal Al-Zahrani'), 

(102, 'Information Systems', 'Dr. Nora Mansour'), 

(103, 'Software Engineering', 'Dr. Khalid Omar'), 

(104, 'Cybersecurity', 'Dr. Sarah Ahmed'); 

 

INSERT INTO Classroom (class_id, capacity, building) VALUES 

('284', 40, 'A'), 

('173', 30, 'B'), 

('209', 25, 'C'), 

('156', 50, 'B'); 

 

INSERT INTO Major (major_id, name, dept_id) VALUES 

(47291, 'Computer Science', 101), 

(80563, 'Mathematics', 102), 

(11928, 'English', 103), 

(66407, 'Physics', 104); 

 

INSERT INTO Courses (course_id, course_title, course_level, dept_id) VALUES 

('CS101', 'Introduction to Programming', 'Level 3', 101), 

('DE202', 'Database Systems', 'Level 4', 101), 

('IS301', 'Systems Analysis', 'Level 5', 102), 

('SE401', 'Software Architecture', 'Level 7', 103); 

 

INSERT INTO Instructors (name, dept_id) VALUES 

('Dr. Ahood Alzahrani', 101), 

('Dr. Raghda Alqurashi', 104), 

('Dr. Mashael Alhajdali', 103), 

('Dr. Saleh Alghamdi', 102), 

('Dr. Khalid Alshammari', 103), 

('Dr. Ghada Alfatni', 104); 

 

INSERT INTO Students (student_id, F_name, L_name, email, major_id) VALUES 

(445001, 'Hala', 'Albushri', 's445001@uqu.edu.sa', 47291), 

(445002, 'Noura', 'Alsaadi', 's445002@uqu.edu.sa', 80563), 

(446001, 'Khalid', 'Alotaibi', 's446001@uqu.edu.sa', 47291), 

(446002, 'Ali', 'Alqahtani', 's446002@uqu.edu.sa', 11928), 

(446003, 'Faisal', 'Alzahrani', 's446003@uqu.edu.sa', 66407), 

(446004, 'Saad', 'Alshammari', 's446004@uqu.edu.sa', 66407), 

(447001, 'Dana', 'Alotaibi', 's447001@uqu.edu.sa', 80563); 

 

INSERT INTO SECTIONS (section_id, semester, instructor_id, course_id) VALUES 

('S001', 'Fall 2026', 1, 'CS101'), 

('S002', 'Fall 2026', 3, 'DE202'), 

('S003', 'Spring 2026', 4, 'IS301'), 

('S004', 'Spring 2026', 5, 'SE401'); 

 

INSERT INTO ENROLLMENTS (enrollment_id, student_id, section_id, grade) VALUES 

('E001', 445001, 'S001', 'A'), 

('E002', 445002, 'S001', 'B+'), 

('E003', 446001, 'S002', 'A-'), 

('E004', 446002, 'S003', 'B'), 

('E005', 446003, 'S004', 'A'); 

INSERT INTO SCHEDULES (schedule_id, section_id, class_id, time, day) VALUES 

('S01', 'S001', '284', '08:00 AM', 'Sunday'), 

('S02', 'S001', '173', '08:00 AM', 'Tuesday'), 

('S03', 'S002', '209', '10:00 AM', 'Monday'), 

('S04', 'S003', '156', '01:00 PM', 'Wednesday'); 

INSERT INTO PAYMENTS (payment_id, student_id, amount, date) VALUES 

('P_101', 445001, 1500.00, '2026-04-01'), 

('P_102', 445002, 2000.50, '2026-04-05'), 

('P_103', 446001, 1200.00, '2026-04-10');
