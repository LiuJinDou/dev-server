include .env

.PHONY: build
build:
	bash run.sh -e canal.auto.scan=false \
		  -e canal.destinations=test \
		  -e canal.instance.master.address=${ADDRESS}  \
		  -e canal.instance.dbUsername=${DB_USERNAME}  \
		  -e canal.instance.dbPassword=${DB_PASSWORD}  \
		  -e canal.instance.connectionCharset=UTF-8 \
		  -e canal.instance.tsdb.enable=true \
		  -e canal.instance.gtidon=false \
		  -e canal.instance.filter.regex=.*\\\\..*