
-- 14 rows

BEGIN;

INSERT INTO classes (class_id, name) VALUES
(1, 'Class 1'),
(2, 'Class 2'),
(3, 'Class 3'),
(4, 'Class 4');

INSERT INTO subjects (subject_id, name) VALUES
(1, 'Mega subject');

INSERT INTO students (student_id, first_name, last_name, birth_date, class_id) VALUES
(1, 'Jennifer', 'Anderson', '1978-12-09', 1),
(2, 'Sandra', 'Perez', '1986-11-22', 2),
(3, 'Steven', 'Duran', '2022-12-09', 3),
(4, 'Jorge', 'Anderson', '1987-10-09', 4);

INSERT INTO teachers (teacher_id, first_name, last_name, subject_id) VALUES
(1, 'Mega', 'Teacher', 1);

INSERT INTO lessons (lesson_id, date, class_id, subject_id) VALUES
(1, '1985-06-24', 1, 1),
(2, '1990-03-18', 2, 1),
(3, '1971-08-10', 3, 1),
(4, '2003-06-30', 4, 1);

COMMIT;

