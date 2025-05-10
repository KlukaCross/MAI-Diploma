PROTOTYPE="./prototype"
export TARGET_DB="target"
export TARGET_DB_PORT="5433"
export TARGET_DB_USER="user"
export TARGET_DB_PASSWORD="password"
export TARGET_DB_HOST="localhost"

TARGET_DSN="postgresql://${TARGET_DB_USER}:${TARGET_DB_PASSWORD}@${TARGET_DB_HOST}:${TARGET_DB_PORT}/${TARGET_DB}"

$PROTOTYPE clear-data --db $TARGET_DSN
