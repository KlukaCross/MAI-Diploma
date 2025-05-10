def main():
    str_count_before_first_class = 6
    classes = 8176
    with open("insert_data.sql") as source, open("insert_data_sep.sql", "w") as target:
        for i in range(str_count_before_first_class + classes):
            line = source.readline()
            target.write(line)
        target.write("\nCOMMIT;\n")
        target.write("\nBEGIN;\n")
        str_count = 0
        line = source.readline()
        while line:
            str_count += 1
            if str_count > 10_000:
                target.write(line[:-2] + ";\n")
                target.write("\nCOMMIT;\n")
                target.write("\nBEGIN;\n")
                target.write("\nINSERT INTO students (student_id, first_name, last_name, birth_date, class_id) VALUES\n")
                str_count = 0
            else:
                target.write(line)
            line = source.readline()


if __name__ == "__main__":
    main()
