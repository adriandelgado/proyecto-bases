from database import connection_pool


def numero_likes_servicio(nombre: str) -> int:
    connection = connection_pool.get_connection()
    cursor = connection.cursor(prepared=True)
    cursor.execute(
        """
        SELECT COUNT(L.usuario_id)
        FROM SERVICIO S
        JOIN LIKES L ON S.id = L.servicio_id
        WHERE S.nombre = %s
        """,
        (nombre,),
    )
    (count,) = cursor.fetchone()
    count = count if count else 0
    cursor.close()
    connection.close()
    return count
