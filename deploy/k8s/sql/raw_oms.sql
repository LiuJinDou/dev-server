SELECT * FROM jdbc('test_local', 'test', 'product');

-- show datasources and usage

select * from jdbc('', 'show datasources');

CREATE TABLE test.product ON CLUSTER 'uco-bi-test' (
     id Int64,
     product_name String
)
ENGINE = JDBC('test_local', 'test', 'product');
select * from raw_test;

DROP DATABASE IF EXISTS raw_local_test ON CLUSTER 'uco-bi-test' SYNC;
CREATE DATABASE IF NOT EXISTS raw_local_test ON CLUSTER 'uco-bi-test' ENGINE = MySQL(
    '10.2.1.180:3308',
    'test',
    'canal',
    'canal'
) SETTINGS read_write_timeout=3000;


-- oms-uco
CREATE DATABASE IF NOT EXISTS raw_oms_uco ON CLUSTER 'uco-bi-test' ENGINE = MySQL(
    'db20c2.uco.com:10006',
    'oms_uco_uat',
    'app_uco',
    'uco4LhnZuZae&6RUrVa'
) SETTINGS read_write_timeout=3000;
-- oms-3pl
CREATE DATABASE IF NOT EXISTS raw_oms_3pl ON CLUSTER 'uco-bi-test' ENGINE = MySQL(
    'db20c2.uco.com:10006',
    'oms_uco_uat',
    'app_uco',
    'uco4LhnZuZae&6RUrVa'
) SETTINGS read_write_timeout=3000;
-- oms-elc
CREATE DATABASE IF NOT EXISTS raw_oms_elc ON CLUSTER 'uco-bi-test' ENGINE = MySQL(
    'db20c2.uco.com:10006',
    'oms_uco_uat',
    'app_uco',
    'uco4LhnZuZae&6RUrVa'
) SETTINGS read_write_timeout=3000;
-- oms-el
CREATE DATABASE IF NOT EXISTS raw_oms_el ON CLUSTER 'uco-bi-test' ENGINE = MySQL(
    'db20c2.uco.com:10006',
    'oms_uco_uat',
    'app_uco',
    'uco4LhnZuZae&6RUrVa'
) SETTINGS read_write_timeout=3000;
-- oms-yy
CREATE DATABASE IF NOT EXISTS raw_oms_yy ON CLUSTER 'uco-bi-test' ENGINE = MySQL(
    'db20c2.uco.com:10006',
    'oms_uco_uat',
    'app_uco',
    'uco4LhnZuZae&6RUrVa'
) SETTINGS read_write_timeout=3000;
-- oms-lian
CREATE DATABASE IF NOT EXISTS raw_oms_lian ON CLUSTER 'uco-bi-test' ENGINE = MySQL(
    'db20c2.uco.com:10006',
    'oms_uco_uat',
    'app_uco',
    'uco4LhnZuZae&6RUrVa'
) SETTINGS read_write_timeout=3000;
-- oms-ssd
CREATE DATABASE IF NOT EXISTS raw_oms_ssd ON CLUSTER 'uco-bi-test' ENGINE = MySQL(
    'db20c2.uco.com:10006',
    'oms_uco_uat',
    'app_uco',
    'uco4LhnZuZae&6RUrVa'
) SETTINGS read_write_timeout=3000;

-- ops-uco
CREATE DATABASE IF NOT EXISTS raw_ops_uco ON CLUSTER 'uco-bi-test' ENGINE = MySQL(
    'db20c2.uco.com:10006',
    'ops_uco_uat',
    'app_uco',
    'uco4LhnZuZae&6RUrVa'
) SETTINGS read_write_timeout=3000;
-- ops-3pl
CREATE DATABASE IF NOT EXISTS raw_ops_3pl ON CLUSTER 'uco-bi-test' ENGINE = MySQL(
    'db20c2.uco.com:10006',
    'ops_uco_uat',
    'app_uco',
    'uco4LhnZuZae&6RUrVa'
) SETTINGS read_write_timeout=3000;
-- ops-elc
CREATE DATABASE IF NOT EXISTS raw_ops_elc ON CLUSTER 'uco-bi-test' ENGINE = MySQL(
    'db20c2.uco.com:10006',
    'ops_uco_uat',
    'app_uco',
    'uco4LhnZuZae&6RUrVa'
) SETTINGS read_write_timeout=3000;
-- ops-el
CREATE DATABASE IF NOT EXISTS raw_ops_el ON CLUSTER 'uco-bi-test' ENGINE = MySQL(
    'db20c2.uco.com:10006',
    'ops_uco_uat',
    'app_uco',
    'uco4LhnZuZae&6RUrVa'
) SETTINGS read_write_timeout=3000;
-- ops-yy
CREATE DATABASE IF NOT EXISTS raw_ops_yy ON CLUSTER 'uco-bi-test' ENGINE = MySQL(
    'db20c2.uco.com:10006',
    'ops_uco_uat',
    'app_uco',
    'uco4LhnZuZae&6RUrVa'
) SETTINGS read_write_timeout=3000;
-- ops-lian
CREATE DATABASE IF NOT EXISTS raw_ops_lian ON CLUSTER 'uco-bi-test' ENGINE = MySQL(
    'db20c2.uco.com:10006',
    'ops_uco_uat',
    'app_uco',
    'uco4LhnZuZae&6RUrVa'
) SETTINGS read_write_timeout=3000;
-- ops-ssd
CREATE DATABASE IF NOT EXISTS raw_ops_ssd ON CLUSTER 'uco-bi-test' ENGINE = MySQL(
    'db20c2.uco.com:10006',
    'ops_uco_uat',
    'app_uco',
    'uco4LhnZuZae&6RUrVa'
) SETTINGS read_write_timeout=3000;

