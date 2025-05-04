#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "USAGE: $0 <sql_script>"
    exit 1
fi

SQL_SCRIPT="$1"

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

SOURCE_CONTAINER="benchmark_source_db"

PROTOTYPE="./prototype"
PROTOTYPE_WITH_SYNC_ARGS="OVERRIDE_REMOTE_HOST=${SOURCE_CONTAINER} ${PROTOTYPE} clone-data --source-db ${SOURCE_DSN} --target-db ${TARGET_DSN} --rule-path './rule.json' --walker data_walker_sync --writer single_data_via_FDW_sync"
PROTOTYPE_WITH_ASYNC_ARGS="OVERRIDE_REMOTE_HOST=${SOURCE_CONTAINER} CONNECTION_POOL_SIZE=5 ${PROTOTYPE} clone-data --source-db ${SOURCE_DSN} --target-db ${TARGET_DSN} --rule-path './rule.json' --walker data_walker_async --writer via_FDW_async"
FULL_COPY_SCRIPT="./copy_full_data.sh"
NUM_RUNS=5

PROGRAMS=("${PROTOTYPE_WITH_SYNC_ARGS}" "${PROTOTYPE_WITH_ASYNC_ARGS}" "${FULL_COPY_SCRIPT}")

export PGPASSWORD="$SOURCE_DB_PASSWORD"

clear_data_from_target() {
    $PROTOTYPE clear-data --db $TARGET_DSN
}

clear_data_from_source() {
    $PROTOTYPE clear-data --db $SOURCE_DSN
}

copy_schema_to_target() {
    $PROTOTYPE clone-schema --source-db $SOURCE_DSN --target-db $TARGET_DSN
}

copy_schema_to_target

clear_data_from_source

echo "Start..." > bench_log.txt

psql -h "$SOURCE_DB_HOST" -U "$SOURCE_DB_USER" -d "$SOURCE_DB" -f "$SQL_SCRIPT" >> bench_log.txt

for PROGRAM_CMD in "${PROGRAMS[@]}"; do
    TOTAL_REAL_TIME_MS=0

    echo "Запуск программы: $PROGRAM_CMD"

    for ((i = 1; i <= NUM_RUNS; i++)); do
        echo "Запуск #$i"

        clear_data_from_target

        START_TIME=$(date '+%s%3N')
        bash -c "$PROGRAM_CMD" >> bench_log.txt
        END_TIME=$(date '+%s%3N')

        REAL_TIME_MS=$((END_TIME - START_TIME))
        echo "Затраченное реальное время: $REAL_TIME_MS миллисекунд"

        TOTAL_REAL_TIME_MS=$((TOTAL_REAL_TIME_MS + REAL_TIME_MS))
    done

    AVERAGE_REAL_TIME_MS=$((TOTAL_REAL_TIME_MS / NUM_RUNS))
    echo "Среднее реальное время выполнения программы: $AVERAGE_REAL_TIME_MS миллисекунд"
done

unset PGPASSWORD
