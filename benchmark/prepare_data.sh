PROTOTYPE="./prototype"
SQL_SCRIPT="test_scripts/insert_data_sep.sql"

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

SOURCE_DSN="postgresql://${SOURCE_DB_USER}:${SOURCE_DB_PASSWORD}@${SOURCE_DB_HOST}:${SOURCE_DB_PORT}/${SOURCE_DB}"
TARGET_DSN="postgresql://${TARGET_DB_USER}:${TARGET_DB_PASSWORD}@${TARGET_DB_HOST}:${TARGET_DB_PORT}/${TARGET_DB}"

$PROTOTYPE clear-data --db $SOURCE_DSN

$PROTOTYPE clone-schema --source-db $SOURCE_DSN --target-db $TARGET_DSN

export PGPASSWORD="$SOURCE_DB_PASSWORD"

psql -h "$SOURCE_DB_HOST" -U "$SOURCE_DB_USER" -d "$SOURCE_DB" -f "$SQL_SCRIPT"
