from typing import Any
import mysql.connector.pooling

db_config: Any = {
    "host": "localhost",
    "user": "root",
    "password": "admin",
    "database": "tripAdvisor",
}

connection_pool = mysql.connector.pooling.MySQLConnectionPool(
    pool_name="trip_pool", pool_size=5, **db_config
)
