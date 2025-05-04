#!/bin/bash

DUMP_FILE="db_dump.sql"

export PGPASSWORD="$SOURCE_DB_PASSWORD"
pg_dump --data-only -h $SOURCE_DB_HOST -U $SOURCE_DB_USER -p $SOURCE_DB_PORT $SOURCE_DB > $DUMP_FILE

export PGPASSWORD="$TARGET_DB_PASSWORD"
psql -h $TARGET_DB_HOST -U $TARGET_DB_USER -p $TARGET_DB_PORT $TARGET_DB < $DUMP_FILE

rm $DUMP_FILE

echo "Дамп базы данных и импорт завершены."

unset PGPASSWORD
