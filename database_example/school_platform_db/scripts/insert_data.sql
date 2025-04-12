BEGIN;

INSERT INTO classes (name) VALUES
('Class 1A'),
('Class 1B'),
('Class 2A'),
('Class 2B');

INSERT INTO subjects (name) VALUES
('Mathematics'),
('Literature'),
('Science'),
('History');

INSERT INTO students (first_name, last_name, birth_date, class_id) VALUES
('John', 'Doe', '2010-05-15', 1),
('Jane', 'Smith', '2009-09-20', 2),
('Emily', 'Jones', '2010-11-02', 1),
('Michael', 'Brown', '2009-01-25', 3);

INSERT INTO teachers (first_name, last_name, subject_id) VALUES
('Alice', 'Johnson', 1),
('Bob', 'Miller', 2),
('Charlie', 'Davis', 3),
('Denise', 'Wilson', 4);

INSERT INTO lessons (date, class_id, subject_id) VALUES
('2023-11-01', 1, 1),
('2023-11-01', 2, 2),
('2023-11-02', 1, 3),
('2023-11-02', 2, 4);

COMMIT;
