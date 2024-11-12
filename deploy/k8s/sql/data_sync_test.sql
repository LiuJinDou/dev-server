
-- mysql-canal-kafka-clickhouse

CREATE TABLE test.ftp_file
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
    
-- INSERT INTO test.ftp_file (id, filename, ext, num, dir, created, status, remark, modified, date, platformId, type, customFileId) VALUES (601, 'CN_TMALL_GIV_ORDER_20180118000001', 'dat', 1, 'lvmh\\rs/', '2018-01-19 10:08:28', 1, '', '2018-01-19 10:08:28', '20180118', '100202', 'rs_ship', null);
CREATE TABLE test.ftp_file_local
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


CREATE MATERIALIZED VIEW test.ftp_file_consumer  TO test.ftp_file_local
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
    'test' AS "env"
    FROM test.ftp_file
);