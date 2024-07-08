.PHONY: flink_install flink_uninstall

flink_install: flink_uninstall
	
	docker-compose -f flink/docker-compose.yaml up -d

flink_uninstall:
	docker-compose -f flink/docker-compose.yaml down


deploy_kafak:
	docker run -p 9092:9092 apache/kafka:3.7.1
