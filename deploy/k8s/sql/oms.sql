drop table if exists stream.uco_oms_database_consumer on cluster "uco-bi-test";
drop table if exists stream.uco_oms_database_stream on cluster "uco-bi-test";

CREATE TABLE stream.uco_oms_database_stream on cluster "uco-bi-test"
(
    "data"      Array(Map(String,Nullable(String))),
    "database"  String,
    "es"        Int64,
    "id"        Int64,
    "isDdl"     boolean,
    "mysqlType" Map(String, String),
    "old"       Array(Map(String,Nullable(String))),
    "pkNames"   Array(String),
    "sql"       String,
    "sqlType"   Map(String, Int64),
    "table"     String,
    "ts"        Int64,
    "type"      String
) ENGINE = Kafka()
SETTINGS
    kafka_broker_list = '10.2.1.74:32100',
    kafka_topic_list = 'uat-test',
    kafka_group_name = 'uat-clickhouse',
    kafka_num_consumers = 1,
    kafka_format = 'JSONEachRow',
    kafka_row_delimiter = '\n';
    
CREATE TABLE stream.uco_oms_database_local on cluster "uco-bi-test"
(
    `data` Array(Map(String, Nullable(String))),
    `database` String,
    `es` Int64,
    `id` Int64,
    `isDdl` Int8,
    `mysqlType` Map(String, String),
    `old` Array(Map(String, Nullable(String))),
    `pkNames` Array(String),
    `sql` String,
    `sqlType` Map(String, Int64),
    `table` String,
    `ts` Int64,
    `type` String,
    `topic` String,
    `timeStamp` DateTime,
    `kafkaTimeStampMs` Nullable(DateTime64(3)) DEFAULT timeStamp,
    `kafkaPartition` UInt64 DEFAULT 0,
    `kafkaOffset` UInt64 DEFAULT 0,
    `kafkaKey` String DEFAULT '',
    `env` String
)
ENGINE = MergeTree
PARTITION BY formatDateTime(fromUnixTimestamp64Milli(ts), '%Y%m%d%H')
ORDER BY (table, ts)
TTL toDateTime(fromUnixTimestamp64Milli(ts)) + toIntervalDay(30)
SETTINGS index_granularity = 1;


CREATE MATERIALIZED VIEW stream.uco_oms_database_consumer on cluster "uco-bi-test" TO stream.uco_oms_database_local
AS (SELECT "data",
    "database",
    "es",
    "id",
    "isDdl",
    "mysqlType",
    "old",
    "pkNames",
    "sql",
    "sqlType",
    "table",
    "ts",
    "type",
    _topic as "topic",
    _timestamp as "timeStamp",
    _timestamp_ms  AS "kafkaTimeStampMs",
    _partition     AS "kafkaPartition",
    _offset        AS "kafkaOffset",
    _key           AS "kafkaKey",
    'uco' AS "env"
    FROM stream.uco_oms_database_stream
);



create table if not exists stream.uco_oms_database
(
    data           Array(),
    database       String,
    es             Int64,
    id             Int64,
    isDdl          Int8,
    mysqlType      Map(String,String),
    old            Array(String),
    pkNames        Array(String),
    sql            String,
    sqlType        String,
    table          String,
    ts             Int64,
    type           String,
    topic          String,
    timeStamp      DateTime,
    kafkaTimeStampMs Nullable(DateTime64(3)),
    kafkaPartition UInt64,
    kafkaOffset    UInt64,
    kafkaKey       String,
    env            String
) engine = Distributed('uco-bi-test', 'stream', 'uco_oms_database_local', halfMD5(ts, env));


drop table if exists stream.uco_oms_database on cluster "uco-bi-test";
create table stream.uco_oms_database on cluster "uco-bi-test" as stream.uco_oms_database_local
ENGINE = Distributed("uco-bi-test", stream, uco_oms_database_local, halfMD5(ts,env));