BEGIN;

CREATE TABLE classes (
    class_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE subjects (
    subject_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE students (
    student_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    birth_date DATE NOT NULL,
    class_id INT,
    FOREIGN KEY (class_id) REFERENCES classes(class_id)
);

CREATE TABLE teachers (
    teacher_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    subject_id INT,
    FOREIGN KEY (subject_id) REFERENCES subjects(subject_id)
);

CREATE TABLE lessons (
    lesson_id INT PRIMARY KEY,
    date DATE NOT NULL,
    class_id INT,
    subject_id INT,
    FOREIGN KEY (class_id) REFERENCES classes(class_id),
    FOREIGN KEY (subject_id) REFERENCES subjects(subject_id)
);

COMMIT;
