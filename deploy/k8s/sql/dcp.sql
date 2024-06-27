show databases;

create database dcp on cluster "uco-bi-test";

DROP USER IF EXISTS dcp on cluster "uco-bi-test";
CREATE USER IF NOT EXISTS dcp on cluster "uco-bi-test" IDENTIFIED WITH sha256_password BY 'Password002';

grant on cluster "uco-bi-test" all on dcp.* to dcp;



CREATE TABLE IF NOT EXISTS dcp.dc_subtask_info on cluster "uco-bi-test"
(
    `id` String,
    `parent_task_id` String DEFAULT '0' COMMENT '父任务id',
    `is_deleted` UInt8 DEFAULT 0 COMMENT '是否删除0否1是',
    `created_by` String DEFAULT '' COMMENT '创建人',
    `created_stamp` DateTime DEFAULT now() COMMENT '创建时间',
    `last_updated_by` String DEFAULT '' COMMENT '上次更新人',
    `last_updated_stamp` DateTime DEFAULT now() COMMENT '上次更新时间',
    `data_source_id` Int32 DEFAULT -1 COMMENT '数据源id',
    `additional_condition` String COMMENT '额外条件',
    `shop_user_name` String DEFAULT '' COMMENT '店铺账号',
    `sequence_id` Int32 DEFAULT 0 COMMENT '序列id',
    `check_data_source_id` Int32 DEFAULT 0 COMMENT '滑块数据源id',
    `robot_account_name` Nullable(String) COMMENT '影刀机器人账号',
    `task_type` Int32 DEFAULT 0 COMMENT '任务类型 0 默认,1 影刀任务，2 插件任务',
    `err_times` Int32 DEFAULT 0 COMMENT '错误次数上限',
    `status` String DEFAULT '0' COMMENT '任务状态0未开始1:任务下发2:爬虫已接收3:正在采集4:采集结束5:采集异常6:清洗已接收7:正在清洗8:清洗结束9:清洗异常10:cookie异常11:入库已接收12:正在入库中13:入库成功，数据不为014:入库失败15:入库成功数据为0',
    `data_count` Int32 DEFAULT 0 COMMENT '任务数据量',
    `begin_time` Nullable(Date) COMMENT '开始时间',
    `end_time` Nullable(Date) COMMENT '结束时间',
    `is_retry` UInt8 DEFAULT 0 COMMENT '是否重试',
    `err_counts` Int32 DEFAULT 0 COMMENT '重试次数',
    `is_dependence` UInt8 DEFAULT 0 COMMENT '是否依赖',
    `module_name` Nullable(String),
    `err_msg` Nullable(String),
    `actual_issuing_time` Nullable(DateTime) COMMENT '实际下发时间',
    `obs_path` String COMMENT 'obs路径',
    `schema_name` Nullable(String) COMMENT '数据库名',
    `table_name` Nullable(String) COMMENT '表名',
    `detail_message` String COMMENT '入库详情',
    `date_type` Nullable(String) COMMENT 'day:按日拆month:按月拆year:按年',
    `is_skip` UInt8 DEFAULT 0 COMMENT '是否跳过',
    `dependency_seq_id` Nullable(String) COMMENT '依赖的sequence_id',
    `flow_params` String COMMENT '流转参数',
    `estimated_pending_time` Int32 DEFAULT -1 COMMENT '预估待执行时间',
    `estimated_queue_wait_time` Int32 DEFAULT -1 COMMENT '预估队列等待时间',
    `created_month` String DEFAULT '' COMMENT '下发月份',
    `parent_id` String DEFAULT '0' COMMENT '当前任务的父任务id',
    `level_no` Int32 DEFAULT 0 COMMENT '任务等级',
    `actual_finish_time` Nullable(DateTime) COMMENT '任务实际完成时间，影刀回调时更新该字段',
    `batch_timestamp` DateTime,
    `task_topic` Nullable(String) COMMENT '任务队列'
)
ENGINE = ReplicatedMergeTree(
    '/clickhouse/tables/one-shard/dc_subtask_info',
    '{replica}'
)

ORDER BY id
;

CREATE TABLE IF NOT EXISTS dcp.dc_task_info on cluster "uco-bi-test"
(
    `id` String,
    `created_user_name` String,
    `shop_user_name` String,
    `is_deleted` UInt8,
    `created_by` String,
    `created_stamp` DateTime DEFAULT now(),
    `last_updated_by` String,
    `last_updated_stamp` DateTime DEFAULT now(),
    `task_type` Int32 DEFAULT 0,
    `is_dependence` UInt8,
    `task_desc` Nullable(String),
    `robot_account_name` Nullable(String),
    `cron` Nullable(String),
    `status` String DEFAULT '0',
    `task_rel` String DEFAULT '',
    `alert_email` Nullable(String),
    `task_style` String,
    `time_type` Nullable(String),
    `start_time` Nullable(String),
    `end_time` Nullable(String),
    `date_range` Nullable(Int32),
    `date_type` Nullable(String),
    `is_skip` Nullable(UInt8),
    `alert_type` String DEFAULT '0',
    `platform_key` String DEFAULT '',
    `batch_timestamp` DateTime
)
ENGINE = ReplicatedMergeTree(
    '/clickhouse/tables/one-shard/dc_task_info',
    '{replica}'
)
ORDER BY id;
