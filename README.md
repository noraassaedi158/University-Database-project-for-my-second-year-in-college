# University-Database-project-for-my-second-year-in-college
My group and I built this University Management System to keep campus data—from students to instructors—actually organized. It shows academic operations like registration using a solid database. it has 10 Key Entities: Students, Instructors, Departments, Courses, Majors, Classrooms, Sections, Enrollments, Schedules, and Payments.


🚀 Overview
Our system is built on MySQL and manages everything from basic student info to complex course scheduling and payment tracking. It ensures data accuracy across all university departments.

🛠️ The 10 Core Entities
I implemented 10 key tables to keep everything organized:

Students & Instructors: The people at the heart of the system.

Departments & Majors: Academic categorization.

Courses & Sections: Course offerings and their specific semester instances.

Classrooms & Schedules: Managing the "where" and "when" of classes.

Enrollments: Linking students to their classes with grade tracking.

Payments: Keeping track of financial records and student dues.

📂 Project Structure
university_setup.sql: This is the main file. It contains the full schema (DDL) to create the tables and the sample data (DML) to populate them.

Report.pdf: (If you kept it) Detailed documentation and ER diagrams for the project.

⚙️ How to Run
Make sure you have MySQL installed.

Create a database named university:

SQL
CREATE DATABASE university;
Run the university_setup.sql script to generate the tables and insert the sample data.

You're all set! You can now run queries to test the relationships.
