.PHONY: up create-tables insert-data down

up:
	docker-compose up -d

create-tables:
	docker-compose exec db psql -U myuser -d school_platform_db -f /scripts/create_tables.sql

insert-data:
	docker-compose exec db psql -U myuser -d school_platform_db -f /scripts/insert_data.sql

down:
	docker-compose down
