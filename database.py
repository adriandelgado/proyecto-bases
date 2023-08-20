import mysql.connector.pooling

db_config = {
    "host": "localhost",
    "user": "root",
    "password": "admin",
    "database": "tripAdvisor",
}

connection_pool = mysql.connector.pooling.MySQLConnectionPool(
    pool_name="trip_pool", pool_size=5, **db_config
)
