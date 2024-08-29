curl --location '10.2.1.180:18090/data_sync/canal_kafka' \
--header 'Content-Type: application/json' \
--header 'Authorization: Bearer rBiX4PB3h6AtIEZypOD2J6_WDG' \
--data '{
    "table_names": [
        "TbSalesOrder",
        "TbSubOrder",
        "SalesOrder",
        "SalesOrderLine"
    ],
    "schema": "uco",
    "system": "oms",
    "env":"uco",
    "condition": "updated >= '\''2024-08-28 17:00:00'\'' AND updated <'\''2024-08-28 17:20:00'\''"
}'