# Makefile for managing ClickHouse container with Docker

include .env

stop_container:
	@echo "Stopping container..."
	@docker stop ${MYSQL_CONTAINER_NAME}  ${CLICKHOUSE_CONTAINER_NAME} ${TRINO_CONTAINER_NAME} || true
	@echo "Deleting containers..."
	@docker rm ${MYSQL_CONTAINER_NAME} ${CLICKHOUSE_CONTAINER_NAME ${TRINO_CONTAINER_NAME} || true

start_container:
	@echo "Container-Starting..."
	docker-compose up -d

backup_data:
	@echo "Please follow the documentation instructions to manually backup data."

update_container: stop_container backup_data start_container
	@echo "The container has been_updated"

build_container: update_container