# install:
# 	bash run.sh -e canal.auto.scan=false   -e canal.destinations=test   -e canal.instance.master.address=10.2.1.180:3308    -e canal.instance.dbUsername=canal    -e canal.instance.dbPassword=canal -e canal.instance.connectionCharset=UTF-8   -e canal.instance.tsdb.enable=true   -e canal.instance.gtidon=false

install:
	docker run -d --privileged=true -it -h 1001 --env-file .env --name=canal-server --net=host -m 4096m canal/canal-server:v1.1.7
