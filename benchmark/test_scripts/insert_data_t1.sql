
-- 8 rows

BEGIN;

INSERT INTO classes (class_id, name) VALUES
(1, 'Class 1'),
(2, 'Class 2');

INSERT INTO subjects (subject_id, name) VALUES
(1, 'Mega subject');

INSERT INTO students (student_id, first_name, last_name, birth_date, class_id) VALUES
(1, 'Katherine', 'Farmer', '1972-03-02', 1),
(2, 'Kenneth', 'Anthony', '1973-11-21', 2);

INSERT INTO teachers (teacher_id, first_name, last_name, subject_id) VALUES
(1, 'Mega', 'Teacher', 1);

INSERT INTO lessons (lesson_id, date, class_id, subject_id) VALUES
(1, '2004-12-27', 1, 1),
(2, '1995-06-01', 2, 1);

COMMIT;

