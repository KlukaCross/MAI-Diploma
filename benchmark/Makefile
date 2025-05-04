.PHONY: up create-tables benchmark down

INSERT_DATA_FILES := $(wildcard test_scripts/insert_data_t*.sql)

up:
	docker-compose up -d

create-tables:
	docker exec -i benchmark_source_db psql -U user -d source -f /scripts/create_tables.sql

benchmark: $(INSERT_DATA_FILES)
	@for file in $^; do \
	  echo "Запуск бенчмарка для $$file..."; \
	  ./bench.sh $$file; \
	done

down:
	docker-compose down

plot:
	gnuplot plot_script.gnuplot
