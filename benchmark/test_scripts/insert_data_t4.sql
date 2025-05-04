
-- 50 rows

BEGIN;

INSERT INTO classes (class_id, name) VALUES
(1, 'Class 1'),
(2, 'Class 2'),
(3, 'Class 3'),
(4, 'Class 4'),
(5, 'Class 5'),
(6, 'Class 6'),
(7, 'Class 7'),
(8, 'Class 8'),
(9, 'Class 9'),
(10, 'Class 10'),
(11, 'Class 11'),
(12, 'Class 12'),
(13, 'Class 13'),
(14, 'Class 14'),
(15, 'Class 15'),
(16, 'Class 16');

INSERT INTO subjects (subject_id, name) VALUES
(1, 'Mega subject');

INSERT INTO students (student_id, first_name, last_name, birth_date, class_id) VALUES
(1, 'Erica', 'Lucas', '1997-08-25', 1),
(2, 'Jacob', 'Jennings', '1994-01-19', 2),
(3, 'Rita', 'Garza', '2012-11-21', 3),
(4, 'Aaron', 'Ball', '1978-06-01', 4),
(5, 'Jacob', 'Serrano', '2008-01-16', 5),
(6, 'Megan', 'Chapman', '2007-09-21', 6),
(7, 'Cassandra', 'Moss', '1999-01-22', 7),
(8, 'Miranda', 'Campbell', '1989-09-26', 8),
(9, 'Samuel', 'Bradley', '2018-06-30', 9),
(10, 'Caitlyn', 'Griffin', '2009-05-29', 10),
(11, 'Kirsten', 'Watts', '2003-05-21', 11),
(12, 'Steven', 'Hood', '1994-01-07', 12),
(13, 'Angela', 'Mora', '2005-12-15', 13),
(14, 'Joyce', 'Dyer', '1976-08-21', 14),
(15, 'Evan', 'Cox', '1993-07-09', 15),
(16, 'Alyssa', 'Williams', '2010-02-01', 16);

INSERT INTO teachers (teacher_id, first_name, last_name, subject_id) VALUES
(1, 'Mega', 'Teacher', 1);

INSERT INTO lessons (lesson_id, date, class_id, subject_id) VALUES
(1, '1973-02-05', 1, 1),
(2, '1981-02-13', 2, 1),
(3, '1994-12-20', 3, 1),
(4, '1984-01-26', 4, 1),
(5, '1991-11-01', 5, 1),
(6, '2004-06-24', 6, 1),
(7, '1994-05-09', 7, 1),
(8, '2006-09-29', 8, 1),
(9, '2018-12-10', 9, 1),
(10, '2007-03-04', 10, 1),
(11, '2004-08-28', 11, 1),
(12, '2015-05-06', 12, 1),
(13, '2011-08-01', 13, 1),
(14, '1997-10-17', 14, 1),
(15, '2016-05-25', 15, 1),
(16, '1990-06-05', 16, 1);

COMMIT;

