
-- 26 rows

BEGIN;

INSERT INTO classes (class_id, name) VALUES
(1, 'Class 1'),
(2, 'Class 2'),
(3, 'Class 3'),
(4, 'Class 4'),
(5, 'Class 5'),
(6, 'Class 6'),
(7, 'Class 7'),
(8, 'Class 8');

INSERT INTO subjects (subject_id, name) VALUES
(1, 'Mega subject');

INSERT INTO students (student_id, first_name, last_name, birth_date, class_id) VALUES
(1, 'April', 'Anderson', '1976-11-20', 1),
(2, 'Joseph', 'Smith', '1981-03-19', 2),
(3, 'Natalie', 'Cabrera', '1973-11-14', 3),
(4, 'Seth', 'Horton', '2001-03-06', 4),
(5, 'Nathan', 'Diaz', '2009-05-10', 5),
(6, 'Christopher', 'Rivera', '2007-11-27', 6),
(7, 'James', 'Kelly', '2008-11-22', 7),
(8, 'John', 'Washington', '2011-04-16', 8);

INSERT INTO teachers (teacher_id, first_name, last_name, subject_id) VALUES
(1, 'Mega', 'Teacher', 1);

INSERT INTO lessons (lesson_id, date, class_id, subject_id) VALUES
(1, '2020-02-19', 1, 1),
(2, '1978-07-16', 2, 1),
(3, '1972-06-25', 3, 1),
(4, '1970-12-20', 4, 1),
(5, '1974-08-03', 5, 1),
(6, '2002-04-13', 6, 1),
(7, '2000-04-10', 7, 1),
(8, '2001-11-09', 8, 1);

COMMIT;

