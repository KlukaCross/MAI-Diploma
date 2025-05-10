import random
from faker import Faker
import json

def main():
    q = 2
    n = 9
    class_n = 16
    students_per_class_n = 32
    sm = class_n*students_per_class_n * ((2*q)**n - 1) // ((2*q) - 1)
    student_last_id = 1
    class_last_id = 1
    faker = Faker()
    classes = []
    students = []
    for i in range(n):
        classes += [f"({class_last_id+j}, 'Class {class_last_id+j}')" for j in range(class_n)]
        students += [f"({student_last_id+j}, '{faker.first_name()}', '{faker.last_name()}', '{faker.date()}', {class_last_id+j//students_per_class_n})" for j in range(class_n*students_per_class_n)]

        source_rules_str = json.dumps([{"table": "classes", "where": f"{' OR '.join(['class_id='+str(class_last_id+j) for j in range(class_n)])}"}])

        class_last_id += class_n
        student_last_id += class_n*students_per_class_n
        class_n *= q
        students_per_class_n *= q

        with open(f"rule_t{i+1}.json", "w") as f:
            f.write(
"""
{
  "source_rules": %s,
  "traversal_rules": []
}
""" % source_rules_str
)


    with open(f"insert_data.sql", "w") as f:
        f.write(
f"""
-- {sm} rows

BEGIN;

INSERT INTO classes (class_id, name) VALUES
{',\n'.join(classes)};

INSERT INTO students (student_id, first_name, last_name, birth_date, class_id) VALUES
{',\n'.join(students)};

COMMIT;
"""
    )

if __name__ == "__main__":
    main()
