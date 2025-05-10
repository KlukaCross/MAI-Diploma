.PHONY: up create-tables benchmark down

INSERT_DATA_FILES := $(wildcard test_scripts/rule_t*.json)

up:
	docker-compose up -d

create-tables:
	docker exec -i benchmark_source_db psql -U user -d source -f /scripts/create_tables.sql

benchmark: $(INSERT_DATA_FILES)
	@echo "Тестирование прототипа..."
	@for file in $^; do \
	  echo "Запуск бенчмарка для $$file..."; \
	  ./clear_target_data.sh; \
	  ./bench_prototype.sh $$file; \
	done
	@echo "Тестирование pg_dump..."
	@./clear_target_data.sh
	@./bench_pg_dump.sh

down:
	docker-compose down

plot:
	gnuplot plot_script.gnuplot
