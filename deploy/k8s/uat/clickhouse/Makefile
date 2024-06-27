.PHONY: install
install:
	kubectl apply -f clickhouse.yaml -n bi-infra
	kubectl apply -f clickhouse-service.yaml -n bi-infra

.PHONY: uninstall
uninstall:
	kubectl delete -f clickhouse.yaml -n bi-infra
	kubectl delete -f clickhouse-service.yaml -n bi-infra
