#!/bin/bash

DUMP_FILE="db_dump.sql"

export SOURCE_DB="source"
export SOURCE_DB_PORT="5432"
export SOURCE_DB_USER="user"
export SOURCE_DB_PASSWORD="password"
export SOURCE_DB_HOST="localhost"

export TARGET_DB="target"
export TARGET_DB_PORT="5433"
export TARGET_DB_USER="user"
export TARGET_DB_PASSWORD="password"
export TARGET_DB_HOST="localhost"

START_TIME=$(date '+%s%3N')
export PGPASSWORD="$SOURCE_DB_PASSWORD"
pg_dump --data-only -h $SOURCE_DB_HOST -U $SOURCE_DB_USER -p $SOURCE_DB_PORT $SOURCE_DB > $DUMP_FILE

export PGPASSWORD="$TARGET_DB_PASSWORD"
psql -h $TARGET_DB_HOST -U $TARGET_DB_USER -p $TARGET_DB_PORT $TARGET_DB < $DUMP_FILE
END_TIME=$(date '+%s%3N')

rm $DUMP_FILE

REAL_TIME_MS=$((END_TIME - START_TIME))

echo "Дамп базы данных и импорт завершены."
echo "Время выполнения программы: $REAL_TIME_MS миллисекунд"

unset PGPASSWORD
