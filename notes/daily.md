###### bi-dev 
> IP=10.2.1.180

> 集群IP: 10.2.1.74
###### docker&kubernetes 

```
bash run.sh -e canal.auto.scan=false   -e canal.destinations=test   -e canal.instance.master.address=10.2.1.180:3308    -e canal.instance.dbUsername=canal    -e canal.instance.dbPassword=canal -e canal.instance.connectionCharset=UTF-8   -e canal.instance.tsdb.enable=true   -e canal.instance.gtidon=false

docker run -i -t --rm --entrypoint=bash  canal/canal-server:v1.1.7
docker inspect canal/canal-server:v1.1.7

kubectl get kafkauser

kubectl get kafkauser uco-bi -oyaml

kubectl get secret uco-bi -oyaml

echo "b3JnLmFwYWNoZS5rYWZrYS5jb21tb24uc2VjdXJpdHkuc2NyYW0uU2NyYW1Mb2dpbk1vZHVsZSByZXF1aXJlZCB1c2VybmFtZT0idWNvLWJpIiBwYXNzd29yZD0iWnJGNW9wVjBhU1dCIjs=" | base64 -d

kubectl get secret uco-bi -n bi-infra -o jsonpath='{.data.password}' | base64 -d

<!-- 重启指定的Deployment -->
kubectl rollout restart deployment/bi-trino-coordinator -n bi-streaming
kubectl rollout restart deployment/bi-trino-worker -n bi-streaming

<!-- 删除状态为失败的POD -->
kubectl -n uco-etl delete pods --field-selector=status.phase==Failed

docker inspect canal/canal-server:v1.1.7
docker run -i -t --rm --entrypoint=bash  canal/canal-server:v1.1.7

docker tag altinity/clickhouse-operator:0.24.0 gitlab-registry.f.uco.com/p/it/big/uco-clickhouse-cluster/clickhouse-operator:0.24.0
docker push gitlab-registry.f.uco.com/p/it/big/uco-clickhouse-cluster/clickhouse-operator:0.24.0

docker tag altinity/metrics-exporter:0.24.0 gitlab-registry.f.uco.com/p/it/big/uco-clickhouse-cluster/altinity/metrics-exporter:0.24.0
docker push gitlab-registry.f.uco.com/p/it/big/uco-clickhouse-cluster/altinity/metrics-exporter:0.24.0

docker tag clickhouse/clickhouse-server:24.5.1 gitlab-registry.f.uco.com/p/it/big/uco-clickhouse-cluster/clickhouse/clickhouse-server:24.5.1
docker push gitlab-registry.f.uco.com/p/it/big/uco-clickhouse-cluster/clickhouse/clickhouse-server:24.5.1

docker tag clickhouse/clickhouse-keeper:24.5.1 gitlab-registry.f.uco.com/p/it/big/uco-clickhouse-cluster/clickhouse/clickhouse-keeper:24.5.1
docker push gitlab-registry.f.uco.com/p/it/big/uco-clickhouse-cluster/clickhouse/clickhouse-keeper:24.5.1

docker tag addressparser:v1.0 gitlab-registry.f.uco.com/p/it/big/uco-clickhouse-cluster/addressparser:v1.0
docker push gitlab-registry.f.uco.com/p/it/big/uco-clickhouse-cluster/addressparser:v1.0



docker tag uco-data-sync:1.1 gitlab-registry.f.uco.com/p/it/big/uco-data-sync:1.1
docker push gitlab-registry.f.uco.com/p/it/big/uco-data-sync:1.1

scp -r bi_dw liujindou@10.2.1.180:/home/liujindou/
47.98.202.31
kubectl rollout restart deployment/uat-bi-trino-worker

```

##### 组件
> mysql-canal-kafka-clickhouse

###### 1. clickhouse 

```

SELECT _shard_num,* FROM clusterAllReplicas('uco-bi-test', 'system', 'databases')

-- show datasources
select * from jdbc('', 'show datasources');

CREATE USER admin IDENTIFIED WITH plaintext_password BY 'admin';

```

###### 2. clickhouse-operator 

###### 3. clickhouse-keeper

###### 4. canal
> read binlog
###### 5. kafka
> kafkamap

```

kafka-topics.sh --list --bootstrap-server localhost:9092


kafka-topics.sh --create --topic scalpler.order --bootstrap-server localhost:9092 --partitions 1 --replication-factor 1
# --create：指定创建操作。
# --topic my_topic：设置要创建的 topic 名称
# --bootstrap-server <broker_host>:<broker_port>：Kafka broker 的地址和端口
# --partitions 3：指定分区的数量
# --replication-factor 1：指定副本因子

# group
./kafka-consumer-groups.sh --list --bootstrap-server 127.0.0.1:9092
# producer
kafka-console-producer.sh --topic scalpler.order --bootstrap-server localhost:9092

# msg 
kafka-console-consumer.sh --topic scalpler.order --bootstrap-server localhost:9092 --from-beginning

```
###### 6. zookeeper
###### 5. mysql 
> binlog
```

CREATE USER 'canal'@'localhost' IDENTIFIED BY 'canal';

GRANT ALL PRIVILEGES ON *.* TO 'canal'@'localhost';

FLUSH PRIVILEGES;

```


```
curl --location --request POST 'https://bi-data-service.i.uco.com/pii' \
--header 'X-Api-Token: a037e6ce467ecb8d55e67afe587282b2' \
--header 'User-Agent: Apifox/1.0.0 (https://apifox.com)' \
--header 'Content-Type: application/json' \
--data-raw '{
    "ciphertexts": [
        "vault:v1:JVuKGSLIWjC4I8QV5zgLyNdpQoMaY6cSamuOUsvcI3+mpXeWjunm"
    ],
    "dataType": "MOBILE",
    "platform": "100074"
}'
```




curl -X POST --header 'Content-Type: application/json' http://addressparser-api:8000/batch/parse_address --data '["浙江省海外留学人员创业园(下沙)"]'