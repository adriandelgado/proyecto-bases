from typing import List, Optional
from database import connection_pool
from dataclasses import dataclass


@dataclass
class Reserva:
    id: str
    fecha: str
    nombres: str


@dataclass
class ReservaModificada:
    fecha: Optional[str] = None
    nombres: Optional[str] = None


def crear_reserva(nuevo_reserva: Reserva):
    connection = connection_pool.get_connection()
    cursor = connection.cursor()
    cursor.execute(
        """INSERT INTO RESERVAS (
            id,
            fecha,
            nombres
        ) VALUES (%s, %s, %s)""",
        (
            nuevo_reserva.id,
            nuevo_reserva.fecha,
            nuevo_reserva.nombres,
        ),
    )
    connection.commit()
    cursor.close()
    connection.close()


def mostrar_reservas() -> List[Reserva]:
    connection = connection_pool.get_connection()
    cursor = connection.cursor()
    cursor.execute("SELECT * FROM RESERVAS")
    reservas = cursor.fetchall()
    cursor.close()
    connection.close()
    return [Reserva(*info) for info in reservas]


def mostrar_reserva(id: int) -> Reserva:
    connection = connection_pool.get_connection()
    cursor = connection.cursor(prepared=True)
    cursor.execute("SELECT * FROM RESERVAS WHERE id = %s", (id,))
    info = cursor.fetchone()
    cursor.close()
    connection.close()
    return Reserva(*info)


def editar_reserva(id: int, reserva_modificado: ReservaModificada):
    datos_actuales = mostrar_reserva(id)
    if not reserva_modificado.fecha:
        reserva_modificado.fecha = datos_actuales.fecha
    if not reserva_modificado.nombres:
        reserva_modificado.nombres = datos_actuales.nombres

    connection = connection_pool.get_connection()
    cursor = connection.cursor(prepared=True)

    update_query = """UPDATE RESERVAS SET
                        fecha = %s,
                        nombres = %s
                    WHERE id = %s"""
    values = (
        reserva_modificado.fecha,
        reserva_modificado.nombres,
        id,
    )

    cursor.execute(update_query, values)
    connection.commit()

    cursor.close()
    connection.close()


def borrar_reserva(id: int):
    connection = connection_pool.get_connection()
    cursor = connection.cursor()

    delete_query = "DELETE FROM RESERVAS WHERE id = %s"
    values = (id,)

    cursor.execute(delete_query, values)
    connection.commit()

    cursor.close()
    connection.close()
