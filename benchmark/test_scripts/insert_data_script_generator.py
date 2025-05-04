import random
from faker import Faker

def main():
    classes_number = int(input())
    students_per_class_number = int(input())
    lessons_per_class_number = int(input())
    faker = Faker()
    classes = [f"({i+1}, 'Class {i+1}')" for i in range(classes_number)]
    students = [f"({i+1}, '{faker.first_name()}', '{faker.last_name()}', '{faker.date()}', {i//students_per_class_number+1})" for i in range(classes_number*students_per_class_number)]
    lessons = [f"({i+1}, '{faker.date()}', {i//lessons_per_class_number+1}, 1)" for i in range(classes_number*lessons_per_class_number)]

    print(
f"""
-- {classes_number + 1 + classes_number*students_per_class_number + 1 + classes_number*lessons_per_class_number} rows

BEGIN;

INSERT INTO classes (class_id, name) VALUES
{',\n'.join(classes)};

INSERT INTO subjects (subject_id, name) VALUES
(1, 'Mega subject');

INSERT INTO students (student_id, first_name, last_name, birth_date, class_id) VALUES
{',\n'.join(students)};

INSERT INTO teachers (teacher_id, first_name, last_name, subject_id) VALUES
(1, 'Mega', 'Teacher', 1);

INSERT INTO lessons (lesson_id, date, class_id, subject_id) VALUES
{',\n'.join(lessons)};

COMMIT;
"""
    )

if __name__ == "__main__":
    main()
