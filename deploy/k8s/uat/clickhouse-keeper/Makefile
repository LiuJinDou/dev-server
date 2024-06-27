.PHONY: install
install:
	kubectl apply -f clickhouse-keeper.yaml -n bi-infra
	kubectl apply -f clickhouse-keeper-service.yaml -n bi-infra


.PHONY: uninstall
uninstall:
	kubectl delete -f clickhouse-keeper.yaml -n bi-infra
	kubectl delete -f clickhouse-keeper-service.yaml -n bi-infra
